package com.xthena.bpm.rule;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.jdbc.core.JdbcTemplate;

/**
 * 获得部门最接近的对应的岗位的人的信息.
 * 
 */
public class PositionAssigneeRule extends AbstractAssigneeRule {
    private static Logger logger = LoggerFactory
            .getLogger(PositionAssigneeRule.class);
    private JdbcTemplate jdbcTemplate;

    @Override
	public List<String> process(String value, String initiator) {
        String userEntityId = this.getUserEntityId(initiator);
        String departmentId = this.getDepartmentEntityId(userEntityId);
        List<String> userEntityIds = this.getPositionUserEntityIds(
                departmentId, value);
        List<String> userIds = new ArrayList<String>();

        for (String uId : userEntityIds) {
            userIds.add(getUserId(uId));
        }

        return userIds;
    }

   /* public List<String> getPositionUserEntityIds(String departmentId,
            String positionName) {
        String sql = "select ps.child_entity_id from PARTY_STRUCT ps,PARTY_ENTITY user,PARTY_TYPE pt,"
                + " JOB_USER ju,JOB_INFO ji,job_title jt"
                + " where ps.parent_entity_id=? and ps.child_entity_id=user.id and user.type_id=pt.id"
                + " and pt.type=1 and user.ref=ju.user_ref and ju.JOB_INFO_id=ji.id and ji.title_id=jt.id and jt.name=?";
        List<String> userIds = this.getJdbcTemplate().queryForList(sql,
                String.class, departmentId, positionName);
        logger.info("departmentId : {}, positionName : {}", departmentId,
                positionName);
        logger.info("userIds : {}", userIds);

        if (userIds.isEmpty()) {
            String higherDepartmentId = getHigherDepartmentEntityId(departmentId);

            if (higherDepartmentId == null) {
                return Collections.emptyList();
            }

            return getPositionUserEntityIds(higherDepartmentId, positionName);
        }

        return userIds;
    }*/

    //杨超修改于2015年1月13日，去掉对部门的指定，只根据岗位名称来寻找负责人
    public List<String> getPositionUserEntityIds(String departmentId,
            String positionName) {
        String sql = "select ps.child_entity_id from PARTY_STRUCT ps,PARTY_ENTITY user,PARTY_TYPE pt,"
                + " JOB_USER ju,JOB_INFO ji,job_title jt"
                + " where ps.child_entity_id=user.id and user.type_id=pt.id"
                + " and pt.type=1 and user.ref=ju.user_ref and ju.JOB_INFO_id=ji.id and ji.title_id=jt.id and jt.name=?";
        List<String> userIds = this.getJdbcTemplate().queryForList(sql,
                String.class,  positionName);
        logger.info("departmentId : {}, positionName : {}", departmentId,
                positionName);
        logger.info("userIds : {}", userIds);

        if (userIds.isEmpty()) {
            String higherDepartmentId = getHigherDepartmentEntityId(departmentId);

            if (higherDepartmentId == null) {
                return Collections.emptyList();
            }

            return getPositionUserEntityIds(higherDepartmentId, positionName);
        }

        return userIds;
    }
    
    
    @Override
	public String process(String initiator) {
        return null;
    }
}
