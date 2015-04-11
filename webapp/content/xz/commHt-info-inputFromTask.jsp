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
		code="commHt-info.commHt-info.input.title" text="合同管理 - 公司档案管理 - 行政管理" /></title>
<%@include file="/common/s.jsp"%>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
<script type="text/javascript">
	$(function() {
		$("#commHt-infoForm")
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
	});
	var table;
	$(function() {
		table = new Table(config);
		table.configPagination('.m-pagination');
		table.configPageInfo('.m-page-info');
		table.configPageSize('.m-page-size');
	});
</script>
</head>
<body>
	<%@include file="/header.jsp"%>
	<div class="row-fluid">
		<%@include file="/menu/xz-workspace.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span10">
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="xz-workspace.do">行政管理</a> <span class="divider">/</span>
							</li>
							<li>公司档案管理<span class="divider">/</span>
							</li>
							<li class="active">合同管理</li>
						</ul>
					</div>
				</div>
			</div>
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="commHt-info.commHt-info.input.title"
							text="编辑" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="commHt-infoForm" method="post"
						action="xz-commHt-info-saveForTask.do?taskId=${taskId}" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="commHt-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="commHt-info_fhetongno"><spring:message
										code="commHt-info.commHt-info.input.fhetongno" text="合同编号" /></label>
								<div class="controls">
									<input id="commHt-info_fhetongno" type="text" name="fhetongno"
										value="${model.fhetongno}" size="" class="text ">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="commHt-info_fhtname"><spring:message
										code="commHt-info.commHt-info.input.fhtname" text="合同名称" /></label>
								<div class="controls">
									<input id="commHt-info_fhtname" type="text" name="fhtname"
										value="${model.fhtname}" size="" class="text  required">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="commHt-info_fprojecttype"><spring:message
										code="commHt-info.commHt-info.input.fprojecttype" text="工程类别" /></label>
								<div class="controls">
									<select class="form-control" id="commHt-info_fprojecttype"
										name="fprojecttype">
										<option value="房屋建筑工程"
											<c:if test="${model.fprojecttype}=='房屋建筑工程'}"> selected="selected"  </c:if>>房屋建筑工程</option>
										<option value="市政公用工程"
											<c:if test="${model.fprojecttype}=='市政公用工程'}"> selected="selected"  </c:if>>市政公用工程</option>
										<option value="电力工程"
											<c:if test="${model.fprojecttype}=='电力工程'}"> selected="selected"  </c:if>>电力工程</option>
										<option value="冶炼工程"
											<c:if test="${model.fprojecttype}=='冶炼工程'}"> selected="selected"  </c:if>>冶炼工程</option>
										<option value="公路工程"
											<c:if test="${model.fprojecttype}=='公路工程'}"> selected="selected"  </c:if>>公路工程</option>
										<option value="矿山工程"
											<c:if test="${model.fprojecttype}=='矿山工程'}"> selected="selected"  </c:if>>矿山工程</option>
										<option value="化工石油工程"
											<c:if test="${model.fprojecttype}=='化工石油工程'}"> selected="selected"  </c:if>>化工石油工程</option>
										<option value="水利水电工程"
											<c:if test="${model.fprojecttype}=='水利水电工程'}"> selected="selected"  </c:if>>水利水电工程</option>
										<option value="农林工程"
											<c:if test="${model.fprojecttype}=='农林工程'}"> selected="selected"  </c:if>>农林工程</option>
										<option value="铁路工程"
											<c:if test="${model.fprojecttype}=='铁路工程'}"> selected="selected"  </c:if>>铁路工程</option>
										<option value="港口与航道工程"
											<c:if test="${model.fprojecttype}=='港口与航道工程'}"> selected="selected"  </c:if>>港口与航道工程</option>
										<option value="航天航空工程"
											<c:if test="${model.fprojecttype}=='航天航空工程'}"> selected="selected"  </c:if>>航天航空工程</option>
										<option value="通信工程"
											<c:if test="${model.fprojecttype}=='通信工程'}"> selected="selected"  </c:if>>通信工程</option>
										<option value="机电安装工程"
											<c:if test="${model.fprojecttype}=='机电安装工程'}"> selected="selected"  </c:if>>机电安装工程</option>
									</select>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="commHt-info_fguimo"><spring:message
										code="commHt-info.commHt-info.input.fguimo" text="工程规模" /></label>
								<div class="controls">
									<input id="commHt-info_fhetongqi" type="text" name="fguimo"
										value="${model.fguimo}" size="" class="text ">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="commHt-info_ftouzie"><spring:message
										code="commHt-info.commHt-info.input.ftouzie" text="总投资（万元）" /></label>
								<div class="controls">
									<input id="commHt-info_ftouzie" type="number" name="ftouzie"
										value="${model.ftouzie}" size="" class="number ">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="commHt-info_fjianlifei"><spring:message
										code="commHt-info.commHt-info.input.fjianlifei" text="监理费(万元)" /></label>
								<div class="controls">
									<input id="commHt-info_fjiafang" type="number"
										name="fjianlifei" value="${model.fjianlifei}" size=""
										class="number ">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="commHt-info_fstartdate"><spring:message
										code="commHt-info.commHt-info.input.fstartdate" text="开工时间" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="commHt-info_fstartdate" type="text"
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
								<label class="control-label" for="commHt-info_fenddate"><spring:message
										code="commHt-info.commHt-info.input.fenddate" text="竣工时间" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="commHt-info_fenddate" type="text" name="fenddate"
											value="${model.fenddate}" size="40" class="text "
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
								<label class="control-label" for="commHt-info_fhtqi"><spring:message
										code="commHt-info.commHt-info.input.fhtqi" text="合同期" /></label>
								<div class="controls">
									<input id="commHt-info_fhtqi" type="text" name="fhtqi"
										value="${model.fhtqi}" size="" class="text ">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="commHt-info_fyezhuname"><spring:message
										code="commHt-info.commHt-info.input.fyezhuname" text="委托人" /></label>
								<div class="controls">
									<input id="commHt-info_fyezhuname" type="text"
										name="fyezhuname" value="${model.fyezhuname}" size=""
										class="text ">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="commHt-info_fzongjian"><spring:message
										code="commHt-info.commHt-info.input.fzongjian" text="总监" /></label>
								<div class="controls">
									<div class="input-append ryPicker">
										<input id="commHt-info_fzongjian" type="hidden"
											name="fzongjian" value="${model.fzongjian}"> <input
											id="commHt-info_userName" type="text"
											value="${ryMap[model.fzongjian].fname}" class=" "
											style="width: 175px;" value="" /> <span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-user"></i></span>
									</div>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="commHt-info_fxzfzwz"><spring:message
										code="commHt-info.commHt-info.input.fxzfzwz" text="放置位置" /></label>
								<div class="controls">
									<input id="commHt-info_fxzfzwz" type="text" name="fxzfzwz"
										value="${model.fxzfzwz}" size="" class="text ">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="commHt-info_fzkstate"><spring:message
										code="commHt-info.commHt-info.input.fzkstate" text="在库状态" /></label>
								<div class="controls">
									<select class="form-control" id="commHt-info_fzkstate"
										name="fzkstate">
										<option value="在库"
											<c:if test="${model.fzkstate=='在库'}"> selected="selected"  </c:if>>在库</option>
										<option value="未在库"
											<c:if test="${model.fzkstate=='未在库'}"> selected="selected"  </c:if>>未在库</option>
									</select>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="commHt-info_fmemo"><spring:message
										code="commHt-info.commHt-info.input.fmemo" text="备注" /></label>
								<div class="controls">
									<input id="commHt-info_fmemo" type="text" name="fmemo"
										value="${model.fmemo}" size="" class="text   ">
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
