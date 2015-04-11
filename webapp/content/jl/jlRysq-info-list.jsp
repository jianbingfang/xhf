<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "jl-home");
%>
<%
	pageContext.setAttribute("currentMenu", "jl-ry");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="dev.jlRysq-info.list.title"
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
			'filter_LIKES_name' : '${param.filter_LIKES_name}'
		},
		selectedItemClass : 'selectedItem',
		gridFormId : 'jlRysq-infoGridForm',
		exportUrl : 'jlRysq-info-export.do'
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
		<%@include file="/menu/jl-workspace.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span10">
			<article class="m-widget">
				<header class="header">
					<h4 class="title">查询</h4>
					<div class="ctrl">
						<a class="btn"><i id="jlRysq-infoSearchIcon"
							class="icon-chevron-up"></i></a>
					</div>
				</header>
				<div id="jlRysq-infoSearch" class="content content-inner">
					<form name="jlRysq-infoForm" method="post"
						action="jlRysq-info-list.do" class="form-inline">
						<label for="jlRysq-info_name"><spring:message
								code='jlRysq-info.jlRysq-info.list.search.name' text='名称' />:</label> <input
							type="text" id="jlRysq-info_name" name="filter_LIKES_name"
							value="${param.filter_LIKES_name}">
						<button class="btn btn-small a-search"
							onclick="document.jlRysq-infoForm.submit()">查询</button>
						&nbsp;
					</form>
				</div>
			</article>
			<article class="m-blank">
				<div class="pull-left">
					<region:region-permission permission="jlRysq-info:create">
						<button class="btn btn-small a-insert"
							onclick="location.href='jlRysq-info-input.do'">新建</button>
					</region:region-permission>
					<region:region-permission permission="jlRysq-info:delete">
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
						<spring:message code="jlRysq-info.jlRysq-info.list.title"
							text="列表" />
					</h4>
				</header>
				<div class="content">
					<form id="jlRysq-infoGridForm" name="jlRysq-infoGridForm"
						method='post' action="jlRysq-info-remove.do" class="m-form-blank">
						<table id="jlRysq-infoGrid" class="m-table table-hover table-bordered">
							<thead>
								<tr>
									<th style="width:10px" class="m-table-check"><input
										type="checkbox" name="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th>
									<th class="sorting" id="fgangw">岗位</th>
									<th class="sorting" id="frenshu">人数</th>
									<th class="sorting" id="fyuanyin">原因</th>
									<th class="sorting" id="fshenqingdate">申请日期</th>
									<th class="sorting" id="fshenpidate">审批日期</th>
									<th class="sorting" id="fstatus">状态</th>
									<th class="sorting" id="fmemo">备注</th>
									<th class="sorting" id="fshenpiinfo">审批意见</th>
									<th style="width:80px">&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.result}" var="item">
									<tr>
										<td><input type="checkbox" class="selectedItem a-check"
											name="selectedItem" value="${item.fid}"></td>
										<td>${item.fgangw}</td>
										<td>${item.frenshu}</td>
										<td>${item.fyuanyin}</td>
										<td>${item.fshenqingdate}</td>
										<td>${item.fshenpidate}</td>
										<td>${item.fstatus}</td>
										<td>${item.fmemo}</td>
										<td>${item.fshenpiinfo}</td>
										<td><a href="jlRysq-info-input.do?id=${item.fid}"
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
