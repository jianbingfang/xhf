<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "gcgl-home");
%>
<%
	pageContext.setAttribute("currentMenu", "jlfRecord");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message
		code="jlfRecord-info.jlfRecord-info.input.title" text="编辑" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript">
	$(
			function() {
				$("#jlfRecord-infoForm")
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
		<%@include file="/menu/gcgl-workspace.jsp"%>
		<div class="row-fluid">
			<!-- start of main -->
			<section id="m-main" class="span10">
				<article class="m-widget">
					<header class="header">
						<h4 class="title">
							<spring:message code="jlfRecord-info.jlfRecord-info.input.title"
								text="编辑" />
						</h4>
					</header>
					<div class="content content-inner">
						<form id="jlfRecord-infoForm" method="post"
							action="jlfRecord-info-save.do?fxmid=${model.fxmid}" class="form-horizontal">
							<c:if test="${model != null}">
								<input id="jlfRecord-info_id" type="hidden" name="fid"
									value="${model.fid}">
							</c:if>
							<div class="control-group">
								<div class="span5">
									<label class="control-label" for="jlfRecord-info_fhtjlf"><spring:message
											code="jlfRecord-info.jlfRecord-info.input.fhtjlf"
											text="监理费" /></label>
									<div class="controls">
										<input id="jlfRecord-info_fhtjlf" type="text" name="fhtjlf"
											value="${model.fhtjlf}" size="" class="text " minlength=""
											maxlength="">
									</div>
								</div>
								<div class="span5">
									<label class="control-label" for="jlfRecord-info_fmemo"><spring:message
											code="jlfRecord-info.jlfRecord-info.input.fmemo" text="说明" /></label>
									<div class="controls">
										<input id="jlfRecord-info_fmemo" type="text" name="fmemo"
											value="${model.fmemo}" size="" class="text " minlength=""
											maxlength="">
									</div>
								</div>
							</div>

							<div class="control-group">
								<div class="span5">
									<label class="control-label"
										for="jlfRecord-info_fshifoudaozhang"><spring:message
											code="jlfRecord-info.jlfRecord-info.input.fshifoudaozhang"
											text="是否到账" /></label>
									<div class="controls">
										<input type="text" name="fshifoudaozhang"
											<c:if test="${model != null}"> value="${model.fshifoudaozhang}" </c:if>
											<c:if test="${model == null}"> value="否" </c:if>
											 />
									</div>
								</div>
								<div class="span5">
									<label class="control-label" for="jlfRecord-info_fdaozhangdate"><spring:message
											code="jlfRecord-info.jlfRecord-info.input.fdaozhangdate"
											text="到账时间" /></label>
									<div class="controls">
										<input id="jlfRecord-info_fdaozhangdate"
											type="text" name="fdaozhangdate"
											value="${model.fdaozhangdate}" size="40">
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
		</div>
	</div>
</body>
</html>
