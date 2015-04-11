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
<title><spring:message code="dev.xzRyzs-info.list.title"
		text="荣誉证书 - 公司档案管理 - 行政管理" /></title>
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
			'filter_LIKES_ftype' : '${param.filter_LIKES_ftype}',
			'filter_LIKES_fhjname' : '${param.filter_LIKES_fhjname}',
			'filter_LIKES_fbfdanw' : '${param.filter_LIKES_fbfdanw}',
			'filter_LIKES_fyear' : '${param.filter_LIKES_fyear}',
			'filter_LIKES_ffileno' : '${param.filter_LIKES_ffileno}',
			'filter_LIKES_ffilename' : '${param.filter_LIKES_ffilename}',
			'filter_LIKES_fleibie' : '${param.filter_LIKES_fleibie}',
			'filter_LIKES_fzongjianname' : '${param.filter_LIKES_fzongjianname}',
		},
		selectedItemClass : 'selectedItem',
		gridFormId : 'xzRyzs-infoGridForm',
		exportUrl : 'xzRyzs-info-export.do'
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
						<a class="btn"><i id="xzRyzs-infoSearchIcon"
							class="icon-chevron-up"></i></a>
					</div>
				</header>
				<div id="xzRyzs-infoSearch" class="content content-inner">

					<form name="xzRyzs-infoForm" method="post"
						action="xzRyzs-info-list.do" class="form-inline">
						<label for="xzRyzs-info_ftype"><spring:message
								code='xzRyzs-info.xzRyzs-info.list.search.ftype' text='证书名称' />:</label>
						<input type="text" id="xzRyzs-info_ftype"  style="width: 100px;"
							name="filter_LIKES_ftype" value="${param.filter_LIKES_ftype}">
					<%-- 	<label for="xzRyzs-info_ffileno"><spring:message
								code='xzRyzs-info.xzRyzs-info.list.search.ffileno' text='证书编号' />:</label>
						<input type="text" id="xzRyzs-info_ffileno"
							name="filter_LIKES_ffileno" value="${param.filter_LIKES_ffileno}"> --%>
						<label for="xzRyzs-info_fhjname"><spring:message
								code='xzRyzs-info.xzRyzs-info.list.search.fhjname' text='项目名称' />:</label>
						<input type="text" id="xzRyzs-info_fhjname"  style="width: 100px;"
							name="filter_LIKES_fhjname" value="${param.filter_LIKES_fhjname}">
						<%-- <label for="xzRyzs-info_fbfdanw"><spring:message
								code='xzRyzs-info.xzRyzs-info.list.search.fbfdanw' text='颁发单位' />:</label>
						<input type="text" id="xzRyzs-info_fbfdanw"
							name="filter_LIKES_fbfdanw" value="${param.filter_LIKES_fbfdanw}"> --%>
						<label for="xzRyzs-info_fyear"><spring:message
								code='xzRyzs-info.xzRyzs-info.list.search.fyear' text='获奖年度' />:</label>
						<input type="text" id="xzRyzs-info_fyear" style="width: 100px;"
							name="filter_LIKES_fyear" value="${param.filter_LIKES_fyear}">
							&nbsp;&nbsp;
								<select class="form-control" id="xzRyzs-info_fleibie" value="${param.filter_LIKES_fleibie}" style="width: 100px;"
										name="filter_LIKES_fleibie"> 
											<option value="" selected="selected">证书类别</option>
										<option value="个人荣誉"
											<c:if test="${param.filter_LIKES_fleibie=='个人荣誉'}"> selected="selected"  </c:if>>个人荣誉</option>
										<option value="企业荣誉"
											<c:if test="${param.filter_LIKES_fleibie=='企业荣誉'}"> selected="selected"  </c:if>>企业荣誉</option>
										<option value="工程获奖"
											<c:if test="${param.filter_LIKES_fleibie=='工程获奖'}"> selected="selected"  </c:if>>工程获奖</option>
										<option value="个人工程类获奖"
											<c:if test="${param.filter_LIKES_fleibie=='个人工程类获奖'}"> selected="selected"  </c:if>>个人工程类获奖</option>
									</select>&nbsp;&nbsp;
									<label for="xzJgysbg-info_fzongjianname"><spring:message
								code='xzJgysbg-info.xzJgysbg-info.list.search.fzongjianname'
								text='总监' />:</label> <input type="text" id="xzJgysbg-info_fzongjianname"
							name="filter_LIKES_fzongjianname" value="${param.filter_LIKES_fzongjianname}">
						<button class="btn btn-small a-search"
							onclick="document.xzRyzs-infoForm.submit()">查询</button>
						&nbsp;
					</form>

				</div>
			</article>

			<article class="m-blank">
				<div class="pull-left">
					<region:region-permission permission="xzRyzs-info:create">
						<button class="btn btn-small a-insert"
							onclick="location.href='xzRyzs-info-input.do'">新建</button>
					</region:region-permission>
					<region:region-permission permission="xzRyzs-info:delete">
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
						<spring:message code="xzRyzs-info.xzRyzs-info.list.title"
							text="列表" />
					</h4>
				</header>
				<div class="content">
					<form id="xzRyzs-infoGridForm" name="xzRyzs-infoGridForm"
						method='post' action="xzRyzs-info-remove.do" class="m-form-blank">
						<table id="xzRyzs-infoGrid" class="m-table table-hover table-bordered">
							<thead>
								<tr>
									<th style="width:10px" class="m-table-check"><input
										type="checkbox" name="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th>
									<th class="sorting" id="ftype">证书名称</th>
									<th class="sorting" id="fhjname">项目名称</th>
									<th class="sorting" id="fhuojiangr">获奖人员</th>
									<th class="sorting" id="fyear">获奖年度</th>
									<th class="sorting" id="ffileno">在库状态</th>
									<th class="sorting" id="fleibie">证书类别</th>
									<!-- <th class="sorting" id="ffzwz">放置位置</th> -->
									<th style="width:80px;">&nbsp;</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach items="${page.result}" var="item">
									<tr>
										<td><input type="checkbox" class="selectedItem a-check"
											id="selectedItem" value="${item.fid}"></td>
										<td>${item.ftype}</td>
										<td>${item.fhjname}</td>
										<td>${ryMap[item.fhuojiangr].fname}</td>
										<td>${item.fyear}</td>
										<td><c:if test="${item.ffileno=='在库'}"> <font color="green">在库</font>  </c:if>
											<c:if test="${item.ffileno=='未在库'}"> <font color="red">未在库</font>  </c:if></td>
										<td>${item.fleibie}</td>
										<%-- <td>${item.ffzwz}</td> --%>
										<td><a href="xzRyzs-info-input.do?id=${item.fid}"
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
