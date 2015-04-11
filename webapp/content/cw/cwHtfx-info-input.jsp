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
		code="cwHtfx-info.cwHtfx-info.input.title" text="编辑" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript">
	$(
			function() {
				$("#cwHtfx-infoForm")
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
						<spring:message code="cwHtfx-info.cwHtfx-info.input.title"
							text="编辑" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="cwHtfx-infoForm" method="post"
						action="cwHtfx-info-save.do" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="cwHtfx-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="cwHtfx-info_fhetongname"><spring:message
										code="cwHtfx-info.cwHtfx-info.input.fhetongname" text="合同名称" /></label>
								<div class="controls">
									<input id="cwHtfx-info_fhetongname" type="text"
										name="fhetongname" value="${model.fhetongname}" size=""
										class="text " minlength="" maxlength="">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="cwHtfx-info_fhetongjine"><spring:message
										code="cwHtfx-info.cwHtfx-info.input.fhetongjine" text="合同金额" /></label>
								<div class="controls">
									<input id="cwHtfx-info_fhetongjine" type="text"
										name="fhetongjine" value="${model.fhetongjine}" size=""
										class="text " minlength="" maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="cwHtfx-info_fsjzsr"><spring:message
										code="cwHtfx-info.cwHtfx-info.input.fsjzsr" text="实际总收入" /></label>
								<div class="controls">
									<input id="cwHtfx-info_fsjzsr" type="text" name="fsjzsr"
										value="${model.fsjzsr}" size="" class="text " minlength=""
										maxlength="">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="cwHtfx-info_fyszk"><spring:message
										code="cwHtfx-info.cwHtfx-info.input.fyszk" text="应收账款" /></label>
								<div class="controls">
									<input id="cwHtfx-info_fyszk" type="text" name="fyszk"
										value="${model.fyszk}" size="" class="text "
										minlength="" maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="cwHtfx-info_fhsl"><spring:message
										code="cwHtfx-info.cwHtfx-info.input.fhsl" text="回收率" /></label>
								<div class="controls">
									<input id="cwHtfx-info_fhsl" type="text" name="fhsl"
										value="${model.fhsl}" size="" class="text " minlength=""
										maxlength="">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="cwHtfx-info_fysjlf"><spring:message
										code="cwHtfx-info.cwHtfx-info.input.fysjlf" text="应收监理费" /></label>
								<div class="controls">
									<input id="cwHtfx-info_fysjlf" type="text" name="fysjlf"
										value="${model.fysjlf}" size="" class="text "
										minlength="" maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="cwHtfx-info_flyl"><spring:message
										code="cwHtfx-info.cwHtfx-info.input.flyl" text="履约率" /></label>
								<div class="controls">
									<input id="cwHtfx-info_flyl" type="text" name="flyl"
										value="${model.flyl}" size="" class="text " minlength=""
										maxlength="">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="cwHtfx-info_fgcjd"><spring:message
										code="cwHtfx-info.cwHtfx-info.input.fgcjd" text="工程进度" /></label>
								<div class="controls">
									<input id="cwHtfx-info_fgcjd" type="text" name="fgcjd"
										value="${model.fgcjd}" size="" class="text "
										minlength="" maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="cwHtfx-info_fqksm"><spring:message
										code="cwHtfx-info.cwHtfx-info.input.fqksm" text="情况说明" /></label>
								<div class="controls">
									<input id="cwHtfx-info_fqksm" type="text" name="fqksm"
										value="${model.fqksm}" size="" class="text " minlength=""
										maxlength="">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="cwHtfx-info_fmemo"><spring:message
										code="cwHtfx-info.cwHtfx-info.input.fmemo" text="备注" /></label>
								<div class="controls">
									<input id="cwHtfx-info_fmemo" type="text" name="fmemo"
										value="${model.fmemo}" size="" class="text "
										minlength="" maxlength="">
								</div>
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
