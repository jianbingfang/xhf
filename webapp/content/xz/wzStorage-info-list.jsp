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
<title><spring:message code="dev.wzStorage-info.list.title"
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
			'filter_LIKES_fname' : '${param.filter_LIKES_fname}',
			'filter_LIKES_ftype':'${param.filter_LIKES_ftype}'
		},
		selectedItemClass : 'selectedItem',
		gridFormId : 'wzStorage-infoGridForm',
		exportUrl : 'wzStorage-info-export.do'
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
						<a class="btn"><i id="wzStorage-infoSearchIcon"
							class="icon-chevron-up"></i></a>
					</div>
				</header>
				<div id="wzStorage-infoSearch" class="content content-inner">
					<form name="wzStorage-infoForm" method="post"
						action="wzStorage-info-list.do" class="form-inline">
						<label for="wzStorage-info_fname"><spring:message
								code='wzStorage-info.wzStorage-info.list.search.fname'
								text='物品名称' />:</label> <input type="text" id="wzStorage-info_fname"
							name="filter_LIKES_fname" value="${param.filter_LIKES_fname}">
						<label for="wzStorage-info_fgg"><spring:message
								code='wzStorage-info.wzStorage-info.list.search.fgg' text='规格' />:</label>
						<input type="text" id="wzStorage-info_fgg"
							name="filter_LIKES_fgg" value="${param.filter_LIKES_fgg}">
						<label for="wzStorage-info_ftype"><spring:message
								code='wzStorage-info.wzStorage-info.list.search.ftype' text='出入库' />:</label> 
								<select class="form-control" id="wzStorage-info_ftype"
							name="filter_LIKES_ftype" value="${param.filter_LIKES_ftype}" class=" ">
							<option ></option>
							<option value="2"<c:if test="${param.filter_LIKES_ftype=='2'}"> selected="selected" </c:if>>出货</option>
							<option value="1"<c:if test="${param.filter_LIKES_ftype=='1'}"> selected="selected"  </c:if>>进货</option>
						</select>
						<button class="btn btn-small a-search"
							onclick="document.wzStorage-infoForm.submit()">查询</button>
						&nbsp;
					</form>
				</div>
			</article>
			<article class="m-blank">
				<div class="pull-left">
					<!-- 	<region:region-permission permission="wzStorage-info:create">
						<button class="btn btn-small a-insert"
							onclick="location.href='wzStorage-info-input.do'">新建</button>
					</region:region-permission>
					<region:region-permission permission="wzStorage-info:delete">
						<button class="btn btn-small a-remove" onclick="table.removeAll()">删除</button>
					</region:region-permission> -->
					<!-- button class="btn btn-small a-export"
						onclick="table.exportExcel()">导出</button> -->
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
						<spring:message code="wzStorage-info.wzStorage-info.list.title"
							text="列表" />
					</h4>
				</header>
				<div class="content">
					<form id="wzStorage-infoGridForm" name="wzStorage-infoGridForm"
						method='post' action="wzStorage-info-remove.do"
						class="m-form-blank">
						<table id="wzStorage-infoGrid" class="m-table table-hover table-bordered">
							<thead>
								<tr>
									<th width="10" class="m-table-check"><input
										type="checkbox" name="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th>
									<th class="sorting" name="ftype">出入货</th>
									<th class="sorting" name="fwzid">物资名称</th>
									<th class="sorting" name="fwzid">规格</th>
									<th class="sorting" name="fnum">数量</th>
									<th class="sorting" name="fprice">单价</th>
									<th class="sorting" name="fxmid">项目</th>
									<th class="sorting" name="fjbr">经办人</th>
									<!--   	<th class="sorting" name="fmemo">说明</th>
        	<th class="sorting" name="ftype">类别</th> -->
									<th width="80">&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.result}" var="item">
									<tr>
										<td><input type="checkbox" class="selectedItem a-check"
											name="selectedItem" value="${item.fid}"></td>
										<td><c:if test="${item.ftype=='1'}">进货</c:if> <c:if
												test="${item.ftype=='2'}">出货</c:if></td>
										<td>${wzMap[item.fwzid].fname}</td>
										<td>${wzMap[item.fwzid].fgg}</td>
										<td>${item.fnum}</td>
										<td>${item.fprice}</td>
										<td>${xmMap[item.fxmid].fxmname}</td>
										<td>${item.fjbr}</td>
										<%--  	 <td>${item.fmemo}</td>
      	 	 <td>${item.ftype}</td> --%>
										<td><a href="wzStorage-info-input.do?id=${item.fid}&ftype=${item.ftype}"
											class="a-update"><spring:message code="core.list.edit"
													text="查看" /></a></td>
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
