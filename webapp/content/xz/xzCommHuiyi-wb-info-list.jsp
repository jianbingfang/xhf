<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "xz-home");
%>
<%
	pageContext.setAttribute("currentMenu", "xz-hy");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="dev.xzCommHuiyi-info.list.title"
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
		gridFormId : 'xzCommHuiyi-infoGridForm',
		exportUrl : 'xzCommHuiyi-info-export.do'
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
			<article class="m-widget">
				<header class="header">
					<h4 class="title">查询</h4>
					<div class="ctrl">
						<a class="btn"><i id="xzCommHuiyi-infoSearchIcon"
							class="icon-chevron-up"></i></a>
					</div>
				</header>
				<div id="xzCommHuiyi-infoSearch" class="content content-inner">
					<form name="xzCommHuiyi-infoForm" method="post"
						action="xzCommHuiyi-info-list.do" class="form-inline">
						<label for="xzCommHuiyi-info_name"><spring:message
								code='xzCommHuiyi-info.xzCommHuiyi-info.list.search.name'
								text='名称' />:</label> <input type="text" id="xzCommHuiyi-info_name"
							name="filter_LIKES_name" value="${param.filter_LIKES_name}">
						<button class="btn btn-small a-search"
							onclick="document.xzCommHuiyi-infoForm.submit()">查询</button>
						&nbsp;
					</form>
				</div>
			</article>
			<article class="m-blank">
				<div class="pull-left">
					<region:region-permission permission="xzCommHuiyi-wb-info:create">
						<button class="btn btn-small a-insert"
							onclick="location.href='xzCommHuiyi-wb-info-input.do'">新建</button>
					</region:region-permission>
					<region:region-permission permission="xzCommHuiyi-wb-info:delete">
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
						<spring:message
							code="xzCommHuiyi-info.xzCommHuiyi-info.list.title" text="列表" />
					</h4>
				</header>
				<div class="content">
					<form id="xzCommHuiyi-infoGridForm" name="xzCommHuiyi-infoGridForm"
						method='post' action="xzCommHuiyi-info-remove.do"
						class="m-form-blank">
						<table id="xzCommHuiyi-infoGrid" class="m-table table-hover table-bordered">
							<thead>
								<tr>
									<th width="10" class="m-table-check"><input
										type="checkbox" name="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th>
								<!-- 	<th class="sorting" id="ftype">会议类型</th> -->
									<!--<th class="sorting" id="faddress">组织人</th> -->
									<th class="sorting" id="fhyzt">会议主题</th>
									<th class="sorting" id="fhydate">会议时间</th>
									<th class="sorting" id="fhycode">文号</th>
									<!-- <th class="sorting" id="fzhuchir">主持人</th>
						        	<th class="sorting" id="fcanyurenyuan">参与人员</th>
						        	<th class="sorting" id="fhycontent">会议内容</th>
						        	<th class="sorting" id="fresult">会议决议</th> -->
									<th class="sorting" id="fhyjf">会议缴费</th>
									<th class="sorting" id="ffpkjqk">发票开具情况</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.result}" var="item">
									<tr>
										<td><input type="checkbox" class="selectedItem a-check"
											name="selectedItem" value="${item.fid}"></td>
									<%-- 	<td>${item.ftype}</td> --%>
										<%--   	 	 <td>${item.faddress}</td> --%>
										<td><a href="xzCommHuiyi-info-input.do?id=${item.fid}"
											class="a-update"><spring:message code="core.list.edit"
													text="${item.fhyzt}" /></a></td>
										<td>${item.fhydate}</td>
										<td>${item.fhycode}</td>
										<%-- <td>${item.fzhuchir}</td>
							      	 	 <td>${item.fcanyurenyuan}</td>
							      	 	 <td>${item.fhycontent}</td>
							      	 	 <td>${item.fresult}</td> --%>
										<td>${item.fhyjf}</td>
										<td>${item.ffpkjqk}</td>
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
