<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "xz-home");
%>
<%
	pageContext.setAttribute("currentMenu", "xz-da");
%>
<!doctype html>
<html lang="zh">

<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message
		code="hetong-info.hetong-info.input.title" text="编辑" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript">
	$(
			function() {
				$("#hetong-infoForm")
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
						<spring:message code="hetong-info.hetong-info.input.title"
							text="编辑" />
					</h4>
				</header>

				<div class="content content-inner">

					<form id="hetong-infoForm" method="post"
						action="hetong-info-save.do" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="hetong-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="hetong-info_fcode"><spring:message
										code="hetong-info.hetong-info.input.fcode" text="合同编号" /></label>
								<div class="controls">
									<input id="hetong-info_fcode" type="text" name="fcode"
										value="${model.fcode}" size="" class="text ">
								</div>
							</div>

							<div class="span5">
								<label class="control-label" for="hetong-info_fname"><spring:message
										code="hetong-info.hetong-info.input.fname" text="合同名称" /></label>
								<div class="controls">
									<input id="hetong-info_fname" type="text" name="fname"
										value="${model.fname}" size="" class="text ">
								</div>
							</div>
						</div>

						<div class="control-group">
								<div class="span5">
								<label class="control-label" for="hetong-info_faddress"><spring:message
										code="hetong-info.hetong-info.input.faddress" text="地址" /></label>
								<div class="controls">
									<input id="hetong-info_faddress" type="text" name="faddress"
										value="${model.faddress}" size="" class="text ">
								</div>
							</div> 

							<div class="span5">
								<label class="control-label" for="hetong-info_fgcgm"><spring:message
										code="hetong-info.hetong-info.input.fgcgm" text="工程规模" /></label>
								<div class="controls">
									<input id="hetong-info_fgcgm" type="text" name="fgcgm"
										value="${model.fgcgm}" size="" class="text "	>
								</div>
							</div>
						</div>

						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="hetong-info_fry"><spring:message
										code="hetong-info.hetong-info.input.fry" text="总监" /></label>
								<div class="controls">
										<div class="input-append ryPicker">
									<input id="hetong-info_fzongjian" type="hidden" name="fzongjian"
										value="${model.fzongjian}"> <input
										id="hetong-info_userName" type="text" value="${ryMap[model.fzongjian].fname}"
										 class=" required" style="width: 175px;" value="">
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-user"></i></span>
								</div>
								</div>
							</div>
	                <div class="span5">
								<label class="control-label" for="hetong-info_fzaojia"><spring:message
										code="hetong-info.hetong-info.input.fzaojia" text="总投资" /></label>
								<div class="controls">
									<input id="hetong-info_fzaojia" type="text" name="fzaojia"
										value="${model.fzaojia}" size="" class="text "
										minlength="" maxlength="">
								</div>
							</div>
						<%-- 	<div class="span5">
								<label class="control-label" for="hetong-info_fhtdate"><spring:message
										code="hetong-info.hetong-info.input.fhtdate" text="合同签订日期" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="hetong-info_fhtdate" type="text" name="fhtdate"
											value="${model.fhtdate}" size="40" class="text "
											style="background-color:white;cursor:default; width: 175px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>
								</div>
							</div> --%>
						</div>

						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="hetong-info_fstartdate"><spring:message
										code="hetong-info.hetong-info.input.fstartdate" text="合同开始日期" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="hetong-info_fstartdate" type="text"
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
								<label class="control-label" for="hetong-info_fenddate"><spring:message
										code="hetong-info.hetong-info.input.fenddate" text="合同截止日期" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="hetong-info_fenddate" type="text" name="fenddate"
											value="${model.fenddate}" size="40" class="text "
											style="background-color:white;cursor:default; width: 175px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>
								</div>
							</div>
						</div>

					<%--	<div class="control-group">
							 <div class="span5">
								<label class="control-label" for="hetong-info_fweituoren"><spring:message
										code="hetong-info.hetong-info.input.fweituoren" text="委托人" /></label>
								<div class="controls">
									<input id="hetong-info_fweituoren" type="text"
										name="fweituoren" value="${model.fweituoren}" size=""
										class="text " minlength="" maxlength="">
								</div>
							</div>
						</div> --%>

						<div class="control-group">
						<%-- 	<div class="span5">
								<label class="control-label" for="hetong-info_fjianliqufei"><spring:message
										code="hetong-info.hetong-info.input.fjianliqufei" text="监理取费" /></label>
								<div class="controls">
									<input id="hetong-info_fjianliqufei" type="text"
										name="fjianliqufei" value="${model.fjianliqufei}" size=""
										class="text " minlength="" maxlength="">
								</div>
							</div> --%>

							<div class="span5">
								<label class="control-label" for="hetong-info_fjianlifei"><spring:message
										code="hetong-info.hetong-info.input.fjianlifei" text="监理费" /></label>
								<div class="controls">
									<input id="hetong-info_fjianlifei" type="text"
										name="fjianlifei" value="${model.fjianlifei}" size=""
										class="text " minlength="" maxlength="">
								</div>
							</div>
					<%-- 	</div>

						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="hetong-info_fpaytype"><spring:message
										code="hetong-info.hetong-info.input.fpaytype" text="付款方式" /></label>
								<div class="controls">
									<input id="hetong-info_fpaytype" type="text" name="fpaytype"
										value="${model.fpaytype}" size="" class="text "
										minlength="" maxlength="">
								</div>
							</div>

							<div class="span5">
								<label class="control-label" for="hetong-info_fflow"><spring:message
										code="hetong-info.hetong-info.input.fflow" text="合同状态" /></label>
								<div class="controls">
									<select class="form-control" id="hetong-info_fflow"
										name="fflow" value="${model.fflow}" class=" ">
										<option value="合同起草"
											<c:if test="${model.fflow}=='合同起草'}"> selected="selected"  </c:if>>合同起草</option>
										<option value="合同评审"
											<c:if test="${model.fflow}=='合同评审'}"> selected="selected"  </c:if>>合同评审</option>
										<option value="合同谈判"
											<c:if test="${model.fflow}=='合同谈判'}"> selected="selected"  </c:if>>合同谈判</option>
										<option value="合同签订"
											<c:if test="${model.fflow}=='合同签订'}"> selected="selected"  </c:if>>合同签订</option>
										<option value="合同管理"
											<c:if test="${model.fflow}=='合同管理'}"> selected="selected"  </c:if>>合同管理</option>
									</select>
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
