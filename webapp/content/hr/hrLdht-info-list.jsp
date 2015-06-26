<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "hr-home");
%>
<%
	pageContext.setAttribute("currentMenu", "commRy");
%>
<!doctype html>
<html lang="zh">

<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="dev.hrLdht-info.list.title"
		text="劳动合同 - 员工管理 - 人力资源" /></title>
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
			'filter_LIKES_fname' : '${param.filter_LIKES_fname}'
		},
		selectedItemClass : 'selectedItem',
		gridFormId : 'hrLdht-infoGridForm',
		exportUrl : 'hrLdht-info-export.do'
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
		<%@include file="/menu/hr-workspace.jsp"%>

		<!-- start of main -->
		<section id="m-main" class="span10">
			<!-- <div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="hr-home.do">人力资源</a> <span class="divider">/</span>
							</li>
							<li>员工管理<span class="divider">/</span>
							</li>
							<li class="active">劳动合同</li>
						</ul>
					</div>
				</div>
			</div> -->
			<article class="m-widget">
				<header class="header">
					<h4 class="title">查询</h4>
					<div class="ctrl">
						<a class="btn"><i id="hrLdht-infoSearchIcon"
							class="icon-chevron-up"></i></a>
					</div>
				</header>
				<div id="hrLdht-infoSearch" class="content content-inner">

					<form name="hrLdht-infoForm" method="post"
						action="hrLdht-info-list.do" class="form-inline">
						<label for="hrLdht-info_name"><spring:message
								code='hrLdht-info.hrLdht-info.list.search.fname' text='员工姓名' />:</label>
						<input type="text" id="hrLdht-info_fryid"
							name="filter_LIKES_fname" value="${param.filter_LIKES_fname}">
						<button class="btn btn-small a-search"
							onclick="document.hrLdht-infoForm.submit()">查询</button>
						&nbsp;
					</form>

				</div>
			</article>

			<article class="m-blank">
				<div class="pull-left">
					<region:region-permission permission="hrLdht-info:create">
						<button class="btn btn-small a-insert"
							onclick="location.href='hrLdht-info-input.do'">新建</button>
					</region:region-permission>
					<region:region-permission permission="hrLdht-info:delete">
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
						<spring:message code="hrLdht-info.hrLdht-info.list.title"
							text="列表" />
					</h4>
				</header>
				<div class="content">
					<form id="hrLdht-infoGridForm" name="hrLdht-infoGridForm"
						method='post' action="hrLdht-info-remove.do" class="m-form-blank">
						<table id="hrLdht-infoGrid" class="m-table table-hover table-bordered">
							<thead>
								<tr>
									<th width="10" class="m-table-check"><input
										type="checkbox" name="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th>
									<th class="sorting" id="fcode">编号</th> 
									<th class="sorting" id="fryid">姓名</th>
									<th class="sorting" id="fht">合同类型</th>
									<th class="sorting" id="fmoney">工资</th>
									<th class="sorting" id="fhtstart">合同期起</th>
									<th class="sorting" id="fhtend">合同期止</th>
								<!-- <th class="sorting" id="fmemo2">放置位置</th>  -->
									<th width="80">&nbsp;</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach items="${page.result}" var="item">
									<tr>
										
										<td><input type="checkbox" class="selectedItem a-check"
											name="selectedItem" value="${item.fid}"></td>
									  <td>${item.fcode}</td> 
										<td>${ryMap[item.fryid].fname}</td>
										<td><c:if test="${item.fht==1}"> 试用合同</c:if> <c:if
												test="${item.fht==2}">临时合同 </c:if> <c:if
												test="${item.fht==3}">正式合同</c:if></td>
										<td>${item.fmoney}</td>
										<td>${item.fhtstart}</td>
										<td>${item.fhtend}</td>
										 <%-- <td>${item.fmemo2}</td>  --%>
										<td><a href="hrLdht-info-input.do?id=${item.fid}"
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
