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
		code="hrRyZj-info.hrRyZj-info.input.title" text="证件管理- 员工管理 - 人力资源" /></title>
<%@include file="/common/s.jsp"%>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
<script type="text/javascript">
	$(function() {
		$("#hrRyZj-infoForm")
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

		loadFujian($('#hrRyZj-info_id').val());

	});

	function addScanFile() {
		if (!$('#hrRyZj-info_id').val()) {
			alert("请先保存证件信息！");
			return;
		}
		showUpload();
	}

	function showFmemo() {
		if ($('#hrRyZj-info_fstatus').val() == 3) {
			$('#memoDiv').show();
		} else {
			hideFmemo();
		}

	}
	function hideFmemo() {
		$('#hrRyZj-info_fmemo').val('');
		$('#memoDiv').hide();
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
			url : '${scopePrefix}/hr/saveZjScan.do',
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			type : 'POST',
			data : {
				zjId : $('#hrRyZj-info_id').val(),
				jlFujians : JSON.stringify(fujianFiles)
			},

			async : false,
			success : function(data) {
				if (data = 'ok') {
					loadScanFile($('#hrRyZj-info_id').val());
				}
			}
		});
		$(".uploadModal").modal('hide');
	}

	function deleteImg(id) {
		$.ajax({
			url : '${scopePrefix}/hr/deleteImg.do',
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			type : 'POST',
			data : {
				fjId : id,
			},
			async : false,
			success : function(data) {
				if (data = 'ok') {
					loadScanFile($('#hrRyZj-info_id').val());
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
						fmaintable : 't_hr_ry_zj'
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
		<%@include file="/menu/hr-workspace.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span10">
		<!-- 	<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="hr-home.do">人力资源</a> <span class="divider">/</span>
							</li>
							<li>员工培训<span class="divider">/</span>
							</li>
							<li class="active">证件管理</li>
						</ul>
					</div>
				</div>
			</div> -->
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="hrRyZj-info.hrRyZj-info.input.title"
							text="编辑" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="hrRyZj-infoForm" method="post"
						action="hrRyZj-info-save.do" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="hrRyZj-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<div class="control-group">
							<div class="span5">
								<div class="control-group">
									<label class="control-label" for="hrRyZj-info_userid"><spring:message
											code="hrLdht-info.hrLdht-info.input.userid" text="姓名" /></label>
									<div class="controls">
										<div class="input-append ryPicker">
											<input id="hrRyZj-info_userid" type="hidden" name="userid"
												value="${model.userid}" required="required"> <input
												id="hrRyZj-info_userName" type="text"
												value="${ryMap[model.userid].fname}" disabled
												class=" required" style="width: 175px;" value=""> <span
												class="add-on"
												style="padding-top: 2px; padding-bottom: 2px;"><i
												class="icon-user"></i></span>
										</div>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="hrRyZj-info_fzhengjianno"><spring:message
											code="hrRyZj-info.hrRyZj-info.input.fzhengjianno" text="证书编号" /></label>
									<div class="controls">
										<input id="hrRyZj-info_fzhengjianno" type="text"
											name="fzhengjianno" value="${model.fzhengjianno}" size="40"
											class="text required"
											style="background-color:white;cursor:default; width: 175px;">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="hrRyZj-info_fzcno"><spring:message
											code="hrRyZj-info.hrRyZj-info.input.fzcno" text="注册号" /></label>
									<div class="controls">
										<input id="hrRyZj-info_fzcno" type="text" name="fzcno"
											value="${model.fzcno}" size="40" class="text"
											style="background-color:white;cursor:default; width: 175px;">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="hrRyZj-info_fname"><spring:message
											code="hrRyZj-info.hrRyZj-info.input.fname" text="证书名称" /></label>
									<div class="controls">
										<select class="form-control" id="hrRyZj-info_name"
											name="fname" value="${model.fname}" class=" required">
											<option value="身份证"
												<c:if test="${model.fname=='身份证'}"> selected="selected"  </c:if>>身份证</option>
											<option value="毕业证"
												<c:if test="${model.fname=='毕业证'}"> selected="selected"  </c:if>>毕业证</option>
											<option value="监理工程师注册证"
												<c:if test="${model.fname=='监理工程师注册证'}"> selected="selected"  </c:if>>监理工程师注册证</option>
											<option value="监理工程师资格证"
												<c:if test="${model.fname=='监理工程师资格证'}"> selected="selected" </c:if>>监理工程师资格证</option>
											<option value="一级建造师注册证"
												<c:if test="${model.fname=='一级建造师注册证'}"> selected="selected"  </c:if>>一级建造师注册证</option>
											<option value="一级建造师资格证"
												<c:if test="${model.fname=='一级建造师资格证'}"> selected="selected"  </c:if>>一级建造师资格证</option>
											<option value="一级建造师继续教育证"
												<c:if test="${model.fname=='一级建造师继续教育证'}"> selected="selected"  </c:if>>一级建造师继续教育证</option>
											<option value="二级建造师注册证"
												<c:if test="${model.fname=='二级建造师注册证'}"> selected="selected"  </c:if>>二级建造师注册证</option>
											<option value="二级建造师资格证"
												<c:if test="${model.fname=='二级建造师资格证'}"> selected="selected"  </c:if>>二级建造师资格证</option>
											<option value="造价师注册证"
												<c:if test="${model.fname=='造价师注册证'}"> selected="selected" </c:if>>造价师注册证</option>
											<option value="造价师资格证"
												<c:if test="${model.fname=='造价师资格证'}"> selected="selected"  </c:if>>造价师资格证</option>
											<option value="造价师继续教育证"
												<c:if test="${model.fname=='造价师继续教育证'}"> selected="selected"  </c:if>>造价师继续教育证</option>
											<option value="交通部监理工程师资格证"
												<c:if test="${model.fname=='交通部监理工程师资格证'}"> selected="selected"  </c:if>>交通部监理工程师资格证</option>
											<option value="交通部监理工程师注册证"
												<c:if test="${model.fname=='交通部监理工程师注册证'}"> selected="selected"  </c:if>>交通部监理工程师注册证</option>
											<option value="专业监理工程师证"
												<c:if test="${model.fname=='专业监理工程师证'}"> selected="selected" </c:if>>专业监理工程师证</option>
											<option value="高级工程师职称证"
												<c:if test="${model.fname=='高级工程师职称证'}"> selected="selected"  </c:if>>高级工程师职称证</option>
											<option value="中级工程师职称证"
												<c:if test="${model.fname=='中级工程师职称证'}"> selected="selected"  </c:if>>中级工程师职称证</option>
											<option value="初级工程师职称证"
												<c:if test="${model.fname=='初级工程师职称证'}"> selected="selected"  </c:if>>初级工程师职称证</option>
											<option value="监理员证"
												<c:if test="${model.fname=='监理员证'}"> selected="selected"  </c:if>>监理员证</option>
											<option value="资料员证"
												<c:if test="${model.fname=='资料员证'}"> selected="selected" </c:if>>资料员证</option>
											<option value="见证员证"
												<c:if test="${model.fname=='见证员证'}"> selected="selected"  </c:if>>见证员证</option>
											<option value="安全员证"
												<c:if test="${model.fname=='安全员证'}"> selected="selected"  </c:if>>安全员证</option>
											<option value="造价员证"
												<c:if test="${model.fname=='造价员证'}"> selected="selected"  </c:if>>造价员证</option>
											<option value="试验员证"
												<c:if test="${model.fname=='试验员证'}"> selected="selected"  </c:if>>试验员证</option>
											<option value="建筑节能培训证"
												<c:if test="${model.fname=='建筑节能培训证'}"> selected="selected" </c:if>>建筑节能培训证</option>
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="hrRyZj-info_fzhuanye"><spring:message
											code="hrRyZj-info.hrRyZj-info.input.fzhuanye" text="专业" /></label>
									<div class="controls">
										<input id="hrRyZj-info_fzhuanye" type="text" name="fzhuanye"
											value="${model.fzhuanye}" size="" class="text" minlength=""
											maxlength="">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="hrRyZj-info_fyxqks"><spring:message
											code="hrRyZj-info.hrRyZj-info.input.fyxqks" text="发证日期" /></label>
									<div class="controls">
										<div class="input-append datepicker date"
											style="padding-left: 0px;">
											<input id="hrRyZj-info_fyxqks" type="text" name="fyxqks"
												value="${model.fyxqks}" size="40" class="text "
												style="background-color:white;cursor:default; width: 175px;" />
											<span class="add-on"
												style="padding-top: 2px; padding-bottom: 2px;"><i
												class="icon-calendar"></i></span>
										</div>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="hrRyZj-info_fyxjs"><spring:message
											code="hrRyZj-info.hrRyZj-info.input.fyxjs" text="到期日期" /></label>
									<div class="controls">
										<div class="input-append datepicker date"
											style="padding-left: 0px;">
											<input id="hrRyZj-info_fyxjs" type="text" name="fyxjs"
												value="${model.fyxjs}" size="40" class="text"
												style="background-color:white;cursor:default; width: 175px;">
											<span class="add-on"
												style="padding-top: 2px; padding-bottom: 2px;"><i
												class="icon-calendar"></i></span>
										</div>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="hrRyZj-info_fyxjs"><spring:message
											code="hrRyZj-info.hrRyZj-info.input.fyxjs" text="领取日期" /></label>
									<div class="controls">
										<div class="input-append datepicker date"
											style="padding-left: 0px;">
											<input id="hrRyZj-info_fyxjs" type="text" name="flingqudate"
												value="${model.flingqudate}" size="40" class=""
												style="background-color:white;cursor:default; width: 175px;">
											<span class="add-on"
												style="padding-top: 2px; padding-bottom: 2px;"><i
												class="icon-calendar"></i></span>
										</div>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="hrRyZj-info_fstatus"><spring:message
											code="hrRyZj-info.hrRyZj-info.input.fstatus" text="状态" /></label>
									<div class="controls">
										<select class="form-control" id="hrRyZj-info_fstatus"
											name="fstatus" value="${model.fstatus}"
											class=" text required" onchange="showFmemo()">
											<option value="在库"
												<c:if test="${model.fstatus=='在库'}"> selected="selected"  </c:if>>在库</option>
											<option value="到期"
												<c:if test="${model.fstatus=='到期'}"> selected="selected"  </c:if>>到期</option>
											<option value="暂借"
												<c:if test="${model.fstatus=='暂借'}"> selected="selected"  </c:if>>暂借</option>
											<option value="其他"
												<c:if test="${model.fstatus=='其他'}"> selected="selected"  </c:if>>其他</option>
										</select>
									</div>
								</div>
								<div class="control-group"
									<c:if test="${model.fstatus!='暂借'}">  hidden="hidden" </c:if>
									id="memoDiv">
									<label class="control-label" for="hrRyZj-info_fmemo"><spring:message
											code="hrRyZj-info.hrRyZj-info.input.fmemo" text="备注" /></label>
									<div class="controls">
										<input id="hrRyZj-info_fmemo" type="text" name="fmemo"
											value="${model.fmemo}" size="" class="text required"
											minlength="" maxlength="">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="hrRyZj-info_fwz"><spring:message
											code="hrRyZj-info.hrRyZj-info.input.fwz" text="放置位置" /></label>
									<div class="controls">
										<input id="hrRyZj-info_fwz" type="text" name="fwz"
											value="${model.fwz}" size="" class="text required"
											minlength="" maxlength="">
									</div>
								</div>
								<div class="control-group">
									<div class="controls">
										<button type="submit" class="btn a-submit">
											<spring:message code='core.input.save' text='保存' />
										</button>
										&nbsp;
										<button type="submit" class="btn a-submit"
											formaction="hrRyZj-info-saveAndNew.do">
											<spring:message code='core.input.save' text='保存并新建' />
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
	</div>
	</article>
	</section>
	<!-- end of main -->
	</div>
</body>
</html>
