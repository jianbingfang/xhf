<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "xz-home");
%>
<%
	pageContext.setAttribute("currentMenu", "xz-wz");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="wzAsk-info.wzAsk-info.input.title"
		text="编辑" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript">
	$(
			function() {
				$("#wzAsk-infoForm")
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
						<spring:message code="wzAsk-info.wzAsk-info.input.title" text="编辑" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="wzAsk-infoForm" method="post" action="wzAsk-info-save.do"
						class="form-horizontal">
						<c:if test="${model != null}">
							<input id="wzAsk-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="wzAsk-info_faskno"><spring:message
										code="wzAsk-info.wzAsk-info.input.faskno" text="申请单编号" /></label>
								<div class="controls">
									<input id="wzAsk-info_faskno" type="text" name="faskno"
										value="${model.faskno}" size="" class="text " minlength=""
										maxlength="">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="wzAsk-info_faskbm"><spring:message
										code="wzAsk-info.wzAsk-info.input.faskbm" text="申请部门" /></label>
								<div class="controls">
									<input id="wzAsk-info_faskbm" type="text" name="faskbm"
										value="${model.faskbm}" size="" class="text required"
										minlength="" maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="wzAsk-info_faskxm"><spring:message
										code="wzAsk-info.wzAsk-info.input.faskxm" text="申请项目" /></label>
								<div class="controls">
									<input id="wzAsk-info_faskxm" type="text" name="faskxm"
										value="${model.faskxm}" size="" class="number   " minlength=""
										maxlength="">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="wzAsk-info_fwplx"><spring:message
										code="wzAsk-info.wzAsk-info.input.fwplx" text="物品类型" /></label>
								<div class="controls">
									<select class="form-control" id="wzAsk-info_fwplx" name="fwplx"
										value="${model.fwplx}" class=" ">
										<option value="固定资产"
											<c:if test="${model.fwplx=='固定资产'}"> selected="selected"  </c:if>>固定资产</option>
										<option value="低值易耗品"
											<c:if test="${model.fwplx=='低值易耗品'}"> selected="selected"  </c:if>>低值易耗品</option>
										<option value="消耗品"
											<c:if test="${model.fwplx=='消耗品'}"> selected="selected"  </c:if>>消耗品</option>
									</select>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="wzAsk-info_faskdate"><spring:message
										code="wzAsk-info.wzAsk-info.input.faskdate" text="申请日期" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="wzAsk-info_faskdate" type="text" name="faskdate"
											value="${model.faskdate}" size="40" class="text "
											style="background-color:white;cursor:default; width: 175px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="wzAsk-info_faskry"><spring:message
										code="wzAsk-info.wzAsk-info.input.faskry" text="申请人" /></label>
								<div class="controls">
									<input id="wzAsk-info_faskry" type="text" name="faskry"
										value="${model.faskry}" size="" class="number   " minlength=""
										maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="wzAsk-info_fspr"><spring:message
										code="wzAsk-info.wzAsk-info.input.fspr" text="审批人" /></label>
								<div class="controls">
									<input id="wzAsk-info_fspr" type="text" name="fspr" readonly
										value="${model.fspr}" size="" class="number   " minlength=""
										maxlength="">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="wzAsk-info_fspyj"><spring:message
										code="wzAsk-info.wzAsk-info.input.fspyj" text="审批状态" /></label>
								<div class="controls">
									<input id="wzAsk-info_fspyj" type="text" name="fspyj" readonly
										value="${model.fspyj}" size="" class="text " minlength=""
										maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="wzAsk-info_fjfqk"><spring:message
										code="wzAsk-info.wzAsk-info.input.fjfqk" text="交费情况" /></label>
								<div class="controls">
									<input id="wzAsk-info_fjfqk" type="text" name="fjfqk"
										value="${model.fjfqk}" size="" class="text required"
										minlength="" maxlength="">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="wzAsk-info_fjnje"><spring:message
										code="wzAsk-info.wzAsk-info.input.fjnje" text="交纳金额" /></label>
								<div class="controls">
									<input id="wzAsk-info_fjnje" type="text" name="fjnje"
										value="${model.fjnje}" size="" class="text " minlength=""
										maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="wzAsk-info_faskyt"><spring:message
										code="wzAsk-info.wzAsk-info.input.faskyt" text="用途" /></label>
								<div class="controls">
									<textarea id="wzAsk-info_faskyt" name="faskyt"
										class="form-control" rows="3" class="text  " minlength=""
										maxlength="500">${model.faskyt}</textarea>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="wzAsk-info_fmemo"><spring:message
										code="wzAsk-info.wzAsk-info.input.fmemo" text="备注" /></label>
								<div class="controls">
									<textarea id="wzAsk-info_fmemo" name="fmemo"
										class="form-control" rows="3" class="text  " minlength=""
										maxlength="500">${model.fmemo}</textarea>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="wzAsk-info_fmemo1"><spring:message
										code="wzAsk-info.wzAsk-info.input.fmemo1" text="物品和规格" /></label>
								<div class="controls">
									<textarea id="wzAsk-info_fmemo1" name="fmemo1"
										class="form-control" rows="6" style="width: 560px"
										class="text  " minlength="" maxlength="500">${model.fmemo1}</textarea>
								</div>
							</div>
						</div>
						<%-- 	<div class="span5">
					    <label class="control-label" for="wzAsk-info_fmemo2"><spring:message code="wzAsk-info.wzAsk-info.input.fmemo2" text="备注2"/></label>
						<div class="controls">
						      	<textarea id="wzAsk-info_fmemo2"  name="fmemo2"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.fmemo2}</textarea>
					    </div>
					    </div>
					    
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="wzAsk-info_fstatus"><spring:message code="wzAsk-info.wzAsk-info.input.fstatus" text="审批状态"/></label>
						<div class="controls">
							  	 <input id="wzAsk-info_fstatus" type="text" name="fstatus" value="${model.fstatus}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>  --%>
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
