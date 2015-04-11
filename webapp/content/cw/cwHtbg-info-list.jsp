<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "cw-home");
%>
<%
	pageContext.setAttribute("currentMenu", "cw-ht");
%>
<!doctype html>
<html lang="zh">

<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="dev.cwHtbg-info.list.title"
		text="列表" /></title>
<%@include file="/common/s.jsp"%>
<link rel="stylesheet" href="style.css" type="text/css">
<script src="${ctx}/s/xthena/amcharts/amcharts.js"
	type="text/javascript"></script>
<link rel="stylesheet" href="style.css" type="text/css">
<script src="${ctx}/s/xthena/amcharts/amcharts.js"
	type="text/javascript"></script>
<script src="${ctx}/s/xthena/amcharts/pie.js" type="text/javascript"></script>
<script src="${ctx}/s/xthena/amcharts/serial.js" type="text/javascript"></script>
<script type="text/javascript">
	var config = {
		id : 'cwHtbg-infoGridForm',
		pageNo : ${page.pageNo},
		pageSize : ${page.pageSize},
		totalCount : ${page.totalCount},
		resultSize : ${page.resultSize},
		pageCount : ${page.pageCount},
		orderBy : '${page.orderBy == null ? "" : page.orderBy}',
		asc : ${page.asc},
		params : {
			/* 'filter_LIKES_name' : '${param.filter_LIKES_name}' */
		},
		selectedItemClass : 'selectedItem',
		gridFormId : 'cwHtbg-infoGridForm',
		exportUrl : 'cwHtbg-info-export.do'
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


	<!-- 		<div class="row-fluid">
				<div class="span6">
					<article class="m-widget">
						<header class="header">
							<h4 class="title">监理费回收动态图</h4>
						</header>
						<div id="chartdiv" style="width: 100%; height: 400px;"></div>
					</article>
				</div>
				<div class="span6">
					<article class="m-widget">
						<header class="header">
							<h4 class="title">合同变更原因分析</h4>
						</header>
						<div id="chartdiv2" style="width: 100%; height: 400px;"></div>
					</article>
				</div>
			</div>
 -->
			<article class="m-widget">
				<header class="header">
					<h4 class="title">查询</h4>
					<div class="ctrl">
						<a class="btn"><i id="cwHtbg-infoSearchIcon"
							class="icon-chevron-up"></i></a>
					</div>
				</header>
				<div id="cwHtbg-infoSearch" class="content content-inner">
					<form name="cwHtbg-infoForm" method="post"
						action="cwHtbg-info-list.do" class="form-inline">
						<label for="cwHtbg-info_name"><spring:message
								code='cwHtbg-info.cwHtbg-info.list.search.fname' text='名称' />:</label> <input
							type="text" id="cwHtbg-info_fname" name="filter_LIKES_fname"
							value="${param.filter_LIKES_fname}">
						<button class="btn btn-small a-search"
							onclick="document.cwHtbg-infoForm.submit()">查询</button>
						&nbsp;
					</form>

				</div>
			</article>

			<article class="m-blank">
				<div class="pull-left">
			<!-- 		<region:region-permission permission="cwHtbg-info:create">
						<button class="btn btn-small a-insert"
							onclick="location.href='cwHtbg-info-input.do'">新建</button>
					</region:region-permission>
					<region:region-permission permission="cwHtbg-info:delete">
						<button class="btn btn-small a-remove" onclick="table.removeAll()">删除</button>
					</region:region-permission> -->
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
						<spring:message code="cwHtbg-info.cwHtbg-info.list.title"
							text="列表" />
					</h4>
				</header>
				<div class="content">
					<form id="cwHtbg-infoGridForm" name="cwHtbg-infoGridForm"
						method='post' action="cwHtbg-info-remove.do" class="m-form-blank">
						<table id="cwHtbg-infoGrid" class="m-table table-hover table-bordered">
							<thead>
								<tr>
									<th width="10" class="m-table-check"><input
										type="checkbox" name="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th>
									<th class="sorting" id="fhetongName">合同名称</th>
									<th class="sorting" id="fhetongJine">合同金额</th>
									<th class="sorting" id="fsjsr">实际总收入</th>
									<th class="sorting" id="fyszk">应收账款</th>
									<th class="sorting" id="fhsl">回收率</th>
									<th class="sorting" id="fysjlf">应收监理费</th>
									<th class="sorting" id="flyl">履约率</th>
									<th class="sorting" id="fgcjd">工程进度</th>
									<th class="sorting" id="fqksm">情况说明</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach items="${page.result}" var="item">
									<tr>
										<td><input type="checkbox" class="selectedItem a-check"
											name="selectedItem" value=""></td>
									<%-- 	<td><a href="cwHtbg-info-input.do?id=
											class="a-update"><spring:message code="core.list.edit"
													text="${item.fhtid}" /></a></td> --%>
										<td>${item.fhetongName}</td>
										<td>${item.fhetongJine}</td>
										<td>${item.fsjsr}</td>
										<td>${item.fyszk}</td>
										<td>${item.fhsl}</td>
										<td>${item.fysjlf}</td>
										<td>${item.flyl}</td>
										<td>${item.fgcjd}</td>
										<td>${item.fqksm}</td>
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
