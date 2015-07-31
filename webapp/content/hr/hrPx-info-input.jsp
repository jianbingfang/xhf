<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "hr-home");
%>
<%
	pageContext.setAttribute("currentMenu", "hrPx");
%>
<!doctype html>
<html lang="zh">

<head>
<%@include file="/common/meta.jsp"%>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/js/jquery.min.js"></script>
<title><spring:message code="hrPx-info.hrPx-info.input.title"
		text="内部培训 - 员工培训 - 人力资源" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript">
	$(function() {
		$("#hrPx-infoForm")
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
	})
	function kaoshi() {
		if ($("#hrPx-info_fsfks").val() == 1) {
			$("#hrPx-info_fksfs").attr("disabled", false);
			$("#hrPx-info_fksjg").attr("disabled", false);
		} else {
			$("#hrPx-info_fksfs").attr("disabled", true);
			$("#hrPx-info_fksjg").attr("disabled", true);
		}
	}
</script>
</head>

<body>
	<%@include file="/header.jsp"%>

	<div class="row-fluid">
		<%@include file="/menu/hr-workspace.jsp"%>

		<!-- start of main -->
		<section id="m-main" class="span10">
			<!-- <div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="hr-home.do">人力资源</a> <span class="divider">/</span>
							</li>
							<li>员工培训<span class="divider">/</span>
							</li>
							<li class="active">内部培训</li>
						</ul>
					</div>
				</div>
			</div> -->
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="hrPx-info.hrPx-info.input.title" text="编辑" />
					</h4>
				</header>

				<div class="content content-inner">

					<form id="hrPx-infoForm" method="post" action="hrPx-info-save.do"
						class="form-horizontal">
						<c:if test="${model != null}">
							<input id="hrPx-info_id" type="hidden" name="fid"
								value="${model.fid}">
							<%--<input id="hrPx-info_fnwb" type="hidden" name="fnwb" value=${model.fnwb=1}>--%>
						</c:if>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="hrPx-info_fpxzt"><spring:message
										code="hrPx-info.hrPx-info.input.fpxzt" text="培训主题" /></label>
								<div class="controls">
									<input id="hrPx-info_fpxzt" type="text" name="fpxzt"
										value="${model.fpxzt}" size="" class="text required"
										minlength="" maxlength="">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="hrPx-info_fpxtype"><spring:message
										code="hrPx-info.hrPx-info.input.fpxtype" text="培训类别" /></label>
								<div class="controls">
									<select class="form-control" id="hrPx-info_fpxtype"
										name="fpxtype" value="${model.fpxtype}" class=" required">
										<option value="1"
											<c:if test="${model.fpxtype=='1'}"> selected="selected"  </c:if>>机关培训</option>
										<option value="2"
											<c:if  test="${model.fpxtype=='2'}"> selected="selected"  </c:if>>项目培训</option>
										<option value="3"
											<c:if  test="${model.fpxtype=='3'}"> selected="selected"  </c:if>>入职培训</option>
										<option value="4"
											<c:if  test="${model.fpxtype=='4'}"> selected="selected"  </c:if>>总监培训</option>
										<option value="5"
											<c:if  test="${model.fpxtype=='5'}"> selected="selected"  </c:if>>其他培训</option>
									</select>
								</div>
							</div>
						</div>

						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="hrPx-info_fzzdw"><spring:message
										code="hrPx-info.hrPx-info.input.fzzdw" text="培训时间" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="hrPx-info_fdate" type="text" name="fdate"
											value="${model.fdate}" size="40" class="text required"
											style="background-color:white;cursor:default; width: 175px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="hrPx-info_fpxfs"><spring:message
										code="hrPx-info.hrPx-info.input.fpxfs" text="培训方式" /></label>
								<div class="controls">
									<select class="form-control" id="hrPx-info_fpxfs" name="fpxfs"
										value="${model.fpxfs}" class=" required">
										<option value="1"
											<c:if test="${model.fpxfs=='1'}"> selected="selected"  </c:if>>视频</option>
										<option value="2"
											<c:if  test="${model.fpxfs=='2'}"> selected="selected"  </c:if>>讲座</option>
										<option value="3"
											<c:if  test="${model.fpxfs=='3'}"> selected="selected"  </c:if>>讨论</option>
										<option value="4"
											<c:if  test="${model.fpxfs=='4'}"> selected="selected"  </c:if>>正式</option>
										<option value="5"
											<c:if  test="${model.fpxfs=='5'}"> selected="selected"  </c:if>>其他</option>
									</select>
								</div>
							</div>
						</div>


						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="hrPx-info_fpxdd"><spring:message
										code="hrPx-info.hrPx-info.input.fpxdd" text="培训地点" /></label>
								<div class="controls">
									<input id="hrPx-info_fpxdd" type="text" name="fpxdd"
										value="${model.fpxdd}" size="" class="text required"
										minlength="" maxlength="">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="hrPx-info_fsfks"><spring:message
										code="hrPx-info.hrPx-info.input.fsfks" text="是否考试" /></label>
								<div class="controls">
									<select class="form-control" id="hrPx-info_fsfks" name="fsfks"
										value="${model.fsfks}" class="" onchange="kaoshi()">
										<option value="0" selected="selected">否</option>
										<option value="1"
											<c:if  test="${model.fsfks=='1'}"> selected="selected"  </c:if>>是</option>
									</select>
								</div>
							</div>
						</div>
						<div class="control-group">

							<div class="span5">
							<label class="control-label" for="hrPx-info_fpxdd"><spring:message
									code="hrPx-info.hrPx-info.input.fpxdd" text="组织单位" /></label>
							<div class="controls">
								<input id="hrPx-info_fzzdw" type="text" name="fzzdw"
									   value="${model.fzzdw}" size="" class="text required"
									   minlength="" maxlength="">
							</div>
						</div>
							<%--<div class="span5">--%>
								<%--<label class="control-label" for="hrPx-info_fzzdw"><spring:message--%>
										<%--code="hrPx-info.hrPx-info.input.fzzdw" text="组织部门" /></label>--%>
								<%--<div class="controls">--%>
									<%--<select id="hrGwbm-info_fbmid" name="fbmid"--%>
										<%--class="form-control required">--%>
										<%--<c:forEach items="${deptList}" var="item">--%>
											<%--<option value="${item.id}"--%>
												<%--${item.id==model.fbmid ? 'selected' : ''}>${item.name}</option>--%>
										<%--</c:forEach>--%>
									<%--</select>--%>
								<%--</div>--%>
							<%--</div>--%>
							<div class="span5">
								<label class="control-label" for="hrPx-info_fksfs"><spring:message
										code="hrPx-info.hrPx-info.input.fksfs" text="考试方式" /></label>
								<div class="controls">
									<input id="hrPx-info_fmemo1" type="text" name="fmemo1"
										   value="${model.fmemo1}" size="" class="text"
										   minlength="" maxlength="">
								</div>
							</div>
						</div>

						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="hrPx-info_ffzr"><spring:message
										code="hrPx-info.hrPx-info.input.ffzr" text="负责人" /></label>
								<div class="controls">
									<input id="hrPx-info_ffzr" type="text" name="ffzr"
															   value="${model.ffzr}" size="" class="text required"
											   minlength="" maxlength="">

									<%--<div class="input-append ryPicker">--%>
										<%--<input id="ryBxRecord-info_fryid" type="hidden" name="ffzr"--%>
											<%--value="${model.ffzr}"> <input--%>
											<%--id="ryBxRecord-info_userName" type="text"--%>
											<%--value="${userNames[model.ffzr].fname}"--%>
											<%--disabled class=" required" style="width: 175px;" value="">--%>
										<%--<span class="add-on"--%>
											<%--style="padding-top: 2px; padding-bottom: 2px;"><i--%>
											<%--class="icon-user"></i></span>--%>
									<%--</div>--%>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="hrPx-info_fksjg"><spring:message
										code="hrPx-info.hrPx-info.input.fksjg" text="考试结果" /></label>
								<div class="controls">
									<input id="hrPx-info_fksjg" type="text" name="fksjg"
										value="${model.fksjg}" size="" class="text "
										<c:if test="${model.fsfks!='1'}"> disabled </c:if>>
								</div>
							</div>
						</div>


						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="hrPx-info_fcjrs"><spring:message
										code="hrPx-info.hrPx-info.input.fcjrs" text="参加人数(人)" /></label>
								<div class="controls">
									<input id="hrPx-info_fcjrs" type="number" name="fcjrs"
										value="${model.fcjrs}" size="" class="number required"
										minlength="" maxlength="">
								</div>
							</div>

							<div class="span5">
								<label class="control-label" for="hrPx-info_fzlmc"><spring:message
										code="hrPx-info.hrPx-info.input.fzlmc" text="培训资料" /></label>
								<div class="controls">
									<input id="hrPx-info_fzlmc" type="text" name="fzlmc"
										value="${model.fzlmc}" size="" class="text " minlength=""
										maxlength="">
								</div>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="hrPx-info_fzlmc"><spring:message
									code="hrPx-info.hrPx-info.input.fzlmc" text="参加人员" /></label>
							<div class="controls">
								 	<textarea id="hrPx-info_fmemo" name="fmemo"
									class="form-control" rows="6" style="width: 560px"
									class="text " minlength="" maxlength="">${model.fmemo}</textarea>
								<%--<div class="span3">--%>
									<%--<select multiple size="5" name="list1"  id="list1" style="width:250px ;height:160px" >--%>
									<%--<c:forEach items="${userNames}" var="item">--%>
											<%--<option value="${item}">${item.fname}</option>--%>
										<%--</c:forEach>--%>
									<%--</select>--%>
								<%--</div>--%>
								<%--<div class="span1">--%>
									<%--<div class="span12">--%>
										<%--<input type="button" value=" >"--%>
											<%--onclick="move(this.form.list1,this.form.list2)" name="B1">--%>
									<%--</div>--%>
									<%--<div class="span12">--%>
										<%--<input type="button" value=" <"--%>
										<%--onclick="--%>
											<%--move(this.form.list2,this.form.list1)" name="B2">--%>
									<%--</div>--%>
									<%--<div class="span12">--%>
										<%--<input type="button" value=">>"--%>
											<%--onclick="moveall(this.form.list1,this.form.list2)" name="B3">--%>
									<%--</div>--%>
									<%--<div class="span12">--%>
										<%--<input type="button" value="<<"--%>
										<%--onclick="--%>
											<%--moveall(this.form.list2,this.form.list1)" name="B4">--%>
									<%--</div>--%>

								<%--</div>--%>
								<%--<div class="span3">--%>
									<%--<select multiple size="5" name="list2" id="list2"--%>
										<%--style="width:250px ;height:160px" value="s">--%>

									<%--</select>--%>
								<%--</div>--%>
							</div>

						</div>

						<div class="control-group">
							<label class="control-label" for="hrPx-info_fpxnrzy"><spring:message
									code="hrPx-info.hrPx-info.input.fpxnrzy" text="培训内容摘要" /></label>
							<div class="controls">
								<textarea id="hrPx-info_fpxnrzy" name="fpxnrzy"
									class="form-control" rows="6" style="width: 560px"
									class="text " minlength="" maxlength="">${model.fpxnrzy}</textarea>
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
