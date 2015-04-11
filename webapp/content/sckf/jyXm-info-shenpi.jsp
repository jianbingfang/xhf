<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "sckf-home");
%>
<%
	pageContext.setAttribute("currentMenu", "sckf-xx");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="jyXm-info.jyXm-info.input.title"
		text="项目信息 - 项目投标 - 市场开发" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/js/linkage.js"></script>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>

<script type="text/javascript">

	var uploadInput="";

	$(function() {
		$("#jyXm-infoForm")
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

		$("#confirmBtn").click(function() {
			getFiles();
		});
	});
	
	function showUploadDiv(inputName){
		uploadInput=inputName;
		showUpload();
	}

	function specialButtonClick(event) {
		event = event ? event : window.event;
		var btn = event.srcElement ? event.srcElement : event.target;
		if (btn.className == "btn btn-block") {
			
			btn.className = "btn btn-block btn-primary";
			$('#'+$(btn).attr('forHidden')).val('1');

		} else if (btn.className == "btn btn-block btn-primary") {
			btn.className = "btn btn-block";
			$('#'+$(btn).attr('forHidden')).val('0');
		}
	}

	function scheduleChange(value1, value2) {
		var bar = document.getElementById("schedule-bar");
		bar.style.width = value1;
	//	bar.innerText = value1;
	//	var a = document.getElementById("btn-jdzt");
	//	a.innerText = value2;
	}
	//在页面定义怎么使用 缓存数据
	function getFiles() {
		var filesIndex = $('#filesUl').children('li[litype="new"]').length;
		$.each($('.files').children(),
			function(index, node) {
				$('#jyXm-info_'+uploadInput+'name').val($(node).data("fileName")+ "."+ $(node).data("fileType"));
				$('#jyXm-info_'+uploadInput+'url').val($(node).data("fileUrl"));
				$('#jyXm-info_'+uploadInput+'Down').attr('href',$(node).data("fileUrl"));
			});
		$(".uploadModal").modal('hide');
	}

	function removeFujian(fujianId) {
		$('[fujianindex="' + fujianId + '"]').remove();
	}
</script>
<style type="text/css">
.form-horizontal .control-label{ width:120px;}
.form-horizontal .controls {margin-left: 140px;}
label{ font-size:12px;}
</style>
</head>
<body>
 <%@include file="/header.jsp"%>
 <div class="row-fluid">
	  <%@include file="/menu/sckf-workspace.jsp"%>
	
	<%@include file="../comm/comm-upload.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span10">
		<form id="jyXm-infoForm" method="post" action="jyXm-info-collect-save.do"
				class="form-horizontal">
				<c:if test="${model != null}">
					<input id="jyXm-info_id" type="hidden" name="fid"
						value="${model.fid}">
				</c:if>
				<div class="container-fluid">
					<ul class="breadcrumb" style="width: 98%">
						<li style="float: right;">
							<button type="submit" class="btn a-submit btn-small" style="margin-top:-3px;">
								<spring:message code='core.input.save' text='保存' />
							</button>
							<button type="button" class="btn a-cancel  btn-small"  style="margin-top:-3px;"
								onclick="history.back();">
								<spring:message code='core.input.back' text='返回' />
							</button>
						</li>
					</ul>
				</div>
						<article class="m-widget">
							<header class="header">
								<h4 class="title">
									<p>招标信息登记</p>
								</h4>
								<div class="ctrl">
									<a class="btn"><i id="jyXm-zbxxdj-infoFormIcon"
										class="icon-chevron-up"></i></a>
								</div>
							</header>
							<div class="content content-inner" style="padding-bottom:20px;">
								<div class="row-fluid">
									<div class="span5">
										<label class="control-label" for="jyXm-info_fname"><spring:message
												code="jyXm-info.jyXm-info.input.fname" text="工程名称" /></label>
										<div class="controls">
											<input id="jyXm-info_fname" type="text" name="fname"
												value="${model.fname}" size="" class="text required"
												minlength="" maxlength="">
										</div>
									</div>
									<div class="span5">
										<label class="control-label" for="jyXm-info_ftype"><spring:message
												code="jyXm-info.jyXm-info.input.ftype" text="工程类别" /></label>
										<div class="controls">
											<select class="form-control" id="jyXm-info_ftype"
												name="ftype" value="${model.ftype}" class=" required">
													<option value="房屋建筑工程"
											<c:if test="${model.ftype=='房屋建筑工程'}"> selected="selected"  </c:if>>房屋建筑工程</option>
											<option value="市政公用工程"
											<c:if test="${model.ftype=='市政公用工程'}"> selected="selected"  </c:if>>市政公用工程</option>
											<option value="电力工程"
											<c:if test="${model.ftype=='电力工程'}"> selected="selected"  </c:if>>电力工程</option>
										<option value="冶炼工程"
											<c:if test="${model.ftype=='冶炼工程'}"> selected="selected"  </c:if>>冶炼工程</option>
											<option value="公路工程"
											<c:if test="${model.ftype=='公路工程'}"> selected="selected"  </c:if>>公路工程</option>
										<option value="矿山工程"
											<c:if test="${model.ftype=='矿山工程'}"> selected="selected"  </c:if>>矿山工程</option>
										<option value="化工石油工程"
											<c:if test="${model.ftype=='化工石油工程'}"> selected="selected"  </c:if>>化工石油工程</option>
										<option value="水利水电工程"	
											<c:if test="${model.ftype=='水利水电工程'}"> selected="selected"  </c:if>>水利水电工程</option>
										<option value="农林工程"
											<c:if test="${model.ftype=='农林工程'}"> selected="selected"  </c:if>>农林工程</option>
										<option value="铁路工程"
											<c:if test="${model.ftype=='铁路工程'}"> selected="selected"  </c:if>>铁路工程</option>
										<option value="港口与航道工程"
											<c:if test="${model.ftype=='港口与航道工程'}"> selected="selected"  </c:if>>港口与航道工程</option>
										<option value="航天航空工程"
											<c:if test="${model.ftype=='航天航空工程'}"> selected="selected"  </c:if>>航天航空工程</option>
										<option value="通信工程"
											<c:if test="${model.ftype=='通信工程'}"> selected="selected"  </c:if>>通信工程</option>
										<option value="机电安装工程"
											<c:if test="${model.ftype=='机电安装工程'}"> selected="selected"  </c:if>>机电安装工程</option>
											</select>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span5">
										<label class="control-label" for="jyXm-info_fjsdw"><spring:message
												code="jyXm-info.jyXm-info.input.fjsdw" text="建设单位" /></label>
										<div class="controls">
											<input id="jyXm-info_fjsdw" type="text" name="fjsdw"
												value="${model.fjsdw}" size="" class="text" minlength=""
												maxlength="">
										</div>
									</div>
									<div class="span5">
										<label class="control-label" for="jyXm-info_fzbdldw"><spring:message
												code="jyXm-info.jyXm-info.input.fzbdldw" text="招标代理" /></label>
										<div class="controls">
											<input id="jyXm-info_fzbdldw" type="text" name="fzbdldw"
												value="${model.fzbdldw}" size="" class="text" minlength=""
												maxlength="">
										</div>
									</div>
								</div>
								
								<div class="row-fluid">
									<div class="span5">
										<label class="control-label" for="jyXm-info_fjsdw"><spring:message
												code="jyXm-info.jyXm-info.input.fjsdw" text="报名时间" /></label>
										<div class="controls">
										<div class="input-append datepicker date" style="padding-left: 0px;">
												<input id="jyXm-info_fbmksdate" type="text" name="fbmksdate" value="" size="40" class="text " style="background-color:white;cursor:default; width: 100px;">
												<span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
											</div>至
											<div class="input-append datepicker date" style="padding-left: 0px;floa">
												<input id="jyXm-info_fbmjzdate" type="text" name="fbmjzdate" value="" size="40" class="text " style="background-color:white;cursor:default; width:100px;">
												<span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
											</div>
										</div>
									</div>
									<div class="span5">
										<label class="control-label" for="jyXm-info_fzbdldw"><spring:message
												code="jyXm-info.jyXm-info.input.fzbdldw" text="招标方式" /></label>
										<div class="controls">
											<select class="form-control" id="jyXm-info_fzhaobtype"
												name="fzhaobtype" value="${model.fzhaobtype}" class=" ">
												<option value="公开"
													<c:if test="${model.fzhaobtype=='公开'}"> selected="selected"  </c:if>>公开</option>
												<option value="邀请"
													<c:if test="${model.fzhaobtype=='邀请'}"> selected="selected"  </c:if>>邀请</option>
											</select>
										</div>
									</div>
								</div>

								<div class="row-fluid">
									<div class="span5">
										<label class="control-label" for="jyXm-info_fmemo1"><spring:message
												code="jyXm-info.jyXm-info.input.fmemo1" text="建设单位联系人" /></label>
										<div class="controls">
											<input id="jyXm-info_fmemo1" type="text" name="fmemo1"
												value="${model.fmemo1}" size="" class="text " minlength=""
												maxlength="">
										</div>
									</div>
									<div class="span5">
										<label class="control-label" for="jyXm-info_fmemo2"><spring:message
												code="jyXm-info.jyXm-info.input.fmemo2" text="招标代理单位联系人" /></label>
										<div class="controls">
											<input id="jyXm-info_fmemo2" type="text" name="fmemo2"
												value="${model.fmemo2}" size="" class="text " minlength=""
												maxlength="">
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span5">
										<label class="control-label" for="jyXm-info_fmemo3"><spring:message
												code="jyXm-info.jyXm-info.input.fmemo3" text="建设单位联系电话" /></label>
										<div class="controls">
											<input id="jyXm-info_fmemo3" type="number" name="fmemo3"
												value="${model.fmemo3}" size="" class="number "
												minlength="7" maxlength="13">
										</div>
									</div>
									<div class="span5">
										<label class="control-label" for="jyXm-info_fmemo4"><spring:message
												code="jyXm-info.jyXm-info.input.fmemo4" text="招标代理单位联系电话" /></label>
										<div class="controls">
											<input id="jyXm-info_fmemo4" type="number" name="fmemo4"
												value="${model.fmemo4}" size="" class="number "
												minlength="7" maxlength="13">
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span5">
										<label class="control-label" for="jyXm-info_fcity"><spring:message
												code="jyXm-info.jyXm-info.input.fcity" text="所属城市" /></label>
										<div class="controls">
											<select id="jyXm-info_fprovince" type="text" name="fprovince"
												value="${model.fprovince}" style="width:100px;"></select>省 <select
												id="jyXm-info_fcity" type="text" name="fcity"
												value="${model.fcity}" style="width:100px;"></select>市
										</div>
									</div>
									<div class="span5">
										<label class="control-label" for="jyXm-info_fzzyq"><spring:message
												code="jyXm-info.jyXm-info.input.fzzyq" text="资质要求" /></label>
										<div class="controls">
											<select class="form-control" id="jyXm-info_fzzyq"
												name="fzzyq" value="${model.fzzyq}" class=" ">
												<option value="综合资质"
													<c:if test="${model.fzzyq}=='综合资质'}"> selected="selected"  </c:if>>综合资质</option>
												<option value="甲级资质"
													<c:if test="${model.fzzyq}=='甲级资质'}"> selected="selected"  </c:if>>甲级资质</option>
												<option value="乙级资质"
													<c:if test="${model.fzzyq}=='乙级资质'}"> selected="selected"  </c:if>>乙级资质</option>
												<option value="无要求"
													<c:if test="${model.fzzyq}=='无要求'}"> selected="selected"  </c:if>>无要求</option>
											</select>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span5">
										<label class="control-label" for="jyXm-info_ftze"><spring:message
												code="jyXm-info.jyXm-info.input.ftze" text="投资额（万元）" /></label>
										<div class="controls">
											<input id="jyXm-info_ftze" type="text" name="ftze"
												value="${model.ftze}" size="" class="number   " minlength=""
												maxlength="">
										</div>
									</div>
									<div class="span5">
										<label class="control-label" for="jyXm-info_fscale"><spring:message
												code="jyXm-info.jyXm-info.input.fscale" text="项目规模" /></label>
										<div class="controls">
											<input id="jyXm-info_fscale" type="text" name="fscale"
												value="${model.fscale}" size="" class="text " minlength=""
												maxlength="">
										</div>
									</div>
								</div>

								<div class="row-fluid">
									<div class="span5">
										<label class="control-label" for="jyXm-info_fxmgk"><spring:message
												code="jyXm-info.jyXm-info.input.fxmgk" text="项目概况" /></label>
										<div class="controls">
											<textarea id="jyXm-info_fxmgk" type="text" name="fxmgk"
												 size="" class="text " rows="2"
												minlength="" maxlength="">${model.fxmgk}</textarea>
										</div>
									</div>


									<div class="span5">
										<label class="control-label" for="jyXm-info_fzbggurl"><spring:message
												code="jyXm-info.jyXm-info.input.fzbggurl" text="招标公告链接" /></label>
										<div class="controls">
											<input id="jyXm-info_fzbggurl" type="text" name="fzbggurl"
												value="${model.fzbggurl}" size="" class="text " minlength=""
												maxlength="">
										</div>
									</div>
								</div>

							</div>
						</article>
						
						<article class="m-widget">
							<header class="header">
								<h4 class="title">
									<p>信息分析</p>
								</h4>
								<div class="ctrl">
									<a class="btn"><i id="jyXm-zbxxdj-infoFormIcon"
										class="icon-chevron-up"></i></a>
								</div>
							</header>
							<div class="content content-inner" style="padding-bottom:20px;">
								<div class="row-fluid">
									<div class="span5">
										<label class="control-label" for="jyXm-info_fshenpiren"><spring:message
												code="jyXm-info.jyXm-info.input.fshenpiren" text="审批人" /></label>
										<div class="controls">
										
											<div class="input-append ryPicker">
												<input id="jyXm-info_fshenpiren" type="hidden"
													name="fshenpiren" value="${model.fshenpiren}"> <input
													id="jyXm-info_fshenpiren" type="text"
													value="${ryMap[model.fshenpiren].fname}" disabled class=" "
													 value=""> <span class="add-on"
													style="padding-top: 2px; padding-bottom: 2px;"><i
													class="icon-user"></i></span>
											</div>
										</div>
									</div>
									<div class="span5">
										<label class="control-label" for="jyXm-info_fshenpiresult"><spring:message
												code="jyXm-info.jyXm-info.input.fshenpiresult" text="审批结果" /></label>
										<div class="controls">
											<select class="form-control" id="jyXm-info_fshenpiresult"
												name="fshenpiresult" value="${model.fshenpiresult}" class=" required">
												<option value="报名"
													<c:if test="${model.fshenpiresult=='报名'}"> selected="selected" </c:if>>报名</option>
												<option value="不报名"
													<c:if test="${model.fshenpiresult=='不报名'}"> selected="selected"  </c:if>>不报名</option>
											</select>
										</div>
									</div>
								</div>
								
								<div class="row-fluid">
										<label class="control-label" for="jyXm-info_fshenpimemo"><spring:message
												code="jyXm-info.jyXm-info.input.fshenpimemo" text="审批备注" /></label>
										<div class="controls">
											<textarea id="jyXm-info_fshenpimemo" rows="4" type="text" name="fshenpimemo">${model.fshenpimemo}</textarea>
										</div>
								</div>
								
							</div>
						</article>
						

			</form>
		</section>
		<!-- end of main -->
	</div>

</body>

</html>
