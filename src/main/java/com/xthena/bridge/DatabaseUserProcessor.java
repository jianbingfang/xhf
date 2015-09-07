package com.xthena.bridge;

import java.util.Map;

import javax.annotation.Resource;

import com.xthena.api.UserProcessor;

import org.springframework.jdbc.core.JdbcTemplate;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public class DatabaseUserProcessor implements UserProcessor {
    private long partyTypeId = 1;
    private long partyStructTypeId = 1;
    private JdbcTemplate jdbcTemplate;

    /**
     * 添加用户.
     * <ul>
     * <li>向PARTY_ENTITY中添加一条记录</li>
     * <li>向PARTY_STRUCT中添加一条记录</li>
     * </ul>
     */
    @Override
	public void insertUser(String id, String username) {
        String insertPartyEntitySql = "insert into PARTY_ENTITY(type_id,name,reference) values(?,?,?)";
        jdbcTemplate.update(insertPartyEntitySql, partyTypeId, username, id);

        String selectPartyEntitySql = "select id from PARTY_ENTITY where type_id=? and reference=?";
        Map<String, Object> map = jdbcTemplate.queryForMap(
                selectPartyEntitySql, partyTypeId, id);
        String insertPartyStructSql = "insert into PARTY_STRUCT(STRUCT_TYPE_ID,PARENT_ENTITY_ID,CHILD_ENTITY_ID) values(?,?,?)";
        jdbcTemplate.update(insertPartyStructSql, partyStructTypeId,
                map.get("id"), map.get("id"));
    }

    /**
     * 修改用户.
     * <p>
     * 只修改PARTY_ENTITY对应的name
     * </p>
     */
    @Override
	public void updateUser(String id, String username) {
        String updatePartyEntitySql = "update PARTY_ENTITY set name=? where type_id=? and reference=?";
        jdbcTemplate.update(updatePartyEntitySql, username, partyTypeId, id);
    }

    /**
     * 删除用户.
     * <ul>
     * <li>删除所有包含关系，将对应值为child_entity_id的PARTY_STRUCT删除，这个认为是从属于某些群组的关联关系</li>
     * <li>删除所有包含关系，将对应值为parent_entity_id的PARTY_STRUCT删除，这个认为是管理其他实体的关联关系</li>
     * <li>删除对应的PARTY_ENTITY</li>
     * </ul>
     */
    @Override
	public void removeUser(String id) {
        String selectPartyEntitySql = "select id from PARTY_ENTITY where type_id=? and reference=?";
        Map<String, Object> map = jdbcTemplate.queryForMap(
                selectPartyEntitySql, partyTypeId, id);

        String removePartyStructParentSql = "delete from PARTY_STRUCT where struct_type_id=? and parent_entity_id=?";
        jdbcTemplate.update(removePartyStructParentSql, partyStructTypeId,
                map.get("id"));

        String removePartyStructChildSql = "delete from PARTY_STRUCT where struct_type_id=? and child_entity_id=?";
        jdbcTemplate.update(removePartyStructChildSql, partyStructTypeId,
                map.get("id"));

        String removePartyEntitySql = "delete from PARTY_ENTITY where id=?";
        jdbcTemplate.update(removePartyEntitySql, map.get("id"));
    }

    public void setPartyTypeId(long partyTypeId) {
        this.partyTypeId = partyTypeId;
    }

    public void setPartyStructTypeId(long partyStructTypeId) {
        this.partyStructTypeId = partyStructTypeId;
    }

    @Resource
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
}
