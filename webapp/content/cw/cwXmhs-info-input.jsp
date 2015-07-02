<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "cw-home");
%>
<%
	pageContext.setAttribute("currentMenu", "cw-hs");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message
		code="cwXmhs-info.cwXmhs-info.input.title" text="编辑" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript">
	$(
			function() {
				$("#cwXmhs-infoForm")
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
		<%@include file="/menu/cw-workspace.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span10">
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="cwXmhs-info.cwXmhs-info.input.title"
							text="编辑" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="cwXmhs-infoForm" method="post"
						action="cwXmhs-info-save.do" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="cwXmhs-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="cwXmhs-info_fhetongname"><spring:message
										code="cwXmhs-info.cwXmhs-info.input.fhetongname" text="季度" /></label>
								<div class="controls">
									<input id="cwXmhs-info_fhetongname" type="text"
										name="fhetongname" value="${model.fmemo1}年度 ${model.fmemo2}季度"
										size="" class="text " disabled="disabled">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="cwXmhs-info_fhetongname"><spring:message
										code="cwXmhs-info.cwXmhs-info.input.fhetongname" text="合同名称" /></label>
								<div class="controls">
									<input id="cwXmhs-info_fhetongname" type="text"
										name="fhetongname" value="${model.fhetongname}" size=""
										class="text " disabled="disabled">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="cwXmhs-info_fhetongjine"><spring:message
										code="cwXmhs-info.cwXmhs-info.input.fhetongjine" text="合同金额" /></label>
								<div class="controls">
									<input id="cwXmhs-info_fhetongjine" type="text"
										name="fhetongjine" value="${model.fhetongjine}" size=""
										class="text">（万元）
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="cwXmhs-info_fbjdsr"><spring:message
										code="cwXmhs-info.cwXmhs-info.input.fbjdsr" text="本季度收入" /></label>
								<div class="controls">
									<input id="cwXmhs-info_fbjdsr" type="text" name="fbjdsr"
										value="${model.fbjdsr}" size="" class="text "
										disabled="disabled">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="cwXmhs-info_fbndzsr"><spring:message
										code="cwXmhs-info.cwXmhs-info.input.fbndzsr" text="本年总收入" /></label>
								<div class="controls">
									<input id="cwXmhs-info_fbndzsr" type="text" name="fbndzsr"
										value="${model.fbndzsr}" size="" class="text "
										disabled="disabled">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="cwXmhs-info_fzsr"><spring:message
										code="cwXmhs-info.cwXmhs-info.input.fzsr" text="总收入" /></label>
								<div class="controls">
									<input id="cwXmhs-info_fzsr" type="text" name="fzsr"
										value="${model.fzsr}" size="" class="text "
										disabled="disabled">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="cwXmhs-info_fbjdzcb"><spring:message
										code="cwXmhs-info.cwXmhs-info.input.fbjdzcb" text="本季度成本" /></label>
								<div class="controls">
									<input id="cwXmhs-info_fbjdzcb" type="text" name="fbjdzcb"
										value="${model.fbjdzcb}" size="" class="text "
										disabled="disabled">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="cwXmhs-info_fbnzcb"><spring:message
										code="cwXmhs-info.cwXmhs-info.input.fbnzcb" text="本年总成本" /></label>
								<div class="controls">
									<input id="cwXmhs-info_fbnzcb" type="text" name="fbnzcb"
										value="${model.fbnzcb}" size="" class="text "
										disabled="disabled">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="cwXmhs-info_fzcb"><spring:message
										code="cwXmhs-info.cwXmhs-info.input.fzcb" text="总成本" /></label>
								<div class="controls">
									<input id="cwXmhs-info_fzcb" type="text" name="fzcb"
										value="${model.fzcb}" size="" class="text "
										disabled="disabled">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="cwXmhs-info_fglf"><spring:message
										code="cwXmhs-info.cwXmhs-info.input.fglf" text="管理费" /></label>
								<div class="controls">
									<input id="cwXmhs-info_fglf" type="text" name="fglf"
										value="${model.fglf}" size="" class="text ">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="cwXmhs-info_flr"><spring:message
										code="cwXmhs-info.cwXmhs-info.input.flr" text="利润" /></label>
								<div class="controls">
									<input id="cwXmhs-info_flr" type="text" name="flr"
										value="${model.flr}" size="" class="text " disabled="disabled">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="cwXmhs-info_ffpkjwdz"><spring:message
										code="cwXmhs-info.cwXmhs-info.input.ffpkjwdz" text="发票开具未到账" /></label>
								<div class="controls">
									<input id="cwXmhs-info_ffpkjwdz" type="text" name="ffpkjwdz"
										value="${model.ffpkjwdz}" size="" class="text "
										disabled="disabled">
								</div>
							</div>
						</div>
						<%-- 
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="cwXmhs-info_fmemo"><spring:message code="cwXmhs-info.cwXmhs-info.input.fmemo" text="备注"/></label>
						<div class="controls">
							  	 <input id="cwXmhs-info_fmemo" type="text" name="fmemo" value="${model.fmemo}" size="" class="text " >	
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
