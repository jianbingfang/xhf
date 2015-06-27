<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "hr-home");
%>
<%
	pageContext.setAttribute("currentMenu", "hrPx");
%>
<!doctype html>
<html lang="zh">

<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="dev.hrPx-info.list.title"
		text="内部培训 - 员工培训 - 人力资源" /></title>
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
			'filter_LIKES_fpxzt' : '${param.filter_LIKES_fpxzt}',
			'filter_GTD_fdate' : '${param.filter_GTD_fdate}',
			'filter_LTD_fdate' : '${param.filter_LTD_fdate}'
		},
		selectedItemClass : 'selectedItem',
		gridFormId : 'hrPx-infoGridForm',
		exportUrl : 'hrPx-info-export.do'
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
							<li>员工培训<span class="divider">/</span>
							</li>
							<li class="active">内部培训</li>
						</ul>
					</div>
				</div>
			</div> -->
			<article class="m-widget">
				<header class="header">
					<h4 class="title">查询</h4>
					<div class="ctrl">
						<a class="btn"><i id="hrPx-infoSearchIcon"
							class="icon-chevron-up"></i></a>
					</div>
				</header>
				<div id="hrPx-infoSearch" class="content content-inner">

					<form name="hrPx-infoForm" method="post" action="hrPx-info-list.do"
						class="form-inline">
						<label for="hrPx-info_name"><spring:message
								code='hrPx-info.hrPx-info.list.search.name' text='培训主题' />:</label> <input
							type="text" id="hrPx-info_name" name="filter_LIKES_fpxzt"
							value="${param.filter_LIKES_fpxzt}"> <label
							for="hrPx-info_name"><spring:message
								code='hrPx-info.hrPx-info.list.search.name' text='培训时间' />: </label>
						<div class="input-append datepicker date"
							style="padding-left: 0px;">
							从 <input id="commRy-info_ruzhi" type="text"
								name="filter_GTD_fdate" value="${param.filter_GTD_fdate}"
								size="40" class="text "
								style="background-color:white;cursor:default; width: 160px;">
							<span class="add-on"
								style="padding-top: 2px; padding-bottom: 2px;"><i
								class="icon-calendar"></i></span>
						</div>
						至
						<div class="input-append datepicker date"
							style="padding-left: 0px;">
							<input id="commRy-info_ruzhi" type="text" name="filter_LTD_fdate"
								value="${param.filter_LTD_fdate}" size="40" class="text "
								style="background-color:white;cursor:default; width: 160px;">
							<span class="add-on"
								style="padding-top: 2px; padding-bottom: 2px;"><i
								class="icon-calendar"></i></span>
						</div>
						<button class="btn btn-small a-search"
							onclick="document.hrPx-infoForm.submit()">查询</button>
						&nbsp;
					</form>

				</div>
			</article>

			<article class="m-blank">
				<div class="pull-left">
					<region:region-permission permission="hrPx-info:create">
						<button class="btn btn-small a-insert"
							onclick="location.href='hrPx-info-input.do'">新建</button>
					</region:region-permission>
					<region:region-permission permission="hrPx-info:delete">
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
						<spring:message code="hrPx-info.hrPx-info.list.title" text="列表" />
					</h4>
				</header>
				<div class="content">
					<form id="hrPx-infoGridForm" name="hrPx-infoGridForm" method='post'
						action="hrPx-info-remove.do" class="m-form-blank">
						<table id="hrPx-infoGrid" class="m-table table-hover table-bordered">
							<thead>
								<tr>
									<th width="10" class="m-table-check"><input
										type="checkbox" name="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th>
									<th class="sorting" name="fpxzt">培训主题</th>
									<th class="sorting" name="fdate">培训时间</th>
									<th class="sorting" name="fpxdd">培训地点</th>
									<%--<th class="sorting" name="fzzdw">组织部门</th>--%>
									<th class="sorting" name="fcjrs">参加人数</th>
									<%--<th class="sorting" name="ftgrs">通过人数</th>--%>
									<th width="80">&nbsp;</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach items="${page.result}" var="item">
									<tr>
										<td><input type="checkbox" class="selectedItem a-check"
											name="selectedItem" value="${item.fid}"></td>
										<td>${item.fpxzt}</td>
										<td>${item.fdate}</td>
										<td>${item.fpxdd}</td>
										<%--<td>${item.fzzdw}</td>--%>
										<td>${item.fcjrs}</td>
										<%--<td>${item.ftgrs}</td>--%>
										<td><a href="hrPx-info-input.do?id=${item.fid}"
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
