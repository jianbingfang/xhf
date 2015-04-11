<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "xz-home");
%>
<%
	pageContext.setAttribute("currentMenu", "xz-cl");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/carpicker/carpicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/carpicker/carpicker.js"></script>
<title><spring:message
		code="xzCarRecord-info.xzCarRecord-info.input.title"
		text="车辆使用记录 - 车辆管理 - 行政管理" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript">
	$(
			function() {
				$("#xzCarRecord-infoForm")
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

				createcarPicker({
					modalId : 'carPicker',
					url : '${scopePrefix}/xz/xzCar-simple-list.do'
				});
				createryPicker({
					modalId : 'ryPicker',
					url : '${scopePrefix}/hr/commRy-simple-list.do'
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
		<!-- 	<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="xz-workspace.do">行政管理</a> <span class="divider">/</span>
							</li>
							<li>车辆管理<span class="divider">/</span>
							</li>
							<li class="active">车辆使用记录</li>
						</ul>
					</div>
				</div>
			</div> -->
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message
							code="xzCarRecord-info.xzCarRecord-info.input.title" text="编辑" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="xzCarRecord-infoForm" method="post"
						action="xzCarRecord-info-save.do" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="xzCarRecord-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="xzCarBxRecord-info_fcarid"><spring:message
										code="xzCarBxRecord-info.xzCarBxRecord-info.input.fcarid"
										text="车牌号" /></label>
								<div class="controls">
									<div class="input-append carPicker">
										<input id="xzCarBxRecord-info_fcarid" type="hidden"
											name="fcarid" value="${model.fcarid}"> <input
											id="fcarno" type="text" value="${fcarno}"
											style="width: 175px;" value=""> <span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-list"></i></span>
									</div>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="hrLdht-info_fryid"><spring:message
										code="hrLdht-info.hrLdht-info.input.fryid" text="使用人" /></label>
								<div class="controls">
									<div class="input-append ryPicker">
										<input id="xzCarRecord-info_fry" type="text" name="fry"
											value="${model.fry}" class=" required">
									</div>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="xzCarRecord-info_foutdate"><spring:message
										code="xzCarRecord-info.xzCarRecord-info.input.foutdate"
										text="出车时间" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="xzCarRecord-info_foutdate" type="text"
											name="foutdate" value="${model.foutdate}" size="40"
											class="text "
											style="background-color:white;cursor:default; width: 175px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="xzCarRecord-info_fbackdate"><spring:message
										code="xzCarRecord-info.xzCarRecord-info.input.fbackdate"
										text="归还时间" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="xzCarRecord-info_fbackdate" type="text"
											name="fbackdate" value="${model.fbackdate}" size="40"
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
								<label class="control-label" for="xzCarRecord-info_fcarstate"><spring:message
										code="xzCarRecord-info.xzCarRecord-info.input.fcarstate"
										text="车辆状况" /></label>
								<div class="controls">
									<select class="form-control" id="xzCarRecord-info_fcarstate"
										name="fcarstate" value="${model.fcarstate}" class=" ">
										<option value="完好"
											<c:if test="${model.fcarstate}=='完好'}"> selected="selected"  </c:if>>完好</option>
										<option value="事故"
											<c:if test="${model.fcarstate}=='事故'}"> selected="selected"  </c:if>>事故</option>
										<option value="划痕"
											<c:if test="${model.fcarstate}=='划痕'}"> selected="selected"  </c:if>>划痕</option>
									</select>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="xzCarRecord-info_fdriveline"><spring:message
										code="xzCarRecord-info.xzCarRecord-info.input.fdriveline"
										text="行车线路" /></label>
								<div class="controls">
									<input id="xzCarRecord-info_fdriveline" type="text"
										name="fdriveline" value="${model.fdriveline}" size=""
										class="text required" minlength="" maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="xzCarRecord-info_ftotalkm"><spring:message
										code="xzCarRecord-info.xzCarRecord-info.input.ftotalkm"
										text="总公里数" /></label>
								<div class="controls">
									<input id="xzCarRecord-info_ftotalkm" type="text"
										name="ftotalkm" value="${model.ftotalkm}" size=""
										class="number   " minlength="" maxlength="">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="xzCarRecord-info_fxckm"><spring:message
										code="xzCarRecord-info.xzCarRecord-info.input.fxckm"
										text="行车里程" /></label>
								<div class="controls">
									<input id="xzCarRecord-info_fxckm" type="text" name="fxckm"
										value="${model.fxckm}" size="" class="number   " minlength=""
										maxlength="">
								</div>
							</div>
						</div>
						<!-- <div class="control-group">
					    </div> 
					    -->
						<div class="control-group">
							<label class="control-label" for="xzCarRecord-info_fmemo"><spring:message
									code="xzCarRecord-info.xzCarRecord-info.input.fmemo" text="备注" /></label>
							<div class="controls">
								<textarea id="xzCarRecord-info_fmemo" name="fmemo"
									class="form-control" rows="6" style="width: 560px"
									class="text  " minlength="" maxlength="1000">${model.fmemo}</textarea>
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
