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
		code="cwYingShou-info.cwYingShou-info.input.title" text="编辑" /></title>
<%@include file="/common/s.jsp"%>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/xmpicker/xmpicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/xmpicker/xmpicker.js"></script>
<script type="text/javascript">
	$(
			function() {
				$("#cwYingShou-infoForm")
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
				createxmPicker({
					modalId : 'xmPicker',
					url : '${scopePrefix}/gcgl/pjXm-simple-list.do'
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
						<spring:message code="cwYingShou-info.cwYingShou-info.input.title"
							text="编辑" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="cwYingShou-infoForm" method="post"
						action="cwYingShou-info-save.do" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="cwYingShou-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<div class="control-group">
							<label class="control-label" for="cwYingShou-info_fxmid"><spring:message
									code="cwYingShou-info.cwYingShou-info.input.fxmid" text="项目" /></label>
							<div class="controls">
								<div class="input-append xmPicker">
									<input id="cwYingShou-info_fxmid" type="hidden" name="fxmid"
										value="${model.fxmid}"> <input
										id="cwYingShou-info_xmmc" type="text"
										value="${xmMap[model.fxmid].fxmname}" disabled
										class=" required" style="width: 500px;" value=""> <span
										class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-th-list"></i></span>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="cwYingShou-info_finviocecode"><spring:message
										code="cwYingShou-info.cwYingShou-info.input.finviocecode"
										text="发票号" /></label>
								<div class="controls">
									<input id="cwYingShou-info_finviocecode" name="finviocecode"
										type="text" class="text" value="${model.finviocecode}"
										style="width: 400px;">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="cwYingShou-info_freceiptcode"><spring:message
										code="cwYingShou-info.cwYingShou-info.input.freceiptcode"
										text="收据号" /></label>
								<div class="controls">
									<input id="cwYingShou-info_freceiptcode" name="freceiptcode"
										type="text" class="text" value="${model.freceiptcode}"
										style="width: 400px;">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="cwYingShou-info_finvoicedate"><spring:message
										code="cwYingShou-info.cwYingShou-info.input.finvoicedate"
										text="开票时间" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="cwYingShou-info_finvoicedate" type="text"
											name="finvoicedate" value="${model.finvoicedate}" size="40"
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
								<label class="control-label" for="cwYingShou-info_fdzdate"><spring:message
										code="cwYingShou-info.cwYingShou-info.input.fdzdate"
										text="到账时间" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="cwYingShou-info_fdzdate" type="text" name="fdzdate"
											value="${model.fdzdate}" size="40" class="text "
											style="background-color:white;cursor:default; width: 175px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="cwYingShou-info_fdebit"><spring:message
										code="cwYingShou-info.cwYingShou-info.input.fdebit"
										text="借方金额" /></label>
								<div class="controls">
									<input id="cwYingShou-info_fdebit" type="text" name="fdebit"
										value="${model.fdebit}" size="" class="number   " minlength=""
										maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="cwYingShou-info_fcreditor"><spring:message
										code="cwYingShou-info.cwYingShou-info.input.fcreditor"
										text="贷方金额" /></label>
								<div class="controls">
									<input id="cwYingShou-info_fcreditor" type="text"
										name="fcreditor" value="${model.fcreditor}" size=""
										class="number   " minlength="" maxlength="">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="cwYingShou-info_foprator"><spring:message
										code="cwYingShou-info.cwYingShou-info.input.foprator"
										text="经办人" /></label>
								<div class="controls">
									<input id="cwYingShou-info_foprator" type="text"
										name="foprator"  value="${empty user?model.foprator:user}" size=""
										class="number " minlength="" maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="cwYingShou-info_fqmmoney"><spring:message
										code="cwYingShou-info.cwYingShou-info.input.fqmmoney"
										text="期末借贷余额" /></label>
								<div class="controls">
									<input id="cwYingShou-info_fqmmoney" type="text"
										name="fqmmoney" value="${model.fqmmoney}" size=""
										class="number   " minlength="" maxlength="">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="cwYingShou-info_fhjjdfx"><spring:message
										code="cwYingShou-info.cwYingShou-info.input.fhjjdfx"
										text="合计借贷方向" /></label>
								<div class="controls">
									<input id="cwYingShou-info_fhjjdfx" type="text" name="fhjjdfx"
										value="${model.fhjjdfx}" size="" class="text required"
										minlength="" maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="cwYingShou-info_fhjje"><spring:message
										code="cwYingShou-info.cwYingShou-info.input.fhjje" text="合计金额" /></label>
								<div class="controls">
									<input id="cwYingShou-info_fhjje" type="text" name="fhjje"
										value="${model.fhjje}" size="" class="text " minlength=""
										maxlength="">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="cwYingShou-info_fmemo"><spring:message
										code="cwYingShou-info.cwYingShou-info.input.fmemo" text="备注" /></label>
								<div class="controls">
									<input id="cwYingShou-info_fmemo" type="text" name="fmemo"
										value="${model.fmemo}" size="" class="text required"
										minlength="" maxlength="">
								</div>
							</div>
						</div>
						<%--			<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="cwYingShou-info_fmemo1"><spring:message code="cwYingShou-info.cwYingShou-info.input.fmemo1" text="备注1"/></label>
						<div class="controls">
							  	 <input id="cwYingShou-info_fmemo1" type="text" name="fmemo1" value="${model.fmemo1}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="cwYingShou-info_fmemo2"><spring:message code="cwYingShou-info.cwYingShou-info.input.fmemo2" text="备注2"/></label>
						<div class="controls">
							  	 <input id="cwYingShou-info_fmemo2" type="text" name="fmemo2" value="${model.fmemo2}" size="" class="text required" minlength="" maxlength="">	
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="cwYingShou-info_fmemo3"><spring:message code="cwYingShou-info.cwYingShou-info.input.fmemo3" text="备注3"/></label>
						<div class="controls">
							  	 <input id="cwYingShou-info_fmemo3" type="text" name="fmemo3" value="${model.fmemo3}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="cwYingShou-info_fmemo4"><spring:message code="cwYingShou-info.cwYingShou-info.input.fmemo4" text="备注4"/></label>
						<div class="controls">
							  	 <input id="cwYingShou-info_fmemo4" type="text" name="fmemo4" value="${model.fmemo4}" size="" class="text required" minlength="" maxlength="">	
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
