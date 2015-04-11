<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "gcgl-home");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message
		code="jlFujian-info.jlFujian-info.input.title" text="编辑" /></title>
<%@include file="/common/s.jsp"%>

<script type="text/javascript">
	$(function() {
		loadProcessBar();
	});

	function loadProcessBar() {
		//for jsfiddle so its mobile friendly.
		$('head')
				.append(
						'<meta name="viewport" content="width=device-width, initial-scale=1" />');

		var $alert = $($(".alert"));
		var $p = $($(".progress"));
	}

	function showJifDiv() {
		$('#jlfDiv').modal();
	}

	function saveXmjlf() {
		$('#pjXmJd-infoForm').submit();
	}

	
</script>
</head>
<body>
	<%@include file="/header.jsp"%>
	<div class="row-fluid">
		<%@include file="/menu/gcgl-workspace.jsp"%>
		<!-- start of main -->
		<%-- <div id="jlfDiv" class="modal hide fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
						</button>
						<h4 class="modal-title" id="fryName">监理费回收</h4>
					</div>
					<div class="modal-body">
						<form id="pjXmJd-infoForm" method="post"
							action="jlfRecord-info-save.do">
							<input id="pjXmJd-info_id" type="hidden" name="fid">
							<div class="control-group">
								<label class="control-label" for="pjXmJd-info_fhtjlf"><spring:message
										code="pjXmJd-info.pjXmJd-info.input.fjlf" text="监理费" /></label>
								<div class="controls">
									<input id="pjXmJd-info_fhtjlf" type="text" name="fhtjlf"
										size="" class="number" maxlength="">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="pjXmJd-info_fmemo"><spring:message
										code="pjXmJd-info.pjXmJd-info.input.fmemo" text="备注" /></label>
								<div class="controls">
									<textarea id="pjXmJd-info_fmemo" name="fmemo"
										class="form-control" rows="6" style="width: 450px"
										class="text" maxlength="500"></textarea>
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button id="uploadPickerBtnSelect" onclick="saveXmjlf()"
							type="button" class="btn btn-primary">保存</button>
					</div>
				</div>
			</div>
		</div> --%>
		<section id="m-main" class="span10">
			<div class="content content-inner form-horizontal">
				<div class="control-group">
					<div class="span5">
						<label class="control-label" for="commHt-info_fjianlifei"><spring:message
								code="commHt-info.commHt-info.input.fjianlifei" text="合同款额" /></label>
						<div class="controls">
							<input id="commHt-info_fjiafang" type="number" name="fjianlifei"
								value="${jlf.fjianlifei}" size="" class="number" maxlength="">
						</div>
					</div>
					<div class="span5">
						<label class="control-label" for="commHt-info_fhtgq"><spring:message
								code="commHt-info.commHt-info.input.fhtgq" text="合同工期" /></label>
						<div class="controls">
							<input id="commHt-info_fhtgq" type="text" name="fhtgq"
								value="${jlf.fhtgq}" size="" class="text" maxlength="">
						</div>
					</div>
				</div>
				<div class="control-group">
						<label class="control-label" for="commHt-info_fpaytype"><spring:message
								code="commHt-info.commHt-info.input.fpaytype" text="支付方式" /></label>
						<div class="controls">
							<textarea id="commHt-info_fpaytype" name="fpaytype" rows="5"
								style="width: 100%;" maxlength="">${commHt.fpaytype}</textarea>
						</div>
				</div>
				<div class="control-group">
					<div class="span5">
						<label class="control-label" for="commHt-info_jlfSum"><spring:message
								code="commHt-info.commHt-info.input.jlfSum" text="已收监理费" /></label>
						<div class="controls">
							<input id="commHt-info_jlfSum" type="number" name="jlfSum"
								value="${jlf.jlfSum}" size="" class="number " maxlength=""> <span
								class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
								class="icon-th-list"></i></span>
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="span5">
						<label class="control-label" for="commHt-info_fjianlifei"><spring:message
								code="commHt-info.commHt-info.input.fjianlifei" text="fjianlifei" /></label>
						<div class="controls">
							<input id="commHt-info_fjianlifei" type="text" name="fjianlifei"
								value="${jlf.fjianlifei}" size="" class="text " maxlength=""> <span
								class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
								class="icon-th-list"></i></span>
						</div>
					</div>
					<div class="span5">
						<label class="control-label" for="commHt-info_fjianlifei"><spring:message
								code="commHt-info.commHt-info.input.fjianlifei" text="本期应收监理费" /></label>
						<div class="controls">
							<input id="commHt-info_fjiafang" type="text" name="fjianlifei"
								value="${jlfSum}" size="" class="text " maxlength="">
						</div>
					</div>
				</div>
					
				<div class="control-group">
				        <label class="control-label" for="commHt-info_fmemo"><spring:message
								code="commHt-info.commHt-info.input.fmemo" text="备注（原因分析）" /></label>
						<div class="controls">
							<textarea id="commHt-info_fmemo" name="fmemo" rows="5"
								style="width: 100%;" maxlength="">${jlf.fmemo}</textarea>
						</div>
				</div>
			</div>
			<%-- <article class="m-blank">
				<div class="pull-left">
					<region:region-permission permission="jlfRecord-info:create">
						<button class="btn btn-small a-insert" onclick="showJifDiv()">新建</button>
					</region:region-permission>
				</div>
				<div class="pull-right">
					每页显示 <select class="m-page-size">
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="50">50</option>
					</select> 条
				</div>
				<div class="m-clear"></div>
			</article>
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="jlfRecord-info.jlfRecord-info.list.title"
							text="列表" />
					</h4>
				</header>
				<div class="content">
					<form id="jlfRecord-infoGridForm" name="jlfRecord-infoGridForm"
						method='post' action="jlfRecord-info-remove.do"
						class="m-form-blank">
						<table id="jlfRecord-infoGrid" class="m-table table-hover table-bordered">
							<thead>
								<tr>
									<th width="10" class="m-table-check"><input
										type="checkbox" name="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th>
									<th class="sorting" name="fhtjlf">监理费</th>
									<th class="sorting" name="fshouqudate">收取时间</th>
									<th class="sorting" name="fmemo">备注</th>
									<th width="80">&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.result}" var="item">
									<tr>
										<td><input type="checkbox" class="selectedItem a-check"
											name="selectedItem" value="${item.fid}"></td>
										<td>${item.fhtjlf}</td>
										<td>${item.fshouqudate}</td>
										<td>${item.fmemo}</td>
										<td><a href="jlfRecord-info-input.do?id=${item.fid}"
											class="a-update"><spring:message code="core.list.edit"
													text="编辑" /></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</form>
				</div>
			</article> --%>
		</section>
	</div>
</body>
</html>
