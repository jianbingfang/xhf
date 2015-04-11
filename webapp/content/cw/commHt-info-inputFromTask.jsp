<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "cw-home");
%>
<%
	pageContext.setAttribute("currentMenu", "cw-ht");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message
		code="commHt-info.commHt-info.input.title" text="编辑" /></title>
<%@include file="/common/s.jsp"%>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/xmpicker/xmpicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/xmpicker/xmpicker.js"></script>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
<%--	<script type='text/javascript'
	src='${scopePrefix}/s/xthena/js/cityquery/jock-citypicker-2.0.min.js'></script>
<link
	href='${scopePrefix}/s/xthena/js/cityquery/jock-citypicker-2.0.min.css'
	rel="stylesheet" type="text/css" /> --%>
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/js/linkage.js"></script>
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/js/jbgzjsq.js"></script>
<script type="text/javascript">
	window.onload = function() {
		pc_init();
		setProvCity("${model.fprovince}", "${model.fcity}");
	};
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
		createxmPicker({
			modalId : 'xmPicker',
			url : '${scopePrefix}/gcgl/pjXm-simple-list.do'
		});
		createryPicker({
			modalId : 'ryPicker',
			url : '${scopePrefix}/hr/commRy-simple-list.do'
		});
	})
	function printDiv() {
		$("div.content-inner").printArea();
	}
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
						<spring:message code="commHt-info.commHt-info.input.title"
							text="编辑" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="commHt-infoForm" method="post"
						action="cw-commHt-info-saveForTask.do?taskId=${taskId}" class="form-horizontal">
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
										value="${model.fhetongno}" size="" class="text " maxlength="">
								</div>
							</div>
							<%-- <div class="span5">
								<label class="control-label" for="commHt-info_fxmid"><spring:message
										code="commHt-info.commHt-info.input.fxmid" text="项目名称" /></label>
								<div class="controls">
									<div class="input-append xmPicker">
										<input id="commHt-info_fxmid" type="hidden"
											name="fxmid" value="${model.fxmid}"> <input
											id="xmBxRecord-info_xmmc" type="text"
											value="${xmMap[model.fxmid].fxmname}" disabled
											class=" required" style="width: 175px;" value=""> <span
											class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-th-list"></i></span>
									</div>
								</div>
							</div> --%>
							<div class="span5">
								<label class="control-label" for="commHt-info_fhtname"><spring:message
										code="commHt-info.commHt-info.input.fhtname" text="合同名称" /></label>
								<div class="controls">
									<input id="commHt-info_fhtname" type="text" name="fhtname"
										value="${model.fhtname}" size="" class="text  required"
										maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="commHt-info_fqiandingstatus"><spring:message
										code="commHt-info.commHt-info.input.fqiandingstatus"
										text="签订状态" /></label>
								<div class="controls">
									<input id="commHt-info_fqiandingstatus" type="text"
										name="fqiandingstatus" value="${model.fqiandingstatus}"
										size="" class="text  " readonly maxlength="">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="commHt-info_fjiafang"><spring:message
										code="commHt-info.commHt-info.input.fjiafang" text="业主" /></label>
								<div class="controls">
									<input id="commHt-info_fjiafang" type="text" name="fjiafang"
										value="${model.fjiafang}" size="" class="text " minlength=""
										maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="commHt-info_fadrr"><spring:message
										code="commHt-info.commHt-info.input.fadrr" text="项目地址" /></label>
								<div class="controls">
									<%-- <input id="commHt-info_fadrr" type="text" name="fadrr"
										value="${model.fadrr}" size="" class="text " maxlength="">
										<div class="controls"> --%>
									<input id="commHt-info_fadrr" type="text" name="fadrr"
										value="${model.fadrr}" alt="详细地址">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="commHt-info_fadrr"><spring:message
										code="commHt-info.commHt-info.input.fadrr" text="所属省市" /></label>
								<div class="controls">
									<select id="commHt-info_fprovince" type="text" name="fprovince"
										value="${model.fprovince}" style="width:80px;"></select>省 <select
										id="commHt-info_fcity" type="text" name="fcity"
										value="${model.fcity}" style="width:80px;"></select>市
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="commHt-info_ftotalMoney"><spring:message
										code="commHt-info.commHt-info.input.ftotalMoney" text="项目总投资" /></label>
								<div class="controls">
									<input id="commHt-info_ftotalMoney" type="text"
										name="ftotalMoney" value="${model.ftotalMoney}" size=""
										class="text " minlength="" maxlength="">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="commHt-info_fscale"><spring:message
										code="commHt-info.commHt-info.input.fscale" text="工程规模" /></label>
								<div class="controls">
									<input id="commHt-info_fprojecttype" type="text" name="fscale"
										value="${model.fscale}" size="" class="text " minlength=""
										maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="commHt-info_fqiandingdate"><spring:message
										code="commHt-info.commHt-info.input.fqiandingdate"
										text="合同签订时间" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="commHt-info_fqiandingdate" type="text"
											name="fqiandingdate" value="${model.fqiandingdate}" size="40"
											class="text "
											style="background-color:white;cursor:default; width: 175px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="commHt-info_fstartdate"><spring:message
										code="commHt-info.commHt-info.input.fstartdate" text="合同开工时间" /></label>
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
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="commHt-info_fenddate"><spring:message
										code="commHt-info.commHt-info.input.fenddate" text="合同竣工时间" /></label>
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
							<div class="span5">
								<label class="control-label" for="commHt-info_fhtqi"><spring:message
										code="commHt-info.commHt-info.input.fhtqi" text="合同期(备注)" /></label>
								<div class="controls">
									<input id="commHt-info_fhtqi" type="text" name="fhtqi"
										value="${model.fhtqi}" size="" class="text " minlength=""
										maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="commHt-info_fzhubanren"><spring:message
										code="commHt-info.commHt-info.input.fzhubanren" text="负责人" /></label>
								<div class="controls">
									<div class="input-append ryPicker">
										<input id="commHt-info_fzhubanren" type="hidden"
											name="fzhubanren" value="${model.fzhubanren}"> <input
											id="ryBxRecord-info_fqiandingren" type="text"
											value="${ryMap[model.fzhubanren].fname}" disabled class=" "
											value=""> <span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-user"></i></span>
									</div>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="commHt-info_fjianlifei"><spring:message
										code="commHt-info.commHt-info.input.fjianlifei" text="监理费(万元)" /></label>
								<div class="controls">
									<input id="commHt-info_fjiafang" type="text" name="fjianlifei"
										value="${model.fjianlifei}" size="" class="number "
										minlength="" maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="commHt-info_fjianlifeilv"><spring:message
										code="commHt-info.commHt-info.input.fjianlifeilv" text="监理费率" /></label>
								<div class="controls">
									<input id="commHt-info_fjianlifeilv" type="text"
										name="fjianlifeilv" value="${model.fjianlifeilv}" size=""
										class="text " minlength="" maxlength="">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="commHt-info_fprojecttype"><spring:message
										code="commHt-info.commHt-info.input.fprojecttype" text="工程类别" /></label>
								<div class="controls">
									<select class="form-control" id="jyXm-info_fprojecttype"
										name="fprojecttype" value="${model.fprojecttype}"
										class=" required">
										<option value="房屋建筑工程"
											<c:if test="${model.fprojecttype=='房屋建筑工程'}"> selected="selected"  </c:if>>房屋建筑工程</option>
										<option value="市政公用工程"
											<c:if test="${model.fprojecttype=='市政公用工程'}"> selected="selected"  </c:if>>市政公用工程</option>
										<option value="电力工程"
											<c:if test="${model.fprojecttype=='电力工程'}"> selected="selected"  </c:if>>电力工程</option>
										<option value="冶炼工程"
											<c:if test="${model.fprojecttype=='冶炼工程'}"> selected="selected"  </c:if>>冶炼工程</option>
										<option value="公路工程"
											<c:if test="${model.fprojecttype=='公路工程'}"> selected="selected"  </c:if>>公路工程</option>
										<option value="矿山工程"
											<c:if test="${model.fprojecttype=='矿山工程'}"> selected="selected"  </c:if>>矿山工程</option>
										<option value="化工石油工程"
											<c:if test="${model.fprojecttype=='化工石油工程'}"> selected="selected"  </c:if>>化工石油工程</option>
										<option value="水利水电工程"
											<c:if test="${model.fprojecttype=='水利水电工程'}"> selected="selected"  </c:if>>水利水电工程</option>
										<option value="农林工程"
											<c:if test="${model.fprojecttype=='农林工程'}"> selected="selected"  </c:if>>农林工程</option>
										<option value="铁路工程"
											<c:if test="${model.fprojecttype=='铁路工程'}"> selected="selected"  </c:if>>铁路工程</option>
										<option value="港口与航道工程"
											<c:if test="${model.fprojecttype=='港口与航道工程'}"> selected="selected"  </c:if>>港口与航道工程</option>
										<option value="航天航空工程"
											<c:if test="${model.fprojecttype=='航天航空工程'}"> selected="selected"  </c:if>>航天航空工程</option>
										<option value="通信工程"
											<c:if test="${model.fprojecttype=='通信工程'}"> selected="selected"  </c:if>>通信工程</option>
										<option value="机电安装工程"
											<c:if test="${model.fprojecttype=='机电安装工程'}"> selected="selected"  </c:if>>机电安装工程</option>
									</select>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="commHt-info_fpaytype"><spring:message
										code="commHt-info.commHt-info.input.fpaytype" text="付款方式" /></label>
								<div class="controls">
									<textarea id="commHt-info_fpaytype" name="fpaytype" rows="5"
										size="" class="text " minlength="" style="width: 360px;"
										maxlength="">${model.fpaytype}</textarea>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="commHt-info_fzhubanren"><spring:message
										code="commHt-info.commHt-info.input.fzhubanren" text="总监" /></label>
								<div class="controls">
									<div class="input-append ryPicker">
										<input id="commHt-info_fzhubanren" type="hidden"
											name="fzongjian" value="${model.fzongjian}"> <input
											id="ryBxRecord-info_fzongjian" type="text"
											value="${ryMap[model.fzongjian].fname}" disabled class=" "
											value=""> <span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-user"></i></span>
									</div>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="commHt-info_fywtype"><spring:message
										code="commHt-info.commHt-info.input.fywtype" text="业务类型" /></label>
								<div class="controls">
									<select class="form-control" id="commHt-info_fywtype"
										name="fywtype" value="${model.fywtype}" class=" ">
										<option value="工程监理"
											<c:if test="${model.fywtype}=='工程监理'}"> selected="selected"  </c:if>>工程监理</option>
										<option value="项目管理"
											<c:if test="${model.fywtype}=='项目管理'}"> selected="selected"  </c:if>>项目管理</option>
										<option value="招标代理"
											<c:if test="${model.fywtype}=='招标代理'}"> selected="selected"  </c:if>>招标代理</option>
										<option value="造价咨询"
											<c:if test="${model.fywtype}=='造价咨询'}"> selected="selected"  </c:if>>造价咨询</option>
										<option value="勘探设计"
											<c:if test="${model.fywtype}=='勘探设计'}"> selected="selected"  </c:if>>勘探设计</option>
									</select>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="commHt-info_fmemo4"><spring:message
										code="commHt-info.commHt-info.input.fmemo4" text="属性" /></label>
								<div class="controls">
									<input id="commHt-info_fmemo4" type="text" name="fmemo4"
										value="${model.fmemo4}" size="" class="text " maxlength="64">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="commHt-info_fcwfzwz"><spring:message
										code="commHt-info.commHt-info.input.fcwfzwz" text="放置位置" /></label>
								<div class="controls">
									<input id="commHt-info_fcwfzwz" type="text" name="fcwfzwz"
										value="${model.fcwfzwz}" size="" class="text " maxlength="64">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="commHt-info_fjsstate"><spring:message
										code="commHt-info.commHt-info.input.fjsstate" text="状态" /></label>
								<div class="controls">
									<select id="commHt-info_fjsstate" name="fjsstate" size=""
										class="text ">
										<option value="未结算"
											<c:if test="${model.fjsstate=='未结算' }">selected="selected"</c:if>>未结算</option>
										<option value="已结算"
											<c:if test="${model.fjsstate=='已结算' }">selected="selected"</c:if>>已结算</option>
									</select>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="controls">
							
								<button type="submit" class="btn a-submit">
									<spring:message code='core.input.saveinput' text='保存' />
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
