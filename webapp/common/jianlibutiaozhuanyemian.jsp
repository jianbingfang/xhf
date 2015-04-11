<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<%@include file="/common/taglibs.jsp"%>
<%response.setStatus(200);%>
<!doctype html>
<html lang="en">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title>请先选择一个监理部</title>
	<link href="${ctx}/s/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${ctx}/s/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
	<script type="text/javascript" src="${ctx}/s/jquery/jquery.min.js"></script>
	<script type="text/javascript">
$(function() {
	$('#targetContentDiv').height($(window).innerHeight() - 150);
})
    </script>
	<style type="text/css">
#targetContentDiv {
	/* background-color: #b8b8b8; */
	padding: 70px 0 80px;
	text-align: center;
}

#targetContentDiv h1 {
	font-size: 120px;
	letter-spacing: -2px;
    line-height: 1;
}

#targetContentDiv p {
	font-size: 40px;
    font-weight: 200;
    line-height: 1.25;
	font-weight: bold;
	padding: 10px;
}

#targetContentDiv li {
	display: inline;
	list-style: none outside none;
}
	</style>
  </head>

  <body>

	<div id="targetContentDiv">
	  <div class="container">
	  <!-- <h2 ></h2> -->
	  <!-- <img alt="请先选择一个监理部。"   onclick="history.back()"> -->
	 	<h2>请先选择一个监理部...</h2>
		<%-- <p><spring:message  text=""/></p> --%>
		<ul>
		  <li><a class="btn btn-primary" href="${ctx}/default/gcgl/pjXm-manager-list.do"><spring:message code="core.404.back" text="选择监理部"/></a></li>
		  <li><a class="btn" href="javascript:void(0);" onclick="history.back()"><spring:message code="core.404.back" text="返回"/></a></li>
		</ul>
      </div>
	</div>

  </body>

</html>
