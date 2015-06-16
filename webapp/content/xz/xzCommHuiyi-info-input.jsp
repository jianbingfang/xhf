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
		code="xzCommHuiyi-info.xzCommHuiyi-info.input.title"
		text="会议记录 - 公司公司会议 - 行政管理" /></title>
<%@include file="/common/s.jsp"%>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/js/jquery.min.js"></script>
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
				createryPicker({
					modalId : 'ryPicker',
					url : '${scopePrefix}/hr/commRy-simple-list.do'
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
			<!-- <div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<ul class="breadcrumb">
				<li>
					<a href="xz-workspace.do">行政管理</a> <span class="divider">/</span>
				</li>
				<li>
					公司会议<span class="divider">/</span>
				</li>
				<li class="active">
					会议记录
				</li>
			</ul>
		</div>
	</div>
</div> -->
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message
							code="xzCommHuiyi-info.xzCommHuiyi-info.input.title" text="编辑" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="xzCommHuiyi-infoForm" method="post"
						action="xzCommHuiyi-info-save.do" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="xzCommHuiyi-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="xzCommHuiyi-info_ftype"><spring:message
										code="xzCommHuiyi-info.xzCommHuiyi-info.input.ftype" text="类型" /></label>
								<div class="controls">
									<select class="form-control" id="xzCommHuiyi-info_ftype"
										name="ftype" value="${model.ftype}" class=" ">
										<option value="高管例会"
											<c:if test="${model.ftype}=='高管例会'}"> selected="selected"  </c:if>>高管例会</option>
										<option value="总监会"
											<c:if test="${model.ftype}=='总监会'}"> selected="selected"  </c:if>>总监会</option>
										<option value="年终会"
											<c:if test="${model.ftype}=='年终会'}"> selected="selected"  </c:if>>年终会</option>
										<option value="其他"
											<c:if test="${model.ftype}=='其他'}"> selected="selected"  </c:if>>其他</option>
									</select>
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
								<label class="control-label" for="xzCommHuiyi-info_fhyzt"><spring:message
										code="xzCommHuiyi-info.xzCommHuiyi-info.input.fhyzt"
										text="会议主题" /></label>
								<div class="controls">
									<input id="xzCommHuiyi-info_fhyzt" type="text" name="fhyzt"
										value="${model.fhyzt}" size="" class="text " minlength=""
										maxlength="">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="xzCommHuiyi-info_fzhuchir"><spring:message
										code="xzCommHuiyi-info.xzCommHuiyi-info.input.fzhuchir"
										text="主持人" /></label>
								<div class="controls">
									<input id="ryBxRecord-info_userName" type="text"
										value="${model.fzhuchir}" class="text" name="fzhuchir"
										style="width: 175px;" value="">
								</div>
							</div>
						</div>
						<div class="control-group">
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
							<div class="span5">
								<label class="control-label" for="xzCommHuiyi-info_faddress"><spring:message
										code="xzCommHuiyi-info.xzCommHuiyi-info.input.faddress"
										text="会议地点" /></label>
								<div class="controls">
									<input id="xzCommHuiyi-info_faddress" type="text"
										name="faddress" value="${model.faddress}" size=""
										class="text " minlength="" maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="xzCommHuiyi-info_fcanyurenyuan"><spring:message
									code="xzCommHuiyi-info.xzCommHuiyi-info.input.fcanyurenyuan"
									text="参会人员" /></label>
							<div class="controls">
								<textarea id="hrPx-info_fzlmc" name="fcanyurenyuan"
									class="form-control" rows="3" style="width: 560px"
									class="text " minlength="" maxlength="">${model.fcanyurenyuan}</textarea>

							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="xzCommHuiyi-info_fhycontent"><spring:message
									code="xzCommHuiyi-info.xzCommHuiyi-info.input.fhycontent"
									text="会议内容" /></label>
							<div class="controls">
								<textarea id="xzCommHuiyi-info_fhycontent" name="fhycontent"
									class="form-control" rows="6" style="width: 560px"
									class="text  " minlength="" maxlength="4000">${model.fhycontent}</textarea>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="xzCommHuiyi-info_fresult"><spring:message
									code="xzCommHuiyi-info.xzCommHuiyi-info.input.fresult"
									text="会议决议" /></label>
							<div class="controls">
								<textarea id="xzCommHuiyi-info_fresult" name="fresult"
									class="form-control" rows="6" style="width: 560px"
									class="text  " minlength="" maxlength="4000">${model.fresult}</textarea>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="xzCommHuiyi-info_fmemo"><spring:message
									code="xzCommHuiyi-info.xzCommHuiyi-info.input.fmemo" text="备注" /></label>
							<div class="controls">
								<textarea id="xzCommHuiyi-info_fmemo" name="fmemo"
									class="form-control" rows="3" style="width: 560px"
									class="text  " minlength="" maxlength="1000">${model.fmemo}</textarea>
							</div>
						</div>
						<div class="control-group hidden">
							<label class="control-label" for="xzCommHuiyi-info_fneiwai"><spring:message
									code="xzCommHuiyi-info.xzCommHuiyi-info.input.fneiwai"
									text="内外" /></label>
							<div class="controls">
								<input id="xzCommHuiyi-info_fneiwai" name="fneiwai"
									class="form-control" class="text  " value="内">
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
