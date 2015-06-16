<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "xz-home");
%>
<%
	pageContext.setAttribute("currentMenu", "xz-hy");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message
		code="xzCommHuiyi-info.xzCommHuiyi-info.input.title" text="编辑" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript">
	$(
			function() {
				$("#xzCommHuiyi-infoForm")
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
		<%@include file="/menu/xz-workspace.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span10">
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message
							code="xzCommHuiyi-info.xzCommHuiyi-info.input.title" text="编辑" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="xzCommHuiyi-infoForm" method="post"
						action="xzCommHuiyi-wb-info-save.do" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="xzCommHuiyi-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="xzCommHuiyi-info_fhyzt"><spring:message
										code="xzCommHuiyi-info.xzCommHuiyi-info.input.fhyzt"
										text="会议主题" /></label>
								<div class="controls">
									<input id="xzCommHuiyi-info_fhyzt" type="text" name="fhyzt"
										value="${model.fhyzt}" size="" class="text required" minlength=""
										maxlength="">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="xzCommHuiyi-info_fhydate"><spring:message
										code="xzCommHuiyi-info.xzCommHuiyi-info.input.fhydate"
										text="会议时间" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="xzCommHuiyi-info_fhydate" type="text"
											name="fhydate" value="${model.fhydate}" size="40"
											class="text required"
											style="background-color:white;cursor:default; width: 175px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="xzCommHuiyi-info_faddress"><spring:message
										code="xzCommHuiyi-info.xzCommHuiyi-info.input.faddress"
										text="组织人" /></label>
								<div class="controls">
									<input id="xzCommHuiyi-info_faddress" name="faddress"
										class="form-control" class="text  " minlength=""
										maxlength="200" type="text" value="${model.faddress}">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="xzCommHuiyi-info_fhycode"><spring:message
										code="xzCommHuiyi-info.xzCommHuiyi-info.input.fhycode"
										text="文号" /></label>
								<div class="controls">
									<input id="xzCommHuiyi-info_fhycode" type="text" name="fhycode"
										value="${model.fhycode}" size="" class="text " minlength=""
										maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="xzCommHuiyi-info_fzhuchir"><spring:message
										code="xzCommHuiyi-info.xzCommHuiyi-info.input.fzhuchir"
										text="主持人" /></label>
								<div class="controls">
									<input id="xzCommHuiyi-info_fzhuchir" type="text"
										name="fzhuchir" value="${model.fzhuchir}" size=""
										class="text " minlength="" maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label"
									for="xzCommHuiyi-info_fcanyurenyuan"><spring:message
										code="xzCommHuiyi-info.xzCommHuiyi-info.input.fcanyurenyuan"
										text="参与人员" /></label>
								<div class="controls">
									<textarea id="xzCommHuiyi-info_fcanyurenyuan"
										name="fcanyurenyuan" class="form-control" rows="3"
										style="width: 560px" class="text  " minlength=""
										maxlength="4000">${model.fcanyurenyuan}</textarea>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="xzCommHuiyi-info_fhycontent"><spring:message
										code="xzCommHuiyi-info.xzCommHuiyi-info.input.fhycontent"
										text="会议内容" /></label>
								<div class="controls">
									<textarea id="xzCommHuiyi-info_fhycontent" name="fhycontent"
										class="form-control" rows="6" style="width: 560px"
										class="text  " minlength="" maxlength="4000">${model.fhycontent}</textarea>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="xzCommHuiyi-info_fhyjf"><spring:message
										code="xzCommHuiyi-info.xzCommHuiyi-info.input.fhyjf"
										text="会议缴费" /></label>
								<div class="controls">
									<input id="xzCommHuiyi-info_fhyjf" name="fhyjf"
										class="form-control" type="text" class="text  " minlength=""
										maxlength="1000" value="${model.fhyjf}">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="xzCommHuiyi-info_ffpkjqk"><spring:message
										code="xzCommHuiyi-info.xzCommHuiyi-info.input.ffpkjqk"
										text="发票开具情况" /></label>
								<div class="controls">
									<input id="xzCommHuiyi-info_ffpkjqk" name="ffpkjqk"
										class="form-control" type="text" class="text  " minlength=""
										maxlength="255" value="${model.ffpkjqk}">
								</div>
							</div>
						</div>
						<div class="control-group hidden">
							<label class="control-label" for="xzCommHuiyi-info_fneiwai"><spring:message
									code="xzCommHuiyi-info.xzCommHuiyi-info.input.fneiwai"
									text="内外" /></label>
							<div class="controls">
								<input id="xzCommHuiyi-info_fneiwai" name="fneiwai"
									class="form-control" class="text  " value="外">
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
