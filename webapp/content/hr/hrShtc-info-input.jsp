<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "hr-home");
%>
<%
	pageContext.setAttribute("currentMenu", "commRy");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
<title><spring:message
		code="hrShtc-info.hrShtc-info.input.title" text="社会统筹- 员工管理 - 人力资源" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript">
	$(function() {
		$("#hrShtc-infoForm")
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
	function repleaceYwx() {
		window.location.href = "hrYwxTihuan-info-input.do?fryid="
				+ $('#hrShtc-info_fryid').val();
	}
	
	function changeUi(select){
		if(select.value=="0"){
		document.getElementById("hrShtc-info_fmemo3_label").innerHTML ="姓名";
		document.getElementById("hrShtc-info_fmemo4").type="hidden";
		document.getElementById("hrShtc-info_fmemo2").type="hidden";
		}
		else {
			document.getElementById("hrShtc-info_fmemo3_label").innerHTML ="负责人";
			document.getElementById("hrShtc-info_fmemo4").type="text";
			document.getElementById("hrShtc-info_fmemo2").type="text";
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
		<!-- 	<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="hr-home.do">人力资源</a> <span class="divider">/</span>
							</li>
							<li>员工管理<span class="divider">/</span>
							</li>
							<li class="active">社会统筹</li>
						</ul>
					</div>
				</div>
			</div> -->
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="hrShtc-info.hrShtc-info.input.title"
							text="编辑" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="hrShtc-infoForm" method="post"
						action="hrShtc-info-save.do" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="hrShtc-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<div class="control-group">
						   <select id="gsState"  name="fmemo3" onchange=changeUi(this) style="width: 80px;">
						<option value="0" <c:if test="${model.fmemo3=='0' }">selected="selected"  </c:if>>公司</option>
						<option value="1" <c:if test="${model.fmemo3=='1' }">selected="selected"  </c:if>>分公司</option>
						</select>
						
						</div>
						<div class="control-group">
							<label class="control-label" id="hrShtc-info_fmemo3_label" for="hrShtc-info_fmemo3">  <c:if test="${model.fmemo3=='0'||model.fmemo3==null}">姓名</c:if>  <c:if test="${model.fmemo3=='1'}">负责人</c:if></label>
							<div class="controls">
								<div class="input-append ryPicker">
									<input id="hrShtc-info_fryid" type="hidden" name="fryid"
										value="${model.fryid}" class="text required"> <input
										id="hrShtc-info_userName" type="text" value="${userName}"
										class=" text required" disabled style="width: 175px;" value="">
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-user"></i></span>
								</div>
								<select id="hrShtc-info_ftype" name="ftype">
									<option value="新增"
										<c:if test="${model.ftype=='新增'}"> selected="selected"  </c:if>>新增</option>
									<option value="转移"
										<c:if test="${model.ftype=='转移'}"> selected="selected"  </c:if>>转移</option>
								</select>
								<div class="input-append datepicker date"
									style="padding-left: 0px;width: 180px;">
									<input id="hrShtc-info_fcreatedate" type="text"
										placeholder="办理时间" name="fcreatedate"
										value="${model.fcreatedate}" size="40" class="text "
										style="background-color:white;cursor:default; width:140px;">
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-calendar"></i></span>
								</div>
								<input id="hrShtc-info_fmemo4" style="width: 120px;" <c:if test="${model.fmemo3=='0'||model.fmemo3==null}">type="hidden"</c:if>  <c:if test="${model.fmemo3=='1'}">type="text"</c:if>
										placeholder="人员姓名" name="fmemo4"
										value="${model.fmemo4}" size="" class="text ">
								<input id="hrShtc-info_fmemo2" style="width: 120px;" <c:if test="${model.fmemo3=='0'||model.fmemo3==null}">type="hidden"</c:if>  <c:if test="${model.fmemo3=='1'}">type="text"</c:if>
										placeholder="所在项目"  name="fmemo2"
										value="${model.fmemo2}" size="" class="text ">
							</div>
						</div>
						<div class="control-group">
							<div class="span10">
								<label class="control-label" for="hrShtc-info_ftctype"><spring:message
										code="hrShtc-info.hrShtc-info.input.ftctype" text="养老保险" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;width: 180px;">
										<input id="hrShtc-info_fstartdate" type="text"
											placeholder="开始时间" name="fstartdate"
											value="${model.fstartdate}" size="40" class="text "
											style="background-color:white;cursor:default; width:140px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>
									<input id="hrShtc-info_fjnjs" style="width: 120px;"
										placeholder="缴纳基数" type="number" name="fjnjs"
										value="${model.fjnjs}" size="" class="number "> <input
										id="hrShtc-info_fbryj" style="width: 120px;"
										placeholder="个人承担" type="number" name="fbryj"
										value="${model.fbryj}" size="" class="number "> <input
										id="hrShtc-info_fgsyj" style="width: 120px;"
										placeholder="公司承担" type="number" name="fgsyj"
										value="${model.fgsyj}" size="" class="number ">
									<div class="input-append datepicker date"
										style="padding-left: 0px;width: 180px;">
										<input id="hrShtc-info_flastdate" type="text"
											placeholder="停保时间" name="flastdate"
											value="${model.flastdate}" size="40" class="text "
											style="background-color:white;cursor:default; width: 140px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span10">
								<label class="control-label" for="hrShtc-info_ftctype"><spring:message
										code="hrShtc-info.hrShtc-info.input.ftctype" text="医疗保险" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;width: 180px;">
										<input id="hrShtc-info_fstartdate" type="text"
											placeholder="开始时间" name="fstartdateyl"
											value="${model.fstartdateyl}" size="40" class="text "
											style="background-color:white;cursor:default; width:140px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>
									<input id="hrShtc-info_fjnjs" style="width: 120px;"
										placeholder="缴纳基数" type="number" name="fjnjsyl"
										value="${model.fjnjsyl}" size="" class="number " minlength=""
										maxlength=""> <input id="hrShtc-info_fbryj"
										style="width: 120px;" placeholder="个人承担" type="number"
										name="fbryjyl" value="${model.fbryjyl}" size=""
										class="number " minlength="" maxlength=""> <input
										id="hrShtc-info_fgsyj" style="width: 120px;"
										placeholder="公司承担" type="number" name="fgsyjyl"
										value="${model.fgsyjyl}" size="" class="number " minlength=""
										maxlength="">
									<div class="input-append datepicker date"
										style="padding-left: 0px;width: 180px;">
										<input id="hrShtc-info_flastdate" type="text"
											placeholder="停保时间" name="flastdateyl"
											value="${model.flastdateyl}" size="40" class="text "
											style="background-color:white;cursor:default; width: 140px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span10">
								<label class="control-label" for="hrShtc-info_ftctype"><spring:message
										code="hrShtc-info.hrShtc-info.input.ftctype" text="意外险" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;width: 180px;">
										<input id="hrShtc-info_fstartdate" type="text"
											placeholder="开始时间" name="fstartdateyw"
											value="${model.fstartdateyw}" size="40" class="text "
											style="background-color:white;cursor:default; width:140px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>
									<input id="hrShtc-info_fjnjs" style="width: 120px;"
										placeholder="保额" type="number" name="fjnjsyw"
										value="${model.fjnjsyw}" size="" class="number "> <input
										id="hrShtc-info_fbryj" style="width: 120px;"
										placeholder="个人承担" type="number" name="fbryjyw"
										value="${model.fbryjyw}" size="" class="number "> <input
										id="hrShtc-info_fgsyj" style="width: 120px;"
										placeholder="公司承担" type="number" name="fgsyjyw"
										value="${model.fgsyjyw}" size="" class="number ">
									<div class="input-append datepicker date"
										style="padding-left: 0px;width: 180px;">
										<input id="hrShtc-info_flastdate" type="text"
											placeholder="停保时间" name="flastdateyw"
											value="${model.flastdateyw}" size="40" class="text "
											style="background-color:white;cursor:default; width: 140px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>
									<button type="button" class="btn" onclick="repleaceYwx()">
										<spring:message code='core.input.save' text='替换' />
									</button>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="input-append ryPicker">
								<label class="control-label" for="hrShtc-info_fjsr"><spring:message
										code="hrShtc-info.hrShtc-info.input.fjsr" text="经手人" /></label>
								<div class="controls">
									<input id="hrShtc-info_fjsr" type="hidden" name="fjsr"
										value="${model.fjsr}" class="text required"> <input
										id="hrShtc-info_userName" type="text"
										value="${ryMap[model.fjsr].fname}" class=" text required"
										disabled style="width: 175px;" value=""> <span
										class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-user"></i></span>
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
