<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "sckf-home");
%>
<%
	pageContext.setAttribute("currentMenu", "sckf-workspace");
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

	window.onload = function() {
		pc_init();
		setProvCity("${model.fprovince}", "${model.fcity}");
	};

	var uploadInput="";

	$(function() {
		$("#jyXm-infoForm")
				.validate(
						{submitHandler : function(form) {
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
		choseDiv();
	});

	$(document).ready(function () {
		$("#Btn_Toproject").click(function () {
			$('#documentForm').submitForm({
				url: "${scopePrefix}/sckf/jyXmJy-info-savefb.do?xmid=${model.fid}",
				contentType: 'application/x-www-form-urlencoded; charset=utf-8',
				type:'POST',
				dataType:'json',
				async: false,
//				data:{
//					fname:$('#jyXm-info_fname').val(),          // 项目名称
//					fjsdw:$('#jyXm-info_fjsdw').val(), 		    // 业主单位
//					ffuzeren:$('#ryBxRecord-info_userName_text').val(), //总监
//					ftze: $('#jyXm-info_ftze').val(), // 投资额
//					fscale: $('#jyXm-info_fscale').val(), //规模
//					faddress: $('#jyXm-info_fprovince').val()+$('#jyXm-info_fcity').val(),//地址
//					fyijiaostatus:$('#jyXmYj-info_fyijiaostatus').val(), // 移交状态
//				},
//				callback: function (data) {
//					endFileUpload();
//					data = eval("(" + data + ")");
//					alert(data.Content);
//					if (data.Result > 0) {
//						location.href = data.Redirect;
//					}
//				},
//				before: function () {
//					startFileUpload();
//					var errMsg = "";
//				}
			}).submit();
		});
	});

	function showUploadDiv(inputName){
		uploadInput=inputName;
		showUpload();
	}
	

	function choseDiv(){
		if("${state}"){
			$('.icon-chevron-up').addClass("icon-chevron-down");
			$('.icon-chevron-down').removeClass("icon-chevron-up");
			$('article .content-inner').hide();
			$('#'+"${state}").show();
		}
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
	
	function urlChange(a){
		$('#openUrl').href=a.value;
	}
	
	function changeFuzeren(){
		$('#ryBxRecord-info_ffuzeren_text').val($('#jyXm-info_ffuzeren_text').val());
	}
	
	function changeZj(){
		$('#ryBxRecord-info_userName_text').val($('#ryBxRecord-info_userName').val());
	}
	
	function changeZzr(){
		$('#ryBxRecord-info_fbszzren').val($('#ryBxRecord-info_fbszzren_text').val());
	}
	
	function changeffuzerentel(){
		$('#fzhubanrentel').html($('#jyXm-info_ffuzerentel').val());
	}



	function xmyj(){
			document.forms[1].action="jyXmYj-info-input.do";
			document.forms[1].submit();
		}

	function GET_XMinfo(){
		$.ajax({
			url : '${scopePrefix}/sckf/jyXmJy-info-savefb.do?xmid=${model.fid}',
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			type:'POST',
			dataType:'json',
			async: false,
			data:{
				fname:$('#jyXm-info_fname').val(),          // 项目名称
				fjsdw:$('#jyXm-info_fjsdw').val(), 		    // 业主单位
				ffuzeren:$('#ryBxRecord-info_userName_text').val(), //总监
				ftze: $('#jyXm-info_ftze').val(), // 投资额
				fscale: $('#jyXm-info_fscale').val(), //规模
				faddress: $('#jyXm-info_fprovince').val()+$('#jyXm-info_fcity').val(),//地址
				fyijiaostatus:$('#jyXmYj-info_fyijiaostatus').val(), // 移交状态
			},
			success : function(data) {
				alert("数据传递成功！");
				//var a=eval("["+data+"]");
				getFbdata();
				//window.location.href="jyXmFb-info-input.do";
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {

				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			}
		});
	}

	function getXMinfo()
	{
		var value=$("#jyXm-info_id").val();
		if(value!=""){
			window.location.href="jyXmYj-info-input.do?xmid="+$('#jyXm-info_id').val()+"&name="+$('#jyXm-info_fname').val();
		}
		else{
			window.location.href="jyXmYj-info-input.do?xmid="+"&name="+$('#jyXm-info_fname').val();
		}
	}
	function getFbdata()
	{
		var value=$("#jyXm-infoForm").val();
		if(value!=""){
			window.location.href="jyXmFb-info-input.do?xmid="+$('#jyXm-info_id').val()+"&name="+$('#jyXm-info_fname').val();
		}
		else{
			window.location.href="jyXmFb-info-input.do?xmid="+"&name="+$('#jyXm-info_fname').val();
		}
	}

	function fbjl(){
		GET_FBinfo();

	}




	function GET_FBinfo(){
		$.ajax({
			url : '${scopePrefix}/sckf/jyXmFb-info-savefb.do?xmid=${model.fid}',
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			type:'POST',
			dataType:'json',
			async: false,
			data:{
				fname:$('#jyXm-info_fname').val(),
				fkbdate:$('#jyXm-info_fkbdate').val(),
				ffuzeren:$('#jyXm-info_ffuzeren_text').val(),
				//$('jyXm-info_ffuzeren_text').val(),
			},
			success : function(data) {
				alert("数据传递成功！");
				//var a=eval("["+data+"]");
				getFbdata();
				//window.location.href="jyXmFb-info-input.do";
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {

				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
			}
		});
	}



	function FBstatus_btn(val) {
		if (val == "是") {
			var Btn_toProject=document.getElementById("Btn_Toproject");
			var Btn_toFeibiao=document.getElementById("Btn_toFeibiao_name");
			Btn_toProject.style.visibility='hidden';
			Btn_toFeibiao.style.visibility='visible';

		}
		else{
			var Btn_toProject=document.getElementById("Btn_Toproject");
			var Btn_toFeibiao=document.getElementById("Btn_toFeibiao_name");
			Btn_toProject.style.visibility='visible';
			Btn_toFeibiao.style.visibility='hidden';
		}
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
	<%@include file="../comm/comm-upload.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span12">


			<form id="jyXm-infoForm" method="post" action="jyXm-info-save.do"
				class="form-horizontal">
				<c:if test="${model != null}">
					<input id="jyXm-info_id" type="hidden" name="fid"
						value="${model.fid}">
				</c:if>
				<div class="container-fluid">
					<ul class="breadcrumb" style="width: 98%">
					<!-- 	<li><a href="sckf-home.do">市场开发</a> <span class="divider">/</span>
						</li>
						<li><a href="jyXm-info-list.do">项目投标</a><span class="divider">/</span></li>
						<li class="active">项目信息</li> -->
						<li style="float: right;">
							<button type="submit" class="btn btn-primary a-submit btn-small" style="margin-top:-3px;">
								<spring:message code='core.input.save' text='保存' />
							</button>
							<button type="button" class="btn a-cancel  btn-small"  style="margin-top:-3px;"
								onclick="history.back();">
								<spring:message code='core.input.back' text='返回' />
							</button>
						</li>
					</ul>
				</div>


				<div class="content content-inner" style="padding-left:20px;">
					<div class="span3 well" >
						<div class="row-fluid">
							<div class="span12">
								<div class="progress progress-striped active progress-info"
									id="schedule">
									<div id="schedule-bar" class="bar" aria-valuemin="0"
										aria-valuemax="100"
										<c:if test="${model.fstate=='信息登记'}"> style="width:10%"  </c:if>
										<c:if test="${model.fstate=='报名登记'}"> style="width:20%"  </c:if>
										<c:if test="${model.fstate=='资格预审及备案'}"> style="width:30%"  </c:if>
										<c:if test="${model.fstate=='招标文件登记'}"> style="width:40%"  </c:if>
										<c:if test="${model.fstate=='投标文件登记'}"> style="width:60%"  </c:if>
										<c:if test="${model.fstate=='开标登记'}"> style="width:80%"  </c:if>
										<c:if test="${model.fstate=='转换成项目'}"> style="width:100%"  </c:if>
										></div>
								</div>
							</div>
						<div class="span12" style="clear:both">
								<select class="form-control" id="jyXm-info_fstate" name="fstate"
									value="${model.fstate}" class=" required" style="width: 100px">
									<option value="信息登记"
										<c:if test="${model.fstate=='信息登记'}"> selected="selected"  </c:if>
										onclick="javascript:scheduleChange('10%','信息登记')">信息登记</option>
									<option value="报名登记"
										<c:if test="${model.fstate=='报名登记'}"> selected="selected"  </c:if>
										onclick="javascript:scheduleChange('20%','报名登记')">报名登记</option>
									<option value="资格预审及备案"
										<c:if test="${model.fstate=='资格预审及备案'}"> selected="selected"  </c:if>
										onclick="javascript:scheduleChange('30%','资格预审及备案')">资格预审及备案</option>
									<option value="招标文件登记"
										<c:if test="${model.fstate=='招标文件登记'}"> selected="selected"  </c:if>
										onclick="javascript:scheduleChange('40%','招标文件登记')">招标文件登记</option>
									<option value="投标文件登记"
										<c:if test="${model.fstate=='投标文件登记'}"> selected="selected"  </c:if>
										onclick="javascript:scheduleChange('60%','投标文件登记')">投标文件登记</option>
									<option value="开标登记"
										<c:if test="${model.fstate=='开标登记'}"> selected="selected"  </c:if>
										onclick="javascript:scheduleChange('80%','开标登记')">开标登记</option>
									<option value="转换成项目"
										<c:if test="${model.fstate=='转换成项目'}"> selected="selected"  </c:if>
										onclick="javascript:scheduleChange('100%','转换成项目')">转换成项目</option>
								</select>
							</div> 
						</div>

					 	<span class="label label-warning" style="margin-top:50px;">投标时间轴:</span>
						<table height=200px;>
							<tr>
								<td valign=top>
									 <div class="row-fluid">
										<label class="control-label" for="jyXm-info_fbmksdate"><spring:message
												code="jyXm-info.jyXm-info.input.fbmksdate" text="报名开始时间" /></label>
										<div class="controls">
											<div class="input-append datepicker date"
												style="padding-left: 0px;">
												<input id="jyXm-info_fbmksdate" type="text" name="fbmksdate"
													value="${model.fbmksdate}" size="40" class="text "
													style="background-color:white;cursor:default; width: 100px;">
												<span class="add-on"
													style="padding-top: 2px; padding-bottom: 2px;"><i
													class="icon-calendar"></i></span>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<label class="control-label" for="jyXm-info_fbmjzdate"><spring:message
												code="jyXm-info.jyXm-info.input.fbmjzdate" text="报名截止时间" /></label>
										<div class="controls">
											<div class="input-append datepicker date"
												style="padding-left: 0px;">
												<input id="jyXm-info_fbmjzdate" type="text" name="fbmjzdate"
													value="${model.fbmjzdate}" size="40" class="text "
													style="background-color:white;cursor:default; width: 100px;">
												<span class="add-on"
													style="padding-top: 2px; padding-bottom: 2px;"><i
													class="icon-calendar"></i></span>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<label class="control-label" for="jyXm-info_fgmzbwjdate"><spring:message
												code="jyXm-info.jyXm-info.input.fgmzbwjdate" text="购买招标文件" /></label>
										<div class="controls">
											<div class="input-append datepicker date"
												style="padding-left: 0px;">
												<input id="jyXm-info_fgmzbwjdate" type="text"
													name="fgmzbwjdate" value="${model.fgmzbwjdate}" size="40"
													class="text "
													style="background-color:white;cursor:default; width: 100px;">
												<span class="add-on"
													style="padding-top: 2px; padding-bottom: 2px;"><i
													class="icon-calendar"></i></span>
											</div>
										</div>
									</div>
									 <div class="row-fluid">
										<label class="control-label" for="jyXm-info_fbzjjnjzdate"><spring:message
												code="jyXm-info.jyXm-info.input.fbzjjnjzdate" text="保证金截至时间" /></label>
										<div class="controls">
											<div class="input-append datepicker date"
												style="padding-left: 0px;">
												<input id="jyXm-info_fbzjjnjzdate" type="text"
													name="fbzjjnjzdate" value="${model.fbzjjnjzdate}" size="40"
													class="text "
													style="background-color:white;cursor:default; width: 100px;">
												<span class="add-on"
													style="padding-top: 2px; padding-bottom: 2px;"><i
													class="icon-calendar"></i></span>
											</div>
										</div>
									</div>
									<div class="row-fluid">
										<label class="control-label" for="jyXm-info_fkbdate"><spring:message
												code="jyXm-info.jyXm-info.input.fkbdate" text="开标时间" /></label>
										<div class="controls">
											<div class="input-append datetimepicker date"
												style="padding-left: 0px;">
												<input id="jyXm-info_fkbdate" type="text" name="fkbdate"
													value="${model.fkbdate}" size="40" class="text "
													style="background-color:white;cursor:default; width: 100px;">

												<fmt:formatDate value="${item.deploymentTime}" pattern="yyyy-MM-dd HH:mm:ss"/>

												<span class="add-on"
													style="padding-top: 2px; padding-bottom: 2px;"><i
													class="icon-calendar time"></i></span>
											</div>
										</div>
									</div>


									<fmt:formatDate value="${item.deploymentTime}" pattern="yyyy-MM-dd HH:mm:ss"/>


									<div class="row-fluid">
										<label class="control-label" for="jyXm-info_fzblqdate"><spring:message
												code="jyXm-info.jyXm-info.input.fzblqdate" text="领取中标通知书" /></label>
										<div class="controls">
											<div class="input-append datepicker date"
												style="padding-left: 0px;">
												<input id="jyXm-info_fzblqdate" type="text" name="fzblqdate"
													value="${model.fzblqdate}" size="40" class="text "
													style="background-color:white;cursor:default; width: 100px;">
												<span class="add-on"
													style="padding-top: 2px; padding-bottom: 2px;"><i
													class="icon-calendar"></i></span>
											</div>
										</div>
									</div> 
								</td>
						</table> 
					 	<span class="label  label-warning"  style="margin-top:50px;">相关人员:</span>
						<div class="row-fluid">
							<label class="control-label" for="jyXm-info_ffuzeren"><spring:message
									code="jyXm-info.jyXm-info.input.ffuzeren" text="主办人" /></label>
							<div class="controls">
									<input
										id="jyXm-info_ffuzeren" type="text"
										value="${model.ffuzeren}" disabled class=" "
										style="width: 100px;" > <span id="fzhubanrentel"></span>
							</div>
						</div>
						<div class="row-fluid">
							<label class="control-label" for="jyXm-info_fzj"><spring:message
									code="jyXm-info.jyXm-info.input.fzj" text="总监" /></label>
							<div class="controls">
									 <input
										id="ryBxRecord-info_userName_text" type="text"
										value="${ryMap[model.fzj].fname}" disabled class=" "
										style="width: 100px;" > 
							</div>
						</div>
						<div class="row-fluid">
							<label class="control-label" for="jyXm-info_fweituoren"><spring:message
									code="jyXm-info.jyXm-info.input.fweituoren" text="开标委托人" /></label>
							<div class="controls">
								<div class="input-append ryPicker">
									<input id="ryBxRecord-info_fweituoren" type="hidden" name="fweituoren"
										value="${model.fweituoren}"> <input
										id="ryBxRecord-info_fweituoren" type="text"
										value="${ryMap[model.fweituoren].fname}" disabled class=" "
										style="width: 100px;" > <span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-user"></i></span>
								</div>
							</div>
						</div>
						<div class="row-fluid">
							<label class="control-label" for="jyXm-info_fbszzren"><spring:message
									code="jyXm-info.jyXm-info.input.fbszzren" text="标书制作人" /></label>
							<div class="controls">
									<input
										id="ryBxRecord-info_fbszzren" type="text"
										value="${ryMap[model.fbszzren].fname}" disabled class=" "
										style="width: 100px;" > 
							</div>
						</div>
						<span class="label  label-warning"  style="margin-top:50px;">特殊提醒:</span>
						<div class="row-fluid" style="padding-bottom:10px; padding-top:10px;">
							<input  type="hidden" name="fzjdc" value="${model.fzjdc}" id="fzjdc"  />
							<button id="jyXm-info_fzjdc" <c:if test="${model.fzjdc=='1'}"> class="btn btn-block btn-primary" </c:if> 
							<c:if test="${model.fzjdc!='1'}"> class="btn btn-block" </c:if> type="button"
								forHidden="fzjdc" onclick="javascript:specialButtonClick(event)">总监到场</button>
						</div>
						<div class="row-fluid" style="padding-bottom:10px">
						<input  type="hidden" name="ffrdc" value="${model.ffrdc}" id="ffrdc"/>
							<button id="jyXm-info_ffrdc" <c:if test="${model.ffrdc=='1'}"> class="btn btn-block btn-primary" </c:if> 
							<c:if test="${model.ffrdc!='1'}"> class="btn btn-block" </c:if> type="button"
								forHidden="ffrdc" onclick="javascript:specialButtonClick(event)">法人到场</button>
						</div>
						<div class="row-fluid" style="padding-bottom:10px">
						<input  type="hidden" name="fisdaban" value="${model.fisdaban}" id="fisdaban"/>
							<button id="jyXm-info_fisdaban" forHidden="fisdaban"
								<c:if test="${model.fisdaban=='1'}"> class="btn btn-block btn-primary" </c:if> 
							<c:if test="${model.fisdaban!='1'}"> class="btn btn-block" </c:if> type="button"
								onclick="javascript:specialButtonClick(event)">大办项目</button>
						</div>
					</div> 
					<!-- ----------------------------------------------------------------------左右分割---------------------------------------------------------------------------------- -->
			<div class="span9">
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
											<input id="jyXm-info_fmemo3" type="text" name="fmemo3"
												value="${model.fmemo3}" size="" class="text "
												minlength="7" maxlength="13">
										</div>
									</div>
									<div class="span5">
										<label class="control-label" for="jyXm-info_fmemo4"><spring:message
												code="jyXm-info.jyXm-info.input.fmemo4" text="招标代理单位联系电话" /></label>
										<div class="controls">
											<input id="jyXm-info_fmemo4" type="text" name="fmemo4"
												value="${model.fmemo4}" size="" class="text "
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
													<c:if test="${model.fzzyq=='综合资质'}"> selected="selected"  </c:if>>综合资质</option>
												<option value="甲级资质"
													<c:if test="${model.fzzyq=='甲级资质'}"> selected="selected"  </c:if>>甲级资质</option>
												<option value="乙级资质"
													<c:if test="${model.fzzyq=='乙级资质'}"> selected="selected"  </c:if>>乙级资质</option>
												<option value="无要求"
													<c:if test="${model.fzzyq=='无要求'}"> selected="selected"  </c:if>>无要求</option>
											</select>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span5">
										<label class="control-label" for="jyXm-info_ftze"><spring:message
												code="jyXm-info.jyXm-info.input.ftze" text="投资额（万元）" /></label>
										<div class="controls">
											<input id="jyXm-info_ftze" type="number" name="ftze"
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
												maxlength="" readonly>
										</div>
									</div>
								</div>

								<div class="row-fluid">
									<div class="span5">
										<label class="control-label" for="jyXm-info_fxmgk"><spring:message
												code="jyXm-info.jyXm-info.input.fxmgk" text="项目概况" /></label>
										<div class="controls">
											<textarea id="jyXm-info_fxmgk" type="text" name="fxmgk"
												 size="" class="text " rows="3"
												minlength="" maxlength="">${model.fxmgk}</textarea>
										</div>
									</div>


									<div class="span5">
										<label class="control-label" for="jyXm-info_fzbggurl"><spring:message
												code="jyXm-info.jyXm-info.input.fzbggurl" text="招标公告链接" /></label>
										<div class="controls">
											<input id="jyXm-info_fzbggurl" type="text" name="fzbggurl"
												value="${model.fzbggurl}" size="" class="text " minlength=""
												maxlength="" onchange="urlChange(this)"><a id="openUrl"  href="${model.fzbggurl}" target="_blank">打开网页</a>
										</div>
									</div>
								</div>

							</div>
						</article>
						
						
					
						
						<article class="m-widget">
							<header class="header">
								<h4 class="title">
									<p>报名资料</p>
								</h4>
								<div class="ctrl">
									<a class="btn"><i id="jyXm-jyXm-infoFormIcon"
										class="icon-chevron-up"></i></a>
								</div>
							</header>
							<div class="content content-inner">
								<div class="row-fluid">
									<div class="control-group">
										<div class="span5">
										<label class="control-label" for="jlShizhong-info_fwarn"><spring:message
												code="jlShizhong-info.jlShizhong-info.input.fwarn"
												text="报名时间" /></label>
										<div class="controls">
											 <div class="input-append datepicker date"
												style="padding-left: 0px;">
												<input id="jyXm-info_fbmdate" type="text" name="fbmdate"
													value="${model.fbmdate}" size="40" class="text "
													style="background-color:white;cursor:default; width: 100px;">
												<span class="add-on"
													style="padding-top: 2px; padding-bottom: 2px;"><i
													class="icon-calendar time"></i></span>
											</div> 
										</div>
										</div>
										<div class="span5">
										<label class="control-label" for="jlShizhong-info_fwarn"><spring:message
												code="jlShizhong-info.jlShizhong-info.input.fwarn"
												text="投标报名人员" /></label>
										<div class="controls">
												<textarea rows="2" name="fbmry" cols="20">${model.fbmry}</textarea>
		
										</div>
									</div>
									</div>
									
									<div class="control-group">
										<div class="span5">
										<label class="control-label" for="jlShizhong-info_ffuzeren"><spring:message
												code="jlShizhong-info.jlShizhong-info.input.ffuzeren"
												text="主办人" /></label>
										<div class="controls">
												<input id="jyXm-info_ffuzeren_text" type="text" name="ffuzeren"
													value="${model.ffuzeren}" size="40" class="text " onchange="changeFuzeren()"
													style="background-color:white;cursor:default; width: 100px;">
										</div>
										</div>
										<div class="span5">
										<label class="control-label" for="jlShizhong-info_fwarn"><spring:message
												code="jlShizhong-info.jlShizhong-info.input.fwarn"
												text="联系方式" /></label>
										<div class="controls">
												<input id="jyXm-info_ffuzerentel" type="text" name="ffuzerentel"
													value="${model.ffuzerentel}" onchange="changeffuzerentel()" class="text "
													style="background-color:white;cursor:default; ">
		
										</div>
									</div>
									</div>
									
									<div class="control-group">
										<div class="span5">
										<label class="control-label" for="jlShizhong-info_ffuzeren"><spring:message
												code="jlShizhong-info.jlShizhong-info.input.ffuzeren"
												text="投标总监" /></label>
										<div class="controls">
											<div class="input-append ryPicker">
												<input id="ryBxRecord-info_fzj" type="hidden" name="fzj" onchange="changeZj()" value="${model.fzj}"> <input id="ryBxRecord-info_userName" type="text" value="${ryMap[model.fzj].fname}" disabled="" class=" " style="width: 100px;">
												 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-user"></i></span>
											</div>
										</div>
										</div>
									<%-- 	<div class="span5">
										<label class="control-label" for="jlShizhong-info_fwarn"><spring:message
												code="jlShizhong-info.jlShizhong-info.input.fwarn"
												text="联系方式" /></label>
										<div class="controls">
												<input id="jyXm-info_ffuzeren" type="text" name="fzjtel"
													value="${model.fzjtel}"  class="text "
													style="background-color:white;cursor:default;">
		
										</div>
									</div> --%>
									</div>
									
									<div class="control-group">
									
									 <div class="span5">
										<label class="control-label" for="jyXm-info_fbmzlname"><spring:message
												code="jyXm-info.jyXm-info.input.fbmzlname" text="报名资料准备人员" /></label>
										<div class="controls">
												<div class="input-append ryPicker">
													<input id="ryBxRecord-info_fbmzlzbr" type="hidden"
														name="fbmzlzbr" value="${model.fbmzlzbr}"> <input
														id="ryBxRecord-info_fbmzlzbr" type="text"
														value="${ryMap[model.fbmzlzbr].fname}" disabled class=" "
														style="width: 100px;" > <span class="add-on"
														style="padding-top: 2px; padding-bottom: 2px;"><i
														class="icon-user"></i></span>
												</div> 
										</div>
									</div>
									 <div class="span5">
										<label class="control-label" for="jyXm-info_fbmzlname"><spring:message
												code="jyXm-info.jyXm-info.input.fbmzlname" text="备注" /></label>
										<div class="controls">
											<textarea rows="2" name="fbmmemo" cols="20">${model.fbmmemo}</textarea>
										</div>
									</div>
									
									</div>
									
									<div class="control-group">
										<div class="span5">
										<label class="control-label" for="jlShizhong-info_fwarn"><spring:message
												code="jlShizhong-info.jlShizhong-info.input.fwarn"
												text="报名资料" /></label>
										<div class="controls">
											<input type="button" class="btn a-link" value="点击上传"
												onclick="showUploadDiv('fbmzl')">
										</div>
										</div>
										 <div class="span5">
											<label class="control-label" for="jyXm-info_fbmzlname"><spring:message
													code="jyXm-info.jyXm-info.input.fbmzlname" text="报名资料" /></label>
											<div class="controls">
												<input id="jyXm-info_fbmzlname" type="text" name="fbmzlname"
													value="${model.fbmzlname}" size="" class="text" 
													minlength="" maxlength="">
													<input id="jyXm-info_fbmzlurl" type="hidden" name="fbmzlurl"
													value="${model.fbmzlurl}" size="" class="text "
													minlength="" maxlength="">
												<a id="jyXm-info_fbmzlDown"  class="btn"  href="${model.fbmzlurl}"
																	target="_blank">下载</a>
											</div>
										</div>
									</div>
									
									<div class="control-group">
										<div class="span5">
										<label class="control-label" for="jyXm-info_fshuxing"><spring:message
												code="jyXm-info.jyXm-info.input.fshuxing" text="属性" /></label>
										<div class="controls">
											<input id="jyXm-info_fshuxing" type="text" name="fshuxing"
												value="${model.fshuxing}" size="" class="  "
												minlength="" maxlength="">
										</div>
									</div>
									</div>
								</div>
							</div>
						</article>
						<article class="m-widget">
							<header class="header">
								<h4 class="title">
									<p>资格预审与备案</p>
								</h4>
								<div class="ctrl">
									<a class="btn"><i id="jyXm-infoFormIcon"
										class="icon-chevron-up"></i></a>
								</div>
							</header>
							<div class="content content-inner">
								<div class="row-fluid">
									<div class="span5">
										<label class="control-label" for="jyXm-info_fzgysstatus"><spring:message
												code="jyXm-info.jyXm-info.input.fzgysstatus" text="资格预审状态" /></label>
										<div class="controls">
											<select class="form-control" id="jyXm-info_fzgysstatus"
												name="fzgysstatus" value="${model.fzgysstatus}" class=" ">
												<option value=""></option>
												<option value="无需预审"
													<c:if test="${model.fzgysstatus=='无需预审'}"> selected="selected"  </c:if>>无需资审</option>
												<option value="未预审"
													<c:if test="${model.fzgysstatus=='未预审'}"> selected="selected"  </c:if>>通过资审</option>
												<option value="已预审"
													<c:if test="${model.fzgysstatus=='已预审'}"> selected="selected"  </c:if>>未通过资审</option>
											</select>
										</div>
									</div>
									<div class="span5">
										<label class="control-label" for="jyXm-info_fbeianstatus"><spring:message
												code="jyXm-info.jyXm-info.input.fbeianstatus" text="备案状态" /></label>
										<div class="controls">
											<select class="form-control" id="jyXm-info_fbeianstatus"
												name="fbeianstatus" value="${model.fbeianstatus}" class=" ">
													<option value=""></option>
												<option value="无需备案"
													<c:if test="${model.fbeianstatus=='无需备案'}"> selected="selected"  </c:if>>无需备案</option>
												<option value="未备案"
													<c:if test="${model.fbeianstatus=='未备案'}"> selected="selected"  </c:if>>未备案</option>
												<option value="已备案"
													<c:if test="${model.fbeianstatus=='已备案'}"> selected="selected"  </c:if>>已备案</option>
											</select>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span5">
										<label class="control-label" for="jyXm-info_fzgysdate"><spring:message
												code="jyXm-info.jyXm-info.input.fzgysdate" text="资格预审时间" /></label>
										<div class="controls">
											<div class="input-append datepicker date"
												style="padding-left: 0px;">
												<input id="jyXmRecord-info_fzgysdate" type="text"
													name="fzgysdate" value="${model.fzgysdate}" size="40"
													class="text "
													style="background-color:white;cursor:default; width: 175px;">
												<span class="add-on"
													style="padding-top: 2px; padding-bottom: 2px;"><i
													class="icon-calendar"></i></span>
											</div>
										</div>
									</div>
									<div class="span5">
										<label class="control-label" for="jyXm-info_fbeiandate"><spring:message
												code="jyXm-info.jyXm-info.input.fbeiandate" text="备案时间" /></label>
										<div class="controls">
											<div class="input-append datepicker date"
												style="padding-left: 0px;">
												<input id="jyXm-info_fbeiandate" type="text"
													name="fbeiandate" value="${model.fbeiandate}" size="40"
													class="text "
													style="background-color:white;cursor:default; width: 175px;">
												<span class="add-on"
													style="padding-top: 2px; padding-bottom: 2px;"><i
													class="icon-calendar"></i></span>
											</div>
										</div>
									</div>

								</div>
								
									<div class="row-fluid">
									<div class="span5">
										<label class="control-label" for="jyXm-info_fzgysdate"><spring:message
												code="jyXm-info.jyXm-info.input.fzgysdate" text="资审制作人" /></label>
										<div class="controls">
											<div class="input-append ryPicker">
													<input id="ryBxRecord-info_fzgyszbr" type="hidden" onchange="changeZzr()"
														name="fzgyszbr" value="${model.fzgyszbr}"> <input
														id="ryBxRecord-info_fzgyszbr_text" type="text"
														value="${ryMap[model.fzgyszbr].fname}" disabled class=" "
														style="width: 100px;" > <span class="add-on"
														style="padding-top: 2px; padding-bottom: 2px;"><i
														class="icon-user"></i></span>
												</div> 
										</div>
									</div>
									<div class="span5">
										<label class="control-label" for="jyXm-info_fbeiandate"><spring:message
												code="jyXm-info.jyXm-info.input.fbeiandate" text="备案资料准备人" /></label>
										<div class="controls">
											<div class="input-append ryPicker">
													<input id="ryBxRecord-info_fbeianry" type="hidden"
														name="fbeianry" value="${model.fbeianry}"> <input
														id="ryBxRecord-info_fbeianry" type="text"
														value="${ryMap[model.fbeianry].fname}" disabled class=" "
														style="width: 100px;" > <span class="add-on"
														style="padding-top: 2px; padding-bottom: 2px;"><i
														class="icon-user"></i></span>
											</div> 
										</div>
									</div>

								</div>
								<div class="content content-inner" style="border:none;">
									<div class="row-fluid">
										
										<div class="control-group">
											<label class="control-label" for="jlShizhong-info_fwarn"><spring:message
													code="jlShizhong-info.jlShizhong-info.input.fwarn"
													text="备案表" /></label>
											<div class="controls">
												<input type="button" class="btn a-link" value="点击上传"
													onclick="showUploadDiv('fbeian')">
											</div>
										</div>
										
										<div class="control-group">
										<label class="control-label" for="jyXm-info_fbeianname"><spring:message
												code="jyXm-info.jyXm-info.input.fbeianname" text="报名资料" /></label>
										<div class="controls">
											<input id="jyXm-info_fbeianname" type="text" name="fbeianname"
												value="${model.fbeianname}" size="" class="text" 
												minlength="" maxlength="">
												<input id="jyXm-info_fbeianurl" type="hidden" name="fbeianurl"
												value="${model.fbeianurl}" size="" class="text "
												minlength="" maxlength="">
											<a id="jyXm-info_fbeianDown"  class="btn"  href="${model.fbeianurl}"
																target="_blank">下载</a>
										</div>
									</div>
										</div>
										</div>
						</article>
						<article class="m-widget">
							<header class="header">
								<h4 class="title">
									<p>招标文件登记</p>
								</h4>
								<div class="ctrl">
									<a class="btn"><i id="jyXm-infoFormIcon"
										class="icon-chevron-up"></i></a>
								</div>
							</header>

							<div class="content content-inner" style="padding-bottom:20px;">
								<div class="row-fluid">
									<div class="span5">
										<label class="control-label" for="jyXm-info_fzbwjbh"><spring:message
												code="jyXm-info.jyXm-info.input.fzbwjbh" text="招标文件编号" /></label>
										<div class="controls">
											<input id="jyXm-info_fzbwjbh" type="text" name="fzbwjbh"
												value="${model.fzbwjbh}" size="" class="text " minlength=""
												maxlength="">
										</div>
									</div>
									<div class="span5">
										<label class="control-label" for="jyXm-info_fbzjje"><spring:message
												code="jyXm-info.jyXm-info.input.fbzjje" text="保证金金额（元）" /></label>
										<div class="controls">
											<input id="jyXm-info_fbzjje" type="number" name="fbzjje"
												value="${model.fbzjje}" size="" class="number" minlength=""
												maxlength="">
										</div>
									</div>
								</div>

								<div class="row-fluid">

									<div class="span5">
										<label class="control-label" for="jyXm-info_fzbds"><spring:message
												code="jyXm-info.jyXm-info.input.fzbds" text="总标段数" /></label>
										<div class="controls">
											<input id="jyXm-info_fzbds" type="number" name="fzbds"
												value="${model.fzbds}" size="" class="number" minlength=""
												maxlength="">
										</div>
									</div>
									<div class="span5">
										<label class="control-label" for="jyXm-info_fstbd"><spring:message
												code="jyXm-info.jyXm-info.input.fstbd" text="所投标段" /></label>
										<div class="controls">
											<input id="jyXm-info_fstbd" type="text" name="fstbd"
												value="${model.fstbd}" size="" class="text " minlength=""
												maxlength="">
										</div>
									</div>

								</div>

							</div>

						</article>
						
						<article class="m-widget">
							<header class="header">
								<h4 class="title">
									<p>保证金状态</p>
								</h4>
								<div class="ctrl">
									<a class="btn"><i id="jyXm-jyXm-infoFormIcon"
										class="icon-chevron-up"></i></a>
								</div>
							</header>
							<div class="content content-inner">
								<div class="row-fluid">
									<div class="control-group">
									
										<div class="span5">
										<label class="control-label" for="jlShizhong-info_fbzjstatus"><spring:message
												code="jlShizhong-info.jlShizhong-info.input.fbzjstatus"
												text="投标保证金" /></label>
										<div class="controls">
										 	<a href="sckf-cwBzj-info-input.do?type=1&xmid=${model.fid}">投标保证金</a>
										</div>
										</div>
										
										<div class="span5">
										<label class="control-label" for="jlShizhong-info_fbzjstatus"><spring:message
												code="jlShizhong-info.jlShizhong-info.input.fbzjstatus"
												text="保证金缴纳状态" /></label>
										<div class="controls">
										 	<select class="form-control" id="jyXm-info_fbzjstatus"
												name="fbzjstatus" value="${model.fbzjstatus}" class=" ">
												<option value="未缴纳"
													<c:if test="${model.fbzjstatus=='未缴纳'}"> selected="selected"  </c:if>>未缴纳</option>
												<option value="已缴纳"
													<c:if test="${model.fbzjstatus=='已缴纳'}"> selected="selected"  </c:if>>已缴纳</option>
											</select> 
										</div>
										</div>
									</div>
								</div>
							</div>
						</article>
						
						<article class="m-widget">
							<header class="header">
								<h4 class="title">
									<p>投标文件登记</p>
								</h4>
								<div class="ctrl">
									<a class="btn"><i id="jyXm-infoFormIcon_toubiao"
										class="icon-chevron-up"></i></a>
								</div>
							</header>

							<div id="toubiao" class="content content-inner" style="padding-bottom:20px;">
								<div class="row-fluid">
									<%-- <div class="span5">
										<label class="control-label" for="jyXm-info_ftbwjbh"><spring:message
												code="jyXm-info.jyXm-info.input.ftbwjbh" text="投标文件编号" /></label>
										<div class="controls">
											<input id="jyXm-info_ftbwjbh" type="text" name="ftbwjbh"
												value="${model.ftbwjbh}" size="" class="text " minlength=""
												maxlength="">
										</div>
									</div> --%>

									<div class="span5">
										<label class="control-label" for="jyXm-info_fzbfs"><spring:message
												code="jyXm-info.jyXm-info.input.fzbfs" text="投标文件份数" /></label>
										<div class="controls">
											<input id="jyXm-info_fzbfs" type="number" name="fzbfs"
												value="${model.fzbfs}" size="" class="number   " style="width:80px;"
												minlength="" maxlength="">正<input id="jyXm-info_ffbfs" type="number" name="ffbfs" style="width: 80px;"
												value="${model.ffbfs}" size="" class="number   "
												minlength="" maxlength="">副
										</div>
									</div>
									
									<div class="span5">
										<label class="control-label" for="jyXm-info_fdzbfs"><spring:message
												code="jyXm-info.jyXm-info.input.fdzbfs" text="电子版" /></label>
										<div class="controls">
											<select class="form-control" id="jyXm-info_fdzbtype" style="width: 80px;"
												name="fdzbtype" value="${model.fdzbtype}" class=" ">
												<option value="">无</option>
												<option value="U盘"
													<c:if test="${model.fdzbtype=='U盘'}"> selected="selected"  </c:if>>U盘</option>
												<option value="光盘"
													<c:if test="${model.fispass=='光盘'}"> selected="selected"  </c:if>>光盘</option>
											</select>
											<input id="jyXm-info_fdzbfs" type="number" name="fdzbfs"
												value="${model.fdzbfs}" size="" class="number   " style="width:80px;"
												minlength="" maxlength="">份
										</div>
									</div>
									
								</div>


								<div class="row-fluid">
									<div class="span5">
										<label class="control-label" for="jyXm-info_ftbts"><spring:message
												code="jyXm-info.jyXm-info.input.ftbts" text="无行贿" /></label>
										<div class="controls">
											<select class="form-control" id="jyXm-info_ftbwxh"
												name="ftbwxh" value="${model.ftbwxh}" class=" " style="width: 80px;">
												<option value=""></option>
												<option value="有"
													<c:if test="${model.ftbwxh=='有'}"> selected="selected"  </c:if>>有</option>
												<option value="无"
													<c:if test="${model.ftbwxh=='无'}"> selected="selected"  </c:if>>无</option>
											</select>
											放正本:
											<select class="form-control" id="jyXm-info_ftbwxhzb"
												name="ftbwxhzb" value="${model.ftbwxhzb}" class=" " style="width: 80px;">
												<option value=""></option>
												<option value="是"
													<c:if test="${model.ftbwxhzb=='是'}"> selected="selected"  </c:if>>是</option>
												<option value="否"
													<c:if test="${model.ftbwxhzb=='无'}"> selected="selected"  </c:if>>否</option>
											</select>
										</div>
									</div>

									<div class="span5">
										<label class="control-label" for="jyXm-info_ftbgzs"><spring:message
												code="jyXm-info.jyXm-info.input.ftbgzs" text="公证书" /></label>
										<div class="controls">
											<select class="form-control" id="jyXm-info_ftbgzs"
												name="ftbgzs" value="${model.ftbgzs}" class=" " style="width: 80px;">
												<option value=""></option>
												<option value="有"
													<c:if test="${model.ftbgzs=='有'}"> selected="selected"  </c:if>>有</option>
												<option value="无"
													<c:if test="${model.ftbgzs=='无'}"> selected="selected"  </c:if>>无</option>
											</select>
											放正本:
											<select class="form-control" id="jyXm-info_ftbgzszb"
												name="ftbgzszb" value="${model.ftbgzszb}" class=" " style="width: 80px;">
												<option value=""></option>
												<option value="是"
													<c:if test="${model.ftbgzszb=='是'}"> selected="selected"  </c:if>>是</option>
												<option value="否"
													<c:if test="${model.ftbgzszb=='无'}"> selected="selected"  </c:if>>否</option>
											</select>
										</div>
									</div>
								</div>
								
								

								<div class="row-fluid">
									<div class="span5">
										<label class="control-label" for="jyXm-info_ftbts"><spring:message
												code="jyXm-info.jyXm-info.input.ftbts" text="建委证明" /></label>
										<div class="controls">
											<select class="form-control" id="jyXm-info_ftbjwzm"
												name="ftbjwzm" value="${model.ftbjwzm}" class=" " style="width: 80px;">
												<option value=""></option>
												<option value="有"
													<c:if test="${model.ftbjwzm=='有'}"> selected="selected"  </c:if>>有</option>
												<option value="无"
													<c:if test="${model.ftbjwzm=='无'}"> selected="selected"  </c:if>>无</option>
											</select>
											放正本:
											<select class="form-control" id="jyXm-info_ftbjwzmzb"
												name="ftbjwzmzb" value="${model.ftbjwzmzb}" class=" " style="width: 80px;">
												<option value=""></option>
												<option value="是"
													<c:if test="${model.ftbjwzmzb=='是'}"> selected="selected"  </c:if>>是</option>
												<option value="否"
													<c:if test="${model.ftbjwzmzb=='无'}"> selected="selected"  </c:if>>否</option>
											</select>
										</div>
									</div>

									<div class="span5">
										<label class="control-label" for="jyXm-info_ftbbab"><spring:message
												code="jyXm-info.jyXm-info.input.ftbbab" text="备案表" /></label>
										<div class="controls">
											<select class="form-control" id="jyXm-info_ftbbab"
												name="ftbbab" value="${model.ftbbab}" class=" ">
												<option value=""></option>
												<option value="有"
													<c:if test="${model.ftbbab=='有'}"> selected="selected"  </c:if>>有</option>
												<option value="无"
													<c:if test="${model.ftbbab=='无'}"> selected="selected"  </c:if>>无</option>
											</select>
										</div>
									</div>
								</div>
								
								
								<div class="row-fluid">
									<div class="span5">
										<label class="control-label" for="jyXm-info_fpsren"><spring:message
												code="jyXm-info.jyXm-info.input.fpsren" text="评审人" /></label>
										<div class="controls">
											<div class="input-append ryPicker">
												<input id="ryBxRecord-info_fpsren" type="hidden" name="fpsren"
													value="${model.fpsren}"> <input
													id="ryBxRecord-info_fpsren" type="text"
													value="${ryMap[model.fpsren].fname}" disabled class=" "
													style="width: 100px;" > <span class="add-on"
													style="padding-top: 2px; padding-bottom: 2px;"><i
													class="icon-user"></i></span>
											</div>
										</div>
									</div>
									
									<div class="span5">
										<label class="control-label" for="jyXm-info_fispass"><spring:message
												code="jyXm-info.jyXm-info.input.fispass" text="标书制作人" /></label>
										<div class="controls">
											<div class="input-append ryPicker">
												<input id="ryBxRecord-info_fbszzren" type="hidden" name="fbszzren" onchange="changeZzr()"
													value="${model.fbszzren}"> <input
													id="ryBxRecord-info_fbszzren_text" type="text"
													value="${ryMap[model.fbszzren].fname}" disabled class=" "
													style="width: 100px;" > <span class="add-on"
													style="padding-top: 2px; padding-bottom: 2px;"><i
													class="icon-user"></i></span>
											</div>
										</div>
									</div>
								</div>
								
								

								<div class="row-fluid">
									<div class="span5">
										<label class="control-label" for="jyXm-info_fmemo5"><spring:message
												code="jyXm-info.jyXm-info.input.fmemo5" text="评审备注" /></label>
										<div class="controls">
											<textarea id="jyXm-info_fmemo5" name="fmemo5"
												class="form-control" rows="4" class="text  " minlength=""
												maxlength="500">${model.fmemo5}</textarea>
										</div>
									</div>
									
									<div class="span5">
										<label class="control-label" for="jyXm-info_ftbts"><spring:message
												code="jyXm-info.jyXm-info.input.ftbts" text="废标条件" /></label>
										<div class="controls">
											<textarea id="jyXm-info_ffbtj" name="ffbtj"
												class="form-control" rows="4" class="text  " minlength=""
												maxlength="500">${model.ffbtj}</textarea>
										</div>
									</div>
								</div>
								
								<div class="row-fluid ">
										<label class="control-label" for="jyXm-info_ftbtjf"><spring:message
												code="jyXm-info.jyXm-info.input.ftbtjf" text="无法满足的条件" /></label>
										<div class="controls" >
											<textarea id="jyXm-info_ftbtjf" name="ftbtjf"
												class="form-control" rows="4" class="text  " minlength=""
												maxlength="500">${model.ftbtjf}</textarea>
										</div>
								</div>
							</div>

						</article>
						<article class="m-widget">
							<header class="header">
								<h4 class="title">
									<p>开标登记</p>
								</h4>
								<div class="ctrl">
									<a class="btn"><i id="jyxm-infoFormIcon_kaibiao"
										class="icon-chevron-up"></i></a>
								</div>
							</header>
							<div id="kaibiao" class="content content-inner" style="padding-bottom:20px;">
								<div class="row-fluid">
									<div class="span5">
										<label class="control-label" for="jyXm-info_fkbaddress"><spring:message
												code="jyXm-info.jyXm-info.input.fkbaddress" text="开标地点" /></label>
										<div class="controls">
											<input id="jyXm-info_fkbaddress" type="text" name="fkbaddress"
												value="${model.fkbaddress}" size="" class="  "
												minlength="" maxlength="">
										</div>
									</div>
									<div class="span5">
										<label class="control-label" for="jyXm-info_ftbzjsfdc"><spring:message
												code="jyXm-info.jyXm-info.input.ftbzjsfdc" text="投标总监是否到场" /></label>
										<div class="controls">
										<select class="form-control" id="jyXm-info_ftbzjsfdc"
												name="ftbzjsfdc" value="${model.ftbzjsfdc}" class=" " >
												<option value=""></option>
												<option value="是"
													<c:if test="${model.ftbzjsfdc=='是'}"> selected="selected"  </c:if>>是</option>
												<option value="否"
													<c:if test="${model.ftbzjsfdc=='无'}"> selected="selected"  </c:if>>否</option>
										 </select>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span5">
										<label class="control-label" for="jyXm-info_fzbstatus"><spring:message
												code="jyXm-info.jyXm-info.input.fzbstatus" text="是否中标" /></label>
										<div class="controls">

											<select class="form-control" id="jyXm-info_fzbstatus"
												name="fzbstatus" value="${model.fzbstatus}" class=" " >
												<option value=""></option>
												<option value="是"
													<c:if test="${model.fzbstatus=='是'}"> selected="selected"  </c:if>>是</option>
												<option value="否"
													<c:if test="${model.fzbstatus=='无'}"> selected="selected"  </c:if>>否</option>
										 </select>
										 
										
										</div>
									</div>

									<%--<div class="span5">--%>
										<%--<label class="control-label" for="jyXm-info_ftbzjsfdc"><spring:message--%>
												<%--code="jyXm-info.jyXm-info.input.ftbzjsfdc" text="是否废标" /></label>--%>
										<%--<div class="controls">--%>
											<%--<select class="form-control" id="jyXm-info_ffbstatus"--%>
													<%--name="ffbstatus" value="${model.ffbstatus}" class=" "  onclick="FBstatus_btn(value)">--%>
												<%--<option value=""></option>--%>
												<%--<option value="是"--%>
														<%--<c:if test="${model.ffbstatus=='是'}"> selected="selected"  </c:if>>是</option>--%>
												<%--<option value="否"--%>
														<%--<c:if test="${model.ffbstatus=='无'}"> selected="selected"  </c:if>>否</option>--%>

											<%--</select>--%>
										<%--</div>--%>
									<%--</div>--%>



								</div>
								
								
								<div class="row-fluid">
									<div class="span5">
										<label class="control-label" for="jyXm-info_fzbkzj"><spring:message
												code="jyXm-info.jyXm-info.input.fzbkzj" text="招标控制价（万元）" /></label>
										<div class="controls">
											<input id="jyXm-info_fzbkzj" type="number" name="fzbkzj"
												value="${model.fzbkzj}" size="" class="number   "
												minlength="" maxlength="">
										</div>
									</div>
									<div class="span5">
										<label class="control-label" for="jyXm-info_fzbmoney"><spring:message
												code="jyXm-info.jyXm-info.input.fzbmoney" text="中标金额（万元）" /></label>
										<div class="controls">
											<input id="jyXm-info_fzbmoney" type="number" name="fzbmoney"
												value="${model.fzbmoney}" size="" class="number   "
												minlength="" maxlength="">
										</div>
									</div>
								</div>

								<div class="row-fluid">
									<div class="span5">
										<label class="control-label" for="jyXm-info_fzbdanwei"><spring:message
												code="jyXm-info.jyXm-info.input.fzbdanwei" text="中标单位" /></label>
										<div class="controls">
											<input id="jyXm-info_fzbdanwei" type="text" name="fzbdanwei"
												value="${model.fzbdanwei}" size="" class="text "
												minlength="" maxlength="">
										</div>
									</div>
									<div class="span5">
										<label class="control-label" for="jyXm-info_fzblqdate"><spring:message
												code="jyXm-info.jyXm-info.input.fzblqdate" text="中标通知书领取时间" /></label>
										<div class="controls">
											<div class="input-append datepicker date"
												style="padding-left: 0px;">
												<input id="jyXm-info_fzblqdate" type="text" name="fzblqdate"
													value="${model.fzblqdate}" size="40" class="text "
													style="background-color:white;cursor:default; width: 175px;">
												<span class="add-on"
													style="padding-top: 2px; padding-bottom: 2px;"><i
													class="icon-calendar"></i></span>
											</div>
										</div>
									</div>
								</div>

								<div class="row-fluid">
								
										<div class="span5">
										<label class="control-label" for="jyXm-info_fmemo"><spring:message
												code="jyXm-info.jyXm-info.input.fmemo" text="备注" /></label>
										<div class="controls">
											<textarea id="jyXm-info_fmemo" name="fmemo"
												class="form-control" rows="2" 
												class="text  " minlength="" maxlength="500">${model.fmemo}</textarea>
										</div>
									</div>
								
									<div class="span5">
										<label class="control-label" for="jyXm-info_fwzbsy"><spring:message
												code="jyXm-info.jyXm-info.input.fwzbsy" text="未中标事由" /></label>
										<div class="controls">
											<textarea id="jyXm-info_fwzbsy" name="fwzbsy"
												class="form-control" rows="2" class="text  " minlength=""
												maxlength="500">${model.fwzbsy}</textarea>
										</div>
									</div>
								</div>

								<div class="row-fluid" style="padding-top:10px;">
										<div class="span5">
										<label class="control-label" for="jyXm-info_fothers"><spring:message
												code="jyXm-info.jyXm-info.input.fothers" text="各投标单位报价" /></label>
										<div class="controls">
											<textarea id="jyXm-info_fothers" name="fothers"
												class="form-control" rows="4" style="width: 560px" class="text  " minlength=""
												maxlength="">${model.fothers}</textarea>
										</div>
									</div>
								</div>
							</div>
						</article>
						
							
						<article class="m-widget">
							<header class="header">
								<h4 class="title">
									<p>中标通知书记录</p>
								</h4>
								<div class="ctrl">
									<a class="btn"><i id="jyxm-infoFormIcon_tongzhishu"
										class="icon-chevron-up"></i></a>
								</div>
							</header>
							<div id="tongzhishu" class="content content-inner" style="padding-bottom:20px;">
								<div class="row-fluid">
									<div class="span5">
										<label class="control-label" for="jyXm-info_fzbtzslqr"><spring:message
												code="jyXm-info.jyXm-info.input.fzbtzslqr" text="中标通知书领取人" /></label>
										<div class="controls">
											<input id="jyXm-info_fzbtzslqr" type="text" name="fzbtzslqr"
												value="${model.fzbtzslqr}" size="" class="text   "
												minlength="" maxlength="">
										</div>
									</div>
									<div class="span5">
										<label class="control-label" for="jyXm-info_fzbtzsdate"><spring:message
												code="jyXm-info.jyXm-info.input.fzbtzsdate" text="领取时间" /></label>
										<div class="controls">
											<div class="input-append datepicker date"
												style="padding-left: 0px;">
												<input id="jyXm-info_fzbtzsdate" type="text" name="fzbtzsdate"
													value="${model.fzbtzsdate}" size="40" class="text "
													style="background-color:white;cursor:default; width: 175px;">
												<span class="add-on"
													style="padding-top: 2px; padding-bottom: 2px;"><i
													class="icon-calendar"></i></span>
											</div>
										</div>
									</div>
								</div>

								<div class="row-fluid">
									<div class="span5">
										<label class="control-label" for="jyXm-info_fjieshouren"><spring:message
												code="jyXm-info.jyXm-info.input.fjieshouren" text="接收人" /></label>
										<div class="controls">
											<input id="jyXm-info_fjieshouren" type="text" name="fjieshouren"
												value="${model.fjieshouren}" size="" class="text "
												minlength="" maxlength="">
										</div>
									</div>
								</div>
							</div>
						</article>




				<article class="m-widget">
					<header class="header">
						<h4 class="title">
							<p>废标记录</p>
						</h4>
						<div class="ctrl">
							<a class="btn"><i id="jyxm-infoFormIcon_feibiaojilu"
											  class="icon-chevron-up"></i></a>
						</div>
					</header>
					<div id="feibiaoshu" class="content content-inner" style="padding-bottom:20px;">
						<div class="row-fluid">

							<label class="control-label" for="jyXm-info_ftbzjsfdc"><spring:message
									code="jyXm-info.jyXm-info.input.ftbzjsfdc" text="是否废标" /></label>
							<div class="controls">
								<select class="form-control" id="jyXm-info_ffbstatus"
										name="ffbstatus" value="${model.ffbstatus}" class=" " onchange="FBstatus_btn(this.value)" >
									<option value=""></option>
									<option value="是"
											<c:if test="${model.ffbstatus=='是'}"> selected="selected"  </c:if>> 是 </option>
									<option value="否"
											<c:if test="${model.ffbstatus=='无'}"> selected="selected"  </c:if>>否</option>
								</select>
							</div>

						</div>

					</div>
				</article>

				<button  id="Btn_Toproject" name="Btn_toproject_name" class="btn btn-block btn-warning" style="height:50px;  margin-bottom:40px; visibility:visible;" type="button" onclick="xmyj()">转换成项目</button>

				<button  id="Btn_toFeibiao_name"  name="Btn_toFeibiao_name" class="btn btn-block btn-warning" style="height:50px;  margin-bottom:40px; visibility:hidden;" type="button" onclick="fbjl()">生成废标记录</button>

			</div>
				</div>
			</form>
		</section>
		<!-- end of main -->
	</div>
</body>

</html>
