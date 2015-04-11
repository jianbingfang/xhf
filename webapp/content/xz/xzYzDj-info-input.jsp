<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "xz-home");
%>
<%
	pageContext.setAttribute("currentMenu", "xz-yz");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message
		code="xzYzDj-info.xzYzDj-info.input.title" text="编辑" /></title>
<%@include file="/common/s.jsp"%>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
<script type="text/javascript">
	$(
			function() {
				$("#xzYzDj-infoForm")
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
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="xzYzDj-info.xzYzDj-info.input.title"
							text="编辑" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="xzYzDj-infoForm" method="post"
						action="xzYzDj-info-save.do" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="xzYzDj-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="xzYzDj-info_fsybm"><spring:message
										code="xzYzDj-info.xzYzDj-info.input.fsybm" text="使用部门" /></label>
								<div class="controls">
									<input id="xzYzDj-info_fsybm" type="text" name="fsybm"
										value="${model.fsybm}" size="" class="text " minlength=""
										maxlength="">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="xzYzDj-info_fsy"><spring:message
										code="xzYzDj-info.xzYzDj-info.input.fsy" text="事由" /></label>
								<div class="controls">
									<textarea id="xzYzDj-info_fsy" name="fsy" class="form-control"
										rows="2" class="text  " minlength="" maxlength="200">${model.fsy}</textarea>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="xzYzDj-info_fspren"><spring:message
										code="xzYzDj-info.xzYzDj-info.input.fspren" text="审批人" /></label>
								<div class="controls">
									<div class="input-append ryPicker">
										<input id="xzYzDj-info_fspren" type="hidden" name="fspren"
											value="${model.fspren}"> <input
											id="ryBxRecord-info_userName" type="text"
											value="${ryMap[model.fspren].fname}" disabled
											class=" required" style="width: 175px;" value=""> <span
											class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-user"></i></span>
									</div>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="xzYzDj-info_fname"><spring:message
										code="xzYzDj-info.xzYzDj-info.input.fname" text="工程名称" /></label>
								<div class="controls">
									<input id="xzYzDj-info_fname" type="text" name="fname"
										value="${model.fname}" size="" class="text required"
										minlength="" maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="xzYzDj-info_fzhubanren"><spring:message
										code="xzYzDj-info.xzYzDj-info.input.fzhubanren" text="主办人" /></label>
								<div class="controls">
								<div class="input-append ryPicker">
									<input id="xzYzDj-info_fzhubanren" type="hidden" name="fzhubanren"
										value="${model.fzhubanren}"> <input
										id="ryBxRecord-info_fzhubanrenuserName" type="text" value="${ryMap[model.fzhubanren].fname}"
										disabled class=" required" style="width: 175px;" value="">
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-user"></i></span>
								</div>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="xzYzDj-info_fdate"><spring:message
										code="xzYzDj-info.xzYzDj-info.input.fdate" text="使用日期" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="xzYzDj-info_fdate" type="text" name="fdate"
											value="${model.fdate}" size="40" class="text "
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
								<label class="control-label" for="xzYzDj-info_fshoufei"><spring:message
										code="xzYzDj-info.xzYzDj-info.input.fshoufei" text="收费" /></label>
								<div class="controls">
									<input id="xzYzDj-info_fshoufei" type="number" name="fshoufei"
										value="${model.fshoufei}" size="" class="number   "
										minlength="" maxlength="20">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="xzYzDj-info_fbszzr"><spring:message
										code="xzYzDj-info.xzYzDj-info.input.fbszzr" text="标书制作人" /></label>
								<div class="controls">
									<div class="input-append ryPicker">
										<input id="xzYzDj-info_fbszzr" type="hidden" name="fbszzr"
											value="${model.fbszzr}"> <input
											id="ryBxRecord-info_userName" type="text"
											value="${ryMap[model.fbszzr].fname}" disabled
											class=" required" style="width: 175px;" value=""> <span
											class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-user"></i></span>
									</div>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="xzYzDj-info_fmemo"><spring:message
										code="xzYzDj-info.xzYzDj-info.input.fmemo" text="备注" /></label>
								<div class="controls">
									<textarea id="xzYzDj-info_fmemo" name="fmemo"
										class="form-control" rows="3" class="text  " minlength=""
										maxlength="400">${model.fmemo}</textarea>
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
