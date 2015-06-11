<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%String url = "/dashboard/dashboard.do";%>
<%--<%String url = "/content/dashboard/dashboard.jsp";%>--%>
<%response.sendRedirect(request.getContextPath() + url);%>
