<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "gcgl-home");
%>
<%
	pageContext.setAttribute("currentMenu", "gcgl-yq");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="wzIo-info.wzIo-info.input.title"
		text="编辑" /></title>
<%@include file="/common/s.jsp"%>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/xmpicker/xmpicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/xmpicker/xmpicker.js"></script>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/wzpicker/wzpicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/wzpicker/wzpicker.js"></script>
<script type="text/javascript">
	$(
			function() {
				$("#wzIo-infoForm")
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
				createxmPicker({
					modalId : 'xmPicker',
					url : '${scopePrefix}/gcgl/pjXm-simple-list.do'
				});
				createwzPicker({
					modalId : 'wzPicker',
					url : '${scopePrefix}/xz/wzList-simple-list.do'
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
						<spring:message code="wzIo-info.wzIo-info.input.title" text="编辑" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="wzIo-infoForm" method="post" action="wzIo-info-save.do"
						class="form-horizontal">
						<c:if test="${model != null}">
							<input id="wzIo-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="wzIo-info_fwzid"><spring:message
										code="wzIo-info.wzIo-info.input.fwzid" text="物资编号" /></label>
								<div class="controls">
									<input id="wzIo-info_fwzid" type="hidden" name="fwzid"
										value="${model.fwzid}"> <input id="wzIo-info_fwzname"
										type="text" value="${wzMap[model.fwzid].fcode}" disabled
										class=" required" value="" readonly>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="wzIo-info_fwzid"><spring:message
										code="wzIo-info.wzIo-info.input.fwzid" text="名称" /></label>
								<div class="controls">
									<input id="wzIo-info_fwzname" type="text"
										value="${wzMap[model.fwzid].fname}" disabled class=" required"
										value="" readonly>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="wzIo-info_fwzid"><spring:message
										code="wzIo-info.wzIo-info.input.fwzid" text="规格" /></label>
								<div class="controls">
									<input id="wzIo-info_fwzname" type="text"
										value="${wzMap[model.fwzid].fgg}" disabled class=" required"
										value="" readonly>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="wzIo-info_fdcxm"><spring:message
										code="wzIo-info.wzIo-info.input.fdcxm" text="调出项目" /></label>
								<div class="controls">
									<input id="wzIo-info_fdcxm" type="hidden" name="fdcxm"
										value="${model.fdcxm}"> <input id="wzIo-info_fdcxmmc"
										type="text" value="${xmMap[model.fdcxm].fxmname}" disabled
										class=" required" value="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="wzIo-info_fdrxm"><spring:message
										code="wzIo-info.wzIo-info.input.fdrxm" text="调入项目" /></label>
								<div class="controls">
									<div class="input-append xmPicker">
										<input id="wzIo-info_fdrxm" type="hidden" name="fdrxm"
											value="${model.fdrxm}"> <input id="wzIo-info_fdrxmmc"
											type="text" value="${xmMap[model.fdrxm].fxmname}" disabled
											class=" required" style="width: 175px;" value=""> <span
											class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-th-list"></i></span>
									</div>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="wzIo-info_fyy"><spring:message
										code="wzIo-info.wzIo-info.input.fyy" text="原因" /></label>
								<div class="controls">
									<textarea id="wzIo-info_fyy" name="fyy" class="form-control"
										rows="3" class="text  " minlength="" maxlength="200">${model.fyy}</textarea>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="wzIo-info_fdate"><spring:message
										code="wzIo-info.wzIo-info.input.fdate" text="时间" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="wzIo-info_fdate" type="text" name="fdate"
											 value="${model.fmemo2}" size="40" class="text "
											style="background-color:white;cursor:default; width: 175px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="wzIo-info_fwhqk"><spring:message
										code="wzIo-info.wzIo-info.input.fwhqk" text="新旧程度" /></label>
								<div class="controls">
									<input id="wzIo-info_fwhqk" type="text" name="fwhqk"
										value="${model.fwhqk}" size="" class="text " minlength=""
										maxlength="64">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="wzIo-info_fjbr"><spring:message
										code="wzIo-info.wzIo-info.input.fjbr" text="经办人" /></label>
								<div class="controls">
									<div class="input-append ryPicker">
										<input id="wzIo-info_fjbr" type="hidden" name="fjbr"
											value="${model.fjbr}"> <input id="wzIo-info_fjbrName"
											type="text" value="${ryMap[model.fjbr].fname}" disabled
											class=" required" style="width: 175px;" value=""> <span
											class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-user"></i></span>
									</div>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="wzIo-info_fmemo1"><spring:message
										code="wzIo-info.wzIo-info.input.fmemo1" text="领用人" /></label>
								<div class="controls">
									<input id="wzIo-info_fmemo1" type="text" name="fmemo1"
										value="${model.fmemo1}" size="" class="text " minlength=""
										maxlength="100">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="wzIo-info_fmemo"><spring:message
										code="wzIo-info.wzIo-info.input.fmemo" text="备注" /></label>
								<div class="controls">
									<textarea id="wzIo-info_fmemo" name="fmemo"
										class="form-control" rows="3" class="text  " minlength=""
										maxlength="500">${model.fmemo}</textarea>
								</div>
							</div>
						</div>
						<%-- 	<div class="control-group">
							<div class="span5">
								<label class="control-label" for="wzIo-info_fmemo1"><spring:message
										code="wzIo-info.wzIo-info.input.fmemo1" text="备注1" /></label>
								<div class="controls">
									<textarea id="wzIo-info_fmemo1" name="fmemo1"
										class="form-control" rows="6" style="width: 560px"
										class="text  " minlength="" maxlength="500">${model.fmemo1}</textarea>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="wzIo-info_fmemo2"><spring:message
										code="wzIo-info.wzIo-info.input.fmemo2" text="备注2" /></label>
								<div class="controls">
									<textarea id="wzIo-info_fmemo2" name="fmemo2"
										class="form-control" rows="6" style="width: 560px"
										class="text  " minlength="" maxlength="500">${model.fmemo2}</textarea>
								</div>
							</div>
						</div> --%>
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
