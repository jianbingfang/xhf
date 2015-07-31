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
<title><spring:message code="xzZj-info.xzZj-info.input.title"
		text="公司证件 - 公司档案管理 - 行政管理" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript">
	$(function() {
		$("#xzZj-infoForm")
				.validate(
						{
							submitHandler : function(form) {
								bootbox.animate(false);
								var box = bootbox
										.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
								form.submit();
							},
							errorClass : 'validate-error',
						});
		$("#confirmBtn").click(function() {
			saveFile();
		});

		loadFujian($('#xzZj-info_id').val());

	});
	function addScanFile() {
		if (!$('#xzZj-info_id').val()) {
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
				zjId : $('#xzZj-info_id').val(),
				jlFujians : JSON.stringify(fujianFiles),
				tableName:'t_xz_zj'
			},

			async : false,
			success : function(data) {
				if (data = 'ok') {
					loadScanFile($('#xzZj-info_id').val());
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
					loadScanFile($('#xzZj-info_id').val());
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
						fmaintable : 't_xz_zj'
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
		<%@include file="/menu/xz-workspace.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span10">
		<%@include file="../comm/comm-upload.jsp"%>
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="xzZj-info.xzZj-info.input.title" text="编辑" />
					</h4>
				</header>
				<div class="content content-inner">
					<!-- <div class=" span6"> -->
						<form id="xzZj-infoForm" method="post" action="xzZj-info-save.do"
							class="form-horizontal ">
							<c:if test="${model != null}">
								<input id="xzZj-info_id" type="hidden" name="fid"
									value="${model.fid}">
							</c:if>
							<div class="control-group">
								<div class="span5">
							<div class="control-group">
								<label class="control-label" for="xzZj-info_fcode"><spring:message
										code="xzZj-info.xzZj-info.input.fcode" text="证件编号" /></label>
								<div class="controls">
									<input id="xzZj-info_fcode" type="text" name="fcode"
										value="${model.fcode}" size="" class="text required"
										minlength="" maxlength="">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="xzZj-info_fname"><spring:message
										code="xzZj-info.xzZj-info.input.fname" text="证件名称" /></label>
								<div class="controls">
									<input id="xzZj-info_fname" type="text" name="fname"
										value="${model.fname}" size="" class="text required"
										minlength="" maxlength="">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="xzZj-info_fnum"><spring:message
										code="xzZj-info.xzZj-info.input.fnum" text="份数" /></label>
								<div class="controls">
									<input id="xzZj-info_fnum" type="number" name="fnum"
										value="${model.fnum}" size="" class="number"
										minlength="" maxlength="">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="xzZj-info_fendate"><spring:message
										code="xzZj-info.xzZj-info.input.fendate" text="到期时间" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="xzZj-info_fendate" type="text" name="fendate"
											value="${model.fendate}" size="40" class="text "
											style="background-color:white;cursor:default; width: 175px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="xzZj-info_fzkstate"><spring:message
										code="xzZj-info.xzZj-info.input.fzkstate" text="在库状态" /></label>
								<div class="controls">
									<select class="form-control" id="xzZj-info_fzkstate"
										name="fzkstate">
										<option value="在库"
											<c:if test="${model.fzkstate=='在库'}"> selected="selected"  </c:if>>在库</option>
										<option value="未在库"
											<c:if test="${model.fzkstate=='未在库'}"> selected="selected"  </c:if>>未在库</option>
									</select>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="xzZj-info_ffzwz"><spring:message
										code="xzZj-info.xzZj-info.input.ffzwz" text="放置位置" /></label>
								<div class="controls">
									<input id="xzZj-info_ffzwz" type="text" name="ffzwz"
										value="${model.ffzwz}" size="" class="text   required">
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
					<!-- </div> -->
					<%-- <div class="control-group">
				    <label class="control-label" for="xzZj-info_fiswarn"><spring:message code="xzZj-info.xzZj-info.input.fiswarn" text="到期提醒"/></label>
					<div class="controls">
				      	 <select class="form-control" id="xzZj-info_fiswarn" name="fiswarn" value="${model.fiswarn}" class=" " >
					    	 	<option value="是"  <c:if test="${model.fiswarn}=='是'}"> selected="selected"  </c:if>>是</option>
					    	 	<option value="否"  <c:if test="${model.fiswarn}=='否'}"> selected="selected"  </c:if>>否</option>
					 	</select>
				    </div>
				  </div> --%>
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
