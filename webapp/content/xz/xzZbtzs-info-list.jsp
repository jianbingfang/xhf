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
<title><spring:message code="dev.xzZbtzs-info.list.title"
		text="中标通知书 - 公司档案管理 - 行政管理" /></title>
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
			'filter_LIKES_ffzdw' : '${param.filter_LIKES_ffzdw}',
			'filter_GTD_fzbje' : '${param.filter_GTD_fzbje}',
			'filter_LTD_fzbje' : '${param.filter_LTD_fzbje}',
			'filter_GTD_ffzrq' : '${param.filter_GTD_ffzrq}',
			'filter_LTD_ffzrq' : '${param.filter_LTD_ffzrq}',
			'filter_LIKES_fzongjianname':'${param.filter_LIKES_fzongjianname}'
		},
		selectedItemClass : 'selectedItem',
		gridFormId : 'xzZbtzs-infoGridForm',
		exportUrl : 'xzZbtzs-info-export.do'
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
			<!-- <div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="xz-workspace.do">行政管理</a> <span class="divider">/</span>
							</li>
							<li>公司档案管理<span class="divider">/</span>
							</li>
							<li class="active">中标通知书</li>
						</ul>
					</div>
				</div>
			</div> -->
			<article class="m-widget">
				<header class="header">
					<h4 class="title">查询</h4>
					<div class="ctrl">
						<a class="btn"><i id="xzZbtzs-infoSearchIcon"
							class="icon-chevron-up"></i></a>
					</div>
				</header>
				<div id="xzZbtzs-infoSearch" class="content content-inner">
					<form name="xzZbtzs-infoForm" method="post"
						action="xzZbtzs-info-list.do" class="form-inline">
						<label for="xzZbtzs-info_fxmname"><spring:message
								code='xzZbtzs-info.xzZbtzs-info.list.search.fxmname' text='项目名称' />:</label>
						<input type="text" id="xzZbtzs-info_fxmname" style="width:100px;"
							name="filter_LIKES_fxmname" value="${param.filter_LIKES_fxmname}">&nbsp;&nbsp;
							<label for="xzJgysbg-info_fzongjianname"><spring:message
								code='xzJgysbg-info.xzJgysbg-info.list.search.fzongjianname'
								text='总监' />:</label> <input type="text" id="xzJgysbg-info_fzongjianname" style="width:100px;"
							name="filter_LIKES_fzongjianname" value="${param.filter_LIKES_fzongjianname}">&nbsp;&nbsp;
						<%-- <label for="xzZbtzs-info_ffzdw"><spring:message
								code='xzZbtzs-info.xzZbtzs-info.list.search.ffzdw' text='发证单位' />:</label>
						<input type="text" id="xzZbtzs-info_ffzdw"
							name="filter_LIKES_ffzdw" value="${param.filter_LIKES_ffzdw}">&nbsp;&nbsp; --%>
						<label for="xzZbtzs-info_fzbje"><spring:message
								code='xzZbtzs-info.xzZbtzs-info.list.search.fzbje' text='中标金额' />:</label>
						<input id="xzZbtzs-info_fzbje" type="number"
							name="filter_GTD_fzbje" value="${param.filter_GTD_fzbje}"
							size="40" class="text "
							style="background-color:white;cursor:default; width:80px;">
						~ <input id="xzZbtzs-info_fzbje" type="number"
							name="filter_LTD_fzbje" value="${param.filter_LTD_fzbje}"
							size="40" class="text "
							style="background-color:white;cursor:default; width: 80px;">&nbsp;&nbsp;
						<label for="xzZbtzs-info_ffzrq"><spring:message
								code='xzZbtzs-info.xzZbtzs-info.list.search.ffzrq' text='发证日期' />:</label>
						<div class="input-append datepicker date"
							style="padding-left: 0px;">
							<input id="xzZbtzs-info_fxmname" type="text"
								name="filter_GTD_ffzrq" value="${param.filter_GTD_ffzrq}"
								size="40" class="text "
								style="background-color:white;cursor:default; width: 100px;">
							<span class="add-on"
								style="padding-top: 2px; padding-bottom: 2px;"><i
								class="icon-calendar"></i></span>
						</div>
						至
						<div class="input-append datepicker date"
							style="padding-left: 0px;">
							<input id="xzZbtzs-info_ffzrq" type="text"
								name="filter_LTD_ffzrq" value="${param.filter_LTD_ffzrq}"
								size="40" class="text "
								style="background-color:white;cursor:default; width: 100px;">
							<span class="add-on"
								style="padding-top: 2px; padding-bottom: 2px;"><i
								class="icon-calendar"></i></span>
						</div>
						<button class="btn btn-small a-search"
							onclick="document.xzZbtzs-infoForm.submit()">查询</button>
						&nbsp;
					</form>
				</div>
			</article>
			<article class="m-blank">
				<div class="pull-left">
					<region:region-permission permission="xzZbtzs-info:create">
						<button class="btn btn-small a-insert"
							onclick="location.href='xzZbtzs-info-input.do'">新建</button>
					</region:region-permission>
					<region:region-permission permission="xzZbtzs-info:delete">
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
						<spring:message code="xzZbtzs-info.xzZbtzs-info.list.title"
							text="列表" />
					</h4>
				</header>
				<div class="content">
					<form id="xzZbtzs-infoGridForm" name="xzZbtzs-infoGridForm"
						method='post' action="xzZbtzs-info-remove.do" class="m-form-blank">
						<table id="xzZbtzs-infoGrid" class="m-table table-hover table-bordered">
							<thead>
								<tr>
									<th style="width: 10px" class="m-table-check"><input
										type="checkbox" name="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th>
									<th class="sorting" id="fcode">编号</th>
									<th class="sorting" id="fxmname" >项目名称</th>
									<!-- <th class="sorting" id="ffzdw">发证单位</th> -->
									<th class="sorting" id="fzbje">中标金额 (元)</th>

									<th class="sorting" id="fzbfl">中标费率</th>

									<th class="sorting" id="fzongjian">总监</th>
									<th class="sorting" id="ffzrq">发证日期</th>
									<th class="sorting" id="fjdjg">监督机构</th>
									<th class="sorting" id="ffzwz">放置位置</th>
									<th class="sorting" id="fzkstate">在库状态</th>
									<th class="sorting" id="fmemo">备注</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.result}" var="item">
									<tr>
										<td><input type="checkbox" class="selectedItem a-check"
											name="selectedItem" value="${item.fid}"></td>
										<td>${item.fcode}</td>
										<td class="span3"><a href="xzZbtzs-info-input.do?id=${item.fid}"
											class="a-update"><spring:message code="core.list.edit"
													text="${item.fxmname}" /></a></td>
										<%-- <td>${item.ffzdw}</td> --%>
										<td>${item.fzbje}</td>
										<td>${item.fzbfl}</td>
										<td>${ryMap[item.fzongjian].fname}</td>
										<td>${item.ffzrq}</td>
										<td>${item.fjdjg}</td>
										<td>${item.ffzwz}</td>
										<td><c:if test="${item.fzkstate=='在库'}"> <font color="green">在库</font>  </c:if>
											<c:if test="${item.fzkstate=='未在库'}"> <font color="red">未在库</font>  </c:if></td>
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
				<div class="btn-group m-page pull-right">
					<%--<input />--%>
				</div>
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
