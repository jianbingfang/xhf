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
		code="xzRedTape-wb-info.xzRedTape-wb-info.input.title"
		text="红头文件（外）- 公司档案管理 - 行政管理" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript" src="${ctx}/s/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	$(function() {
		$("#xzRedTape-wb-infoForm")
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
		$("#confirmBtn").click(function() {
			saveFile();
		});

		loadFujian($('#xzRedTape-wb-info_id').val());
		loadEditor();
	});
	
	function loadEditor(){
		editor = CKEDITOR.replace('xzRedTape-wb-info_fhjxm');
		editor.config.filebrowserImageUploadUrl = "${scopePrefix}/comm/editor-article-uploadImage.do";
		editor.config.height = 100; 
		editor1 = CKEDITOR.replace('xzRedTape-wb-info_fzj');
		editor1.config.filebrowserImageUploadUrl = "${scopePrefix}/comm/editor-article-uploadImage.do";
		editor1.config.height = 100; 
	}
	function addScanFile() {
		if (!$('#xzRedTape-wb-info_id').val()) {
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
				zjId : $('#xzRedTape-wb-info_id').val(),
				jlFujians : JSON.stringify(fujianFiles),
				tableName:'t_xz_redtape'
			},

			async : false,
			success : function(data) {
				if (data = 'ok') {
					loadScanFile($('#xzRedTape-wb-info_id').val());
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
					loadScanFile($('#xzRedTape-wb-info_id').val());
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
						fmaintable : 't_xz_redtape'
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
						<spring:message
							code="xzRedTape-wb-info.xzRedTape-wb-info.input.title" text="编辑" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="xzRedTape-wb-infoForm" method="post"
						action="xzRedTape-wb-info-save.do" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="xzRedTape-wb-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<div class="control-group">
							<div class="span6">
							<div class="control-group">
									<label class="control-label" for="xzRedTape-wb-info_fcode"><spring:message
											code="xzRedTape-wb-info.xzRedTape-wb-info.input.fcode"
											text="编号" /></label>
									<div class="controls">
										<input id="xzRedTape-wb-info_ftapeno" type="text"
											name="fcode" value="${model.fcode}" size=""
											class="text required" maxlength="">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="xzRedTape-wb-info_ftapeno"><spring:message
											code="xzRedTape-wb-info.xzRedTape-wb-info.input.ftapeno"
											text="文件号" /></label>
									<div class="controls">
										<input id="xzRedTape-wb-info_ftapeno" type="text"
											name="ftapeno" value="${model.ftapeno}" size=""
											class="text required" maxlength="">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="xzRedTape-wb-info_ftaptitle"><spring:message
											code="xzRedTape-wb-info.xzRedTape-wb-info.input.ftaptitle"
											text="标题" /></label>
									<div class="controls">
										<input id="xzRedTape-wb-info_ftaptitle" type="text"
											name="ftaptitle" value="${model.ftaptitle}" size=""
											class="text required" maxlength="4000">
									</div>
								</div>
									<div class="control-group">
									<label class="control-label" for="xzRedTape-wb-info_fhjxm"><spring:message
											code="xzRedTape-wb-info.xzRedTape-wb-info.input.fhjxm"
											text="获奖工程名称" /></label>
									<div class="controls">
										<textarea id="xzRedTape-wb-info_fhjxm" 
											name="fhjxm" rows="3"
											class="text " maxlength="2000">${model.fhjxm}</textarea>
									</div>
								</div>
									<div class="control-group">
									<label class="control-label" for="xzRedTape-wb-info_fzj"><spring:message
											code="xzRedTape-wb-info.xzRedTape-wb-info.input.fzj"
											text="获奖人员" /></label>
									<div class="controls">
										<textarea id="xzRedTape-wb-info_fzj" 
											name="fzj" rows="3"
											class="text " maxlength="2000">${model.fzj}</textarea>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label"
										for="xzRedTape-wb-info_fcreatedate"><spring:message
											code="xzRedTape-wb-info.xzRedTape-wb-info.input.fcreatedate"
											text="日期" /></label>
									<div class="controls">
										<div class="input-append datepicker date"
											style="padding-left: 0px;">
											<input id="xzRedTape-wb-info_fcreatedate" type="text"
												name="fcreatedate" value="${model.fcreatedate}" size="40"
												class="text "
												style="background-color:white;cursor:default; width: 175px;">
											<span class="add-on"
												style="padding-top: 2px; padding-bottom: 2px;"><i
												class="icon-calendar"></i></span>
										</div>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="xzRedTape-wb-info_fsend"><spring:message
											code="xzRedTape-wb-info.xzRedTape-wb-info.input.fsend"
											text="发文单位" /></label>
									<div class="controls">
										<input id="xzRedTape-wb-info_fsend" type="text" name="fsend"
											value="${model.fsend}" size="" class="text required"
											maxlength="">
									</div>
								</div>
							<%-- 	<div class="control-group">
									<label class="control-label" for="xzRedTape-wb-info_frecive"><spring:message
											code="xzRedTape-wb-info.xzRedTape-wb-info.input.frecive"
											text="接收单位" /></label>
									<div class="controls">
										<input id="xzRedTape-wb-info_frecive" type="text"
											name="frecive" value="${model.frecive}" size="" class="text "
											maxlength="">
									</div>
								</div> --%>
								<div class="control-group">
									<label class="control-label" for="xzRedTape-wb-info_ffzwz"><spring:message
											code="xzRedTape-wb-info.xzRedTape-wb-info.input.ffzwz"
											text="放置位置" /></label>
									<div class="controls">
										<input id="xzRedTape-wb-info_ffzwz" type="text" name="ffzwz"
											value="${model.ffzwz}" size="" class="text " maxlength="">
									</div>
								</div>
								
								
								<div class="control-group">
									<label class="control-label" for="xzRedTape-wb-info_fzkstate"><spring:message
											code="xzRedTape-wb-info.xzRedTape-wb-info.input.fzkstate"
											text="在库状态" /></label>
									<div class="controls">
											<select class="form-control" id="xzRedTape-info_fzkstate" name="fzkstate" >
										    	 	<option value="在库"  <c:if test="${model.fzkstate=='在库'}"> selected="selected"  </c:if>>在库</option>
										    	 	<option value="未在库"  <c:if test="${model.fzkstate=='未在库'}"> selected="selected"  </c:if>>未在库</option>
										 	</select>
									</div>
								</div>
								
								
							
					 	
								<div class="control-group">
									<label class="control-label" for="xzRedTape-wb-info_ftapename"><spring:message
											code="xzRedTape-wb-info.xzRedTape-wb-info.input.ftapename"
											text="文件内容" /></label>
									<div class="controls">
										<textarea id="xzRedTape-wb-info_ftapename" name="ftapename"
											class="form-control" rows="6" class="text  required"
											maxlength="">${model.ftapename}</textarea>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="xzRedTape-wb-info_fmemo"><spring:message
											code="xzRedTape-wb-info.xzRedTape-wb-info.input.fmemo"
											text="备注" /></label>
									<div class="controls">
										<textarea id="xzRedTape-wb-info_fmemo" name="fmemo"
											class="form-control" rows="3" class="text  "
											maxlength="4,000">${model.fmemo}</textarea>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="xzRedTape-wb-info_furl"><spring:message
											code="xzRedTape-wb-info.xzRedTape-wb-info.input.furl"
											text="文件链接" /></label>
									<div class="controls">
										<input id="xzRedTape-wb-info_furl" type="text" name="furl"
											value="${model.furl}" size="" class="text " maxlength=""><a
											href="${model.furl}" target="_blank"><span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
												class="icon-paperclip"></i></span></a>
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
