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
<title><spring:message code="dev.xzChufa-info.list.title"
		text="行政处罚 - 公司档案管理 - 行政管理" /></title>
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
		gridFormId : 'xzChufa-infoGridForm',
		exportUrl : 'xzChufa-info-export.do'
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
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="xz-workspace.do">行政管理</a> <span class="divider">/</span>
							</li>
							<li>公司档案管理<span class="divider">/</span>
							</li>
							<li class="active">行政处罚</li>
						</ul>
					</div>
				</div>
			</div>
			<article class="m-widget">
				<header class="header">
					<h4 class="title">查询</h4>
					<div class="ctrl">
						<a class="btn"><i id="xzChufa-infoSearchIcon"
							class="icon-chevron-up"></i></a>
					</div>
				</header>
				<div id="xzChufa-infoSearch" class="content content-inner">

					<form name="xzChufa-infoForm" method="post"
						action="xzChufa-info-list.do" class="form-inline">
						<label for="xzChufa-info_fname"><spring:message
								code='xzChufa-info.xzChufa-info.list.search.fname' text='标题' />:</label>
						<input type="text" id="xzChufa-info_fname"
							name="filter_LIKES_fname" value="${param.filter_LIKES_fname}">&nbsp;&nbsp;
						<%--<label for="xzChufa-info_fxmid"><spring:message--%>
								<%--code='xzChufa-info.xzChufa-info.list.search.fxmid' text='项目名称' />:</label>--%>
						<%--<input type="text" id="xzChufa-info_fxmid"--%>
						<%--<input type="text" id="xzChufa-info_fxmid"--%>
							<%--name="filter_LIKES_fxmid" value="${param.filter_LIKES_fxmid}">&nbsp;&nbsp;--%>
						<label for="xzChufa-info_fdate"><spring:message
								code='xzChufa-info.xzChufa-info.list.search.fdate' text='日期' />:</label>
						<div class="input-append datepicker date"
							style="padding-left: 0px;">
							<input id="commRy-info_fdate" type="text" name="filter_GTD_fdate"
								value="${param.filter_GTD_fdate}" size="40" class="text "
								style="background-color:white;cursor:default; width: 160px;">
							<span class="add-on"
								style="padding-top: 2px; padding-bottom: 2px;"><i
								class="icon-calendar"></i></span>
						</div>
						至
						<div class="input-append datepicker date"
							style="padding-left: 0px;">
							<input id="commRy-info_fdate" type="text" name="filter_LTD_fdate"
								value="${param.filter_LTD_fdate}" size="40" class="text "
								style="background-color:white;cursor:default; width: 160px;">
							<span class="add-on"
								style="padding-top: 2px; padding-bottom: 2px;"><i
								class="icon-calendar"></i></span>
						</div>
						<button class="btn btn-small a-search"
							onclick="document.xzChufa-infoForm.submit()">查询</button>
						&nbsp;
					</form>

				</div>
			</article>

			<article class="m-blank">
				<div class="pull-left">
					<region:region-permission permission="xzChufa-info:create">
						<button class="btn btn-small a-insert"
							onclick="location.href='xzChufa-info-input.do'">新建</button>
					</region:region-permission>
					<region:region-permission permission="xzChufa-info:delete">
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
						<spring:message code="xzChufa-info.xzChufa-info.list.title"
							text="列表" />
					</h4>
				</header>
				<div class="content">
					<form id="xzChufa-infoGridForm" name="xzChufa-infoGridForm"
						method='post' action="xzChufa-info-remove.do" class="m-form-blank">
						<table id="xzChufa-infoGrid" class="m-table table-hover table-bordered">
							<thead>
								<tr>
									<th style="width: 10px;" class="m-table-check"><input
										type="checkbox" name="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th>
									<th class="sorting" id="fname">标题</th>
									<th class="sorting" id="ffileno">文件号</th>
									<th class="sorting" id="fdate">日期</th>
									<th class="sorting" id="fxmid">项目名称</th>
									<th class="sorting" id="fmemo">备注</th>
									<th style="width:80px;">&nbsp;</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach items="${page.result}" var="item">
									<tr>
										<td><input type="checkbox" class="selectedItem a-check"
											name="selectedItem" value="${item.fid}"></td>
										<td>${item.fname}</td>
										<td>${item.ffileno}</td>
										<td>${item.fdate}</td>
										<td>${xmMap[item.fxmid].fxmname}</td>
										<td>${item.fmemo}</td>
										<td><a href="xzChufa-info-input.do?id=${item.fid}"
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
