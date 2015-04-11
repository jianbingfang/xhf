<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "cw-home");
%>
<%
	pageContext.setAttribute("currentMenu", "cw-zk");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="dev.cwBzj-info.list.title"
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
		gridFormId : 'cwBzj-infoGridForm',
		exportUrl : 'cwBzj-info-export.do'
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
						<a class="btn"><i id="cwBzj-infoSearchIcon"
							class="icon-chevron-up"></i></a>
					</div>
				</header>
				<div id="cwBzj-infoSearch" class="content content-inner">
					<form name="cwBzj-infoForm" method="post"
						action="cwBzj-info-list.do" class="form-inline">
						<label for="cwBzj-info_name"><spring:message
								code='cwBzj-info.cwBzj-info.list.search.name' text='名称' />:</label> <input
							type="text" id="cwBzj-info_name" name="filter_LIKES_name"
							value="${param.filter_LIKES_name}">
						<button class="btn btn-small a-search"
							onclick="document.cwBzj-infoForm.submit()">查询</button>
						&nbsp;
					</form>
				</div>
			</article>
			<article class="m-blank">
				<div class="pull-left">
					<%-- <region:region-permission permission="cwBzj-info:create">
						<button class="btn btn-small a-insert"
							onclick="location.href='cwBzj-info-input.do?type=${type}'">新建</button>
					</region:region-permission> 
					<region:region-permission permission="cwBzj-info:delete">
						<button class="btn btn-small a-remove" onclick="table.removeAll()">删除</button>
					</region:region-permission>
					<button class="btn btn-small a-export"
						onclick="table.exportExcel()">导出</button>--%>
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
						<spring:message code="cwBzj-info.cwBzj-info.list.title" text="列表" />
					</h4>
				</header>
				<div class="content">
					<form id="cwBzj-infoGridForm" name="cwBzj-infoGridForm"
						method='post' action="cwBzj-info-remove.do" class="m-form-blank">
						<table id="cwBzj-infoGrid" class="m-table table-hover table-bordered">
							<thead>
								<tr>
									<th width="10" class="m-table-check"><input
										type="checkbox" id="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th>
									<th class="sorting" id="fxmid">项目名称</th>
									<th class="sorting" id="ffzr">负责人</th>
									<th class="sorting" id="fjnmoney">金额</th>
									<th class="sorting" id="fzjyw">资金有无</th>
									<!-- <th class="sorting" id="fhetongno">合同名称</th> -->
									<!-- <th class="sorting" id="fyzname">业主名称</th> -->
									<th class="sorting" id="fskdw">收款单位</th>
									<th class="sorting" id="fzh">帐号</th>
									<th class="sorting" id="fkhh">开户行</th>
									<th class="sorting" id="fjnmethod">交纳方式</th>
									
									<th class="sorting" id="fjndate">最迟交纳日期</th>
									<th class="sorting" id="foprator">经办人</th>
									<!-- <th class="sorting" id="fbackdate">可退还日期</th>
        	<th class="sorting" id="fbackoprator">退换经办人</th> -->
									<th class="sorting" id="fmemo4">领导意见</th>
									<th class="sorting" id="fmoneydate">到账日期</th>
									<!--         	<th class="sorting" id="fbzjtype">保证金类型</th> -->
									<th class="sorting" id="fmemo">备注</th>
									<th width="80">&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.result}" var="item">
									<tr>
										<td><input type="checkbox" class="selectedItem a-check"
											name="selectedItem" value="${item.fid}"></td>
										<%--  <td>${item.fyzname}</td> --%>
										<td>${xmMap[item.fxmid].fxmname}</td>
										 <td>${ryMap[item.ffzr].fname}</td>
										 <td>${item.fjnmoney}</td>
										<%-- <td>${ fyzname}</td> --%>
										<td>${item.fzjyw}</td>
										<td>${item.fskdw}</td>
										<td>${item.fzh}</td>
										<td>${item.fkhh}</td>
										<td>${item.fjnmethod}</td>
										
										<td>${item.fjndate}</td>
										<td>${item.foprator}</td>
										<%--  <td>${item.fbackdate}</td>
      	 	 <td>${item.fbackoprator}</td> --%>
										<td>${item.fmemo4}</td>
										<td>${item.fmoneydate}</td>
										<%-- <td>${item.fbzjtype}</td> --%>
										<td>${item.fmemo}</td>
										<td><a href="cwBzj-info-input.do?id=${item.fid}&type=3"
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
