<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "gcgl-home");
%>
<%
	pageContext.setAttribute("currentMenu", "gcgl-jlf");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="jlf-info.jlf-info.input.title"
		text="监理费回收" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript">
	$(
			function() {
				$("#jlf-infoForm")
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
		<!-- start of main -->
		<section id="m-main" class="span10">
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="jlf-info.jlf-info.input.title" text="监理费回收" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="jlf-infoForm" method="post" action="jlf-info-save.do"
						class="form-horizontal">
						<c:if test="${model != null}">
							<input id="jlf-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<%-- 	<div class="control-group">
							<label class="control-label" for="jlf-info_fxmid"><spring:message
									code="jlf-info.jlf-info.input.fxmid" text="项目id" /></label>
							<div class="controls">
								<input id="jlf-info_fxmid" type="text" name="fxmid"
									value="${model.fxmid}" size="" class="number   " 
									maxlength="">
							</div>
						</div> --%>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="jlf-info_fhtke"><spring:message
										code="jlf-info.jlf-info.input.fhtke" text="合同款额" /></label>
								<div class="controls">
									<input id="jlf-info_fhtke" type="text" name="fhtke"
										value="${model.fhtke}" size="" class="text required"
										maxlength="">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="jlf-info_fhtgq"><spring:message
										code="jlf-info.jlf-info.input.fhtgq" text="合同工期" /></label>
								<div class="controls">
									<input id="jlf-info_fhtgq" type="text" name="fhtgq"
										value="${model.fhtgq}" size="" class="text required"
										maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="jlf-info_fzffs"><spring:message
									code="jlf-info.jlf-info.input.fzffs" text="支付方式" /></label>
							<div class="controls">
								<textarea id="jlf-info_fzffs" name="fzffs" class="form-control"
									rows="6" style="width: 560px" class="text  " maxlength="400">${model.fzffs}</textarea>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="jlf-info_jlfsum"><spring:message
										code="jlf-info.jlf-info.input.jlfsum" text="已收监理费" /></label>
								<div class="controls">
									<input id="jlf-info_jlfsum" type="text" name=""
										value="${jlfSum}" size="" class="text " maxlength=""> <a href="jlfRecord-info-list.do"><span
								class="add-on" style="padding-top: 2px; padding-bottom: 2px;" ><i
								class="icon-th-list" ></i></span></a>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="jlf-info_fbqys"><spring:message
										code="jlf-info.jlf-info.input.fbqys" text="本期应收监理费" /></label>
								<div class="controls">
									<input id="jlf-info_fbqys" type="text" name="fbqys"
										value="${model.fbqys}" size="" class="text "
										maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="jlf-info_fmemo"><spring:message
									code="jlf-info.jlf-info.input.fmemo" text="备注（原因分析）" /></label>
							<div class="controls">
								<textarea id="jlf-info_fmemo" name="fmemo" class="form-control"
									rows="6" style="width: 560px" class="text  " maxlength="400">${model.fmemo}</textarea>
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
