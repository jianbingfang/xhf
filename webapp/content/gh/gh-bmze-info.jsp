<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "gh-home");
%>
<%
	pageContext.setAttribute("currentMenu", "gh-zd");
%>
<!doctype html>
<html lang="en">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="plain-info.plain-info.input.title"
		text="部门职责 - 管理制度 - 人力资源" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/js/ajaxfileupload.js"></script>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/uploadpicker/uploadpicker.css">
<script type="text/javascript">
	var formid = "";

	$(function() {

		$("#jlFujian-infoForm")
				.validate(
						{
							submitHandler : function(form) {
								bootbox.animate(false);
								var box = bootbox
										.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
								form.submit();
							},
							errorClass : 'validate-error'
						});

		$('#myTab a').click(function(e) {
			e.preventDefault();
			$(this).tab('show');
		});

		activeFirst();
	});

	function activeFirst() {
		$('#myTab li:first-child').addClass("active");
		$('.tab-content div:first-child').addClass("active");
	}
</script>
</head>
<body>
      <%@include file="/header.jsp"%>

    <div class="row-fluid">
	   <%@include file="/menu/gh-workspace.jsp"%>
		<section id="m-main" class="span10">
		<a href="gh-doc-bmze-list.do" style="float: right;">编辑</a>
			<ul id="myTab" class="nav nav-tabs" role="tablist">
				<c:forEach items="${page.result}" var="item">
					<li role="presentation"><a href="#tab${item.fid}">${item.ftitle}</a></li>
				</c:forEach>
			</ul>
			<div class="tab-content">
				<c:forEach items="${page.result}" var="item">
					<div class="tab-pane" id="tab${item.fid}">${item.fmemo1}</div>
				</c:forEach>
			</div>
		</section>
		<!-- start of main -->
		<%-- <section id="m-main" class="span10">
	 <article class="m-widget">
        <header class="header">
		  <h4 class="title">部门职责</h4>
		  <div class="ctrl">
		   <a class="btn" href="../group/org-department-input.do?id=3"><i id="hrLz-infoSearchIcon" >修改</i></a>
		    <a class="btn"><i id="hrLz-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="hrLz-infoSearch" class="content content-inner">
        
			<form id="plain-infoForm" method="post" action="hr-doc-glzd-save.do" class="form-horizontal">
			  <div class="control-group">
				<div class="controls" style="margin-left:10px;">
					<label class="control-label" style="width:94%; text-align: left; line-height:28px;" for="hrLz-info_fczbg"><spring:message code="hrLz-info.hrLz-info.input.fczbg" text="${model.fbmze}"/></label>
			    </div>
			  </div>
			
			</form>
		</div>
	  </article>
	  	 <article class="m-widget">
        <header class="header">
		  <h4 class="title">人员列表</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="hrLz-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="hrLz-infoSearch" class="content content-inner">
			<form id="plain-infoForm" method="post" action="hr-doc-glzd-save.do" class="form-horizontal">
			 <c:forEach items="${model.rylist}" var="item">
			 <label class="control-label" for="hrLz-info_fczbg"><spring:message code="hrLz-info.hrLz-info.input.fczbg" text="${item.key}:"/></label>
			 	<div class="control-group">
					<div class="controls">
						<label class="control-label" for="hrLz-info_fczbg"><spring:message code="hrLz-info.hrLz-info.input.fczbg" text="${item.value}"/></label>
				    </div>
	 			 </div>
			 </c:forEach>
			</form>
		</div>
	  </article>
	  	 <article class="m-widget">
        <header class="header">
		  <h4 class="title">岗位职责</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="hrLz-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="hrLz-infoSearch" class="content content-inner">
				<form id="plain-infoForm" method="post" action="hr-doc-glzd-save.do" class="form-horizontal">
				<c:forEach items="${model.gwlist}" var="item">
				<label class="control-label" for="hrLz-info_fczbg"><spring:message code="hrLz-info.hrLz-info.input.fczbg" text="${item.key}"/></label>
				  <div class="control-group">
					<div class="controls">
						<label class="control-label" style="width:94%; text-align: left;" for="hrLz-info_fczbg"><spring:message code="hrLz-info.hrLz-info.input.fczbg" text="${item.value}"/></label>
				    </div>
				  </div>
				 </c:forEach>
			</form>
		</div>
	  </article>
      </section> --%>
	</div>
</body>
</html>
