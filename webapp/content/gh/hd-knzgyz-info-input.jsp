<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "gh-home");
%>
<%
	pageContext.setAttribute("currentMenu", "gh-hd");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="hd-info.hd-info.input.title"
		text="编辑" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript">
	$(
			function() {
				$("#hd-infoForm")
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
			  	   <%@include file="/menu/gh-workspace.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span10">
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="hd-info.hd-info.input.title" text="编辑" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="hd-infoForm" method="post"
						action="gh-hd-info-save.do?ftype=4" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="hd-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="hd-info_fpxzt"><spring:message
										code="hd-info.hd-info.input.fpxzt" text="活动主题" /></label>
								<div class="controls">
									<input id="hd-info_fpxzt" type="text" name="fpxzt"
										value="${model.fpxzt}" size="" class="text " minlength=""
										maxlength="">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="hd-info_fdate"><spring:message
										code="hd-info.hd-info.input.fdate" text="时间" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="hd-info_fdate" type="text" name="fdate"
											value="${model.fdate}" size="40" class="text "
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
								<label class="control-label" for="hd-info_faddress"><spring:message
										code="hd-info.hd-info.input.faddress" text="地点" /></label>
								<div class="controls">
									<input id="hd-info_faddress" type="text" name="faddress"
										value="${model.faddress}" size="" class="text " minlength=""
										maxlength="">
								</div>
							</div>
							<div class="span5">
					    <label class="control-label" for="hd-info_fprice"><spring:message code="hd-info.hd-info.input.fprice" text="消费金额（元）"/></label>
						<div class="controls">
							  	 <input id="hd-info_fprice" type="text" name="fprice" value="${model.fprice}" size="" class="text " minlength="" maxlength="">	
					    </div>
					    </div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="hd-info_fcjry"><spring:message
										code="hd-info.hd-info.input.fcjry" text="参加人员" /></label>
								<div class="controls">
									 	 <textarea id="hd-info_fcjry" type="text" name="fcjry"  rows="6"  value=""class="form-control " minlength="100" maxlength="">${model.fcjry}</textarea>
								</div>
							</div>
								</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="hd-info_fpxnr"><spring:message
										code="hd-info.hd-info.input.fpxnr" text="培训内容" /></label>
								<div class="controls">
									<textarea id="hd-info_fpxnr" name="fpxnr" class="form-control"
										rows="6" style="width: 560px" class="text  " minlength=""
										maxlength="200">${model.fpxnr}</textarea>
								</div>
							</div>
						</div>
						<div class="control-group">
						<%-- <div class="span5">
					    <label class="control-label" for="hd-info_furl"><spring:message code="hd-info.hd-info.input.furl" text="图片上传"/></label>
						<div class="controls">
						      	<textarea id="hd-info_furl"  name="furl"  class="form-control" rows="6"  style="width: 560px" class="text  "  minlength="" maxlength="500">${model.furl}</textarea>
					    </div>
					  </div>--%>
	  
						
					    </div> 
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="hd-info_fmemo"><spring:message
										code="hd-info.hd-info.input.fmemo" text="备注" /></label>
								<div class="controls">
									<textarea id="hd-info_fmemo" name="fmemo" class="form-control"
										rows="6" style="width: 560px" class="text  " minlength=""
										maxlength="1000">${model.fmemo}</textarea>
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
