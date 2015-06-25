<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "xz-home");
%>
<%
	pageContext.setAttribute("currentMenu", "xz-fgs");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="dev.commpany-info.list.title"
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
			'filter_LIKES_fname' : '${param.filter_LIKES_fname}'
		},
		selectedItemClass : 'selectedItem',
		gridFormId : 'commpany-infoGridForm',
		exportUrl : 'commpany-info-export.do'
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
						<a class="btn"><i id="commpany-infoSearchIcon"
							class="icon-chevron-up"></i></a>
					</div>
				</header>
				<div id="commpany-infoSearch" class="content content-inner">
					<form name="commpany-infoForm" method="post"
						action="commpany-info-list.do" class="form-inline">
						<label for="commpany-info_fname"><spring:message
								code='commpany-info.commpany-info.list.search.fname' text='分公司/注册名称' />:</label>
						<input type="text" id="commpany-info_fname"
							name="filter_LIKES_fname" value="${param.filter_LIKES_fname}">
						<button class="btn btn-small a-search"
							onclick="document.commpany-infoForm.submit()">查询</button>
						&nbsp;
					</form>
				</div>
			</article>
			<article class="m-blank">
				<div class="pull-left">
					<region:region-permission permission="commpany-info:create">
						<button class="btn btn-small a-insert"
							onclick="location.href='commpany-info-input.do'">新建</button>
					</region:region-permission>
					<region:region-permission permission="commpany-info:delete">
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
						<spring:message code="commpany-info.commpany-info.list.title"
							text="列表" />
					</h4>
				</header>
				<div class="content">
					<form id="commpany-infoGridForm" name="commpany-infoGridForm"
						method='post' action="commpany-info-remove.do"
						class="m-form-blank">
						<table id="commpany-infoGrid" class="m-table table-hover table-bordered">
							<thead>
								<tr>
									<th width="10" class="m-table-check"><input
										type="checkbox" name="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th>
									<th class="sorting" name="fname">分公司/注册名称</th>
									<th class="sorting" name="faddress">分公司地址</th>
									<th class="sorting" name="ffuzeren">负责人</th>
									<th class="sorting" name="ftel">联系电话</th>
									<!-- <th class="sorting" name="fjsfzr">技术负责人</th> -->
									<th class="sorting" name="fbadate">备案或注册日期</th>
									<!-- <th class="sorting" name="fnpry">拟派人员</th> -->
									<th class="sorting" name="fyxdate">有效期</th>
									<!--         	<th class="sorting" name="fglxyqdqk">管理协议签订情况</th>
									        	<th class="sorting" name="fxyqdqk">签订时间</th>
									        	<th class="sorting" name="fglfmoney">管理费金额</th>
									        	<th class="sorting" name="fglpay">管理费支付办法</th>
									        	<th class="sorting" name="fyfjine">已付金额</th>
									        	<th class="sorting" name="fxczfje">下次支付金额</th>
									        	<th class="sorting" name="fxczfsj">下次支付时间</th> -->
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.result}" var="item">
									<tr>
										<td><input type="checkbox" class="selectedItem a-check"
											name="selectedItem" value="${item.fid}"></td>
										<td><a href="commpany-info-input.do?id=${item.fid}"
											class="a-update"><spring:message code="core.list.edit"
													text="${item.fname}" /></a></td>
										<td>${item.faddress}</td>
										<td>${ryMap[item.ffuzeren].fname}</td>
										<td>${item.ftel}</td>
										<%-- 	 <td>${item.fjsfzr}</td> --%>
										<td>${item.fbadate}</td>
										<%-- <td>${item.fnpry}</td> --%>
										<td>${item.fyxdate}</td>
										<%--    	 	 <td>${item.fglxyqdqk}</td>
      	 	 <td>${item.fxyqdqk}</td>
      	 	 <td>${item.fglfmoney}</td>
      	 	 <td>${item.fglpay}</td>
      	 	 <td>${item.fyfjine}</td>
      	 	 <td>${item.fxczfje}</td>
      	 	 <td>${item.fxczfsj}</td> --%>
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
