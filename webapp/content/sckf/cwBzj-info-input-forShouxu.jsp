<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "sckf-home");
%>
<%
	pageContext.setAttribute("currentMenu", "sckf-bzj");
%>
<!doctype html>
<html lang="zh">

<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message
		code="sckf-cwBzj-info.sckf-cwBzj-info.input.title" text="编辑" /></title>
<%@include file="/common/s.jsp"%>
   <link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/jyxmpicker/jyxmpicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/jyxmpicker/jyxmpicker.js"></script>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>

<script type="text/javascript">
	$(
			function() {
				$("#sckf-cwBzj-infoForm")
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
				createjyxmPicker({
					modalId : 'jyxmPicker',
					url : '${scopePrefix}/sysconf/jyXm-toubiao-simple-list.do'
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
		<%@include file="/menu/sckf-workspace.jsp"%>

		<!-- start of main -->
		<section id="m-main" class="span10">
			<!-- <div class="container-fluid">
				<ul class="breadcrumb" style="width: 98%">
					<li><a href="sckf-home.do">市场开发</a> <span class="divider">/</span>
					</li>
					<li><a href="sckf-week-plain-info-list.do">投标保证金</a><span
						class="divider">/</span></li>
					<li class="active">保证金申请与缴纳</li>
				</ul>
			</div> -->
			<article class="m-widget">
				
				<header class="header">
					<h4 class="title">
						<spring:message code="sckf-cwBzj-info.sckf-cwBzj-info.input.title"
							text="编辑" />
					</h4>
				</header>

				<div class="content content-inner">
					<form id="sckf-cwBzj-infoForm" method="post"
						action="sckf-cwBzj-info-shouxu.do?taskId=${taskId}" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="sckf-cwBzj-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						
						<div class="control-group">
							<%-- 	<div class="span5">
					    <label class="control-label" for="cwBzj-info_fyzname"><spring:message code="cwBzj-info.cwBzj-info.input.fyzname" text="业主名称"/></label>
						<div class="controls">
							  	 <input id="cwBzj-info_fyzname" type="text" name="fyzname" value="${model.fyzname}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div> --%>
							<label class="control-label" for="cwBzj-info_fxmid"><spring:message
									code="cwBzj-info.cwBzj-info.input.fxmid" text="项目名称" /></label>
							<div class="controls">
								<div class="input-append xmPicker">
									<input id="cwBzj-info_fxmid" type="hidden" name="fxmid"
										value="${model.fxmid}"> <input id="cwBzj-info_xmmc"
										type="text" value="${xmMap[model.fxmid].fname}" 
										 class=" required" style="width: 400px;" value="">
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-th-list"></i></span>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="cwBzj-info_fskdw"><spring:message
										code="cwBzj-info.cwBzj-info.input.fskdw" text="收款单位" /></label>
								<div class="controls">
									<input id="cwBzj-info_fskdw" type="text" name="fskdw"
										value="${model.fskdw}" size="" class="text " minlength=""
										 maxlength="">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="cwBzj-info_fzh"><spring:message
										code="cwBzj-info.cwBzj-info.input.fzh" text="帐号" /></label>
								<div class="controls">
									<input id="cwBzj-info_fzh" type="text" name="fzh"
										value="${model.fzh}" size="" class="text " 
										minlength="" maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="cwBzj-info_fkhh"><spring:message
										code="cwBzj-info.cwBzj-info.input.fkhh" text="开户行" /></label>
								<div class="controls">
									<input id="cwBzj-info_fkhh" type="text" name="fkhh"
										value="${model.fkhh}" size="" class="text " minlength=""
										 maxlength="">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="cwBzj-info_fjnmethod"><spring:message
										code="cwBzj-info.cwBzj-info.input.fjnmethod" text="交纳方式" /></label>
								<div class="controls">
									<input id="cwBzj-info_fjnmethod" type="text" name="fjnmethod"
										value="${model.fjnmethod}" size="" class="text " 
										maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="cwBzj-info_fjnmoney"><spring:message
										code="cwBzj-info.cwBzj-info.input.fjnmoney" text="金额(元)" /></label>
								<div class="controls">
									<input id="cwBzj-info_fjnmoney" type="number" name="fjnmoney"
										value="${model.fjnmoney}" size="" class="number" 
										minlength="" maxlength="">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="cwBzj-info_fjndate"><spring:message
										code="cwBzj-info.cwBzj-info.input.fjndate" text="最迟交纳日期" /></label>
								<div class="controls">
									<!-- datepicker date  -->
									<div class="input-append " style="padding-left: 0px;">
										<input id="cwBzj-info_fjndate" type="text" name="fjndate"
											value="${model.fjndate}" size="40" class="text " 
											style="background-color:white;cursor:default; width: 175px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar "></i></span>
									</div>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="cwBzj-info_foprator"><spring:message
										code="cwBzj-info.cwBzj-info.input.foprator" text="经办人" /></label>
								<div class="controls">
									<div class="input-append ryPicker">
										<input id="cwBzj-info_foprator" type="hidden" name="foprator"
											value="${model.foprator}"> <input
											id="cwBzj-info_userName" type="text"
											value="${ryMap[model.foprator].fname}" disabled 
											class=" required" style="width: 175px;" value=""> <span
											class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-user"></i></span>
									</div>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="cwBzj-info_fmemo"><spring:message
										code="cwBzj-info.cwBzj-info.input.fmemo" text="备注" /></label>
								<div class="controls">
									<input id="cwBzj-info_fmemo" type="text" name="fmemo"
										value="${model.fmemo}" size="" class="text " minlength=""
										maxlength="">
								</div>
							</div>
						</div>
						<%-- 		<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="cwBzj-info_fbackdate"><spring:message code="cwBzj-info.cwBzj-info.input.fbackdate" text="可退还日期"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="cwBzj-info_fbackdate" type="text" name="fbackdate" value="${model.fbackdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="cwBzj-info_fbackoprator"><spring:message code="cwBzj-info.cwBzj-info.input.fbackoprator" text="退换经办人"/></label>
					    <div class="controls">
							  	<div class="input-append ryPicker">
									<input id="cwBzj-info_fbackoprator" type="hidden" name="fbackoprator"
										value="${model.fkhfuzerenid}"> <input
										id="cwBzj-info_fbackoprator_userName" type="text" value="${ryMap[model.fbackoprator].fname}"
										disabled class=" required" style="width: 175px;" value="">
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-user"></i></span>
								</div>
					    </div>
					    </div>
					    </div> --%>
					    <div class="control-group">
							<div class="span5">
								<label class="control-label" for="cwBzj-info_fmemo4"><spring:message
										code="cwBzj-info.cwBzj-info.input.fmemo4" text="领导意见" /></label>
								<div class="controls">
									<input id="cwBzj-info_fmemo4" type="text" name="fmemo4"
										value="${model.fmemo4}" size="" class="text " minlength="" readonly
										maxlength="">
								</div>
							</div>
							</div>
						<div class="control-group">
							<label class="control-label" for="cwBzj-info_fmoneydate"><spring:message
									code="cwBzj-info.cwBzj-info.input.fmoneydate" text="交纳日期" /></label>
							<div class="controls">
								<div class="input-append datepicker date"
									style="padding-left: 0px;">
									<input id="cwBzj-info_fmoneydate" type="text" name="fmoneydate"
										value="${model.fmoneydate}" size="40" class="text "
										style="background-color:white;cursor:default; width: 175px;">
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-calendar"></i></span> <label
										style="font-size: 10px;color: red; ">财务部填写</label>
								</div>
							</div>
								<div class="span5 hidden">
									<label class="control-label" for="cwBzj-info_fbzjtype"><spring:message
											code="cwBzj-info.cwBzj-info.input.fbzjtype" text="保证金类型" /></label>
									<div class="controls">
										<input id="cwBzj-info_fbzjtype" type="text" name="fbzjtype"
											<c:if test="${model!=null }">value="${model.fbzjtype}"</c:if>
											value="${type }" size="" class="text required" maxlength="">
									</div>
								</div>
							</div>
							
						 <div class="control-group">
							<label class="control-label" for="cwBzj-info_fmoneydate"><spring:message
									code="cwBzj-info.cwBzj-info.input.fmoneydate" text="归还经办人" /></label>
									
							  <div class="controls">
									<div class="input-append ryPicker">
										<input id="cwBzj-info_foprator" type="hidden" name="fbackoprator"
											value="${model.fbackoprator}"> <input
											id="cwBzj-info_userName" type="text"
											value="${ryMap[model.fbackoprator].fname}" disabled 
											class=" required" style="width: 175px;" value=""> <span
											class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-user"></i></span>
									</div>
								</div>
								
								<div class="span5 hidden">
									<label class="control-label" for="cwBzj-info_fbzjtype"><spring:message
											code="cwBzj-info.cwBzj-info.input.fbzjtype" text="归还到账日期" /></label>
									<div class="controls">
										<div class="input-append datepicker date"
											style="padding-left: 0px;">
											<input id="cwBzj-info_fmoneydate" type="text" name="fbackdate"
												value="${model.fbackdate}" size="40" class="text "
												style="background-color:white;cursor:default; width: 175px;">
											<span class="add-on"
												style="padding-top: 2px; padding-bottom: 2px;"><i
												class="icon-calendar"></i></span> <label
												style="font-size: 10px;color: red; ">财务部填写</label>
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
