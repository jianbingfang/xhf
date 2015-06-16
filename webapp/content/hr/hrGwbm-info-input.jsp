<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "hr-home");
%>
<%
	pageContext.setAttribute("currentMenu", "hrGwbm");
%>
<!doctype html>
<html lang="zh">

<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message
		code="hrGwbm-info.hrGwbm-info.input.title" text="岗位需求 - 员工招聘 - 人力资源" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript">
	$(
			function() {
				$("#hrGwbm-infoForm")
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
		<%@include file="/menu/hr-workspace.jsp"%>

		<!-- start of main -->
		<section id="m-main" class="span10">
		<!-- 	<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="hr-home.do">人力资源</a> <span class="divider">/</span>
							</li>
							<li>员工招聘<span class="divider">/</span>
							</li>
							<li class="active">岗位需求</li>
						</ul>
					</div>
				</div>
			</div> -->
			<article class="m-widget">


				<header class="header">
					<h4 class="title">
						<spring:message code="hrGwbm-info.hrGwbm-info.input.title"
							text="编辑" />
					</h4>
				</header>

				<div class="content content-inner">

					<form id="hrGwbm-infoForm" method="post"
						action="hrGwbm-info-save.do" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="hrGwbm-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="hrGwbm-info_fjobid"><spring:message
										code="hrGwbm-info.hrGwbm-info.input.fjobid" text="岗位名称" /></label>
								<div class="controls">
									<input id="hrGwbm-info_fjobid" type="text" name="fname"
										value="${model.fname}" size="" class="text required"
										minlength="" maxlength="">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="hrGwbm-info_fzpsl"><spring:message
										code="hrGwbm-info.hrGwbm-info.input.fzpsl" text="招聘人数" /></label>
								<div class="controls">
									<input id="hrGwbm-info_fzpsl" type="text" name="fzpsl"
										value="${model.fzpsl}<c:if test="${model.fzpsl==null}">0</c:if>" size="" class="number required"
										minlength="" maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="hrGwbm-info_fstatus"><spring:message
										code="hrGwbm-info.hrGwbm-info.input.fstatus" text="状态" /></label>
								<div class="controls">
									<select id="hrGwbm-info_fstatus" name="fstatus"
										class="form-control required">
										<option
											<c:if test="${model.fstatus=='1'}"> selected="selected" </c:if>
											value="1">招聘中</option>
										<option
											<c:if test="${model.fstatus=='2'}"> selected="selected"  </c:if>
											value="2">暂停</option>
									</select>
								</div>

							</div>

							<div class="span5">
								<label class="control-label" for="hrGwbm-info_fdqsl"><spring:message
										code="hrGwbm-info.hrGwbm-info.input.fdqsl" text="当前员工数量" /></label>
								<div class="controls">
									<input id="hrGwbm-info_fdqsl" type="text" name="fdqsl"
										value="${model.fdqsl}" size="" class="number"
										minlength="" maxlength="">
								</div>

							</div>
						</div>

						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="hrGwbm-info_fbmid"><spring:message
										code="hrGwbm-info.hrGwbm-info.input.fbmid" text="部门" /></label>
								<div class="controls">
									<select id="hrGwbm-info_fbmid" name="fbmid"
										class="form-control required">
										<c:forEach items="${deptList}" var="item">
											<option value="${item.id}"
												${item.id==model.fbmid? 'selected' : ''}>${item.name}</option>
										</c:forEach>
									</select>
								</div>
							</div>

							<div class="span5">
								<label class="control-label" for="hrGwbm-info_fzssl"><spring:message
										code="hrGwbm-info.hrGwbm-info.input.fzssl" text="正式员工数量" /></label>
								<div class="controls">
									<input id="hrGwbm-info_fzssl" type="text" name="fzssl"
										value="${model.fzssl}" size="" class="number"
										minlength="1" maxlength="4">
								</div>
								<!-- -->
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="hrGwbm-info_fjobid"><spring:message
										code="hrGwbm-info.hrGwbm-info.input.fjobid" text="职务" /></label>
								<div class="controls">
									<select id="hrGwbm-info_fjobid" name="fjobid"
										class="form-control required">
										<c:forEach items="${jobInfos}" var="item">
											<option value="${item.id}"
												${item.id==model.fjobid? 'selected' : ''}>${item.jobTitle.name}</option>
										</c:forEach>
									</select>
								</div>

								<!-- <label class="control-label" for="hrGwbm-info_fgwxc"><spring:message code="hrGwbm-info.hrGwbm-info.input.fgwxc" text="岗位薪酬福利"/></label>
		<div class="controls">
		  <input id="hrGwbm-info_fgwxc" type="text" name="fgwxc" value="${model.fgwxc}" size="" class="text required" >
	    </div> -->
							</div>

							<div class="span5">
								<label class="control-label" for="hrGwbm-info_fyjsl"><spring:message
										code="hrGwbm-info.hrGwbm-info.input.fyjsl" text="预计员工数量" /></label>
								<div class="controls">
									<input id="hrGwbm-info_fyjsl" type="text" name="fyjsl"
										value="${model.fyjsl}" size="" class="number "
										minlength="" maxlength="">
								</div>
							</div>
						</div>
						<%-- 	<div class="control-group">
	  
	 
    	<div class="span5">
	    <label class="control-label" for="hrGwbm-info_fpbrs"><spring:message code="hrGwbm-info.hrGwbm-info.input.fpbrs" text="配备人数"/></label>
		<div class="controls">
		  <input id="hrGwbm-info_fpbrs" type="text" name="fpbrs" value="${model.fpbrs}" size="" class="number required" minlength="" maxlength="">
	    </div>
	  </div> 
	   </div>--%>
						<div class="control-group">
							<label class="control-label" for="hrGwbm-info_fgwzz"><spring:message
									code="hrGwbm-info.hrGwbm-info.input.fgwzz" text="岗位职责" /></label>
							<div class="controls">
								<textarea name="fgwzz" id="hrGwbm-info_fgwzz" rows="6"
									cols="1200" style="width: 560px" class="text required"
									minlength="" maxlength="">${model.fgwzz}</textarea>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="hrGwbm-info_fgwyq"><spring:message
									code="hrGwbm-info.hrGwbm-info.input.fgwyq" text="岗位要求" /></label>
							<div class="controls">
								<textarea name="fgwyq" id="hrGwbm-info_fgwyq" rows="6"
									cols="1200" style="width: 560px" class="text required"
									minlength="" maxlength="">${model.fgwyq}</textarea>
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
