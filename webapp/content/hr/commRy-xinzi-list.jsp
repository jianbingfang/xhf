<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "hr-home");
%>
<%
	pageContext.setAttribute("currentMenu", "commRy");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="dev.commRy-info.list.title"
		text="人员信息 - 员工管理 - 人力资源" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript">
	var config = {
		id : 'commRy-infoGrid',
		pageNo : ${page.pageNo},
		pageSize : ${page.pageSize},
		totalCount : ${page.totalCount},
		resultSize : ${page.resultSize},
		pageCount : ${page.pageCount},
		orderBy : '${page.orderBy == null ? "" : page.orderBy}',
		asc : ${page.asc},
		params : {
			'filter_LIKES_fname' : '${param.filter_LIKES_fname}',
			'filter_GTD_frzdate' : '${param.filter_GTD_frzdate}',
			'filter_LTD_frzdate' : '${param.filter_LTD_frzdate}'
		},
		selectedItemClass : 'selectedItem',
		gridFormId : 'commRy-infoGridForm',
		exportUrl : 'commRy-info-export.do'
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
	<div class="row-fluid">
		<!-- start of main -->
			<article class="m-widget">
				<header class="header">
					<h4 class="title">查询</h4>
					<div class="ctrl">
						<a class="btn"><i id="commRy-infoSearchIcon"
							class="icon-chevron-up"></i></a>
					</div>
				</header>
				<div id="commRy-infoSearch" class="content content-inner">
					<form name="commRy-infoForm" method="post"
						action="commRy-info-list.do" class="form-inline">
						<label for="commRy-info_name"><spring:message
								code='commRy-info.commRy-info.list.search.name' text='姓名' />:</label> <input
							type="text" id="commRy-info_name" name="filter_LIKES_fname"
							value="${param.filter_LIKES_fname}"> <label
							for="commRy-info_ruzhi"><spring:message
								code='commRy-info.commRy-info.list.search.name' text='入职时间' />:</label>
						<div class="input-append datepicker date"
							style="padding-left: 0px;">
							<input id="commRy-info_ruzhi" type="text"
								name="filter_GTD_frzdate" value="${param.filter_GTD_frzdate}"
								size="40" class="text "
								style="background-color:white;cursor:default; width: 160px;">
							<span class="add-on"
								style="padding-top: 2px; padding-bottom: 2px;"><i
								class="icon-calendar"></i></span>
						</div>
						至
						<div class="input-append datepicker date"
							style="padding-left: 0px;">
							<input id="commRy-info_ruzhi" type="text"
								name="filter_LTD_frzdate" value="${param.filter_LTD_frzdate}"
								size="40" class="text "
								style="background-color:white;cursor:default; width: 160px;">
							<span class="add-on"
								style="padding-top: 2px; padding-bottom: 2px;"><i
								class="icon-calendar"></i></span>
						</div>
						<button class="btn btn-small a-search"
							onclick="document.commRy-infoForm.submit()">查询</button>
						&nbsp;
					</form>
				</div>
			</article>
			<article class="m-blank">
			<!-- 	<div class="pull-left">
					<region:region-permission permission="commRy-info:create">
						<button class="btn btn-small a-insert"
							onclick="location.href='commRy-info-input.do'">新建</button>
					</region:region-permission>
					<region:region-permission permission="commRy-info:delete">
						<button class="btn btn-small a-remove" onclick="table.removeAll()">删除</button>
					</region:region-permission>
					<button class="btn btn-small a-export"
						onclick="table.exportExcel()">导出</button>
				</div> -->
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
						<spring:message code="commRy-info.commRy-info.list.title"
							text="列表" />
					</h4>
				</header>
				<div class="content">
					<form id="commRy-infoGridForm" name="commRy-infoGridForm"
						method='post' action="commRy-info-remove.do" class="m-form-blank">
						<table id="commRy-infoGrid" class="m-table table-hover table-bordered">
							<thead>
								<tr>
									<th width="10" class="m-table-check"><input
										type="checkbox" name="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th>
									<th class="sorting" id="fname">姓名</th>
									<th class="sorting" id="fsex">性别</th>
									<th class="sorting" id="fidno">身份证号</th>
									<th class="sorting" id="frzdate">入职时间</th>
									<th class="sorting" id="fxueli">学历</th>
									<th class="sorting" id="fzhuanye">专业</th>
									<th class="sorting" id="fbyyx">毕业时间</th>
									<th class="sorting" id="fjibengongzi">基本工资</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.result}" var="item">
									<tr id="ry${item.fid}">
										<td><input type="checkbox" class="selectedItem a-check"
											name="selectedItem" value="${item.fid}"></td>
										<td>${item.fname}</td>
										<td><c:if test="${item.fsex==0}">	
								    		女
								    	</c:if> <c:if test="${item.fsex==1}">	
								    		男
								    	</c:if></td>
										<td>${item.fidno}</td>
										<td>${item.frzdate}</td>
										<td><c:if test="${item.fxueli=='-1'}"> 小学 </c:if> <c:if
												test="${item.fxueli=='0'}"> 初中</c:if> <c:if
												test="${item.fxueli=='1'}">中专</c:if> <c:if
												test="${item.fxueli=='2'}"> 大专</c:if> <c:if
												test="${item.fxueli=='3'}"> 本科</c:if> <c:if
												test="${item.fxueli=='4'}">研究生</c:if> <c:if
												test="${item.fxueli=='5'}">博士</c:if></td>
										<td>${item.fzhuanye}</td>
										<td>${item.fbydate}</td>
										<td>${item.fjbgz}</td>
										<td></td>
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
