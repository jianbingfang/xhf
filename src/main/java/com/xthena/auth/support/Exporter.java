package com.xthena.auth.support;

import java.util.Map;

import com.xthena.api.scope.ScopeHolder;

import org.springframework.jdbc.core.JdbcTemplate;

public class Exporter {
    private JdbcTemplate jdbcTemplate;

    public String execute() {
        StringBuilder buff = new StringBuilder();
        buff.append("ref:\n").append(ScopeHolder.getScopeDto().getRef())
                .append("\n\n");
        buff.append("code:\n").append(ScopeHolder.getScopeCode())
                .append("\n\n");
        buff.append("userRepoRef:\n").append(ScopeHolder.getUserRepoRef())
                .append("\n\n");
        buff.append("permType:\n");

        for (Map<String, Object> map : jdbcTemplate.queryForList(
                "select name,type from AUTH_PERM_type where scope_id=?",
                ScopeHolder.getScopeId())) {
            buff.append(map.get("name")).append(",").append(map.get("type"))
                    .append("\n");
        }

        buff.append("\n");
        buff.append("perm:\n");

        for (Map<String, Object> map : jdbcTemplate.queryForList(
                "select ap.code as code,apt.name as type from AUTH_PERM ap,AUTH_PERM_type apt"
                        + " where ap.perm_type_id=apt.id and ap.scope_id=?",
                ScopeHolder.getScopeId())) {
            buff.append(map.get("code")).append(",").append(map.get("type"))
                    .append("\n");
        }

        buff.append("\n");

        buff.append("method:\n");

        for (Map<String, Object> map : jdbcTemplate
                .queryForList(
                        "select aa.value as resc,ap.code as perm from AUTH_ACCESS aa,AUTH_PERM ap "
                                + "where aa.perm_id=ap.id and aa.type='METHOD' and aa.scope_id=?",
                        ScopeHolder.getScopeId())) {
            buff.append(map.get("resc")).append(",").append(map.get("perm"))
                    .append("\n");
        }

        buff.append("\n");
        buff.append("url:\n");

        for (Map<String, Object> map : jdbcTemplate
                .queryForList(
                        "select aa.value as resc,ap.code as perm from AUTH_ACCESS aa,AUTH_PERM ap "
                                + "where aa.perm_id=ap.id and aa.type='URL' and aa.scope_id=?",
                        ScopeHolder.getScopeId())) {
            buff.append(map.get("resc")).append(",").append(map.get("perm"))
                    .append("\n");
        }

        buff.append("\n");
        buff.append("role:\n");

        for (Map<String, Object> map : jdbcTemplate
                .queryForList(
                        "select ar.name as name,ap.code as perm,sc.ref as scope "
                                + "from AUTH_ROLE ar,AUTH_ROLE_DEF ard,AUTH_PERM_ROLE_DEF aprd,AUTH_PERM ap,SCOPE_INFO sc "
                                + "where ar.role_def_id=ard.id and ard.id=aprd.role_def_id and aprd.perm_id=ap.id "
                                + "and ar.scope_id=? and sc.id=ard.scope_id",
                        ScopeHolder.getScopeId())) {
            buff.append(map.get("name")).append(",").append(map.get("perm"))
                    .append(",").append(map.get("scope")).append("\n");
        }

        buff.append("\n");
        buff.append("user:\n");

        for (Map<String, Object> map : jdbcTemplate
                .queryForList(
                        "select aus.username as username,aus.reference as ref,ar.name as role"
                                + " from AUTH_ROLE ar,AUTH_USER_STATUS aus,AUTH_USER_ROLE aur "
                                + "where ar.id=aur.role_id and aur.user_status_id=aus.id and aus.scope_id=?",
                        ScopeHolder.getScopeId())) {
            buff.append(map.get("username")).append(",").append(map.get("ref"))
                    .append(",").append(map.get("role")).append("\n");
        }

        buff.append("\n");

        return buff.toString();
    }

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
}
