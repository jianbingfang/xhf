<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "xz-home");
%>
<%
	pageContext.setAttribute("currentMenu", "xz-yz");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message
		code="xzYinzhang-info.xzYinzhang-info.input.title" text="编辑" /></title>
<%@include file="/common/s.jsp"%>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
	
          <link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/xmpicker/xmpicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/xmpicker/xmpicker.js"></script>
	
<script type="text/javascript">
	$(
			function() {
				$("#xzYinzhang-infoForm")
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
		<%@include file="/menu/xz-workspace.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span10">
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="xzYinzhang-info.xzYinzhang-info.input.title"
							text="编辑" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="xzYinzhang-infoForm" method="post"
						action="xzYinzhang-info-save.do" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="xzYinzhang-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="xzYinzhang-info_fcode"><spring:message
										code="xzYinzhang-info.xzYinzhang-info.input.fcode" text="编号" /></label>
								<div class="controls">
									<input id="xzYinzhang-info_fcode" type="text" name="fcode"
										value="${model.fcode}" size="" class="text ">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="xzYinzhang-info_fname"><spring:message
										code="xzYinzhang-info.xzYinzhang-info.input.fname" text="印章名称" /></label>
								<div class="controls">
									<input id="xzYinzhang-info_fname" name="fname" type="text"
										class="text  " maxlength="200" value="${model.fname}">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="xzYinzhang-info_fsqr"><spring:message
										code="xzYinzhang-info.xzYinzhang-info.input.fsqr" text="申请人" /></label>
								<div class="controls">
									<input id="xzYinzhang-info_fsqr" type="text" name="fsqr"
										value="${model.fsqr}" size="" class="text ">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="xzYinzhang-info_fbm"><spring:message
										code="xzYinzhang-info.xzYinzhang-info.input.fbm" text="部门/项目部" /></label>
								<div class="controls">
									<div class="input-append xmPicker">
										<input id="xzChufa-info_fbm" type="hidden" name="fbm"
											value="${model.fbm}"> <input id="xzYinzhang-info_fbm"
											type="text" value="${xmMap[model.fbm].fxmname}" disabled
											class=" required" style="width: 175px;" value=""> <span
											class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-th-list"></i></span>
									</div>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="xzYinzhang-info_fdate"><spring:message
										code="xzYinzhang-info.xzYinzhang-info.input.fdate" text="领用日期" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="xzYinzhang-info_fdate" type="text" name="fdate"
											value="${model.fdate}" size="40" class="text "
											style="background-color:white;cursor:default; width: 175px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="xzYinzhang-info_fghdate"><spring:message
										code="xzYinzhang-info.xzYinzhang-info.input.fghdate"
										text="归还日期" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="xzYinzhang-info_fghdate" type="text" name="fghdate"
											value="${model.fghdate}" size="40" class="text "
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
								<label class="control-label" for="xzYinzhang-info_fshenpi"><spring:message
										code="xzYinzhang-info.xzYinzhang-info.input.fshenpi" text="审批" /></label>
								<div class="controls">
									<select class="form-control" id="xzYinzhang-info_fshenpi"
										name="fshenpi" value="${model.fshenpi}" class=" ">
										<option value="同意"
											<c:if test="${model.fshenpi}=='同意'}"> selected="selected"  </c:if>>同意</option>
										<option value="不同意"
											<c:if test="${model.fshenpi}=='不同意'}"> selected="selected"  </c:if>>不同意</option>
									</select>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="xzYinzhang-info_fymba"><spring:message
										code="xzYinzhang-info.xzYinzhang-info.input.fymba" text="印模备案" /></label>
								<div class="controls">
									<select class="form-control" id="xzYinzhang-info_fymba"
										name="fymba" value="${model.fymba}" class=" ">
										<option value="是"
											<c:if test="${model.fymba=='是'}"> selected="selected"  </c:if>>是</option>
										<option value="否"
											<c:if test="${model.fymba=='否'}"> selected="selected"  </c:if>>否</option>
									</select>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="xzYinzhang-info_fqyrq"><spring:message
										code="xzYinzhang-info.xzYinzhang-info.input.fqyrq" text="启用日期" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="xzYinzhang-info_fqyrq" type="text" name="fqyrq"
											value="${model.fqyrq}" size="40" class="text "
											style="background-color:white;cursor:default; width: 175px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="xzYinzhang-info_fzrr"><spring:message
										code="xzYinzhang-info.xzYinzhang-info.input.fzrr" text="责任人" /></label>
								<div class="controls">
									<div class="input-append ryPicker">
										<input id="xzYinzhang-info_fzrr" type="hidden" name="fzrr"
											value="${model.fzrr}"> <input
											id="ryBxRecord-info_userName" type="text"
											value="${ryMap[model.fzrr].fname}" disabled class=" required"
											style="width: 175px;" value=""> <span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-user"></i></span>
									</div>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<div class="row-fluid">
									<label class="control-label" for="xzYinzhang-info_fstatus"><spring:message
											code="xzYinzhang-info.xzYinzhang-info.input.fstatus"
											text="状态" /></label>
									<div class="controls">
										<select class="form-control" id="xzYinzhang-info_fstatus"
											name="fstatus" value="${model.fstatus}" class=" ">
											<option value="在用"
												<c:if test="${model.fstatus}=='在用'}"> selected="selected"  </c:if>>在用</option>
											<option value="交回"
												<c:if test="${model.fstatus}=='交回'}"> selected="selected"  </c:if>>交回</option>
											<option value="销毁"
												<c:if test="${model.fstatus}=='销毁'}"> selected="selected"  </c:if>>销毁</option>
										</select>
									</div>
								</div>
								<div class="row-fluid">
									<label class="control-label" for="xzYinzhang-info_ffzwz"><spring:message
											code="xzYinzhang-info.xzYinzhang-info.input.ffzwz"
											text="放置位置" /></label>
									<div class="controls">
										<input id="xzYinzhang-info_ffzwz" type="text" name="ffzwz"
											value="${model.ffzwz}" size="" class="text ">
									</div>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="xzYinzhang-info_fkzcsjyy"><spring:message
										code="xzYinzhang-info.xzYinzhang-info.input.fkzcsjyy"
										text="刻制次数及原因" /></label>
								<div class="controls">
									<textarea id="xzYinzhang-info_fkzcsjyy" name="fkzcsjyy"
										class="form-control" rows="6" class="text  " minlength=""
										maxlength="200">${model.fkzcsjyy}</textarea>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="xzYinzhang-info_ffy"><spring:message
										code="xzYinzhang-info.xzYinzhang-info.input.ffy" text="成本" /></label>
								<div class="controls">
									<input id="xzYinzhang-info_ffy" type="number" name="ffy"
										value="${model.ffy}" size="" class="number" minlength=""
										maxlength="">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="xzYinzhang-info_fjnje"><spring:message
										code="xzYinzhang-info.xzYinzhang-info.input.fjnje" text="交纳金额" /></label>
								<div class="controls">
									<input id="xzYinzhang-info_fjnje" type="number" name="fjnje"
										value="${model.fjnje}" size="" class="number " minlength=""
										maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="xzYinzhang-info_fmemo"><spring:message
										code="xzYinzhang-info.xzYinzhang-info.input.fmemo" text="交纳方式" /></label>
								<div class="controls">
									<input id="xzYinzhang-info_fmemo" type="text" name="fmemo"
										value="${model.fmemo}" size="" class="text " maxlength="">
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
