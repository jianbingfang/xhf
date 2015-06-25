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
<title><spring:message code="dev.xz-commHt-info.list.title"
		text="合同管理 - 公司档案管理 - 行政管理" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript">
	var config = {
		id : 'xz-commHt-infoGrid',
		pageNo : ${page.pageNo},
		pageSize : ${page.pageSize},
		totalCount : ${page.totalCount},
		resultSize : ${page.resultSize},
		pageCount : ${page.pageCount},
		orderBy : '${page.orderBy == null ? "" : page.orderBy}',
		asc : ${page.asc},
		params : {
			'filter_LIKES_fhetongno' : '${param.filter_LIKES_fhetongno}',
			'filter_LIKES_fhtname' : '${param.filter_LIKES_fhtname}',
			'filter_LIKES_fzongjianname' : '${param.filter_LIKES_fzongjianname}',
			'filter_LIKES_fcity' : '${param.filter_LIKES_fcity}',
			'filter_LIKES_ftotalMoney' : '${param.filter_LIKES_ftotalMoney}',
			'filter_GTN_fjianlifei' : '${param.filter_GTN_fjianlifei}',
			'filter_LTN_fjianlifei' : '${param.filter_LTN_fjianlifei}',
		},
		selectedItemClass : 'selectedItem',
		gridFormId : 'xz-commHt-infoGridForm',
		exportUrl : 'xz-commHt-info-export.do'
	};

	var table;
	$(function() {
		$("#xz-commHt-infoForm")
				.validate(
				{
					submitHandler : function(form) {
						bootbox.animate(false);
						var box = bootbox
								.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
						form.submit();
					},
					errorClass : 'validate-error'
				});


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
						<a class="btn"><i id="xz-commHt-infoSearchIcon"
							class="icon-chevron-up"></i></a>
					</div>
				</header>
				<div id="xz-commHt-infoSearch" class="content content-inner">
					<form name="xz-commHt-infoForm" method="post"
						action="xz-commHt-info-list.do" class="form-inline">
						<label for="xz-commHt-info_fhetongno"><spring:message
								code='xz-commHt-info.xz-commHt-info.list.search.fhetongno'
								text='编号' />:</label> <input type="text" id="xz-commHt-info_fhetongno"
							style="width: 120px;" name="filter_LIKES_fhetongno"
							value="${param.filter_LIKES_fhetongno}"> <label
							for="xz-commHt-info_fhtname"><spring:message
								code='xz-commHt-info.xz-commHt-info.list.search.fhtname'
								text='合同名称' />:</label> <input type="text" id="xz-commHt-info_fhtname"
							style="width: 120px;" name="filter_LIKES_fhtname"
							value="${param.filter_LIKES_fhtname}"> <label
							for="xz-commHt-info_fzongjianname"><spring:message
								code='xz-commHt-info.xz-commHt-info.list.search.fzongjianname'
								text='总监' />:</label> <input type="text"
							id="xz-commHt-info_fzongjianname" style="width: 100px;"
							name="filter_LIKES_fzongjianname"
							value="${param.filter_LIKES_fzongjianname}"> </label> &nbsp;<select
							class="form-control" id="xz-commHt-info_fprojecttype" name="filter_LIKES_fprojecttype"
							value="${param.filter_LIKES_fprojecttype}" style="width: 120px">
							<option value=""
								<c:if test="${param.filter_LIKES_fprojecttype=='房屋建筑工程'}"> selected="selected"  </c:if>>工程类别</option>
							<option value="房屋建筑工程"
								<c:if test="${param.filter_LIKES_fprojecttype=='房屋建筑工程'}"> selected="selected"  </c:if>>房屋建筑工程</option>
							<option value="市政公用工程"
								<c:if test="${param.filter_LIKES_fprojecttype=='市政公用工程'}"> selected="selected"  </c:if>>市政公用工程</option>
							<option value="电力工程"
								<c:if test="${param.filter_LIKES_fprojecttype=='电力工程'}"> selected="selected"  </c:if>>电力工程</option>
							<option value="冶炼工程"
								<c:if test="${param.filter_LIKES_fprojecttype=='冶炼工程'}"> selected="selected"  </c:if>>冶炼工程</option>
							<option value="公路工程"
								<c:if test="${param.filter_LIKES_fprojecttype=='公路工程'}"> selected="selected"  </c:if>>公路工程</option>
							<option value="矿山工程"
								<c:if test="${param.filter_LIKES_fprojecttype=='矿山工程'}"> selected="selected"  </c:if>>矿山工程</option>
							<option value="化工石油工程"
								<c:if test="${param.filter_LIKES_fprojecttype=='化工石油工程'}"> selected="selected"  </c:if>>化工石油工程</option>
							<option value="水利水电工程"
								<c:if test="${param.filter_LIKES_fprojecttype=='水利水电工程'}"> selected="selected"  </c:if>>水利水电工程</option>
							<option value="农林工程"
								<c:if test="${param.filter_LIKES_fprojecttype=='农林工程'}"> selected="selected"  </c:if>>农林工程</option>
							<option value="铁路工程"
								<c:if test="${param.filter_LIKES_fprojecttype=='铁路工程'}"> selected="selected"  </c:if>>铁路工程</option>
							<option value="港口与航道工程"
								<c:if test="${param.filter_LIKES_fprojecttype=='港口与航道工程'}"> selected="selected"  </c:if>>港口与航道工程</option>
							<option value="航天航空工程"
								<c:if test="${param.filter_LIKES_fprojecttype=='航天航空工程'}"> selected="selected"  </c:if>>航天航空工程</option>
							<option value="通信工程"
								<c:if test="${param.filter_LIKES_fprojecttype=='通信工程'}"> selected="selected"  </c:if>>通信工程</option>
							<option value="机电安装工程"
								<c:if test="${model.fprojecttype=='机电安装工程'}"> selected="selected"  </c:if>>机电安装工程</option></select>&nbsp;
								<label
							for="xz-commHt-info_fzongjianname"><spring:message
								code='xz-commHt-info.xz-commHt-info.list.search.fzongjianname'
								text='监理费' />:</label>
							<input type="number" id="xz-commHt-info_fjianlifei"
							style="width: 80px;" name="filter_GTN_fjianlifei"
							value="${param.filter_GTN_fjianlifei}" /> ~
							<input type="number" id="xz-commHt-info_fjianlifei"
							style="width: 80px;" name="filter_LTN_fjianlifei"
							value="${param.filter_LTN_fjianlifei}" />
							<button class="btn btn-small a-search"
								onclick="document.xz-commHt-infoForm.submit()">查询</button>
							&nbsp; 
					</form>
				</div>
			</article>
			<article class="m-blank">
				<div class="pull-left">
					<region:region-permission permission="xz-commHt-info:create">
						<button class="btn btn-small a-insert"
							onclick="location.href='xz-commHt-info-input.do'">新建</button>
					</region:region-permission>
					<region:region-permission permission="xz-commHt-info:delete">
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
						<spring:message code="xz-commHt-info.xz-commHt-info.list.title"
							text="列表" />
					</h4>
				</header>
				<div class="content">
					<form id="xz-commHt-infoGridForm" name="xz-commHt-infoGridForm"
						method='post' action="xz-commHt-info-remove.do"
						class="m-form-blank">
						<table id="xz-commHt-infoGrid" class="m-table table-hover table-bordered">
							<thead>
								<tr>
									<th style="width:10px" class="m-table-check"><input
										type="checkbox" name="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th>
									<th class="sorting" id="fhetongno">合同编号</th>
									<th class="sorting" id="fhtname">合同名称</th>
									<!-- <th class="sorting" id="fprojecttype">工程类别</th> -->
									<th class="sorting" id="fscale">工程规模</th>
									<th class="sorting" id="ftotalMoney">总投资(万元)</th>
									<th class="sorting" id="fjianlifei">监理费(万元)</th>
									<th class="sorting" id="fzongjian">总监</th>
									<th class="sorting" id="fstartdate">开工时间</th>
									<th class="sorting" id="fenddate">竣工时间</th>
									<th class="sorting" id="fhtqi">合同期</th>
									<!-- <th class="sorting" id="fyezhuname">业主名称</th> -->
									<th class="sorting" id="fxzfzwz">放置位置</th>
									<th class="sorting" id="fzkstate">在库状态</th>
									<th class="sorting" id="fmemo">备注</th>
									<!-- <th style="width:80px">&nbsp;</th> -->
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.result}" var="item">
									<tr
										ondblclick="window.location='xz-commHt-info-input.do?id=${item.fid}'">
										<td><input type="checkbox" class="selectedItem a-check"
											name="selectedItem" value="${item.fid}"></td>
										<%--  <td>${item.fpaytype}</td> --%>
										<td>${item.fhetongno}</td>
										<td class="span3">${item.fhtname}</td>
										<%-- <td>${item.fprojecttype}</td> --%>
										<td>${item.fscale}</td>
										<td>${item.ftouzie}</td>
										<td>${item.fjianlifei}</td>
										<td>${ryMap[item.fzongjian].fname}</td>
										<td>${item.fstartdate}</td>
										<td>${item.fenddate}</td>
										<td>${item.fhtqi }</td>
										<%-- <td>${item.fyezhuname}</td> --%>
										<td>${item.fxzfzwz}</td>
										<td><c:if test="${item.fzkstate=='在库'}"> <font color="green">在库</font>  </c:if>
											<c:if test="${item.fzkstate=='未在库'}"> <font color="red">未在库</font>  </c:if></td>
										<td>${item.fmemo}</td>
										<%-- <td><a href="xz-commHt-info-input.do?id=${item.fid}"
											class="a-update"><spring:message code="core.list.edit"
													text="编辑" /></a></td> --%>
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
