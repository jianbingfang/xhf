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
<title><spring:message code="dev.xzJgysbg-info.list.title"
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
			'filter_LIKES_fxmname' : '${param.filter_LIKES_fxmname}',
			'filter_LIKES_fzongjianname' : '${param.filter_LIKES_fzongjianname}'
		},
		selectedItemClass : 'selectedItem',
		gridFormId : 'xzJgysbg-infoGridForm',
		exportUrl : 'xzJgysbg-info-export.do'
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
						<a class="btn"><i id="xzJgysbg-infoSearchIcon"
							class="icon-chevron-up"></i></a>
					</div>
				</header>
				<div id="xzJgysbg-infoSearch" class="content content-inner">
					<form name="xzJgysbg-infoForm" method="post"
						action="xzJgysbg-info-list.do" class="form-inline">
						<label for="xzJgysbg-info_fxmname"><spring:message
								code='xzJgysbg-info.xzJgysbg-info.list.search.fxmname'
								text='项目名称' />:</label> <input type="text" id="xzJgysbg-info_fxmname" style="width:100px;"
							name="filter_LIKES_fxmname" value="${param.filter_LIKES_fxmname}">
						<label for="xzJgysbg-info_fzongjianname"><spring:message
								code='xzJgysbg-info.xzJgysbg-info.list.search.fzongjianname'
								text='总监' />:</label> <input type="text" id="xzJgysbg-info_fzongjianname" style="width:100px;"
							name="filter_LIKES_fzongjianname" value="${param.filter_LIKES_fzongjianname}">
						<button class="btn btn-small a-search"
							onclick="document.xzJgysbg-infoForm.submit()">查询</button>
						&nbsp;
					</form>
				</div>
			</article>
			<article class="m-blank">
				<div class="pull-left">
					<region:region-permission permission="xzJgysbg-info:create">
						<button class="btn btn-small a-insert"
							onclick="location.href='xzJgysbg-info-input.do'">新建</button>
					</region:region-permission>
					<region:region-permission permission="xzJgysbg-info:delete">
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
						<spring:message code="xzJgysbg-info.xzJgysbg-info.list.title"
							text="列表" />
					</h4>
				</header>
				<div class="content">
					<form id="xzJgysbg-infoGridForm" name="xzJgysbg-infoGridForm"
						method='post' action="xzJgysbg-info-remove.do"
						class="m-form-blank">
						<table id="xzJgysbg-infoGrid" class="m-table table-hover table-bordered">
							<thead>
								<tr>
									<th style="width:10px;" class="m-table-check"><input
										type="checkbox" name="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th>
									<th class="sorting" id="fcode">编号</th>
									<th class="sorting" id="fxmname">项目名称</th>
									<th class="sorting" id="fgcgm">工程规模</th>
									<th class="sorting" id="fztz">总投资（万元）</th>
									<th class="sorting" id="fzongjian">总监</th>
									<th class="sorting" id="fstartdate">开工日期</th>
									<th class="sorting" id="fenddate">竣工日期</th>
									<th class="sorting" id="fzkstate">在库状态</th>
									<th class="sorting" id="ffzwz">放置位置</th>
									<th class="sorting" id="fmemo">备注</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.result}" var="item">
									<tr>
										<td><input type="checkbox" class="selectedItem a-check"
											name="selectedItem" value="${item.fid}"></td>
										<td>${item.fcode}</td>
										<td class="span3"><a href="xzJgysbg-info-input.do?id=${item.fid}"
											class="a-update"><spring:message code="core.list.edit"
													text="${item.fxmname}" /></a></td>
										<td>${item.fgcgm}</td>
										<td>${item.fmemo1}</td>
										<td>${ryMap[item.fzongjian].fname}</td>
										<td>${item.fstartdate}</td>
										<td>${item.fenddate}</td>
										<td><c:if test="${item.fzkstate=='在库'}"> <font color="green">在库</font>  </c:if>
											<c:if test="${item.fzkstate=='未在库'}"> <font color="red">未在库</font>  </c:if></td>
										<td>${item.ffzwz}</td>
										<td>${item.fmemo}</td>
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
