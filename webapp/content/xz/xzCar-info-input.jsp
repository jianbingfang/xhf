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
<title><spring:message code="xzCar-info.xzCar-info.input.title"
		text="车辆信息 - 车辆管理 - 行政管理" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/js/ajaxfileupload.js"></script>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/uploadpicker/uploadpicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/uploadpicker/uploadpicker.js"></script>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
<script type="text/javascript">
	$(
			function() {
				$("#xzCar-infoForm")
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
						$('a[uploadt="download"]').show();
						$('a[uploadt="download"]').text(data.fileName);
						$('a[uploadt="download"]').attr('href', data.fileUrl);
					}
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
			<!--      <div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<ul class="breadcrumb">
				<li>
					<a href="xz-workspace.do">行政管理</a> <span class="divider">/</span>
				</li>
				<li>
					车辆管理<span class="divider">/</span>
				</li>
				<li class="active">
					车辆信息
				</li>
			</ul>
		</div>
	</div>
</div> -->
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="xzCar-info.xzCar-info.input.title" text="编辑" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="xzCar-infoForm" method="post" action="xzCar-info-save.do"
						class="form-horizontal">
						<c:if test="${model != null}">
							<input id="xzCar-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="xzCar-info_fmemo2"><spring:message
										code="xzCar-info.xzCar-info.input.fmemo2" text="编号" /></label>
								<div class="controls">
									<input id="xzCar-info_fmemo1" type="text" name="fmemo1"
										value="${model.fmemo1}" size="" class="text " minlength=""
										maxlength="">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="xzCar-info_fcarno"><spring:message
										code="xzCar-info.xzCar-info.input.fcarno" text="车牌号" /></label>
								<div class="controls">
									<input id="xzCar-info_fcarno" type="text" name="fcarno"
										value="${model.fcarno}" size="" class="text required"
										minlength="" maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="xzCar-info_ftype"><spring:message
										code="xzCar-info.xzCar-info.input.ftype" text="厂牌型号" /></label>
								<div class="controls">
									<input id="xzCar-info_ftype" type="text" name="ftype"
										value="${model.ftype}" size="" class="text " minlength=""
										maxlength="">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="xzCar-info_fbrand"><spring:message
										code="xzCar-info.xzCar-info.input.fbrand" text="初次登记" /></label>
								<div class="controls">
									<input id="xzCar-info_fbrand" type="text" name="fbrand"
										value="${model.fbrand}" size="" class="text " minlength=""
										maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="hrLdht-info_fmemo"><spring:message
										code="hrLdht-info.hrLdht-info.input.fmemo" text="车架号" /></label>
								<div class="controls">
									<input id="xzCar-info_fmemo" type="text" name="fmemo"
										value="${model.fmemo}" size="" class="text " minlength=""
										maxlength="">
								</div>
							</div>
							<%-- <div class="span5">
					    <label class="control-label" for="xzCar-info_fprice"><spring:message code="xzCar-info.xzCar-info.input.fprice" text="车辆价格"/></label>
						<div class="controls">
							  	<input id="xzCar-info_fprice" type="text" name="fprice" value="${model.fprice}" size="" class="number   " minlength="" maxlength="">
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="xzCar-info_fcurrentprice"><spring:message code="xzCar-info.xzCar-info.input.fcurrentprice" text="车辆现值"/></label>
						<div class="controls">
							  	<input id="xzCar-info_fcurrentprice" type="text" name="fcurrentprice" value="${model.fcurrentprice}" size="" class="number   " minlength="" maxlength="">
					    </div>
					  </div> --%>
							<div class="span5">
								<label class="control-label" for="xzCar-info_ftotalkm"><spring:message
										code="xzCar-info.xzCar-info.input.ftotalkm" text="总公里数" /></label>
								<div class="controls">
									<input id="xzCar-info_ftotalkm" type="text" name="ftotalkm"
										value="${model.ftotalkm}" size="" class="number   "
										minlength="" maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<%-- <div class="span5">
							<div class="uploadPicker">
						   <label class="control-label" for="xzCar-info_fdrivelicense"><spring:message code="xzCar-info.xzCar-info.input.fdrivelicense" text="行驶证扫描证件"/></label>
								<a <c:if test="${model.fdrivelicense==null}"> style="display:none;" </c:if> uploadt="download" class="btn btn-link" href="${model.fdrivelicense}"><spring:message code='core.input.back' text='${model.fdrivelicensename}'/></a>
								<a  class="btn btn-link" uploadt="upbutton"   href="javaScript:void(0)"><spring:message code='core.input.back' text='上传'/></a>
						        <input id="uploadPicker_fileUrlSave"  type="hidden" uploadt="urlSave" name="fdrivelicense" name="" value="${model.fdrivelicense}"/>
						        <input id="uploadPicker_fileName"  type="hidden" uploadt="nameSave" name="fdrivelicensename" name="" value="${model.fdrivelicensename}"/>
						    </div>
					  </div> --%>
							<div class="span5">
								<label class="control-label" for="hrLdht-info_fryid"><spring:message
										code="hrLdht-info.hrLdht-info.input.fryid" text="使用人" /></label>
								<div class="controls">
									<div class="input-append ryPicker">
										<input id="ryBxRecord-info_fryid" type="hidden" name="fuserid"
											value="${model.fuserid}" class=" " style="width: 175px;">
										<input id="ryBxRecord-info_userName" type="text" name="fuser"
											value="${model.fuser}" class=" " style="width: 175px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-user"></i></span>
									</div>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="xzCar-info_frybz"><spring:message
										code="xzCar-info.xzCar-info.input.frybz" text="燃油标准" /></label>
								<div class="controls">
									<input id="xzCar-info_frybz" type="text" name="frybz"
										value="${model.frybz}" size="" class="text " minlength=""
										maxlength="">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="hrLdht-info_fryid"><spring:message
										code="hrLdht-info.hrLdht-info.input.fryid" text="车主" /></label>
								<div class="controls">
									<div class="input-append ryPicker">
										<input id="ryBxRecord-info_fryid" type="hidden"
											name="fownerid" value="${model.fownerid}" class=" "
											style="width: 175px;"> <input
											id="ryBxRecord-info_userName" type="text" name="fowner"
											value="${model.fowner}" class=" " style="width: 175px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-user"></i></span>
									</div>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="xzCar-info_fwbdate"><spring:message
										code="xzCar-info.xzCar-info.input.fwbdate" text="下次维保时间" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="xzCar-info_fwbdate" type="text" name="fwbdate"
											value="${model.fwbdate}" size="40" class="text "
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
								<label class="control-label" for="xzCar-info_fscdate"><spring:message
										code="xzCar-info.xzCar-info.input.fscdate" text="下次审车时间" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="xzCar-info_fscdate" type="text" name="fscdate"
											value="${model.fscdate}" size="40" class="text "
											style="background-color:white;cursor:default; width: 175px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="xzCar-info_fbxdate"><spring:message
										code="xzCar-info.xzCar-info.input.fbxdate" text="下次续保时间" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="xzCar-info_fbxdate" type="text" name="fbxdate"
											value="${model.fbxdate}" size="40" class="text "
											style="background-color:white;cursor:default; width: 175px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>
								</div>
							</div>
						</div>
						<%-- 	<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="xzCar-info_fzjmoney"><spring:message code="xzCar-info.xzCar-info.input.fzjmoney" text="残值金额"/></label>
						<div class="controls">
							  	<input id="xzCar-info_fzjmoney" type="text" name="fzjmoney" value="${model.fzjmoney}" size="" class="number   " minlength="" maxlength="">
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="xzCar-info_fzjnum"><spring:message code="xzCar-info.xzCar-info.input.fzjnum" text="折旧期数"/></label>
						<div class="controls">
							  	<input id="xzCar-info_fzjnum" type="text" name="fzjnum" value="${model.fzjnum}" size="" class="number   " minlength="" maxlength="">
					    </div>
					    </div>
					    </div> --%>
						<div class="control-group">
							<label class="control-label" for="xzCar-info_fmemo2"><spring:message
									code="xzCar-info.xzCar-info.input.fmemo2" text="备注" /></label>
							<div class="controls">
								<textarea id="xzCar-info_fmemo2" name="fmemo2"
									class="form-control" rows="6" style="width: 560px"
									class="text  " minlength="" maxlength="1000">${model.fmemo2}</textarea>
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
