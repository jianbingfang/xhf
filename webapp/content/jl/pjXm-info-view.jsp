<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "jl-home");
%>
<%
	pageContext.setAttribute("currentMenu", "jl-jbxx");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="pjXm-info.pjXm-info.input.title"
		text="编辑" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/js/linkage.js"></script>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
<script type="text/javascript">

	window.onload = function() {
		pc_init();
		setProvCity("${model.fprovince}", "${model.fcity}");
	};

	$(function() {
		$("#pjXm-infoForm")
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

		createryPicker({
			modalId : 'ryPicker',
			url : '${scopePrefix}/hr/commRy-simple-list.do'
		});

	});
</script>
</head>
<body>
	<%@include file="/header.jsp"%>
	<div class="row-fluid">
		<%@include file="/menu/jl-workspace.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span10">
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="pjXm-info.pjXm-info.input.title" text="编辑" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="pjXm-infoForm" method="post" action="pjXm-info-save.do"
						class="form-horizontal">
						<c:if test="${model != null}">
							<input id="pjXm-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="pjXm-info_fxmname"><spring:message
										code="pjXm-info.pjXm-info.input.fxmname" text="项目名称" /></label>
								<div class="controls">
									<label id="pjXm-info_fxmname">${model.fxmname}</label>
									<%-- <input id="pjXm-info_fxmname" type="text" name="fxmname"
										value="${model.fxmname}" size="" class="text "> --%>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="pjXm-info_fxmtype"><spring:message
										code="pjXm-info.pjXm-info.input.fxmtype" text="工程类别" /></label>
								<div class="controls">
									<label class="form-control" id="pjXm-info_fxmtype">${model.fxmtype}</label>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="pjXm-info_fxmmoney"><spring:message
										code="pjXm-info.pjXm-info.input.fxmmoney" text="项目总投资" /></label>
								<div class="controls">
									<input id="pjXm-info_fxmmoney" type="text" name="fxmmoney"
										value="${model.fxmmoney}" size="" class="text ">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="pjXm-info_fprovince"><spring:message
										code="pjXm-info.pjXm-info.input.fprovince" text="项目地址" /></label>
								<div class="controls">
									<label class="form-control" id="pjXm-info_fxmtype">${model.fprovince}-${model.fcity}-${model.fxmaddr}</label>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="pjXm-info_fjzgm"><spring:message
										code="pjXm-info.pjXm-info.input.fxmstatus" text="建筑面积" /></label>
								<div class="controls">
									<label class="form-control" id="pjXm-info_fjzgm">${model.fjzgm}</label>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="pjXm-info_fzgd"><spring:message
										code="pjXm-info.pjXm-info.input.fzgd" text="建筑高度" /></label>
								<div class="controls">
									<label class="form-control" id="pjXm-info_fzgd">${model.fzgd}</label>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="pjXm-info_fcengshu"><spring:message
										code="pjXm-info.pjXm-info.input.fxmstatus" text="层数" /></label>
								<div class="controls">
									<label class="form-control" id="pjXm-info_fcengshu">${model.fcengshu}</label>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="pjXm-info_fjggm"><spring:message
										code="pjXm-info.pjXm-info.input.fjggm" text="结构类型" /></label>
								<div class="controls">
									<label class="form-control" id="pjXm-info_fjggm">${model.fjggm}</label>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="pjXm-info_fxmstatus"><spring:message
										code="pjXm-info.pjXm-info.input.fxmstatus" text="工程状态" /></label>
								<div class="controls">
									<label class="form-control" id="pjXm-info_fxmstatus">${model.fxmstatus}</label>
								</div>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="pjXm-info_fxmgaikuang"><spring:message
									code="pjXm-info.pjXm-info.input.fxmgaikuang" text="项目概况" /></label>
							<div class="controls">
								<!-- <textarea id="pjXm-info_fxmgaikuang" name="fxmgaikuang"
									class="form-control" rows="6" style="width: 560px" readonly
									class="text"></textarea> -->
									<label id="pjXm-info_fxmgaikuang" class="form-control"  >${model.fxmgaikuang}</label>
							</div>
						</div>
						<div class="control-group">
							<div class="controls">
								<%-- 	<button type="submit" class="btn a-submit">
									<spring:message code='core.input.save' text='保存' />
								</button>
								&nbsp; --%>
								<button type="button" class="btn a-cancel"
									onclick="history.back();">
									<spring:message code='core.input.back' text='返回' />
								</button>
							</div>
						</div>
					</form>
				</div>
			</article>
		</section>
		<!-- end of main -->
	</div>
</body>
</html>
