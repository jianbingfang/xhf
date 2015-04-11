<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "kh-home");
%>
<%
	pageContext.setAttribute("currentMenu", "kh-ny");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="khJl-info.khJl-info.input.title"
		text="编辑" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript">
	$(
			function() {
				$("#khJl-infoForm")
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
			})
</script>
</head>
<body>
	<%@include file="/header.jsp"%>
	<div class="row-fluid">
		<%@include file="/menu/kh-workspace.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span10">
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="khJl-info.khJl-info.input.title" text="编辑" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="khJl-infoForm" method="post" action="khJl-info-save.do?ftype=2"
						class="form-horizontal">
						<c:if test="${model != null}">
							<input id="khJl-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<div class="control-group">
							<label class="control-label" for="khJl-info_fname"><spring:message
									code="khJl-info.khJl-info.input.fname" text="标题" /></label>
							<div class="controls">
								<input id="khJl-info_fname" type="text" name="fname"
									value="${model.fname}" size="" class="text required"
									minlength="" maxlength="">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="khJl-info_fdate"><spring:message
									code="khJl-info.khJl-info.input.fdate" text="时间" /></label>
							<div class="controls">
								<div class="input-append datepicker date"
									style="padding-left: 0px;">
									<input id="khJl-info_fdate" type="text" name="fdate"
										value="${model.fdate}" size="40" class="text "
										style="background-color:white;cursor:default; width: 175px;">
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-calendar"></i></span>
								</div>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="khJl-info_fkhzcy"><spring:message
									code="khJl-info.khJl-info.input.fkhzcy" text="事由" /></label>
							<div class="controls">
								<textarea id="khJl-info_fkhzcy" name="fkhzcy"
									class="form-control" rows="3" style="width: 560px"
									class="text  " minlength="" maxlength="200">${model.fkhzcy}</textarea>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="khJl-info_fkhjg"><spring:message
									code="khJl-info.khJl-info.input.fkhjg" text="内容" /></label>
							<div class="controls">
								<textarea id="khJl-info_fkhjg" name="fkhjg" class="form-control"
									rows="6" style="width: 560px" class="text  " minlength=""
									maxlength="1000">${model.fkhjg}</textarea>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="khJl-info_fmemo"><spring:message
									code="khJl-info.khJl-info.input.fmemo" text="备注" /></label>
							<div class="controls">
								<textarea id="khJl-info_fmemo" name="fmemo" class="form-control"
									rows="6" style="width: 560px" class="text  " minlength=""
									maxlength="400">${model.fmemo}</textarea>
							</div>
						</div>
						<div class="control-group">
							<div class="controls">
								<button type="submit" class="btn a-submit">
									<spring:message code='core.input.save' text='保存' />
								</button>
								&nbsp;
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
