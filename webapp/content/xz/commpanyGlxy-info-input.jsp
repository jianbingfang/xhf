<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "xz-home");
%>
<%
	pageContext.setAttribute("currentMenu", "xz-fgs");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message
		code="commpany-info.commpany-info.input.title" text="编辑" /></title>
<%@include file="/common/s.jsp"%>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
<script type="text/javascript">
	$(
			function() {
				$("#commpany-infoForm")
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
						<spring:message code="commpany-info.commpany-info.input.title"
							text="编辑" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="commpany-infoForm" method="post"
						action="commpany-info-save.do" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="commpany-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="commpany-info_fname"><spring:message
										code="commpany-info.commpany-info.input.fname" text="分公司/注册名称" /></label>
								<div class="controls">
									<textarea id="commpany-info_fname" name="fname"
										class="form-control" rows="3" class="text  " minlength=""
										maxlength="512">${model.fname}</textarea>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="commpany-info_faddress"><spring:message
										code="commpany-info.commpany-info.input.faddress" text="分公司地址" /></label>
								<div class="controls">
									<textarea id="commpany-info_faddress" name="faddress"
										class="form-control" rows="3" class="text  " minlength=""
										maxlength="512">${model.faddress}</textarea>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="commpany-info_ffuzeren"><spring:message
										code="commpany-info.commpany-info.input.ffuzeren" text="负责人" /></label>
								<div class="controls">
									<div class="input-append ryPicker">
										<input id="commpany-info_ffuzeren" type="hidden"
											name="ffuzeren" value="${model.ffuzeren}"> <input
											id="ryBxRecord-info_ffuzeren" type="text"
											value="${ryMap[model.ffuzeren].fname}" disabled class=" "
											style="width: 175px;" value=""> <span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-user"></i></span>
									</div>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="commpany-info_ftel"><spring:message
										code="commpany-info.commpany-info.input.ftel" text="联系电话" /></label>
								<div class="controls">
									<input id="commpany-info_ftel" type="text" name="ftel"
										value="${model.ftel}" size="" class="text " minlength=""
										maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="commpany-info_fglxyqdqk"><spring:message
										code="commpany-info.commpany-info.input.fglxyqdqk"
										text="管理协议签订情况" /></label>
								<div class="controls">
									<select class="form-control" id="commpany-info_fglxyqdqk"
										name="fglxyqdqk" value="${model.fglxyqdqk}" class=" ">
										<option value="未签订"
											<c:if test="${model.fglxyqdqk}=='未签订'}"> selected="selected"  </c:if>>未签订</option>
										<option value="谈判中"
											<c:if test="${model.fglxyqdqk}=='谈判中'}"> selected="selected"  </c:if>>谈判中</option>
										<option value="已签订"
											<c:if test="${model.fglxyqdqk}=='已签订'}"> selected="selected"  </c:if>>已签订</option>
									</select>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="commpany-info_fxyqdqk"><spring:message
										code="commpany-info.commpany-info.input.fxyqdqk" text="签订时间" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="commpany-info_fxyqdqk" type="text" name="fxyqdqk"
											value="${model.fxyqdqk}" size="40" class="text "
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
								<label class="control-label" for="commpany-info_fglfmoney"><spring:message
										code="commpany-info.commpany-info.input.fglfmoney"
										text="管理费金额" /></label>
								<div class="controls">
									<input id="commpany-info_fglfmoney" type="number"
										name="fglfmoney" value="${model.fglfmoney}" size=""
										class="number " minlength="" maxlength="20">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="commpany-info_fyfjine"><spring:message
										code="commpany-info.commpany-info.input.fyfjine" text="已付金额" /></label>
								<div class="controls">
									<input id="commpany-info_fyfjine" type="number" name="fyfjine"
										value="${model.fyfjine}" size="" class="number" minlength=""
										maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="commpany-info_fglpay"><spring:message
										code="commpany-info.commpany-info.input.fglpay" text="管理费支付办法" /></label>
								<div class="controls">
									<textarea id="commpany-info_fglpay" name="fglpay"
										class="form-control" rows="4" style="width: 560px;"
										class="text  " minlength="" maxlength="200">${model.fglpay}</textarea>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="commpany-info_fxczfje"><spring:message
										code="commpany-info.commpany-info.input.fxczfje" text="下次支付金额" /></label>
								<div class="controls">
									<input id="commpany-info_fxczfje" type="number" name="fxczfje"
										value="${model.fxczfje}" size="" class="number " minlength=""
										maxlength="">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="commpany-info_fxczfsj"><spring:message
										code="commpany-info.commpany-info.input.fxczfsj" text="下次支付时间" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="commpany-info_fxczfsj" type="text" name="fxczfsj"
											value="${model.fxczfsj}" size="40" class="text "
											style="background-color:white;cursor:default; width: 175px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
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
