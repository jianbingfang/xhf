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
<title><spring:message code="dev.xzZjOrder-info.list.title"
		text="列表" /></title>


	<link type="text/css" rel="stylesheet"
		  href="${scopePrefix}/s/xthena/jyxmpicker/jyxmpicker.css">


	<script type="text/javascript"
			src="${scopePrefix}/s/xthena/jyxmpicker/jyxmpicker.js">
	</script>

	<link type="text/css" rel="stylesheet"
		  href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
	<script type="text/javascript"
			src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>



	<%@include file="/common/s.jsp"%>
<script type="text/javascript">
	var config = {
		id : '${lowerName}-infoGrid',
		pageNo : ${page.pageNo},
		pageSize : ${page.pageSize},
		totalCount : ${page.totalCount},
		resultSize : ${page.resultSize},
		pageCount : ${page.pageCount},
		orderBy : '${page.orderBy == null ? "" : page.orderBy}',
		asc : ${page.asc},
		params : {
			'filter_LIKES_name' : '${param.filter_LIKES_name}'
		},
		selectedItemClass : 'selectedItem',
		gridFormId : 'xzZjOrder-infoGridForm',
		exportUrl : 'xzZjOrder-info-export.do'
	};

	var table;

	$(function() {
		table = new Table(config);
		table.configPagination('.m-pagination');
		table.configPageInfo('.m-page-info');
		table.configPageSize('.m-page-size');

		createjyxmPicker({
			modalId : 'jyxmPicker',
			url : '${scopePrefix}/sysconf/jyXm-toubiao-simple-list.do',

		});

		createryPicker({
			modalId : 'ryPicker',
			url : '${scopePrefix}/hr/commRy-simple-list.do'
		});
	});
</script>
</head>
<body>
	<%@include file="/header.jsp"%>
	<div class="row-fluid">
		<%@include file="/menu/xz-workspace.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span10">
			<article class="m-widget">
				<header class="header">
					<h4 class="title">查询</h4>
					<div class="ctrl">
						<a class="btn"><i id="xzZjOrder-infoSearchIcon"
							class="icon-chevron-up"></i></a>
					</div>
				</header>
				<div id="xzZjOrder-infoSearch" class="content content-inner">
					<%--<form name="xzZjOrder-infoForm" method="post"--%>
						<%--action="xzZjOrder-info-list.do" class="form-inline">--%>
						<%--<label for="xzZjOrder-info_name"><spring:message--%>
								<%--code='xzZjOrder-info.xzZjOrder-info.list.search.name' text='名称' />:</label>--%>
						<%--<input type="text" id="xzZjOrder-info_name"--%>
							<%--name="filter_LIKES_name" value="${param.filter_LIKES_name}">--%>
						<%--<button class="btn btn-small a-search"--%>
							<%--onclick="document.xzZjOrder-infoForm.submit()">查询</button>--%>
						<%--&nbsp;--%>
					<%--</form>--%>



					<form name="xzZjOrder-infoForm" method="post" action="xzZjOrder-info-list.do" class="form-inline">

						<label for="xzZjOrder-info_xmid"><spring:message code='jyXmYj-info.jyXmYj-info.list.search.name'
																		  text='项目名称'/>:</label>
						<div class="input-append jyxmPicker">
							<input id="xzZjOrder-info_xmid" type="hidden" name="filter_EQL_fxmid"
								   value="${model.fxmid}"> <input
								id="xzZjOrder-info_xmmc" type="text"
								value="${xmMap[model.fxmid].fname}" disabled
								class=" required" style="width: 175px;" value=""> <span
								class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
								class="icon-th-list"></i></span>
						</div>

						<label for="xzZjOrder-info_zrid"><spring:message code='jyXmYj-info.jyXmYj-info.list.search.name'
																		 text='负责人'/>:</label>
						<div class="input-append ryPicker">
								<input id="xzZjOrder-info_ffzrid" type="hidden" name="filter_EQL_ffzrid"
									   value="${model.ffzrid}"> <input
									id="ryBxRecord-info_ffzrid" type="text"
									value="${ryMap[model.ffzrid].fname}" disabled class=" "
									value=""> <span class="add-on"
													style="padding-top: 2px; padding-bottom: 2px;"><i
									class="icon-user"></i></span>
							</div>

						<%--<input type="text" id="jyXmYj-info_name" name="filter_LIKES_fname" value="${param.filter_LIKES_fname}">--%>
						<button class="btn btn-small a-search" onclick="document.xzZjOrder-infoForm.submit()">查询</button>&nbsp;
					</form>




				</div>
			</article>
			<article class="m-blank">
				<div class="pull-left">
					<region:region-permission permission="xzZjOrder-info:create">
						<button class="btn btn-small a-insert"
							onclick="location.href='xzZjOrder-info-input.do'">新建</button>
					</region:region-permission>

					<region:region-permission permission="xzZjOrder-info:delete">
						<button class="btn btn-small a-remove" onclick="table.removeAll()">删除</button>
					</region:region-permission>

					<%--<button class="btn btn-small a-export"--%>
						<%--onclick="table.exportExcel()">导出</button>--%>
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
						<spring:message code="xzZjOrder-info.xzZjOrder-info.list.title"
							text="列表" />
					</h4>
				</header>
				<div class="content">
					<form id="xzZjOrder-infoGridForm" name="xzZjOrder-infoGridForm"
						method='post' action="xzZjOrder-info-remove.do"
						class="m-form-blank">
						<table id="xzZjOrder-infoGrid" class="m-table table-hover table-bordered">
							<thead>
								<tr>
									<th width="10" class="m-table-check"><input
										type="checkbox" name="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th>
									<!-- <th class="sorting" name="forderno">订单编号</th> -->
									<th class="sorting" name="fstatus">状态</th>
									<th class="sorting" name="fcreatetime">创建时间</th>
									<th class="sorting" name="fstarttime">开始使用时间</th>
									<th class="sorting" name="fendtime">使用截止时间</th>
									<th class="sorting" name="ffzrid">负责人</th>
									<th class="sorting" name="fxmid">使用项目</th>
									<!-- 	<th class="sorting" name="fmemo">备注</th> -->
									<th class="sorting" name="fbackdate">归还时间</th>
									<th width="80">&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.result}" var="item">
									<tr>
										<td><input type="checkbox" class="selectedItem a-check"
											name="selectedItem" value="${item.fid}"></td>
										<%--  <td>${item.forderno}</td> --%>
										<td>${item.fstatus}</td>
										<td>${item.fcreatetime}</td>
										<td>${item.fstarttime}</td>
										<td>${item.fendtime}</td>
										<td>${ryMap[item.ffzrid].fname}</td>
										<td>${xmMap[item.fxmid].fname}</td>
										<%-- <td>${item.fmemo}</td> --%>
										<td>${item.fbackdate}</td>
										<td><a href="xzZjOrder-info-input.do?id=${item.fid}"
											class="a-update"><spring:message code="core.list.edit"
													text="编辑" /></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</form>
				</div>
			</article>
			<article>
				<div class="m-page-info pull-left">共100条记录 显示1到10条记录</div>
				<div class="btn-group m-pagination pull-right">
					<button class="btn btn-small">&lt;</button>
					<button class="btn btn-small">1</button>
					<button class="btn btn-small">&gt;</button>
				</div>
				<div class="m-clear"></div>
			</article>
			<div class="m-spacer"></div>
		</section>
		<!-- end of main -->
	</div>
</body>
</html>
