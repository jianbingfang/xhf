<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "xz-home");
%>
<%
	pageContext.setAttribute("currentMenu", "xz-wz");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="dev.wzList-info.list.title"
		text="列表" /></title>
<%@include file="/common/s.jsp"%>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/xmpicker/xmpicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/xmpicker/xmpicker.js"></script>
<script type="text/javascript">
	var gdconfig = {
		id : 'wzList-infoGrid',
		pageNo : ${page.pageNo},
		pageSize : ${page.pageSize},
		totalCount : ${page.totalCount},
		resultSize : ${page.resultSize},
		pageCount : ${page.pageCount},
		orderBy : '${page.orderBy == null ? "" : page.orderBy}',
		asc : ${page.asc},
		params : {
			'filter_LIKES_projectname' : '${param.filter_LIKES_projectname}',
			'filter_LIKES_fname' : '${param.filter_LIKES_fname}',
			'filter_LIKES_fcode' : '${param.filter_LIKES_fcode}',
			'filter_LIKES_flyr':'${param.filter_LIKES_flyr}'
		},
		selectedItemClass : 'selectedItem',
		gridFormId : 'wzList-infoGridForm',
		exportUrl : 'wzList-info-export.do'
	};
	createxmPicker({
		modalId : 'xmPicker',
		url : '${scopePrefix}/gcgl/pjXm-simple-list.do'
	});
	createryPicker({
		modalId : 'ryPicker',
		url : '${scopePrefix}/hr/commRy-simple-list.do'
	});
	var gdtable;

	$(function() {
		gdtable = new Table(gdconfig);
		gdtable.configPagination('.m-pagination');
		gdtable.configPageInfo('.m-page-info');
		gdtable.configPageSize('.m-page-size');
	});
</script>
</head>
<body>
	<div class="row-fluid">
		<!-- start of main -->
		<section id="m-main" class="span12">
			<article class="m-widget">
				<header class="header">
					<h4 class="title">查询</h4>
					<div class="ctrl">
						<a class="btn"><i id="wzList-infoSearchIcon"
							class="icon-chevron-up"></i></a>
					</div>
				</header>
				<div id="wzList-infoSearch" class="content content-inner">
					<form name="wzList-infoForm" method="post"
						action="wzList-gz-info-list.do" class="form-inline">
						<label for="wzList-info_fcode"><spring:message
								code='wzList-info.wzList-info.list.search.fcode' text='物资编码' />:</label>
						<input type="text" id="wzList-info_fcode"
							name="filter_LIKES_fcode" value="${param.filter_LIKES_fcode}">
						<label for="wzList-info_fname"><spring:message
								code='wzList-info.wzList-info.list.search.fname' text='物资名称' />:</label>
						<input type="text" id="wzList-info_fname"
							name="filter_LIKES_fname" value="${param.filter_LIKES_fname}">
						<label for="wzList-info_fprojectname"><spring:message
								code='wzList-info.wzList-info.list.search.fprojectname'
								text='项目名称' />:</label> <input type="text"
							id="wzList-info_fprojectname" name="filter_LIKES_fprojectname"
							value="${param.filter_LIKES_fprojectname}">
								<label for="wzList-info_flyr"><spring:message
								code='wzList-info.wzList-info.list.search.flyr' text='领用人' />:</label>
						<input type="text" id="wzList-info_flyr"
							name="filter_LIKES_flyr" value="${param.filter_LIKES_flyr}">
						<button class="btn btn-small a-search"
							onclick="document.wzList-infoForm.submit()">查询</button>
						&nbsp;
					</form>
				</div>
			</article>
			<article class="m-blank">
				<div class="pull-left">
					<region:region-permission permission="wzList-info:create">
						<button class="btn btn-small a-insert"
							onclick="location.href='wzList-info-input.do'">新建</button>
					</region:region-permission>
					<region:region-permission permission="wzList-info:delete">
					<button class="btn btn-small a-remove" onclick="gdtable.removeAll()">删除</button>
					</region:region-permission>
					<%--<button class="btn btn-small a-export"--%>
						<%--onclick="gdtable.exportExcel()">导出</button>--%>
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
						<spring:message code="wzList-info.wzList-info.list.title"
							text="列表" />
					</h4>
				</header>
				<div class="content">
					<form id="wzList-infoGridForm" name="wzList-infoGridForm"
						method='post' action="wzList-gd-info-remove.do" class="m-form-blank">
						<table id="wzList-infoGrid" class="m-table table-hover table-bordered">
							<thead>
								<tr>
									<th width="10" class="m-table-check"><input
										type="checkbox" name="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th>
									<th class="sorting" name="fcode">物资编码</th>
									<!-- <th class="sorting" id="ftype">物品类别</th> -->
									<th class="sorting" id="fname">名称</th>
									<th class="sorting" id="fgg">规格</th>
									<th class="sorting" id="flyr">领用人</th>
									<!-- <th class="sorting" id="fnum">数量</th> -->
									<th class="sorting" id="flydate">领用日期</th>
									<th class="sorting" id="fxmid">所在项目</th>
									<th class="sorting" id="fxmfzr">负责人</th>
									<th class="sorting" id="fsystate">使用状态</th>
									<th class="sorting" id="fxjstate">新旧程度</th>
									<th width="80">&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.result}" var="item">
									<tr>
										<td><input type="checkbox" class="selectedItem a-check"
											id="selectedItem" name="selectedItem" value="${item.fid}"></td>
										<td><a href="wzList-info-input.do?id=${item.fid}"
											class="a-update"><spring:message code="core.list.edit"
													text="${item.fcode}" /></a></td>
										<%-- <td>${item.ftype}</td> --%>
										<td>${item.fname}</td>
										<td>${item.fgg}</td>
										<td>${item.flyr}</td>
										<%-- <td>${item.fnum}</td> --%>
										<td>${item.flydate}</td>
										<td>${xmMap[item.fxmid].fxmname}</td>
										<td>${ryMap[xmMap[item.fxmid].fxmzongjianid].fname}</td>
										<td>
											<c:if test="${item.fsystate=='0'}">在库</c:if>
											<c:if test="${item.fsystate=='1'}">在使用</c:if>
											<c:if test="${item.fsystate=='2'}">已报废</c:if></td>
										<td>${item.fxjstate}</td>
										<td><a href="wzIo-info-input.do?fwzid=${item.fid}" target="_blank"
											class="a-update"><spring:message code="core.list.edit"
													text="调拨" /></a></td>
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
		</section>
		<!-- end of main -->
	</div>
</body>
</html>
