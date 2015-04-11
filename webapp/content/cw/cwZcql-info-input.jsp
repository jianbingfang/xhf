<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "cw-home");
%>
<%
	pageContext.setAttribute("currentMenu", "cwZc");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="cwZc-info.cwZc-info.input.title"
		text="编辑" /></title>
<%@include file="/common/s.jsp"%>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/xmpicker/xmpicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/xmpicker/xmpicker.js"></script>
<script type="text/javascript">
	$(
			function() {
				$("#cwZc-infoForm")
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
			/* 	createxmPicker({
					modalId : 'xmPicker',
					url : '${scopePrefix}/gcgl/pjXm-simple-list.do'
				}); */
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
						<spring:message code="cwZc-info.cwZc-info.input.title" text="编辑" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="cwZc-infoForm" method="post" action="cwZc-info-save.do"
						class="form-horizontal">
						<c:if test="${model != null}">
							<input id="cwZc-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<div class="control-group">
							<label class="control-label" for="cwZc-info_fcode"><spring:message
									code="cwZc-info.cwZc-info.input.fcode" text="编号" /></label>
							<div class="controls">
								<input id="cwZc-info_fcode" type="text" name="fcode"
									value="${model.fcode}" size="" class="text required" readonly>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="cwZc-info_fname"><spring:message
									code="cwZc-info.cwZc-info.input.fname" text="名称" /></label>
							<div class="controls">
								<input id="cwZc-info_fname" type="text" name="fname"
									value="${model.fname}" size="" class="text " readonly>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="cwZc-info_ftype"><spring:message
									code="cwZc-info.cwZc-info.input.ftype" text="分类" /></label>
							<div class="controls">
								<input id="cwZc-info_ftype" type="text" name="ftype"
									value="${model.ftype}" size="" class="text " readonly>
							</div>
						</div>
					
						<div class="control-group">
							<label class="control-label" for="cwZc-info_fqldate"><spring:message
									code="cwZc-info.cwZc-info.input.fqldate" text="清理时间" /></label>
							<div class="controls">
								<div class="input-append datepicker date"
									style="padding-left: 0px;">
									<input id="cwZc-info_fqldate" type="text" name="fqldate"
										value="${model.fqldate}" size="40" class="text "
										style="background-color:white;cursor:default; width: 175px;">
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-calendar"></i></span>
								</div>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="cwZc-info_fqljine"><spring:message
									code="cwZc-info.cwZc-info.input.fqlprice" text="清理金额" /></label>
							<div class="controls">
								<input id="cwZc-info_fqlprice" type="text" name="fqlprice"
									value="${model.fqlprice}" size="" class="text required">
							</div>
						</div>
							<div class="control-group">
							<label class="control-label" for="cwZc-info_fxmid"><spring:message
									code="cwZc-info.cwZc-info.input.fxmid" text="项目名称" /></label>
							<div class="controls">
								<div class="input-append xmPicker">
									<input id="xzChufa-info_fxmid" type="hidden" name="fxmid"
										value="${model.fxmid}"> <input
										id="xmBxRecord-info_xmmc" type="text"
										value="${xmMap[model.fxmid].fxmname}" disabled
										class=" required" style="width: 175px;" value=""> <span
										class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-th-list"></i></span>
								</div>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="cwZc-info_fmemo"><spring:message
									code="cwZc-info.cwZc-info.input.fmemo" text="备注" /></label>
							<div class="controls">
								<input id="cwZc-info_fmemo" type="text" name="fmemo"
									value="${model.fmemo}" size="" class="text ">
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
