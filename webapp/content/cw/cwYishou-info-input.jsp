<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "cw-home");
%>
<%
	pageContext.setAttribute("currentMenu", "cw-zk");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message
		code="cwYiShou-info.cwYiShou-info.input.title" text="已收账款明细" /></title>
	   <link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/htpicker/htpicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/htpicker/htpicker.js"></script>
	<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
<%@include file="/common/s.jsp"%>
<script type="text/javascript">
	$(
			function() {
				$("#cwYiShou-infoForm")
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
				createhtPicker({
					modalId : 'htPicker',
					url : '${scopePrefix}/sckf/ht-simple-list.do'
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
		<%@include file="/menu/cw-workspace.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span10">
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="cwYiShou-info.cwYiShou-info.input.title"
							text="已收账款明细" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="cwYiShou-infoForm" method="post"
						action="cwYiShou-info-save.do" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="cwYiShou-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<div class="control-group">
							<label class="control-label" for="cwYiShou-info_fhtid"><spring:message
									code="cwYiShou-info.cwYiShou-info.input.fhtid" text="项目" /></label>
							<div class="controls">
								<div class="input-append htPicker">
									<input id="cwYiShou-info_fhtid" type="hidden" name="fxmid"
										value="${model.fxmid}"> <input
										id="cwYiShou-info_htmc" type="text"
										value="${htMap[model.fxmid].fhtname}" disabled
										class=" required" style="width: 500px;" value=""> <span
										class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-th-list"></i></span>
								</div>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="cwYiShou-info_fdzdate"><spring:message
									code="cwYiShou-info.cwYiShou-info.input.fdzdate"
									text="到账时间" /></label>
							<div class="controls">
								<div class="input-append datepicker date"
									style="padding-left: 0px;">
									<input id="cwYiShou-info_fdzdate" type="text" name="fdzdate"
										value="${model.fdzdate}" size="40" class="text required"
										style="background-color:white;cursor:default; width: 175px;">
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-calendar"></i></span>
								</div>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="cwYiShou-info_fcreditor"><spring:message
									code="cwYiShou-info.cwYiShou-info.input.fcreditor"
									text="贷方金额" /></label>
							<div class="controls">
								<input id="cwYiShou-info_fcreditor" type="number"
									name="fcreditor" value="${model.fcreditor==null?0:model.fcreditor}" size=""
									class="number required" >
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="cwYiShou-info_foprator"><spring:message
									code="cwYiShou-info.cwYiShou-info.input.foprator"
									text="经办人" /></label>
							<div class="controls">
									<div class="input-append ryPicker">
										<input id="cwYiShou-info_foprator" type="hidden" name="foprator"
											value="${model.foprator}"> <input
											id="cwYiShou-info_userName" type="text"
											value="${ryMap[model.foprator].fname}" disabled readonly
											class=" required" style="width: 175px;" value=""> <span
											class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-user"></i></span>
									</div>
							</div>
						</div>
				<%-- 		<div class="control-group">
							<label class="control-label" for="cwYiShou-info_fhjjdfx"><spring:message
									code="cwYiShou-info.cwYiShou-info.input.fhjjdfx"
									text="合计借贷方向" /></label>
							<div class="controls">
								<input id="cwYiShou-info_fhjjdfx" type="text" name="fhjjdfx"
									value="${model.fhjjdfx}" size="" class="text required"
									>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="cwYiShou-info_fhjje"><spring:message
									code="cwYiShou-info.cwYiShou-info.input.fhjje" text="合计金额" /></label>
							<div class="controls">
								<input id="cwYiShou-info_fhjje" type="text" name="fhjje"
									value="${model.fhjje}" size="" class="text " 
									maxlength="">
							</div>
						</div> --%>
						<div class="control-group">
							<label class="control-label" for="cwYiShou-info_fmemo"><spring:message
									code="cwYiShou-info.cwYiShou-info.input.fmemo" text="备注" /></label>
							<div class="controls">
								<input id="cwYiShou-info_fmemo" type="text" name="fmemo"
									value="${model.fmemo}" size="" class="text "
									>
							</div>
						</div>
						<div class="control-group">
							<div class="controls">
								<button type="submit" class="btn a-submit">
									<spring:message code='core.input.YiShousave' text='保存' />
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
