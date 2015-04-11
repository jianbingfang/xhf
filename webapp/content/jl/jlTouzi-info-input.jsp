<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "jl-home");
%>
<%
	pageContext.setAttribute("currentMenu", "jl-xcgl");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message
		code="jlTouzi-info.jlTouzi-info.input.title" text="编辑" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript">
	$(
			function() {
				$("#jlTouzi-infoForm")
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
		<%@include file="/menu/jl-workspace.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span10">
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="jlTouzi-info.jlTouzi-info.input.title"
							text="编辑" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="jlTouzi-infoForm" method="post"
						action="jlTouzi-info-save.do" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="jlTouzi-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<input id="jlTouzi-info_ftype" type="hidden" name="ftype"
								value="${model.ftype==null?ftype:model.ftype}">
						<div class="control-group">
							<label class="control-label" for="jlTouzi-info_ftype"><spring:message
									code="jlTouzi-info.jlTouzi-info.input.ftype" text="类型" /></label>
							<div class="controls">
								<select class="form-control" id="jlTouzi-info_ftype"
									name="ftype" value="${model.ftype}" class="required " disabled="disabled">
									<%-- <option value="1"
										<c:if test="${model.ftype=='1'}"> selected="selected"</c:if>>概算投资额</option>--%>
									<option value="2"
										<c:if test="${param.ftype=='2'}"> selected="selected"</c:if>>合同价款</option> 
									<option value="3"  
										<c:if test="${param.ftype=='3'}"> selected="selected"</c:if>>工程款支付</option>
									<option value="4"
										<c:if test="${param.ftype=='4'}"> selected="selected"</c:if>>设计变更</option>
									<option value="5"
										<c:if test="${param.ftype=='5'}"> selected="selected"</c:if>>现场签证</option>
								<%-- 	<option value="6"
										<c:if test="${model.ftype=='6'}"> selected="selected"</c:if>>结算价</option> --%>
								</select>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="jlTouzi-info_fdwname"><spring:message
									code="jlTouzi-info.jlTouzi-info.input.fdwname" text="单位名称" /></label>
							<div class="controls">
								<input id="jlTouzi-info_fdwname" type="text" name="fdwname"
									value="${model.fdwname}" size="" class="text"
									maxlength="">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="jlTouzi-info_fjine"><spring:message
									code="jlTouzi-info.jlTouzi-info.input.fjine" text="金额" /></label>
							<div class="controls">
								<input id="jlTouzi-info_fjine" type="text" name="fjine"
									value="${model.fjine}" size="" class="text "
									maxlength="">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="jlTouzi-info_fdate"><spring:message
									code="jlTouzi-info.jlTouzi-info.input.fdate" text="时间" /></label>
							<div class="controls">
								<div class="input-append datepicker date"
									style="padding-left: 0px;">
									<input id="jlTouzi-info_fjine" type="text" name="fdate"
										value="${model.fdate}" size="40" class="text "
										style="background-color:white;cursor:default; width: 175px;">
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-calendar"></i></span>
								</div>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="jlTouzi-info_fmemo"><spring:message
									code="jlTouzi-info.jlTouzi-info.input.fmemo" text="备注" /></label>
							<div class="controls">
								<textarea id="jlTouzi-info_fmemo" name="fmemo" rows="3"
									class="text" maxlength="">${model.fmemo}</textarea>
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
						<!-- <div class="control-group">
							<label style="color: red;">备注：<br>概算投资额是指工程的整体预算，可不填写单位名称和时间。<br>合同价款是各个单位的合同款总额，需填写单位名称和时间。<br>工程款支付是指每项工程款的支付记录，需要填写单位名称和时间。
							</label>
						</div> -->
					</form>
				</div>
			</article>
		</section>
		<!-- end of main -->
	</div>
</body>
</html>
