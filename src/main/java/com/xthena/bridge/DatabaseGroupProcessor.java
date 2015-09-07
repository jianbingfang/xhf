package com.xthena.bridge;

import java.util.Map;

import javax.annotation.Resource;

import com.xthena.api.GroupProcessor;

import org.springframework.jdbc.core.JdbcTemplate;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public class DatabaseGroupProcessor implements GroupProcessor {
    private JdbcTemplate jdbcTemplate;

    /**
     * 添加群组.
     * <p>
     * 向PARTY_ENTITY中添加一条记录
     * </p>
     */
    @Override
	public void insertGroup(String id, String name) {
        String insertPartyEntitySql = "insert into PARTY_ENTITY(type_id,name,reference) values(2,?,?)";
        jdbcTemplate.update(insertPartyEntitySql, name, id);
    }

    /**
     * 修改用户.
     * <p>
     * 只修改PARTY_ENTITY对应的name
     * </p>
     */
    @Override
	public void updateGroup(String id, String name) {
        String updatePartyEntitySql = "update PARTY_ENTITY set name=? where type_id=2 and reference=?";
        jdbcTemplate.update(updatePartyEntitySql, name, id);
    }

    /**
     * 删除用户.
     * <ul>
     * <li>删除所有包含关系，将对应值为parent_entity_id的PARTY_STRUCT删除</li>
     * <li>删除所有包含关系，将对应值为child_entity_id的PARTY_STRUCT删除</li>
     * <li>删除对应的PARTY_ENTITY</li>
     * </ul>
     */
    @Override
	public void removeGroup(String id) {
        String selectPartyEntitySql = "select id from PARTY_ENTITY where type_id=2 and reference=?";
        Map<String, Object> map = jdbcTemplate.queryForMap(
                selectPartyEntitySql, id);

        String removePartyStructParentSql = "delete from PARTY_STRUCT where struct_type_id=1 and parent_entity_id=?";
        jdbcTemplate.update(removePartyStructParentSql, map.get("id"));

        String removePartyStructChildSql = "delete from PARTY_STRUCT where struct_type_id=1 and child_entity_id=?";
        jdbcTemplate.update(removePartyStructChildSql, map.get("id"));

        String removePartyEntitySql = "delete from PARTY_ENTITY where id=?";
        jdbcTemplate.update(removePartyEntitySql, map.get("id"));
    }

    @Resource
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
}
