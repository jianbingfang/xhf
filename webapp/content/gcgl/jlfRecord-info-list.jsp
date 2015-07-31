<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "gcgl-home");
%>
<%
	pageContext.setAttribute("currentMenu", "gcgl-jlf");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="dev.jlfRecord-info.list.title"
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
		gridFormId : 'jlfRecord-infoGridForm',
		exportUrl : 'jlfRecord-info-export.do'
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
		<%@include file="/menu/gcgl-workspace.jsp"%>
		<div class="row-fluid">
			<!-- start of main -->
			<section id="m-main" class="span10">
				<%--<article class="m-widget">--%>
					<%--<header class="header">--%>
						<%--<h4 class="title">查询</h4>--%>
						<%--<div class="ctrl">--%>
							<%--<a class="btn"><i id="jlfRecord-infoSearchIcon"--%>
								<%--class="icon-chevron-up"></i></a>--%>
						<%--</div>--%>
					<%--</header>--%>
					<%--<div id="jlfRecord-infoSearch" class="content content-inner">--%>
						<%--<form name="jlfRecord-infoForm" method="post"--%>
							<%--action="jlfRecord-info-list.do" class="form-inline">--%>
							<%--<label for="jlfRecord-info_name"><spring:message--%>
									<%--code='jlfRecord-info.jlfRecord-info.list.search.name' text='名称' />:</label>--%>
							<%--<input type="text" id="jlfRecord-info_name"--%>
								<%--name="filter_LIKES_name" value="${param.filter_LIKES_name}">--%>
							<%--<button class="btn btn-small a-search"--%>
								<%--onclick="document.jlfRecord-infoForm.submit()">查询</button>--%>
							<%--&nbsp;--%>
						<%--</form>--%>
					<%--</div>--%>
				<%--</article>--%>
				<article class="m-blank">
					<div class="pull-left">
						 <region:region-permission permission="jlfRecord-info:create">
							<button class="btn btn-small a-insert"
								onclick="location.href='jlfRecord-info-input.do?fxmid=${fxmid}'">新建</button>
						</region:region-permission>
						<region:region-permission permission="jlfRecord-info:delete">
							<button class="btn btn-small a-remove"
								onclick="table.removeAll()">删除</button>
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
							<spring:message code="jlfRecord-info.jlfRecord-info.list.title"
								text="列表" />
						</h4>
					</header>
					<div class="content">
						<form id="jlfRecord-infoGridForm" name="jlfRecord-infoGridForm"
							method='post' action="jlfRecord-info-remove.do?fxmid=${fxmid}"
							class="m-form-blank">
							<table id="jlfRecord-infoGrid" class="m-table table-hover table-bordered">
								<thead>
									<tr>
										<th style="width:10px;left: auto;" class="m-table-check"><input
											type="checkbox" name="checkAll"
											onchange="toggleSelectedItems(this.checked)"></th>
										<th class="sorting" id="fhtjlf">合同监理费</th>
										<!-- 	<th class="sorting" id="fshouqudate">计划收取时间</th> -->
										<!-- <th class="sorting" id="fshifoukaip">是否开票</th>
										<th class="sorting" id="fkaipiaodate">开票时间</th> -->
										<th class="sorting" id="fshifoudaozhang">是否到账</th>
										<th class="sorting" id="fdaozhangdate">到账时间</th>
										<th class="sorting" id="fmemo">备注</th>
										<th width="80">&nbsp操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${page.result}" var="item">
										<tr>
											<td><input type="checkbox" class="selectedItem a-check"
												name="selectedItem" value="${item.fid}"></td>
											<td>${item.fhtjlf}</td>
											<%-- <td>${item.fshouqudate}</td> --%>
											<%-- <td>${item.fshifoukaip}</td>
											<td>${item.fkaipiaodate}</td> --%>
											<td>${item.fshifoudaozhang}</td>
											<td>${item.fdaozhangdate}</td>
											<td>${item.fmemo}</td>
											<td><a href="jlfRecord-info-input.do?id=${item.fid}&fxmid=${fxmid}"
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
	</div>
</body>
</html>
