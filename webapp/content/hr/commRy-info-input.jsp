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
<title><spring:message
		code="commRy-info.commRy-info.input.title" text="人员信息 - 员工管理 - 人力资源" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/js/ajaxfileupload.js"></script>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/uploadpicker/uploadpicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/uploadpicker/uploadpicker.js"></script>
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/js/linkage.js"></script>
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/js/jbgzjsq.js"></script>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/yprypicker.js"></script>
<script type="text/javascript">
	
	window.onload = function() {
		pc_init();
		setProvCity("${model.fprovince}", "${model.fcity}");
	};

	$(function() {
		$('#commRy-infoForm')
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

		createuploadPicker({
			modalId : 'uploadPicker',
			filePath : '',
			url : '/xhf/default/comm/comm-uploadFile.do',
			uploadSuccess : function(data) {
				$('#uploadPicker_fileUrlSave').val(data.fileUrl);
				$('#uploadPicker_fileName').val(data.fileName);
				$('#uploadPicker_fileUrl').attr('src', data.fileUrl);
			}
		});

		$('#confirmBtn').click(function() {
			getPic();
		});
		
		createryPicker1({
			modalId : 'ryPicker',
			url : '${scopePrefix}/hr/yprecord-simple-list.do'
		});
	});

	function loadypRy(ryid){
		$.ajax({
			url: 'hr-loadypry-ajax.do',
			data: {
				'fid': ryid,
			},
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			async:false,
			dataType:'json',
			success: function(data) {
				$('#commRy-info_fidno').val(data.fidno);
				$('#commRy-info_fname').val(data.fname);
				$('#commRy-info_fsex').val(data.fsex);
				$('#commRy-info_ftel').val(data.ftel);
				//$('#commRy-info_jobid').val(data.fidno);
				$('#commRy-info_femail').val(data.femail);
				$('#commRy-info_fbirdate').val(data.fbirdate);
				//$('#commRy-info_frzdate').val(data.fidno);
				$('#commRy-info_fminzu').val(data.fminzu);
				$('#commRy-info_fxueli').val(data.fxueli);
				$('#commRy-info_fxueli2').val(data.fxueli2);
				$('#commRy-info_fbyyx').val(data.fbyxuexiao);
				$('#commRy-info_fzhuanye').val(data.fbyzhuanye);
				$('#commRy-info_fbydate').val(data.fbydate);
				$('#commRy-info_faddress').val(data.faddr);
				//$('#commRy-info_fbankcode').val(data.fidno);
				$('#commRy-info_jinji').val(data.fcontact);
				$('#commRy-info_jinjir').val(data.fcontactr);
				$('#commRy-info_jinjitel').val(data.fcontacttel);
						
			}
		}); 
	}
	
	function getPic() {
		var url = "";
		$.each($('.files').children(), function(index, node) {
			url = $(node).data("fileUrl");
			$('#uploadPicker_fileUrlSave').val(url);
			$('#uploadPicker_fileName').val(
					$(node).data("fileName") + "." + $(node).data("fileType"));
		});
		$('#uploadPicker_fileUrl').attr('src', url);
		$(".uploadModal").modal('hide');
	}

	/* 计算工龄 */
	function gongling(item) {
		var dt = new Date(Date.parse(item.value.replace(/-/g, "/")));
		var date = new Date();
		var dateYear = date.getFullYear();
		var bysjYear = dt.getFullYear();
		var dateMonth = date.getMonth();
		var bysjMonth = dt.getMonth();
		var dateDay = date.getDay();
		var bysjDay = dt.getDay();
		var gl = 0;
		var result = dateYear - bysjYear;
		if (result <= 0) {
			gl = 0;
		} else if (result > 0) {
			var monthResult = dateMonth - bysjMonth;
			if (monthResult < 0) {
				gl = result - 1;

			} else if (monthResult == 0) {
				var dayResult = dateDay - bysjDay;
				if (dayResult < 0) {
					gl = result - 1;
				} else if (dayResult >= 0) {
					gl = result;
				}

			} else if (monthResult > 0) {
				gl = result;
			}
		}
		$('#commRy-info_fobjyear').val(gl);
	}

	function sj() {
		var value = jbgzjsq($("#commRy-info_fxueli").val(), 1, $(
				"#commRy-info_fgyxz").val(), $("#commRy-info_fbydate").val());
		$('#commRy-info_fjbgz').val(value);
	}

	/*

	js自身没有trim()函数取消字符串中的空白字符

	自定义函数：用正则替换掉空白字符

	 */

	function trim(s) {
		return s.replace(/^\s+|\s+$/g, "");
	};

	//验证身份证号并获取出生日期
	function getBirthdatByIdNo(no) {
		var iIdNo = no.value;
		var tmpStr = "";
		iIdNo = trim(iIdNo);
		if (iIdNo.length == 15) {
			tmpStr = iIdNo.substring(6, 12);
			tmpStr = "19" + tmpStr;
			tmpStr = tmpStr.substring(0, 4) + "-" + tmpStr.substring(4, 6)
					+ "-" + tmpStr.substring(6);
			document.getElementById("commRy-info_fbirdate").value = tmpStr;
		} else {
			tmpStr = iIdNo.substring(6, 14);
			tmpStr = tmpStr.substring(0, 4) + "-" + tmpStr.substring(4, 6)
					+ "-" + tmpStr.substring(6);
			document.getElementById("commRy-info_fbirdate").value = tmpStr;
		}
	}
	
	function loadFromRecord(){
		$(document).delegate('#' + conf.modalId + 'BtnSelect', 'click', function(e) {
			$('#' + conf.modalId).modal('hide');
			var ryPickerElement = $('#' + conf.modalId).data('ryPicker');
			var selectBoy=$('#'+ conf.modalId + 'Body');
			var checkedEl=selectBoy.find('.selectedItem:checked');
			ryPickerElement.children('input[type=hidden]').val(checkedEl.val());
			ryPickerElement.children('input[type=text]').val(checkedEl.attr('title'));
		});
		
	}
</script>
</head>
<body>
	<%@include file="/header.jsp"%>
	<div class="row-fluid">
		<%@include file="/menu/hr-workspace.jsp"%>
		<%@include file="../comm/comm-upload.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span10">
			<!-- <div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="hr-home.do">人力资源</a> <span class="divider">/</span>
							</li>
							<li>员工管理<span class="divider">/</span>
							</li>
							<li class="active">人员信息</li>
						</ul>
					</div>
				</div>
			</div> -->
			<div class="control-group">
				<div class="controls">
					<button type="button" class="btn" onclick="loadyprecord()">
						<spring:message code='core.input.save' text='从应聘记录填充' />
					</button>
				</div>
			</div>
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="commRy-info.commRy-info.input.title"
							text="编辑" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="commRy-infoForm" method="post"
						action="commRy-info-save.do" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="commRy-info_id" type="hidden" name="fid"
								value="${model.fid}" />
						</c:if>
						<div class="control-group">
							<div class="container-fluid">
								<div class="row-fluid">
									<div class="span6">
										<div class="row-fluid">
											<div class="span12">
												<label class="control-label" for="commRy-info_fidno"><spring:message
														code="commRy-info.commRy-info.input.fidno" text="身份证号" /></label>
												<div class="controls">
													<input id="commRy-info_fidno" type="text" name="fidno"
														value="${model.fidno}" size="" class="text required"
														onchange="getBirthdatByIdNo(this)" minlength="15"
														maxlength="18" />
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span12">
												<label class="control-label" for="commRy-info_fname"><spring:message
														code="commRy-info.commRy-info.input.fname" text="姓名" /></label>
												<div class="controls">
													<input id="commRy-info_fname" type="text" name="fname"
														value="${model.fname}" size="" class="text required"
														minlength="" maxlength="" />
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span12">
												<label class="control-label" for="commRy-info_fsex"><spring:message
														code="commRy-info.commRy-info.input.fsex" text="性别" /></label>
												<div class="controls">
													<select class="form-control" id="commRy-info_fsex"
														name="fsex" value="${model.fsex}" class=" required">
														<option value="0"
															<c:if test="${model.fsex=='0'}"> selected="selected"  </c:if>>女</option>
														<option value="1"
															<c:if  test="${model.fsex=='1'}"> selected="selected"  </c:if>>男</option>
													</select>
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span12">
												<label class="control-label" for="commRy-info_ftel"><spring:message
														code="commRy-info.commRy-info.input.ftel" text="联系电话" /></label>
												<div class="controls">
													<input id="commRy-info_ftel" type="text" name="ftel"
														value="${model.ftel}" size="" class="number"
														minlength="11" maxlength="11" />
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span12">
												<label class="control-label" for="commRy-info_jobid"><spring:message
														code="commRy-info.commRy-info.input.jobid" text="岗位" /></label>
												<div class="controls">
													<select id="hrGwbm-info_fjobid" name="fjobid"
														class="form-control required">
														<c:forEach items="${gwInfos}" var="item">
															<option value="${item.fid}"
																${item.fid==model.fjobid? 'selected' : ''}>${item.fgwname}</option>
														</c:forEach>
													</select>
												</div>
											</div>
										</div>
									</div>
									<div class="span6">
										<label class="control-label" for="commRy-info_fpicurl"><spring:message
												code="commRy-info.commRy-info.input.fpicurl" text="照片" /></label>
										<div class="controls">
											<input id="uploadPicker_fileUrlSave" type="hidden"
												uploadt="urlSave" name="fpicurl" name="" value="" /> <input
												id="uploadPicker_fileName" type="hidden" uploadt="fileName"
												name="" value="" /> <img id="uploadPicker_fileUrl"
												ondblclick="showUpload()" uploadt="url"
												src="${model.fpicurl}"
												style="height:140px;   <c:if test="${model == null}">width:140px;  </c:if>"
												alt="双击上传" class="img-rounded" />
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span6">
										<div class="row-fluid">
											<div class="span12">
												<label class="control-label" for="commRy-info_femail"><spring:message
														code="commRy-info.commRy-info.input.femail" text="办公邮箱" /></label>
												<div class="controls">
													<input id="commRy-info_femail" type="text" name="femail"
														value="${model.femail}" size="" class="text " minlength=""
														maxlength="" />
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span12">
												<label class="control-label" for="commRy-info_fbirdate"><spring:message
														code="commRy-info.commRy-info.input.fbirdate" text="出生日期" /></label>
												<div class="controls">
													<div class="input-append datepicker date"
														style="padding-left: 0px;">
														<input id="commRy-info_fbirdate" type="text"
															name="fbirdate" value="${model.fbirdate}" size="40"
															class="text required"
															style="background-color:white;cursor:default; width: 175px;" />
														<span class="add-on"
															style="padding-top: 2px; padding-bottom: 2px;"><i
															class="icon-calendar"></i></span>
													</div>
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span12">
												<label class="control-label" for="commRy-info_fbiraddress"><spring:message
														code="commRy-info.commRy-info.input.fbiraddress" text="籍贯" /></label>
												<div class="controls">
													<select id="jyXm-info_fprovince" type="text"
														name="fprovince" value="${model.fprovince}"
														style="width:100px;"></select>省 <select
														id="jyXm-info_fcity" type="text" name="fcity"
														value="${model.fcity}" style="width:100px;"></select>市
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span12">
												<label class="control-label" for="commRy-info_fbank"><spring:message
														code="commRy-info.commRy-info.input.fbank" text="入职时间" /></label>
												<div class="controls">
													<div class="input-append datepicker date"
														style="padding-left: 0px;">
														<input id="commRy-info_frzdate" type="text" name="frzdate"
															value="${model.frzdate}" size="40" class="text required"
															style="background-color:white;cursor:default; width: 175px;"
															onchange="gongling(this);sj();" /> <span class="add-on"
															style="padding-top: 2px; padding-bottom: 2px;"><i
															class="icon-calendar"></i></span>
													</div>
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span12">
												<label class="control-label" for="commRy-info_fobjyear"><spring:message
														code="commRy-info.commRy-info.input.fobjyear" text="工龄" /></label>
												<div class="controls">
													<input id="commRy-info_fobjyear" type="text" size=""
														class="text " minlength="" value="${model.fobjyear}"
														name="fobjyear" readonly />
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span12">
												<label class="control-label" for="plain-info_ftitle"><spring:message
														code="commRy-info.commRy-info.input.fgyxz" text="雇佣性质" /></label>
												<div class="controls">
													<select class="form-control" id="commRy-info_fgyxz"
														name="fgyxz" value="${model.fgyxz }" class=" required"
														onchange="sj()">
														<option value="1"
															<c:if test="${model.fgyxz == 1}">selected="selected"</c:if>>试用期</option>
														<option value="2"
															<c:if test="${model.fgyxz == 2}">selected="selected"</c:if>>实习期</option>
														<option value="3"
															<c:if test="${model.fgyxz == 3}">selected="selected"</c:if>>正式</option>
														<option value="4"
															<c:if test="${model.fgyxz == 4}">selected="selected"</c:if>>离职</option>
													</select>
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span12">
												<label class="control-label" for="commRy-info_fjbgz"><spring:message
														code="commRy-info.commRy-info.input.fjbgz" text="基本工资金额" /></label>
												<div class="controls">
													<input id="commRy-info_fjbgz" type="text" size=""
														class="text " minlength="" value="${model.fjbgz}"
														name="fjbgz" readonly />
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span12">
												<label class="control-label" for="commRy-info_fbank"><spring:message
														code="commRy-info.commRy-info.input.fbank" text="开户行" /></label>
												<div class="controls">
													<input id="commRy-info_fbank" type="text" name="fbank"
														value="${model.fbank}" size="" class="text " minlength=""
														maxlength="" />
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span12">
												<label class="control-label" for="commRy-info_fbankcode"><spring:message
														code="commRy-info.commRy-info.input.fbankcode" text="银行卡号" /></label>
												<div class="controls">
													<input id="commRy-info_fbankcode" type="text"
														name="fbankcode" value="${model.fbankcode}" size=""
														class="text " minlength="" maxlength="" />
												</div>
											</div>
										</div>
									</div>
									<div class="span6">
										<div class="row-fluid">
											<div class="span12">
												<label class="control-label" for="commRy-info_fbankcode"><spring:message
														code="commRy-info.commRy-info.input.fbankcode" text="民族" /></label>
												<div class="controls">
													<select class="form-control" id="commRy-info_fminzu"
														name="fminzu" value="${model.fminzu}">
														<option></option>
														<option value="汉族"
															<c:if test="${model.fminzu=='汉族'}"> selected="selected"</c:if>>汉族</option>
														<option value="回族"
															<c:if test="${model.fminzu=='回族'}"> selected="selected"</c:if>>回族</option>
														<option value="蒙古族"
															<c:if test="${model.fminzu=='蒙古族'}"> selected="selected"</c:if>>蒙古族</option>
														<option value="壮族"
															<c:if test="${model.fminzu=='壮族'}"> selected="selected"</c:if>>壮族</option>
														<option value="苗族"
															<c:if test="${model.fminzu=='苗族'}"> selected="selected"</c:if>>苗族</option>
														<option value="满族"
															<c:if test="${model.fminzu=='满族'}"> selected="selected"</c:if>>满族</option>
													</select>
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span12">
												<label class="control-label" for="commRy-info_fxueli"><spring:message
														code="commRy-info.commRy-info.input.fxueli" text="学历" /></label>
												<div class="controls">
													<select class="form-control" id="commRy-info_fxueli"
														name="fxueli" value="${model.fxueli}" class=" "
														style="width: 100px;" onchange="sj()">
														<option value="-1"
															<c:if test="${model.fxueli=='-1'}"> selected="selected"  </c:if>>小学</option>
														<option value="0"
															<c:if test="${model.fxueli=='0'}"> selected="selected"  </c:if>>初中</option>
														<option value="1"
															<c:if test="${model.fxueli=='1'}"> selected="selected"  </c:if>>中专</option>
														<option value="2"
															<c:if test="${model.fxueli=='2'}"> selected="selected"  </c:if>>大专</option>
														<option value="3"
															<c:if test="${model.fxueli=='3'}"> selected="selected"  </c:if>>本科</option>
														<option value="4"
															<c:if test="${model.fxueli=='4'}"> selected="selected"  </c:if>>硕士</option>
														<option value="5"
															<c:if test="${model.fxueli=='5'}"> selected="selected"  </c:if>>博士</option>
													</select> 第二学历： <select class="form-control"
														id="commRy-info_fxueli2" name="fxueli2"
														value="${model.fxueli2}" class=" " style="width: 100px;"
														onchange="sj()">
														<option value=""></option>
														<option value="-1"
															<c:if test="${model.fxueli2=='-1'}"> selected="selected"  </c:if>>小学</option>
														<option value="0"
															<c:if test="${model.fxueli2=='0'}"> selected="selected"  </c:if>>初中</option>
														<option value="1"
															<c:if test="${model.fxueli2=='1'}"> selected="selected"  </c:if>>中专</option>
														<option value="2"
															<c:if test="${model.fxueli2=='2'}"> selected="selected"  </c:if>>大专</option>
														<option value="3"
															<c:if test="${model.fxueli2=='3'}"> selected="selected"  </c:if>>本科</option>
														<option value="4"
															<c:if test="${model.fxueli2=='4'}"> selected="selected"  </c:if>>硕士</option>
														<option value="5"
															<c:if test="${model.fxueli2=='5'}"> selected="selected"  </c:if>>博士</option>
													</select>
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span12">
												<label class="control-label" for="commRy-info_fbyyx"><spring:message
														code="commRy-info.commRy-info.input.fbyyx" text="毕业院校" /></label>
												<div class="controls">
													<input id="commRy-info_fbyyx" type="text" name="fbyyx"
														value="${model.fbyyx}" size="" class="text " minlength=""
														maxlength="" />
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span12">
												<label class="control-label" for="commRy-info_fbank"><spring:message
														code="commRy-info.commRy-info.input.fbank" text="所学专业" /></label>
												<div class="controls">
													<input id="commRy-info_fzhuanye" type="text"
														name="fzhuanye" value="${model.fzhuanye}" size=""
														class="text " minlength="" maxlength="" />
												</div>
											</div>
										</div>
										<%-- <div class="row-fluid">
											<div class="span12">
												<label class="control-label" for="commRy-info_fxueli2"><spring:message
														code="commRy-info.commRy-info.input.fxueli2" text="学历-2" /></label>
												<div class="controls">
													<select class="form-control" id="commRy-info_fxueli2"
														name="fxueli2" value="${model.fxueli2}" class=" "
														onchange="sj()">
														<option value="-1"
															<c:if test="${model.fxueli=='-1'}"> selected="selected"  </c:if>>小学</option>
														<option value="0"
															<c:if test="${model.fxueli=='0'}"> selected="selected"  </c:if>>初中</option>
														<option value="1"
															<c:if test="${model.fxueli=='1'}"> selected="selected"  </c:if>>中专</option>
														<option value="2"
															<c:if test="${model.fxueli=='2'}"> selected="selected"  </c:if>>大专</option>
														<option value="3"
															<c:if test="${model.fxueli=='3'}"> selected="selected"  </c:if>>本科</option>
														<option value="4"
															<c:if test="${model.fxueli=='4'}"> selected="selected"  </c:if>>硕士</option>
														<option value="5"
															<c:if test="${model.fxueli=='5'}"> selected="selected"  </c:if>>博士</option>
													</select>
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span12">
												<label class="control-label" for="commRy-info_fbyyx2"><spring:message
														code="commRy-info.commRy-info.input.fbyyx2" text="毕业院校-2" /></label>
												<div class="controls">
													<input id="commRy-info_fbyyx2" type="text" name="fbyyx2"
														value="${model.fbyyx2}" size="" class="text " minlength=""
														maxlength="" />
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span12">
												<label class="control-label" for="commRy-info_fzhuanye2"><spring:message
														code="commRy-info.commRy-info.input.fzhuanye2"
														text="所学专业-2" /></label>
												<div class="controls">
													<input id="commRy-info_fzhuanye2" type="text"
														name="fzhuanye2" value="${model.fzhuanye}" size=""
														class="text " minlength="" maxlength="" />
												</div>
											</div>
										</div> --%>
										<div class="row-fluid">
											<div class="span12">
												<label class="control-label" for="commRy-info_fbydate"><spring:message
														code="commRy-info.commRy-info.input.fbydate" text="毕业时间" /></label>
												<div class="controls">
													<div class="input-append datepicker date"
														style="padding-left: 0px;">
														<input id="commRy-info_fbydate" type="text" name="fbydate"
															value="${model.fbydate}" size="40" class="text "
															style="background-color:white;cursor:default; width: 175px;"
															onchange="sj()" /> <span class="add-on"
															style="padding-top: 2px; padding-bottom: 2px;"><i
															class="icon-calendar"></i></span>
													</div>
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span12">
												<label class="control-label" for="commRy-info_ffzwz"><spring:message
														code="commRy-info.commRy-info.input.ffzwz" text="放置位置" /></label>
												<div class="controls">
													<input id="commRy-info_ffzwz" type="text" name="ffzwz"
														value="${model.ffzwz}" size="50" class="text "
														minlength="" maxlength="" />
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span12">
												<label class="control-label" for="commRy-info_fbank"><spring:message
														code="commRy-info.commRy-info.input.fbank" text="政治面貌" /></label>
												<div class="controls">
													<select class="form-control" id="commRy-info_fzzmm"
														name="fzzmm" value="${model.fzzmm}" class=" ">
														<option value="0"
															<c:if test="${model.fzzmm=='0'}"> selected="selected"  </c:if>>群众</option>
														<option value="1"
															<c:if test="${model.fzzmm=='1'}"> selected="selected"  </c:if>>党员</option>
														<option value="2"
															<c:if test="${model.fzzmm=='2'}"> selected="selected"  </c:if>>团员</option>
														<option value="3"
															<c:if test="${model.fzzmm=='3'}"> selected="selected"  </c:if>>民族党派</option>
													</select>
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span12">
												<label class="control-label" for="commRy-info_fismarry"><spring:message
														code="commRy-info.commRy-info.input.fismarry" text="婚否" /></label>
												<div class="controls">
													<select class="form-control" id="commRy-info_fismarry"
														name="fismarry" value="${model.fismarry}" class=" ">
														<option value="0"
															<c:if test="${model.fismarry=='0'}"> selected="selected"  </c:if>>未婚</option>
														<option value="1"
															<c:if test="${model.fismarry=='1'}"> selected="selected"  </c:if>>已婚</option>
													</select>
												</div>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span12">
												<label class="control-label" for="commRy-info_fischildren"><spring:message
														code="commRy-info.commRy-info.input.fischildren"
														text="子女(个)" /></label>
												<div class="controls">
													<select class="form-control" id="commRy-info_fischildren"
														name="fischildren" value="${model.fischildren}"
														class="number">
														<option value="0"
															<c:if test="${model.fismarry=='0'}"> selected="selected"  </c:if>>无</option>
														<option value="1"
															<c:if test="${model.fismarry=='1'}"> selected="selected"  </c:if>>1</option>
														<option value="2"
															<c:if test="${model.fismarry=='2'}"> selected="selected"  </c:if>>2</option>
														<option value="3"
															<c:if test="${model.fismarry=='3'}"> selected="selected"  </c:if>>3</option>
														<option value="4"
															<c:if test="${model.fismarry=='4'}"> selected="selected"  </c:if>>4</option>
													</select>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span12">
										<label class="control-label" for="commRy-info_faddress"><spring:message
												code="commRy-info.commRy-info.input.faddress" text="家庭地址" /></label>
										<div class="controls">
											<input id="commRy-info_faddress" type="text" name="faddress"
												value="${model.faddress}" size="50" class="text "
												minlength="" maxlength="" style="width: 480px;" />
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span12">
										<label class="control-label" for="commRy-info_fbankcode"><spring:message
												code="commRy-info.commRy-info.input.fbankcode" text="原工作单位" /></label>
										<div class="controls">
											<input id="commRy-info_fbankcode" type="text" name="flastjob"
												value="${model.flastjob}" size="50" class="text "
												minlength="" maxlength="" style="width: 480px;" />
										</div>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span12">
										<label class="control-label" for="commRy-info_jinji"><spring:message
												code="commRy-info.commRy-info.input.fbank" text="紧急联系人" /></label>
										<div class="controls">
											<input id="commRy-info_jinji" type="text" name="fcontact"
												placeholder="姓名" value="${model.fcontact}"
												style="width: 120px;" class="text " minlength=""
												maxlength="" /> <input id="commRy-info_jinjir" type="text"
												name="fcontguanxi" placeholder="关系"
												value="${model.fcontguanxi}" style="width: 120px;"
												class="text " minlength="" maxlength="" /> <input
												id="commRy-info_jinjitel" type="text" name="fconttel"
												placeholder="联系方式" value="${model.fconttel}"
												style="width: 160px;" class="text " minlength=""
												maxlength="" />
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
						</div>
					</form>
				</div>
			</article>
		</section>
		<!-- end of main -->
	</div>
</body>
</html>
