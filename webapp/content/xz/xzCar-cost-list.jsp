<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "xz-home");
%>
<%
	pageContext.setAttribute("currentMenu", "xz-cl");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="dev.xzCar-info.list.title"
		text="车辆成本核算 - 车辆管理 - 行政管理" /></title>
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
		gridFormId : 'xzCar-infoGridForm',
		exportUrl : 'xzCar-info-export.do'
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
		<%@include file="/menu/xz-workspace.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span10">
	<!-- 		<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="xz-workspace.do">行政管理</a> <span class="divider">/</span>
							</li>
							<li>车辆管理<span class="divider">/</span>
							</li>
							<li class="active">车辆成本核算</li>
						</ul>
					</div>
				</div>
			</div> -->
			<%-- <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="xzCar-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="xzCar-infoSearch" class="content content-inner">

		  <form name="xzCar-infoForm" method="post" action="xzCar-cost-list.do" class="form-inline">
		    <label for="xzCar-info_name"><spring:message code='xzCar-info.xzCar-info.list.search.name' text='名称'/>:</label>
		    <input type="text" id="xzCar-info_name" name="filter_LIKES_name" value="${param.filter_LIKES_name}">
			<button class="btn btn-small a-search" onclick="document.xzCar-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article> --%>
			<article class="m-blank">
				<div class="pull-left">
					<button class="btn btn-small a-insert"
						onclick="location.href='xzCarOilRecord-info-list.do'">燃油记录</button>
					<button class="btn btn-small a-insert"
						onclick="location.href='xzCarWbrecord-info-list.do'">维保记录</button>
					<button class="btn btn-small a-insert"
						onclick="location.href='xzCarBxRecord-info-list.do'">保险记录</button>
					<button class="btn btn-small a-insert"
						onclick="location.href='xzCarSc-info-list.do'">审车记录</button>
					<!-- <region:region-permission permission="xzCar-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='xzCar-info-input.do'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="xzCar-info:delete">
		  <button class="btn btn-small a-remove" onclick="table.removeAll()">删除</button>
		  </region:region-permission>
		  <button class="btn btn-small a-export" onclick="table.exportExcel()">导出</button> -->
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
						<spring:message code="xzCar-info.xzCar-info.list.title" text="列表" />
					</h4>
				</header>
				<div class="content">
					<form id="xzCar-infoGridForm" name="xzCar-infoGridForm"
						method='post' action="xzCar-info-remove.do" class="m-form-blank">
						<table id="xzCar-infoGrid" class="m-table table-hover table-bordered">
							<thead>
								<tr>
									<th width="10" class="m-table-check"><input
										type="checkbox" name="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th>
										<th class="sorting" name="fmemo1">编号</th>
									<th class="sorting" name="fcarno">车牌号</th>
									<th class="sorting" name="oilmoney">加油费</th>
									<th class="sorting" name="bxMoney">保险费</th>
									<th class="sorting" name="wbmoney">维保费</th>
									<th class="sorting" name="scmoney">审车费</th>
									<th class="sorting" name="name">合计</th>
									<th width="80">&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.result}" var="item">
									<tr>
										<td><input type="checkbox" class="selectedItem a-check"
											name="selectedItem" value="${item.fid}"></td>
										<td>${item.fmemo1}</td>
										<td>${item.fcarno}</td>
										<td><a
											href="xzCarOilRecord-info-list.do?fcarid=${item.fid}"
											class="a-update"><spring:message text="${item.oilmoney}" /></a></td>
										<td><a
											href="xzCarBxRecord-info-list.do?fcarid=${item.fid}"
											class="a-update"><spring:message text="${item.bxMoney}" /></a></td>
										<td><a
											href="xzCarWbrecord-info-list.do?fcarid=${item.fid}"
											class="a-update"><spring:message text="${item.wbmoney}" /></a></td>
										<td><a href="xzCarSc-info-list.do?fcarid=${item.fid}"
											class="a-update"><spring:message text="${item.scmoney}" /></a></td>
										<td>${item.bxMoney+item.wbmoney+item.scmoney+item.oilmoney}</td>
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
