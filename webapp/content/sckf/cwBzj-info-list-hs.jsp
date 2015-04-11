<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "sckf-home");
%>
<%
	pageContext.setAttribute("currentMenu", "sckf-bzj");
%>
<!doctype html>
<html lang="zh">

<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="dev.sckf-cwBzj-info.list.title"
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
		gridFormId : 'sckf-cwBzj-infoGridForm',
		exportUrl : 'sckf-cwBzj-info-export-hs.do'
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
		<%@include file="/menu/sckf-workspace.jsp"%>

		<!-- start of main -->
		<section id="m-main" class="span10">
			<article class="m-widget">
				<header class="header">
					<h4 class="title">查询</h4>
					<div class="ctrl">
						<a class="btn"><i id="sckf-cwBzj-infoSearchIcon"
							class="icon-chevron-up"></i></a>
					</div>
				</header>
				<div id="sckf-cwBzj-infoSearch" class="content content-inner">

					<form name="sckf-cwBzj-infoForm" method="post"
						action="sckf-cwBzj-info-list-hs.do?type=1" class="form-inline">
						<label for="sckf-cwBzj-info_name"><spring:message
								code='sckf-cwBzj-info.sckf-cwBzj-info.list.search.fxmid'
								text='项目' />:</label> <input type="text" id="sckf-cwBzj-info_name"
							name="filter_LIKES_name" value="${param.filter_LIKES_fxmid}">
						<button class="btn btn-small a-search"
							onclick="document.sckf-cwBzj-infoForm.submit()">查询</button>
						&nbsp;
					</form>

				</div>
			</article>

			<article class="m-blank">
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
						<spring:message code="sckf-cwBzj-info.sckf-cwBzj-info.list.title"
							text="列表" />
					</h4>
				</header>
				<div class="content">
					<form id="sckf-cwBzj-infoGridForm" name="sckf-cwBzj-infoGridForm"
						method='post' action="sckf-cwBzj-info-remove-hs.do"
						class="m-form-blank">
						<table id="sckf-cwBzj-infoGrid" class="m-table table-hover table-bordered">
							<thead>
								<tr>
									<th width="10" class="m-table-check"><input
										type="checkbox" name="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th>
									<th class="sorting" name="fxmid">项目</th>
									<th class="sorting" name="fjnmoney">金额</th>
									<th class="sorting" name="fyzname">收款单位</th>
									<th class="sorting" name="fjndate">交纳日期</th>
									<th class="sorting" name="fjnmethod">交纳方式</th>
									<th class="sorting" name="fissj">是否有收据</th>
									<th class="sorting" name="fzbstatus">是否中标</th>
									<th class="sorting" name="fmoneydate">合同状态</th>
									<th class="sorting" name="fmoneydate">回收负责人</th>
									<th class="sorting" name="fbackdate">回收时间</th>
									<th width="80">&nbsp;</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach items="${page.result}" var="item">
									<tr>
										<td><input type="checkbox" class="selectedItem a-check"
											name="selectedItem" value="${item.fid}"></td>
										<td>${xmMap[item.fxmid].fname}</td>
										<td>${item.fjnmoney}</td>
										<td>${item.fskdw}</td>
										<td>${item.fjndate}</td>
										<td>${item.fjnmethod}</td>
										<td>${item.fissj}</td>
										<td>${xmMap[item.fxmid].fzbstatus}</td>
										<td><c:if test="${htMap[item.fid].fqiandingstatus==0}">未起草</c:if> <c:if
												test="${htMap[item.fid].fqiandingstatus==1}">已经起草</c:if> <c:if
												test="${htMap[item.fid].fqiandingstatus==2}">合同谈判 </c:if> <c:if
												test="${htMap[item.fid].fqiandingstatus==3}">会签通过</c:if> <c:if
												test="${htMap[item.fid].fqiandingstatus==4}">业主签章</c:if> <c:if
												test="${htMap[item.fid].fqiandingstatus==5}">返还归档</c:if></td>
										<td>${ryMap[item.fbackoprator].fname}</td>
										<td>${item.fbackdate}</td>
										<td><a href="sckf-cwBzj-info-input-hs.do?id=${item.fid}&type=${type}"
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
