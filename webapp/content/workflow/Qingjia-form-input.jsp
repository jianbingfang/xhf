<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "dashboard");
%>
<%
	pageContext.setAttribute("currentMenu", "dashboard");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message
		code="commHt-info.commHt-info.input.title" text="编辑" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/js/linkage.js"></script>
<%-- <link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/xmpicker/xmpicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/xmpicker/xmpicker.js"></script> --%>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
 <link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/jyxmpicker/jyxmpicker.css"> 
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/jyxmpicker/jyxmpicker.js"></script>
	<script type="text/javascript">
	<%--window.onload = function() {--%>
		<%--pc_init();--%>
		<%--setProvCity("${model.fprovince}", "${model.fcity}");--%>
	<%--};--%>


	<%--$(--%>
			<%--function() {--%>
				<%--$("#commHt-infoForm")--%>
						<%--.validate(--%>
								<%--{--%>
									<%--submitHandler : function(form) {--%>
										<%--bootbox.animate(false);--%>
										<%--var box = bootbox--%>
												<%--.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');--%>
										<%--form.submit();--%>
									<%--},--%>
									<%--errorClass : 'validate-error'--%>
								<%--});--%>
		 	<%--createjyxmPicker({--%>
					<%--modalId : 'jyxmPicker',--%>
					<%--url : '${scopePrefix}/sckf/jyXm-toubiao-simple-list.do'--%>
					<%--//redUrl : '${scopePrefix}/sckf/jyXm-info-input.do'--%>
				<%--});  --%>
				<%--createryPicker({--%>
					<%--modalId : 'ryPicker',--%>
					<%--url : '${scopePrefix}/hr/commRy-simple-list.do'--%>
				<%--});--%>
			<%--})--%>
	</script>
</head>
<body>
	<%@include file="/header.jsp"%>
	<div class="row-fluid">
		<%@include file="/menu/bpm-workspace.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span10">
			<!-- <div class="container-fluid">
				<ul class="breadcrumb" style="width: 98%">
					<li><a href="sckf-home.do">市场开发</a> <span class="divider">/</span>
					</li>
					<li><a href="sckf-week-plain-info-list.do">合同管理</a><span
						class="divider">/</span></li>
					<li class="active">合同</li>
				</ul>
			</div> -->
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="commHt-info.commHt-info.input.title"
							text="编辑" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="Qingjia-infoForm" method="post"
						action="Qingjia-form-save.do" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="Qingjia-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						
						<%--<div class="control-group">--%>
							<%--<div class="span5">--%>
								<%--<label class="control-label" for="commHt-info_fxmid"><spring:message--%>
										<%--code="commHt-info.commHt-info.input.fxmid" text="项目名称" /></label>--%>
								<%--<div class="controls">--%>
									<%--<div class="input-append jyxmPicker">--%>
										<%--<input id="commHt-info_fxmid" type="hidden" name="fxmid"--%>
											<%--value="${model.fxmid}"> <input--%>
											<%--id="xmBxRecord-info_xmmc" type="text"--%>
											<%--value="${jyxmMap[model.fxmid].fname}" disabled--%>
											<%--class=" required" style="width: 175px;" value=""> <span--%>
											<%--class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i--%>
											<%--class="icon-th-list"></i></span>--%>
									<%--</div>--%>
								<%--</div>--%>
							<%--</div>--%>
							<%--<div class="span5">--%>
								<%--<label class="control-label" for="commHt-info_fmemo4"><spring:message--%>
										<%--code="commHt-info.commHt-info.input.fmemo4" text="属性" /></label>--%>
								<%--<div class="controls">--%>
										<%--<input id="commHt-info_fmemo4" type="text" name="fmemo4"--%>
										<%--value="${model.fmemo4}" size="" class="text " minlength=""--%>
										<%--maxlength="">--%>
								<%--</div>--%>
							<%--</div>--%>
						<%--</div>--%>
						<div class="control-group">

							<div class="span5">
								<label class="control-label" for="qingjia_fstartdate"><spring:message
										code="commHt-info.commHt-info.input.fstartdate" text="请假开始时间" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										 style="padding-left: 0px;">
										<input id="qingjia_fstartdate" type="text"
											   name="fstartdate" value="${model.fstartdate}" size="40"
											   class="text "
											   style="background-color:white;cursor:default; width: 175px;">
										<span class="add-on"
											  style="padding-top: 2px; padding-bottom: 2px;"><i
												class="icon-calendar"></i></span>
									</div>
								</div>
							</div>



							<div class="span5">
								<label class="control-label" for="qingjia_fenddate"><spring:message
										code="commHt-info.commHt-info.input.fstartdate" text="请假结束时间" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										 style="padding-left: 0px;">
										<input id="qingjia_fenddate" type="text"
											   name="fenddate" value="${model.fenddate}" size="40"
											   class="text "
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
								<label class="control-label" for="qingjia_id"><spring:message
										code="commHt-info.commHt-info.input.fxmid" text="请假原因" /></label>
								<div class="controls">

									<textarea id="qingjia_id" name="qingjia_name"
											  class="form-control" rows="10" style="width: 560px"
											  class="text " minlength="" maxlength="">${model.fname}</textarea>

								</div>
							</div>
						</div>

						<div class="control-group">
							<div class="span5">
								<div class="span5">
									<label class="control-label" for="qingjia_fmemo"><spring:message
											code="commHt-info.commHt-info.input.fhetongno" text="批示" /></label>
									<div class="controls">
										<input id="qingjia_fmemo" type="text" name="fmemo" readonly="readonly"
											   value="${model.fmemo}" size="" class="text " minlength=""
											   maxlength="">
									</div>
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
