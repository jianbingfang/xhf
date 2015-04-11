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
		code="xzChufa-info.xzChufa-info.input.title"
		text="行政处罚 - 公司档案管理 - 行政管理" /></title>
<%@include file="/common/s.jsp"%>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/xmpicker/xmpicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/xmpicker/xmpicker.js"></script>
<script type="text/javascript">
	$(
			function() {
				$("#xzChufa-infoForm")
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
				$("#confirmBtn").click(function() {
					saveFile();
				});

				loadFujian($('#xzChufa-info_id').val());

			});
			function addScanFile() {
				if (!$('#xzChufa-info_id').val()) {
					alert("请先保存证件信息！");
					return;
				}
				showUpload();
			}

			var table;
			$(function() {
			});

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
						zjId : $('#xzChufa-info_id').val(),
						jlFujians : JSON.stringify(fujianFiles),
						tableName:'t_xz_chufa'
					},

					async : false,
					success : function(data) {
						if (data = 'ok') {
							loadScanFile($('#xzChufa-info_id').val());
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
							loadScanFile($('#xzChufa-info_id').val());
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
								fmaintable : 't_xz_chufa'
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
	<%@include file="../comm/comm-upload.jsp"%>
	<div class="row-fluid">
		<%@include file="/menu/xz-workspace.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span10">
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="xzChufa-info.xzChufa-info.input.title"
							text="编辑" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="xzChufa-infoForm" method="post"
						action="xzChufa-info-save.do" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="xzChufa-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<div class="control-group">
							<div class="span6">
								<div class="control-group">
									<label class="control-label" for="xzChufa-info_fname"><spring:message
											code="xzChufa-info.xzChufa-info.input.fname" text="标题" /></label>
									<div class="controls">
										<input id="xzChufa-info_fname" type="text" name="fname"
											value="${model.fname}" size="" class="text required">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="xzChufa-info_ffileno"><spring:message
											code="xzChufa-info.xzChufa-info.input.ffileno" text="文件号" /></label>
									<div class="controls">
										<input id="xzChufa-info_ffileno" type="text" name="ffileno"
											value="${model.ffileno}" size="" class="number   ">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="xzChufa-info_ffwdw"><spring:message
											code="xzChufa-info.xzChufa-info.input.ffwdw" text="发文单位" /></label>
									<div class="controls">
										<input id="xzChufa-info_ffwdw" type="text" name="ffwdw"
											value="${model.ffwdw}" size="" class="text   ">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="xzChufa-info_fxmid"><spring:message
											code="xzChufa-info.xzChufa-info.input.fxmid" text="项目" /></label>
									<div class="controls">
										<div class="input-append xmPicker">
											<input id="xzChufa-info_fxmid" type="hidden" name="fxmid"
												value="${model.fxmid}"> <input
												id="xmBxRecord-info_fxmid" type="text"
												value="${xmMap[model.fxmid].fxmname}" disabled
												class=" required" style="width: 175px;" value=""> <span
												class="add-on"
												style="padding-top: 2px; padding-bottom: 2px;"><i
												class="icon-th-list"></i></span>
										</div>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="xzChufa-info_fdate"><spring:message
											code="xzChufa-info.xzChufa-info.input.fdate" text="日期" /></label>
									<div class="controls">
										<div class="input-append datepicker date"
											style="padding-left: 0px;">
											<input id="xzChufa-info_fdate" type="text" name="fdate"
												value="${model.fdate}" size="40" class="text "
												style="background-color:white;cursor:default; width: 175px;">
											<span class="add-on"
												style="padding-top: 2px; padding-bottom: 2px;"><i
												class="icon-calendar"></i></span>
										</div>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="xzChufa-info_fcontent"><spring:message
											code="xzChufa-info.xzChufa-info.input.fcontent" text="内容" /></label>
									<div class="controls">
										<textarea id="xzChufa-info_fcontent" name="fcontent"
											class="form-control" rows="6" maxlength="4000">${model.fcontent}</textarea>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="xzChufa-info_fmemo"><spring:message
											code="xzChufa-info.xzChufa-info.input.fmemo" text="备注" /></label>
									<div class="controls">
										<textarea id="xzChufa-info_fmemo" name="fmemo"
											class="form-control" rows="3" maxlength="4000">${model.fmemo}</textarea>
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
					<div class="span6">
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
