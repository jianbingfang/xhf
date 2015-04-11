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
		code="hrLdht-info.hrLdht-info.input.title" text="劳动合同 - 员工管理 - 人力资源" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript">
	$(function() {
		$("#hrLdht-infoForm")
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
			saveFile();
		});

		loadFujian($('#hrLdht-info_id').val());

	});
	function addScanFile() {
		if (!$('#hrLdht-info_id').val()) {
			alert("请先保存证件信息！");
			return;
		}
		showUpload();
	}

	var table;

	function saveFile() {
		var fujianFiles = new Array();
		$.each($('.files').children(), function(index, node) {
			var file = {
				fname : $(node).data("fileName") + "."
						+ $(node).data("fileType"),
				furl : $(node).data("fileUrl")
			};
			fujianFiles.push(file);
		});

		$.ajax({
			url : '${scopePrefix}/xz/saveZjScan.do',
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			type : 'POST',
			data : {
				zjId : $('#hrLdht-info_id').val(),
				jlFujians : JSON.stringify(fujianFiles),
				tableName : 't_hr_ldht'
			},

			async : false,
			success : function(data) {
				if (data = 'ok') {
					loadScanFile($('#hrLdht-info_id').val());
				}
			}
		});
		$(".uploadModal").modal('hide');
	}

	function deleteImg(id) {
		$.ajax({
			url : '${scopePrefix}/xz/deleteImg.do',
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			type : 'POST',
			data : {
				fjId : id,
			},
			async : false,
			success : function(data) {
				if (data = 'ok') {
					loadScanFile($('#hrLdht-info_id').val());
				}
			}
		});
	}

	function rowClick() {
		$('#ryzjtid').css("background-color", "red");
		$(this).css("background-color", "green");
	}

	function loadFujian(zjid) {
		$('#ryzjtid tr').css("background-color", "white");
		$('[trid=' + zjid + ']').css("background-color", "yellow");
		loadScanFile(zjid);
	}

	function showImg(url) {
		$('#scanFileid').attr('src', url);
	}
	function loadScanFile(zjid) {
		editZjid = zjid;

		$('#zjids').append('<tr>aa</tr>');
		$
				.ajax({
					url : '${scopePrefix}/comm/fujianlist.do',
					data : {
						fmainid : zjid,
						fmaintable : 't_hr_ldht'
					},
					dataType : 'json',
					async : false,
					success : function(data) {
						$('#zjids').empty();
						for (var i = 0; i < data.length; i++) {
							$('#zjids')
									.append(
											'<tr>'
													+ '<td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="'+data[i].fid+'"></td>'
													+ '<td><a href="javascript:void(0);" class="a-update" onclick="showImg(\''
													+ data[i].furl
													+ '\')"> '
													+ data[i].fname
													+ ' </a></td>'
													+ '<td><a href="javascript:void(0);" class="a-update" onclick="deleteImg(\''
													+ data[i].fid + '\')"> 删除'
													+ ' </a></td>' + '</tr>');
						}
					}
				});
		$('#zjids')
				.append(
						'<tr id="addFujian">'
								+ '<td><input type="button" class="btn btn-link"  onclick="addScanFile()" value="添加扫描件..."></td>'
								+ '</tr>');
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
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="hrLdht-info.hrLdht-info.input.title"
							text="编辑" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="hrLdht-infoForm" method="post"
						action="hrLdht-info-save.do" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="hrLdht-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<div class="control-group">
							<div class="span5">
								<div class="control-group">
									<label class="control-label" for="hrLdht-info_fcode"><spring:message
											code="hrLdht-info.hrLdht-info.input.fcode" text="编号" /></label>
									<div class="controls">
										<input id="hrLdht-info_fcode" name="fcode" type="text"
											class="text" value="${model.fcode}">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="hrLdht-info_fryid"><spring:message
											code="hrLdht-info.hrLdht-info.input.fryid" text="姓名" /></label>
									<div class="controls">
										<div class="input-append ryPicker">
											<input id="hrLdht-info_fryid" type="hidden" name="fryid"
												value="${model.fryid}"> <input
												id="hrLdht-info_userName" type="text"
												value="${ryMap[model.fryid].fname}" disabled
												class=" required" style="width: 175px;"> <span
												class="add-on"
												style="padding-top: 2px; padding-bottom: 2px;"><i
												class="icon-user"></i></span>
										</div>
									</div>
								</div>
								<%-- 	<div class="control-group">
							<label class="control-label" for="hrLdht-info_fzw"><spring:message
									code="hrLdht-info.hrLdht-info.input.fzw" text="岗位" /></label>
							<div class="controls">
								<select id="hrLdht-info_fzw" name="fzw"
									class="form-control required">
									<c:forEach items="${gwInfos}" var="item">
										<option value="${item.fid}"
											${item.fid==model.fjobid? 'selected' : ''}>${item.fgwname}</option>
									</c:forEach>
								</select>
							</div>
						</div> --%>
								<div class="control-group">
									<label class="control-label" for="hrLdht-info_fht"><spring:message
											code="hrLdht-info.hrLdht-info.input.fht" text="合同类型" /></label>
									<div class="controls">
										<select class="form-control" id="hrLdht-info_fht" name="fht"
											value="${model.fht}" class=" required">
											<option value="3"
												<c:if  test="${model.fht=='3'}"> selected="selected"  </c:if>>正式合同</option>
											<option value="1"
												<c:if test="${model.fht=='1'}"> selected="selected"  </c:if>>试用合同</option>
											<option value="2"
												<c:if  test="${model.fht=='2'}"> selected="selected"  </c:if>>临时合同</option>
										</select>
									</div>
								</div>
								<%-- <div class="control-group">
							<label class="control-label" for="hrLdht-info_fdept"><spring:message
									code="hrLdht-info.hrLdht-info.input.fdept" text="所在部门" /></label>
							<div class="controls">
								<select id="hrGwbm-info_fdept" name="fdept"
									class="form-control required">
									<c:forEach items="${deptList}" var="item">
										<option value="${item.id}"
											${item.id==model.fdept? 'selected' : ''}>${item.name}</option>
									</c:forEach>
								</select>
							</div>
						</div> --%>
								<div class="control-group">
									<label class="control-label" for="hrLdht-info_fmoney"><spring:message
											code="hrLdht-info.hrLdht-info.input.fmoney" text="工资" /></label>
									<div class="controls">
										<input id="hrLdht-info_fmoney" type="text" name="fmoney"
											value="${model.fmoney}" size="" class="text required"
											minlength="" maxlength="">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="hrLdht-info_fsystart"><spring:message
											code="hrLdht-info.hrLdht-info.input.fsystart" text="试用期起" /></label>
									<div class="controls">
										<div class="input-append datepicker date"
											style="padding-left: 0px;">
											<input id="hrLdht-info_fsystart" type="text" name="fsystart"
												value="${model.fsystart}" size="40" class="text "
												style="background-color:white;cursor:default; width: 175px;">
											<span class="add-on"
												style="padding-top: 2px; padding-bottom: 2px;"><i
												class="icon-calendar"></i></span>
										</div>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="hrLdht-info_fsyend"><spring:message
											code="hrLdht-info.hrLdht-info.input.fsyend" text="试用期止" /></label>
									<div class="controls">
										<div class="input-append datepicker date"
											style="padding-left: 0px;">
											<input id="hrLdht-info_fsyend" type="text" name="fsyend"
												value="${model.fsyend}" size="40" class="text "
												style="background-color:white;cursor:default; width: 175px;">
											<span class="add-on"
												style="padding-top: 2px; padding-bottom: 2px;"><i
												class="icon-calendar"></i></span>
										</div>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="hrLdht-info_fhtstart"><spring:message
											code="hrLdht-info.hrLdht-info.input.fhtstart" text="合同期起" /></label>
									<div class="controls">
										<div class="input-append datepicker date"
											style="padding-left: 0px;">
											<input id="hrLdht-info_fhtstart" type="text" name="fhtstart"
												value="${model.fhtstart}" size="40" class="text "
												style="background-color:white;cursor:default; width: 175px;">
											<span class="add-on"
												style="padding-top: 2px; padding-bottom: 2px;"><i
												class="icon-calendar"></i></span>
										</div>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="hrLdht-info_fhtend"><spring:message
											code="hrLdht-info.hrLdht-info.input.fhtend" text="合同期止" /></label>
									<div class="controls">
										<div class="input-append datepicker date"
											style="padding-left: 0px;">
											<input id="hrLdht-info_fhtend" type="text" name="fhtend"
												value="${model.fhtend}" size="40" class="text "
												style="background-color:white;cursor:default; width: 175px;">
											<span class="add-on"
												style="padding-top: 2px; padding-bottom: 2px;"><i
												class="icon-calendar"></i></span>
										</div>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="hrLdht-info_fmemo2"><spring:message
											code="hrLdht-info.hrLdht-info.input.fmemo2" text="放置位置" /></label>
									<div class="controls">
										<input id="hrLdht-info_fmemo2" type="text" name="fmemo2"
											value="${model.fmemo2}" size="" class="text " minlength=""
											maxlength="">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="hrLdht-info_fmemo"><spring:message
											code="hrLdht-info.hrLdht-info.input.fmemo" text="备注" /></label>
									<div class="controls">
										<input id="hrLdht-info_fmemo" type="text" name="fmemo"
											value="${model.fmemo}" size="" class="text " minlength=""
											maxlength="">
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
					<div class="span5">
						<div class="control-group">
							<article class="m-widget">
								<header class="header">
									<h4 class="title">
										<spring:message code="hrRyZj-info.hrRyZj-info.list.title"
											text="扫描件列表" />
									</h4>
								</header>
								<div class="content">
									<form id="hrRyZj-infoGridForm" name="hrRyZj-infoGridForm"
										method='post' action="hrRyZj-info-remove.do"
										class="m-form-blank">
										<table id="hrRyZj-infoGrid" class="m-table table-hover table-bordered">
											<thead>
												<tr>
													<th width="10" class="m-table-check"><input
														type="checkbox" name="checkAll"
														onchange="toggleSelectedItems(this.checked)"></th>
													<th class="sorting" name="xmjmc">扫描件名称</th>
													<th width="80">&nbsp;</th>
												</tr>
											</thead>
											<tbody id="zjids">
												<%-- 	<c:forEach items="${page.result}" var="item">
														<tr>
															<td><input type="checkbox"
																class="selectedItem a-check" name="selectedItem"
																value="${item.fid}"></td>
															<td><a href="hrRyZj-info-input.do?id=${item.fid}"
																class="a-update"> ${item.fzhuanye} </a></td>
														</tr>
													</c:forEach> --%>
												<tr id="addFujian">
													<td></td>
													<td><input type="button" class="btn btn-link"
														onclick="addScanFile()" value="添加扫描件..."></td>
												</tr>
											</tbody>
										</table>
									</form>
								</div>
							</article>
						</div>
						<div class="control-group">
							<article class="m-widget">
								<header class="header">
									<h4 class="title">
										<spring:message code="hrRyZj-info.hrRyZj-info.list.title"
											text="扫描件缩略图" />
									</h4>
								</header>
								<div class="content">
									<img id="scanFileid" alt="140x140"
										src="../s/xthena/img/photo.png" />
								</div>
							</article>
						</div>
					</div>
				</div>
			</article>
		</section>
		<!-- end of main -->
	</div>
</body>
</html>
