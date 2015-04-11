<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "xz-home");
%>
<%
	pageContext.setAttribute("currentMenu", "xz-xw");
%>
<!doctype html>
<html lang="zh">

<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="dev.xzCommNews-info.list.title"
		text="上级新闻 - 新闻平台 - 行政管理" /></title>
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
			'filter_LIKES_fnewcontent' : '${param.filter_LIKES_fnewcontent}',
			'filter_GTD_fcreatedate' : '${param.filter_GTD_fcreatedate}',
			'filter_LTD_fcreatedate' : '${param.filter_LTD_fcreatedate}'
		},
		selectedItemClass : 'selectedItem',
		gridFormId : 'xzCommNews-infoGridForm',
		exportUrl : 'xzCommNews-info-export.do'
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
						<a class="btn"><i id="xzCommNews-infoSearchIcon"
							class="icon-chevron-up"></i></a>
					</div>
				</header>
				<div id="xzCommNews-infoSearch" class="content content-inner">

					<form name="xzCommNews-infoForm" method="post"
						action="xzCommNews-info-list.do" class="form-inline">
						<label for="xzCommNews-info_fname"><spring:message
								code="xzCommNews-info.xzCommNews-info.list.search.fname"
								text="新闻标题" />:</label> <input type="text" id="xzCommNews-info_fname"
							name="filter_LIKES_fname" value="${param.filter_LIKES_fname}">
						<label for="xzCommNews-info_ffnewcontent"><spring:message
								code="xzCommNews-info.xzCommNews-info.list.search.fnewcontent"
								text="新闻内容" />:</label> <input type="text"
							id="xzCommNews-info_fnewcontent" name="filter_LIKES_fnewcontent"
							value="${param.filter_LIKES_fnewcontent}"> <label
							for="commRy-info_fcreatedate"><spring:message
								code='commRy-info.commRy-info.list.search.fcreatedate'
								text='发布时间' />:</label>
						<div class="input-append datepicker date"
							style="padding-left: 0px;">
							<input id="commRy-info_fcreatedate" type="text"
								name="filter_GTD_fcreatedate"
								value="${param.filter_GTD_fcreatedate}" size="40" class="text "
								style="background-color:white;cursor:default; width: 160px;">
							<span class="add-on"
								style="padding-top: 2px; padding-bottom: 2px;"><i
								class="icon-calendar"></i></span>
						</div>
						至
						<div class="input-append datepicker date"
							style="padding-left: 0px;">
							<input id="commRy-info_fcreatedate" type="text"
								name="filter_LTD_fcreatedate"
								value="${param.filter_LTD_fcreatedate}" size="40" class="text "
								style="background-color:white;cursor:default; width: 160px;">
							<span class="add-on"
								style="padding-top: 2px; padding-bottom: 2px;"><i
								class="icon-calendar"></i></span>
						</div>
						<button class="btn btn-small a-search" onclick="document.xzCommNews-infoForm.submit()">查询</button>&nbsp;
					</form>

				</div>
			</article>

			<article class="m-blank">
				<div class="pull-left">
					<region:region-permission permission="xzCommNews-info:create">
						<button class="btn btn-small a-insert"
							onclick="location.href='xzCommNews-info-input.do'">新建</button>
					</region:region-permission>
					<region:region-permission permission="xzCommNews-info:delete">
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
						<spring:message code="xzCommNews-info.xzCommNews-info.list.title"
							text="列表" />
					</h4>
				</header>
				<div class="content">
					<form id="xzCommNews-infoGridForm" name="xzCommNews-infoGridForm"
						method='post' action="xzCommNews-info-remove.do"
						class="m-form-blank">
						<table id="xzCommNews-infoGrid" class="m-table table-hover table-bordered">
							<thead>
								<tr>
									<th width="10" class="m-table-check"><input
										type="checkbox" name="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th>
									<th class="sorting" name="fname">新闻标题</th>
									<th class="sorting" name="ffaburen">发布单位</th>
									<th class="sorting" name="fcreatedate">发布时间</th>
									<th class="sorting" name="fupdatedate">更新时间</th>
									<th class="sorting" name="froles">访问权限</th>
									<th class="sorting" name="fitop">是否置顶</th>
									<th class="sorting" name="ftuijian">是否推荐</th>
									<th class="sorting" name="forder">排序</th>
									<th class="sorting" name="freadnum">阅读次数</th>
									<th width="80">&nbsp;</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach items="${page.result}" var="item">
									<tr>
										<td><input type="checkbox" class="selectedItem a-check"
											name="selectedItem" value="${item.fid}"></td>
										<td>${item.fname}</td>
										<td>${item.ffaburen}</td>
										<td>${item.fcreatedate}</td>
										<td>${item.fupdatedate}</td>
										<td>${item.froles}</td>
										<td>${item.fitop}</td>
										<td>${item.ftuijian}</td>
										<td>${item.forder}</td>
										<td>${item.freadnum}</td>
										<td><a href="xzCommNews-info-input.do?id=${item.fid}"
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
