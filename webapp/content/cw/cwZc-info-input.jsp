<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "cw-home");
%>
<%
	pageContext.setAttribute("currentMenu", "cw-zc");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="wzList-info.wzList-info.input.title"
		text="编辑" /></title>
<%@include file="/common/s.jsp"%>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/xmpicker/xmpicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/xmpicker/xmpicker.js"></script>
<script type="text/javascript">
	$(
			function() {
				$("#wzList-infoForm")
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
						<spring:message code="wzList-info.wzList-info.input.title" text="编辑" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="wzList-infoForm" method="post" action="cwZc-info-save.do"
						class="form-horizontal">
						<c:if test="${model != null}">
							<input id="wzList-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="wzList-info_fname"><spring:message
										code="wzList-info.wzList-info.input.fname" text="固定资产名称" /></label>
								<div class="controls">
									<input id="wzList-info_fname" type="text" name="fname" disabled="disabled"
										value="${model.fname}" size="" class="text ">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="wzList-info_fcode"><spring:message
										code="wzList-info.wzList-info.input.fcode" text="编号" /></label>
								<div class="controls">
									<input id="wzList-info_fcode" type="text" name="fcode" disabled="disabled"
										value="${model.fcode}" size="" class="text ">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="wzList-info_ftype"><spring:message
										code="wzList-info.wzList-info.input.fgg" text="规格" /></label>
								<div class="controls">
									<input id="wzList-info_ftype" type="text" name="fgg" disabled="disabled"
										value="${model.fgg}" size="" class="text ">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="wzList-info_fprice"><spring:message
										code="wzList-info.wzList-info.input.fprice" text="原价" /></label>
								<div class="controls">
									<input id="wzList-info_fprice" type="text" name="fprice"
										value="${model.fprice}" size="" class="text ">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="wzList-info_fzjjine"><spring:message
										code="wzList-info.wzList-info.input.fsubprice" text="已折旧金额" /></label>
								<div class="controls">
									<input id="wzList-info_fsubprice" type="text"   name="fsubprice"
										value="${model.fsubprice}" size="" class="text ">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="wzList-info_fcprice"><spring:message
										code="wzList-info.wzList-info.input.fcprice" text="净残值" /></label>
								<div class="controls">
									<input id="wzList-info_fcprice" type="text" name="fcprice"
										value="${model.fcprice}" size="" class="text ">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="wzList-info_fcanzhi"><spring:message
										code="wzList-info.wzList-info.input.fyscz" text="预设残值" /></label>
								<div class="controls">
									<input id="wzList-info_fyscz" type="text" name="fyscz"
										value="${model.fyscz}" size="" class="text ">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="wzList-info_fendate"><spring:message
										code="wzList-info.wzList-info.input.fendate" text="折旧计提完成时间" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="wzList-info_fzjtjwcdate" type="text" name="fzjtjwcdate"
											value="${model.fzjtjwcdate}" size="40" class="text "
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
								<label class="control-label" for="wzList-info_fyzjjine"><spring:message
										code="wzList-info.wzList-info.input.fyzjprice" text="月折旧金额" /></label>
								<div class="controls">
									<input id="wzList-info_fyzjprice" type="text" name="fyzjprice"
										value="${model.fyzjprice}" size="" class="text ">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="wzList-info_fstatus"><spring:message
										code="wzList-info.wzList-info.input.fzjstate" text="折旧状态" /></label>
								<div class="controls">
									<select class="form-control" id="wzList-info_fzjstate"
										name="fzjstate" value="${model.fzjstate}" class=" ">
										<option value="折旧中"
											<c:if test="${model.fzjstate=='折旧中'}"> selected="selected"  </c:if>>折旧中</option>
										<option value="已清理"
											<c:if test="${model.fzjstate=='已清理'}"> selected="selected"  </c:if>>已清理</option>
									</select>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="wzList-info_fusestatus"><spring:message
										code="wzList-info.wzList-info.input.fusestatus" text="使用状态" /></label>
								<div class="controls">
									<select class="form-control" id="wzList-info_fusestatus"
										name="fsystate" value="${model.fsystate}" class=" " disabled="disabled">
										<option value="0"
											<c:if test="${model.fsystate=='0'}">selected="selected"</c:if>>在库</option>
										<option value="1"
											<c:if test="${model.fsystate=='1'}">selected="selected"</c:if>>在使用</option>
										<option value="2"
											<c:if test="${model.fsystate=='2'}">selected="selected"</c:if>>已报废</option>
									</select>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="wzList-info_fjlunit"><spring:message
										code="wzList-info.wzList-info.input.fjlunit" text="所在项目" /></label>
								<div class="controls">
									<div class="input-append xmPicker">
										<input id="xzChufa-info_fxmid" type="hidden" name="fxmid" disabled="disabled"
											value="${model.fxmid}"> <input
											id="xmBxRecord-info_xmmc" type="text"
											value="${xmMap[model.fxmid].fxmname}" disabled
											class=" required" style="width: 175px;" value=""> <span
											class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-th-list"></i></span>
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
