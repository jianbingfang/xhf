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
<title><spring:message code="dev.wzList-info.list.title"
		text="列表" /></title>
<%@include file="/common/s.jsp"%>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/xmpicker/xmpicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/xmpicker/xmpicker.js"></script>
<script type="text/javascript">
	var gdconfig = {
		id : 'wzList-infoGrid',
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
		gridFormId : 'wzList-infoGridForm',
		exportUrl : 'wzList-info-export.do'
	};
	createxmPicker({
		modalId : 'xmPicker',
		url : '${scopePrefix}/gcgl/pjXm-simple-list.do'
	});
	createryPicker({
		modalId : 'ryPicker',
		url : '${scopePrefix}/hr/commRy-simple-list.do'
	});
	var gdtable;

	$(function() {
		gdtable = new Table(gdconfig);
		gdtable.configPagination('.m-pagination');
		gdtable.configPageInfo('.m-page-info');
		gdtable.configPageSize('.m-page-size');
	});
</script>
</head>
<body>
	<%@include file="/header.jsp"%>
	<div class="row-fluid">
		<%@include file="/menu/xz-workspace.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span10">
			<div class="span12">
				<div class="tabbable" id="tabs-573266">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#panel-564685" data-toggle="tab">固定资产</a>
						</li>
						<li><a href="#panel-294002" data-toggle="tab">低值易耗品</a></li>
						<li><a href="#panel-294003" data-toggle="tab">消耗品</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="panel-564685">
							<p>
								<iframe src="wzList-gz-info-list.do" height="500" width="100%"
									style="border: 0px;"></iframe>
							</p>
						</div>
						<div class="tab-pane" id="panel-294002">
							<p>
								<section id="m-main" class="span12">
									<article class="m-widget">
										<header class="header">
											<h4 class="title">查询</h4>
											<div class="ctrl">
												<a class="btn"><i id="wzList-infoSearchIcon"
													class="icon-chevron-up"></i></a>
											</div>
										</header>
										<div id="wzList-infoSearch" class="content content-inner">
											<form name="wzList-infoForm" method="post"
												action="wzList-info-list.do" class="form-inline">
												<label for="wzList-info_name"><spring:message
														code='wzList-info.wzList-info.list.search.name' text='名称' />:</label>
												<input type="text" id="wzList-info_name"
													name="filter_LIKES_fname" value="${param.filter_LIKES_fname}">
												<button class="btn btn-small a-search"
													onclick="document.wzList-infoForm.submit()">查询</button>
												&nbsp;
											</form>
										</div>
									</article>
									<article class="m-blank">
										<div class="pull-left">
											<region:region-permission permission="wzList-info:create">
												<button class="btn btn-small a-insert"
													onclick="location.href='wzList-dz-info-input.do?ftype=2'">新建</button>
											</region:region-permission>
											<region:region-permission permission="wzList-info:delete">
												<button class="btn btn-small a-remove"
													onclick="gdtable.removeAll()">删除</button>
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
												<spring:message code="wzList-info.wzList-info.list.title"
													text="列表" />
											</h4>
										</header>
										<div class="content">
											<form id="wzList-infoGridForm" name="wzList-infoGridForm"
												method='post' action="wzList-info-remove.do"
												class="m-form-blank">
												<table id="wzList-infoGrid" class="m-table table-hover table-bordered">
													<thead>
														<tr>
															<th width="10" class="m-table-check"><input
																type="checkbox" name="checkAll"
																onchange="toggleSelectedItems(this.checked)"></th>
															<!-- 		<th class="sorting" id="ftype">物品类别</th> -->
															<th class="sorting" id="fname">名称</th>
															<th class="sorting" id="fgg">规格</th>
															<th class="sorting" id="fnum">数量</th>
															<th class="sorting" id="fprice">单价</th>
															<th width="80">&nbsp;</th>
															<th width="80">&nbsp;</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${pageDZ.result}" var="item">
															<tr>
																<td><input type="checkbox"
																	class="selectedItem a-check" name="selectedItem"
																	value="${item.fid}"></td>
																<%-- <td>${item.ftype}</td> --%>
																<td><a
																	href="wzList-dz-info-input.do?id=${item.fid}"
																	class="a-update"><spring:message
																			code="core.list.edit" text="${item.fname}" /></a></td>
																<td>${item.fgg}</td>
																<td>${item.fnum}</td>
																<td>${item.fprice}</td>
																<td><a
																	href="wzStorage-info-input.do?fwzid=${item.fid}&ftype=1"
																	class="a-update"><spring:message
																			code="core.list.edit" text="进货" /></a></td>
																<td><a
																	href="wzStorage-info-input.do?fwzid=${item.fid}&ftype=2"
																	class="a-update"><spring:message
																			code="core.list.edit" text="出货" /></a></td>
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
							</p>
						</div>
						<div class="tab-pane" id="panel-294003">
							<p>
								<section id="m-main" class="span12">
									<article class="m-widget">
										<header class="header">
											<h4 class="title">查询</h4>
											<div class="ctrl">
												<a class="btn"><i id="wzList-infoSearchIcon"
													class="icon-chevron-up"></i></a>
											</div>
										</header>
										<div id="wzList-infoSearch" class="content content-inner">
											<form name="wzList-infoForm" method="post"
												action="wzList-info-list.do" class="form-inline">
												<label for="wzList-info_name"><spring:message
														code='wzList-info.wzList-info.list.search.name' text='名称' />:</label>
												<input type="text" id="wzList-info_name"
													name="filter_LIKES_fname" value="${param.filter_LIKES_fname}">
												<button class="btn btn-small a-search"
													onclick="document.wzList-infoForm.submit()">查询</button>
												&nbsp;
											</form>
										</div>
									</article>
									<article class="m-blank">
										<div class="pull-left">
											<region:region-permission permission="wzList-info:create">
												<button class="btn btn-small a-insert"
													onclick="location.href='wzList-dz-info-input.do?ftype=3'">新建</button>
											</region:region-permission>
											<region:region-permission permission="wzList-info:delete">
												<button class="btn btn-small a-remove"
													onclick="gdtable.removeAll()">删除</button>
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
												<spring:message code="wzList-info.wzList-info.list.title"
													text="列表" />
											</h4>
										</header>
										<div class="content">
											<form id="wzList-infoGridForm" name="wzList-infoGridForm"
												method='post' action="wzList-info-remove.do"
												class="m-form-blank">
												<table id="wzList-infoGrid" class="m-table table-hover table-bordered">
													<thead>
														<tr>
															<th width="10" class="m-table-check"><input
																type="checkbox" name="checkAll"
																onchange="toggleSelectedItems(this.checked)"></th>
															<!-- <th class="sorting" id="ftype">物品类别</th> -->
															<th class="sorting" id="fname">名称</th>
															<th class="sorting" id="fgg">规格</th>
															<th class="sorting" id="fnum">数量</th>
															<th class="sorting" id="fprice">单价</th>
															<th width="80">&nbsp;</th>
															<th width="80">&nbsp;</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${pageXH.result}" var="item">
															<tr>
																<td><input type="checkbox"
																	class="selectedItem a-check" name="selectedItem"
																	value="${item.fid}"></td>
																<%-- <td>${item.ftype}</td> --%>
																<td><a
																	href="wzList-dz-info-input.do?id=${item.fid}"
																	class="a-update"><spring:message
																			code="core.list.edit" text="${item.fname}" /></a></td>
																<td>${item.fgg}</td>
																<td>${item.fnum}</td>
																<td>${item.fprice}</td>
																<td><a
																	href="wzStorage-info-input.do?fwzid=${item.fid}&ftype=1"
																	class="a-update"><spring:message
																			code="core.list.edit" text="进货" /></a></td>
																<td><a
																	href="wzStorage-info-input.do?fwzid=${item.fid}&ftype=2"
																	class="a-update"><spring:message
																			code="core.list.edit" text="出货" /></a></td>
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
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="m-spacer"></div>
		</section>
		<!-- end of main -->
	</div>
</body>
</html>
