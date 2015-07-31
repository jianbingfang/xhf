<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "jl-home");
%>
<%
	pageContext.setAttribute("currentMenu", "jlfRecord");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message
		code="jlfRecord-info.jlfRecord-info.input.title" text="编辑" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript">
	$(
			function() {
				$("#jlfRecord-infoForm")
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
		<div class="row-fluid">
			<!-- start of main -->
			<section id="m-main" class="span10">
				<article class="m-widget">
					<header class="header">
						<h4 class="title">
							<spring:message code="jlfRecord-info.jlfRecord-info.input.title"
								text="编辑" />
						</h4>
					</header>
					<div class="content content-inner">
						<form id="jlfRecord-infoForm" method="post"
							action="jlfRecord-info-save.do?fxmid=${model.fxmid}" class="form-horizontal">
							<c:if test="${model != null}">
								<input id="jlfRecord-info_id" type="hidden" name="fid"
									value="${model.fid}">
							</c:if>
							<div class="control-group">
								<div class="span5">
									<label class="control-label" for="jlfRecord-info_fhtjlf"><spring:message
											code="jlfRecord-info.jlfRecord-info.input.fhtjlf"
											text="监理费" /></label>
									<div class="controls">
										<input id="jlfRecord-info_fhtjlf" type="text" name="fhtjlf"
											value="${model.fhtjlf}" size="" class="text " minlength=""
											maxlength="">
									</div>
								</div>
								<div class="span5">
									<label class="control-label" for="jlfRecord-info_fmemo"><spring:message
											code="jlfRecord-info.jlfRecord-info.input.fmemo" text="说明" /></label>
									<div class="controls">
										<input id="jlfRecord-info_fmemo" type="text" name="fmemo"
											value="${model.fmemo}" size="" class="text " minlength=""
											maxlength="">
									</div>
								</div>
								<%-- <div class="span5">
					    <label class="control-label" for="jlfRecord-info_fshouqudate"><spring:message code="jlfRecord-info.jlfRecord-info.input.fshouqudate" text="收取时间"/></label>
						<div class="controls">
							  		 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="jlfRecord-info_fshouqudate" type="text" name="fshouqudate" value="${model.fshouqudate}" size="40"   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>	
					    </div>
					    </div> --%>
							</div>
							<%-- 			<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="jlfRecord-info_fshifoukaip"><spring:message code="jlfRecord-info.jlfRecord-info.input.fshifoukaip" text="是否开票"/></label>
						<div class="controls">
						      	 <select class="form-control" id="jlfRecord-info_fshifoukaip" name="fshifoukaip" value="${model.fshifoukaip}" class=" " >
							    	 	<option value="是"  <c:if test="${model.fshifoukaip}=='是'}"> selected="selected"  </c:if>>是</option>
							    	 	<option value="否"  <c:if test="${model.fshifoukaip}=='否'}"> selected="selected"  </c:if>>否</option>
							 	</select>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="jlfRecord-info_fkaipiaodate"><spring:message code="jlfRecord-info.jlfRecord-info.input.fkaipiaodate" text="开票时间"/></label>
						<div class="controls">
						      	 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="jlfRecord-info_fkaipiaodate" type="text" name="fkaipiaodate" value="${model.fkaipiaodate}" size="40"  style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
					    </div>
					    </div>
					    </div> --%>
							<div class="control-group">
								<div class="span5">
									<label class="control-label"
										for="jlfRecord-info_fshifoudaozhang"><spring:message
											code="jlfRecord-info.jlfRecord-info.input.fshifoudaozhang"
											text="是否到账" /></label>
									<div class="controls">
										<input type="text" name="fshifoudaozhang"
											<c:if test="${model != null}"> value="${model.fshifoudaozhang}" </c:if>
											<c:if test="${model == null}"> value="否" </c:if>
											readonly="readonly" />
									</div>
								</div>
								<div class="span5">
									<label class="control-label" for="jlfRecord-info_fdaozhangdate"><spring:message
											code="jlfRecord-info.jlfRecord-info.input.fdaozhangdate"
											text="到账时间" /></label>
									<div class="controls">
										<input id="jlfRecord-info_fdaozhangdate" readonly="readonly"
											type="text" name="fdaozhangdate"
											value="${model.fdaozhangdate}" size="40">
									</div>
								</div>
							</div>
							<!-- <div class="control-group">
								
							</div> -->
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
	</div>
</body>
</html>
