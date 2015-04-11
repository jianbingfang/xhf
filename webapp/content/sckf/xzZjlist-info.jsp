<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "sckf-home");
%>
<%
	pageContext.setAttribute("currentMenu", "sckf-xmtb");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="dev.xzZjDxlist-info.list.title"
		text="证件" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript">
	
</script>
</head>
<body>
	<%@include file="/header.jsp"%>
	<div class="row-fluid">
		<%@include file="/menu/sckf-workspace.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span10">
			<h2>
				<a href="${scopePrefix }/xz/xzZj-info-list.do" target="_blank">公司证件</a>
			</h2>
			<h2>
				<a href="${scopePrefix }/xz/xzRyzs-info-list.do" target="_blank">
					荣誉证书</a>
			</h2>
			<h2>
				<a href="${scopePrefix }/xz/xz-commHt-info-list.do" target="_blank">
					合同</a>
			</h2>
			<h2>
				<a href="${scopePrefix }/xz/xzZbtzs-info-list.do" target="_blank">
					中标通知书</a>
			</h2>
			<h2>
				<a href="${scopePrefix }/xz/xzJgysbg-info-list.do" target="_blank">
					竣工验收报告</a>
			</h2>
			<h2>
				<a href="${scopePrefix }/xz/xzRedTape-wb-info-list.do"
					target="_blank"> 红头文件</a>
			</h2>
			<h2>
				<a href="${scopePrefix }/xz/xzxjpy-wb-info-list.do" target="_blank">
					外部评先</a>
			</h2>
			<h2>
				<a href="${scopePrefix }/hr/hrRyZj-treelist.do" target="_blank">人员证件
				</a>
			</h2>
		</section>
		<!-- end of main -->
	</div>
</body>
</html>
