<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "cw-home");
%>
<%
	pageContext.setAttribute("currentMenu", "cw-hs");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="dev.cwXmhs-info.list.title"
		text="列表" /></title>
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
			'flistid':${param.flistid},
			'filter_EQL_flistid' : '${filter_EQL_flistid}'
		},
		selectedItemClass : 'selectedItem',
		gridFormId : 'cwXmhs-infoGridForm',
		exportUrl : 'cwXmhs-info-export.do'
	};

	var table;

	$(function() {
		table = new Table(config);
		table.configPagination('.m-pagination');
		table.configPageInfo('.m-page-info');
		table.configPageSize('.m-page-size');
	});
</script>
</head>
<body>
	<%@include file="/header.jsp"%>
	<div class="row-fluid">
		<%@include file="/menu/cw-workspace.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span10">
			<article class="m-widget">
				<header class="header">
					<h4 class="title">查询</h4>
					<div class="ctrl">
						<a class="btn"><i id="cwXmhs-infoSearchIcon"
							class="icon-chevron-up"></i></a>
					</div>
				</header>
				<div id="cwXmhs-infoSearch" class="content content-inner">
					<form name="cwXmhs-infoForm" method="post"
						action="cwXmhs-info-list.do?flistid=${flistid}" class="form-inline">
						<label for="cwXmhs-info_name"><spring:message
								code='cwXmhs-info.cwXmhs-info.list.search.name' text='名称' />:</label> <input
							type="text" id="cwXmhs-info_name" name="filter_LIKES_fhetongname"
							value="${param.filter_LIKES_fhetongname}">
						<button class="btn btn-small a-search"
							onclick="document.cwXmhs-infoForm.submit()">查询</button>
						&nbsp;
					</form>
				</div>
			</article>
			<article class="m-blank">
				<div class="pull-left">
					<region:region-permission permission="cwXmhs-info:create">
						<button class="btn btn-small a-insert"
							onclick="location.href='cwXmhs-info-input.do'">新建</button>
					</region:region-permission>
					<region:region-permission permission="cwXmhs-info:delete">
						<button class="btn btn-small a-remove" onclick="table.removeAll()">删除</button>
					</region:region-permission>
					<button class="btn btn-small a-export"
						onclick="table.exportExcel()">导出</button>
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
						<spring:message code="cwXmhs-info.cwXmhs-info.list.title"
							text="列表" />
					</h4>
				</header>
				<div class="content">
					<form id="cwXmhs-infoGridForm" name="cwXmhs-infoGridForm"
						method='post' action="cwXmhs-info-remove.do" class="m-form-blank">
						<table id="cwXmhs-infoGrid" class="m-table table-hover table-bordered">
							<thead>
								<tr>
									<th width="10" class="m-table-check"><input
										type="checkbox" name="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th>
									<th class="sorting" id="fhetongname">合同名称</th>
									<th class="sorting" id="fhetongjine">合同金额</th>
									<th class="sorting" id="fbjdsr">本季度收入</th>
									<th class="sorting" id="fbndzsr">本年总收入</th>
									<th class="sorting" id="fzsr">总收入</th>
									<th class="sorting" id="fbjdzcb">本季度成本</th>
									<th class="sorting" id="fbnzcb">本年总成本</th>
									<th class="sorting" id="fzcb">总成本</th>
									<th class="sorting" id="fglf">管理费</th>
									<th class="sorting" id="flr">利润</th>
									<th class="sorting" id="ffpkjwdz">发票开具未到账</th>
									<th width="80">&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.result}" var="item">
									<tr>
										<td><input type="checkbox" class="selectedItem a-check"
											name="selectedItem" value="${item.fid}"></td>
										<td>${item.fhetongname}</td>
										<td>${item.fhetongjine}</td>
										<td>${item.fbjdsr}</td>
										<td>${item.fbndzsr}</td>
										<td>${item.fzsr}</td>
										<td>${item.fbjdzcb}</td>
										<td>${item.fbnzcb}</td>
										<td>${item.fzcb}</td>
										<td>${item.fglf}</td>
										<td>${item.flr}</td>
										<td>${item.ffpkjwdz}</td>
										<td><a href="cwXmhs-info-input.do?id=${item.fid}"
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
