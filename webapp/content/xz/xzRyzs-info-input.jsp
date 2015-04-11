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
		code="xzRyzs-info.xzRyzs-info.input.title" text="荣誉证书 - 公司档案管理 - 行政管理" /></title>
<%@include file="/common/s.jsp"%>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/xmpicker/xmpicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/xmpicker/xmpicker.js"></script>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
<script type="text/javascript">
	$(function() {
		$("#xzRyzs-infoForm")
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
		
		$("#confirmBtn").click(function() {
			saveFile();
		});

		loadFujian($('#xzRyzs-info_id').val());
	});
	function addScanFile() {
		if (!$('#xzRyzs-info_id').val()) {
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
				zjId : $('#xzRyzs-info_id').val(),
				jlFujians : JSON.stringify(fujianFiles),
				tableName:'t_xz_ryzs'
			},

			async : false,
			success : function(data) {
				if (data = 'ok') {
					loadScanFile($('#xzRyzs-info_id').val());
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
					loadScanFile($('#xzRyzs-info_id').val());
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
		$.ajax({
					url : '${scopePrefix}/comm/fujianlist.do',
					data : {
						fmainid : zjid,
						fmaintable : 't_xz_ryzs'
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
						<spring:message code="xzRyzs-info.xzRyzs-info.input.title"
							text="编辑" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="xzRyzs-infoForm" method="post"
						action="xzRyzs-info-save.do" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="xzRyzs-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="xzRyzs-info_ftype"><spring:message
										code="xzRyzs-info.xzRyzs-info.input.ftype" text="证书名称" /></label>
								<div class="controls">
									<input id="xzRyzs-info_ftype" type="text" name="ftype"
										style="width:300px;" value="${model.ftype}"
										class="text required" />
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="xzRyzs-info_fcode"><spring:message
										code="xzRyzs-info.xzRyzs-info.input.fcode" text="证书编号" /></label>
								<div class="controls">
									<input id="xzRyzs-info_fcode" type="text" name="fcode"
										value="${model.fcode}" size="" class="text ">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="xzRyzs-info_fhjname"><spring:message
										code="xzRyzs-info.xzRyzs-info.input.fhjname" text="项目名称" /></label>
								<div class="controls">
									<input id="xzRyzs-info_fhjname" type="text" name="fhjname"
										style="width:300px;" value="${model.fhjname}" class="text" />
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="xzRyzs-info_fhuojiangr"><spring:message
										code="xzRyzs-info.xzRyzs-info.input.fhuojiangr" text="获奖人员" /></label>
								<div class="controls">
									<div class="input-append ryPicker">
										<input id="xzRyzs-info_fhuojiangr" type="hidden"
											name="fhuojiangr" value="${model.fhuojiangr}"> <input
											id="xzRyzs-info_fhuojiangr" type="text"
											value="${ryMap[model.fhuojiangr].fname}" disabled
											class=" required" style="width: 175px;" value=""> <span
											class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-user"></i></span>
									</div>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="xzRyzs-info_fbfdanw"><spring:message
										code="xzRyzs-info.xzRyzs-info.input.fbfdanw" text="发证单位" /></label>
								<div class="controls">
									<input id="xzRyzs-info_fbfdanw" type="text" name="fbfdanw"
										style="width:300px;" value="${model.fbfdanw}" size=""
										class="text required">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="xzRyzs-info_fyear"><spring:message
										code="xzRyzs-info.xzRyzs-info.input.fyear" text="获奖年度" /></label>
								<div class="controls">
									<input id="xzRyzs-info_fyear" type="text" name="fyear"
										value="${model.fyear}" size="" class="text required">
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="xzRyzs-info_fmemo"><spring:message
										code="xzRyzs-info.xzRyzs-info.input.fmemo" text="备注" /></label>
								<div class="controls">
									<input id="xzRyzs-info_fmemo" type="text" name="fmemo"
										style="width:300px;" value="${model.fmemo}" class="text ">
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="xzRyzs-info_ffileno"><spring:message
										code="xzRyzs-info.xzRyzs-info.input.ffileno" text="在库状态" /></label>
								<div class="controls">
									<select class="form-control" id="xzZj-info_ffileno"
										name="ffileno">
										<option value="在库"
											<c:if test="${model.ffileno=='在库'}"> selected="selected"  </c:if>>在库</option>
										<option value="未在库"
											<c:if test="${model.ffileno=='未在库'}"> selected="selected"  </c:if>>未在库</option>
									</select>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="xzRyzs-info_fleibie"><spring:message
										code="xzRyzs-info.xzRyzs-info.input.fleibie" text="证书类别" /></label>
								<div class="controls">
									<select class="form-control" id="xzRyzs-info_fleibie"
										name="fleibie">
										<option value="个人荣誉"
											<c:if test="${model.fleibie=='个人荣誉'}"> selected="selected"  </c:if>>个人荣誉</option>
										<option value="企业荣誉"
											<c:if test="${model.fleibie=='企业荣誉'}"> selected="selected"  </c:if>>企业荣誉</option>
										<option value="工程获奖"
											<c:if test="${model.fleibie=='工程获奖'}"> selected="selected"  </c:if>>工程获奖</option>
										<option value="个人工程类获奖"
											<c:if test="${model.fleibie=='个人工程类获奖'}"> selected="selected"  </c:if>>个人工程类获奖</option>
									</select>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="xzRyzs-info_ffzwz"><spring:message
										code="xzRyzs-info.xzRyzs-info.input.ffzwz" text="放置位置" /></label>
								<div class="controls">
									<input id="xzRyzs-info_ffzwz" type="text" name="ffzwz"
										value="${model.ffzwz}" size="" class="text   required">
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
