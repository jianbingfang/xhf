<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<!doctype html>
<html lang="en">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title> <spring:message code="core.500.error" text="从工程部进入"/></title>
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
		<h1>您好！</h1>
		<p><spring:message code="core.500.error" text="请从 工程部 ->在线项目 -> 进入监理部。"/></p>
		<ul>
		  <li><a class="btn btn-primary" href="${ctx}/"><spring:message code="core.500.back" text="返回首页"/></a></li>
		</ul>
      </div>
	</div>
	<div id="output" style="display:none">
	  <div style="text-align:center;" class="container">
	    <a class="btn btn-info container" href="javascript:void(0);" onclick="$('#output').hide();$('#targetContentDiv').show();">返回</a>
	  </div>
	
	</div>

  </body>

</html>
