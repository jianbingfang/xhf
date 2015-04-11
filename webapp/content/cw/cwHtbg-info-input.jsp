<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "cw-home");
%>
<%
	pageContext.setAttribute("currentMenu", "cw-ht");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message
		code="cwHtbg-info.cwHtbg-info.input.title" text="编辑" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript">
	$(
			function() {
				$("#cwHtbg-infoForm")
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
		<%@include file="/menu/cw-workspace.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span10">
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="cwHtbg-info.cwHtbg-info.input.title"
							text="编辑" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="cwHtbg-infoForm" method="post"
						action="cwHtbg-info-save.do" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="cwHtbg-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="cwHtbg-info_fhtid"><spring:message
										code="cwHtbg-info.cwHtbg-info.input.fhtid" text="合同名称" /></label>
								<div class="controls">
									<input id="cwHtbg-info_fhtid" type="text" name="fhtid"
										value="${model.fhtid}" size="" class="number   ">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="cwHtbg-info_fbgmoney"><spring:message
										code="cwHtbg-info.cwHtbg-info.input.fbgmoney" text="合同金额" /></label>
								<div class="controls">
									<input id="cwHtbg-info_fbgmoney" type="text" name="fbgmoney"
										value="${model.fbgmoney}" size="" class="number   ">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="cwHtbg-info_fbgresult"><spring:message
										code="cwHtbg-info.cwHtbg-info.input.fbgresult" text="实际总收入" /></label>
								<div class="controls">
									<input id="cwHtbg-info_fbgresult" type="text" name="fbgresult"
										value="${model.fbgresult}" size="" class="text ">
								</div>
							</div>
								<div class="span5">
								<label class="control-label" for="cwHtbg-info_fbgdate"><spring:message
										code="cwHtbg-info.cwHtbg-info.input.fbgdate" text="应收账款" /></label>
								<div class="controls">
									<input id="cwHtbg-info_fbgresult" type="text" name="fbgresult"
										value="${model.fbgresult}" size="" class="text ">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="cwHtbg-info_foprator"><spring:message
										code="cwHtbg-info.cwHtbg-info.input.foprator" text="回收率" /></label>
								<div class="controls">
									<input id="cwHtbg-info_foprator" type="text" name="foprator"
										value="${model.foprator}" size="" class="number   ">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="cwHtbg-info_fbgdate"><spring:message
										code="cwHtbg-info.cwHtbg-info.input.fbgdate" text="应收监理费" /></label>
								<div class="controls">
									<input id="cwHtbg-info_fbgresult" type="text" name="fbgresult"
										value="${model.fbgresult}" size="" class="text ">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="cwHtbg-info_foprator"><spring:message
										code="cwHtbg-info.cwHtbg-info.input.foprator" text="履约率" /></label>
								<div class="controls">
									<input id="cwHtbg-info_foprator" type="text" name="foprator"
										value="${model.foprator}" size="" class="number   ">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="cwHtbg-info_fbgdetail"><spring:message
										code="cwHtbg-info.cwHtbg-info.input.fbgdetail" text="工程进度" /></label>
								<div class="controls">
									<input id="cwHtbg-info_foprator" type="text" name="foprator"
										value="${model.foprator}" size="" class="number   ">
								</div>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="cwHtbg-info_fbgdetail"><spring:message
									code="cwHtbg-info.cwHtbg-info.input.fbgdetail" text="情况说明" /></label>
							<div class="controls">
								<textarea id="cwHtbg-info_fbgdetail" name="fbgdetail"
									class="form-control" rows="6" style="width: 560px"
									class="text  " maxlength="500">${model.fbgdetail}</textarea>
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
