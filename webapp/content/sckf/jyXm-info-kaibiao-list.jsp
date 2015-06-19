<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "sckf-home");
%>
<%
	pageContext.setAttribute("currentMenu", "sckf-xmtb");
%>
<!doctype html>
<html lang="zh">

<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="dev.jyXm-info.list.title"
		text="投标项目台账 - 项目投标 - 市场开发" /></title>
<%@include file="/common/s.jsp"%>

<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/xmpicker/xmpicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/xmpicker/jyxmpicker.js">
	</script>
	
<script type="text/javascript">
	var config = {
		id : 'jyXm-infoGrid',
		pageNo : ${page.pageNo},
		pageSize : ${page.pageSize},
		totalCount : ${page.totalCount},
		resultSize : ${page.resultSize},
		pageCount : ${page.pageCount},
		orderBy : '${page.orderBy == null ? "" : page.orderBy}',
		asc : ${page.asc},
		params : {
			'filter_LIKES_fname' : '${param.filter_LIKES_fname}',
			'filter_LIKES_ftype' : '${param.filter_LIKES_ftype}',
			'filter_LIKES_fstate' : '${param.filter_LIKES_fstate}',
			'filter_LIKES_fcity' : '${param.filter_LIKES_fcity}'
		},
		selectedItemClass : 'selectedItem',
		gridFormId : 'jyXm-infoGridForm',
		exportUrl : 'jyXm-info-export.do'
	};

	var table;

	$(function() {
		table = new Table(config);
		table.configPagination('.m-pagination');
		table.configPageInfo('.m-page-info');
		table.configPageSize('.m-page-size');
		
		createxmPicker({
			modalId : 'xmPicker',
			url : '${scopePrefix}/sckf/jyXm-toubiao-simple-list.do',
			redUrl : '${scopePrefix}/sckf/jyXm-info-kaibiao.do'
		});
	});
</script>
</head>
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/js/linkage.js"></script>
<body>
	<%@include file="/header.jsp"%>

	<div class="row-fluid">
		<%@include file="/menu/sckf-workspace.jsp"%>

		<!-- start of main -->
		<section id="m-main" class="span10">
	<!-- 		<div class="container-fluid">
				<ul class="breadcrumb" style="width: 98%">
					<li><a href="sckf-home.do">市场开发</a> <span class="divider">/</span>
					</li>
					<li><a href="jyXm-info-list.do">项目投标</a><span class="divider">/</span></li>
					<li class="active">投标项目台账</li>
				</ul>
			</div> -->
			<article class="m-widget">
				<header class="header">
					<h4 class="title">查询</h4>
					<div class="ctrl">
						<a class="btn"><i id="jyXm-infoSearchIcon"
							class="icon-chevron-up"></i></a>
					</div>
				</header>
				<div id="jyXm-infoSearch" class="content content-inner">

					<form name="jyXm-infoForm" method="post" action="jyXm-info-kaibiao-list.do"
						class="form-inline">
						<label for="jyXm-info_fname"><spring:message
								code='jyXm-info.jyXm-info.list.search.fname' text='工程名称' />:</label> <input
							type="text" id="jyXm-info_fname" name="filter_LIKES_fname"
							value="${param.filter_LIKES_fname}" style="width: 100px">
						<label for="jyXm-info_ftype"><spring:message
								code='jyXm-info.jyXm-info.list.search.ftype' text='工程类别' />:</label> <select
							class="form-control" id="jyXm-info_ftype" name="ftype"
							value="${model.ftype}" class=" required" style="width: 100px">
							<option value="">全部</option>
							<option value="房屋建筑工程"
								<c:if test="${param.filter_EQS_ftype=='房屋建筑工程'}"> selected="selected"  </c:if>>房屋建筑工程</option>
							<option value="市政公用工程"
								<c:if test="${param.filter_EQS_ftype=='市政公用工程'}"> selected="selected"  </c:if>>市政公用工程</option>
							<option value="电力工程"
								<c:if test="${param.filter_EQS_ftype=='电力工程'}"> selected="selected"  </c:if>>电力工程</option>
							<option value="冶炼工程"
								<c:if test="${param.filter_EQS_ftype=='冶炼工程'}"> selected="selected"  </c:if>>冶炼工程</option>
							<option value="公路工程"
								<c:if test="${param.filter_EQS_ftype=='公路工程'}"> selected="selected"  </c:if>>公路工程</option>
							<option value="矿山工程"
								<c:if test="${param.filter_EQS_ftype=='矿山工程'}"> selected="selected"  </c:if>>矿山工程</option>
							<option value="化工石油工程"
								<c:if test="${param.filter_EQS_ftype=='化工石油工程'}"> selected="selected"  </c:if>>化工石油工程</option>
							<option value="水利水电工程"
								<c:if test="${param.filter_EQS_ftype=='水利水电工程'}"> selected="selected"  </c:if>>水利水电工程</option>
							<option value="农林工程"
								<c:if test="${param.filter_EQS_ftype=='农林工程'}"> selected="selected"  </c:if>>农林工程</option>
							<option value="铁路工程"
								<c:if test="${param.filter_EQS_ftype=='铁路工程'}"> selected="selected"  </c:if>>铁路工程</option>
							<option value="港口与航道工程"
								<c:if test="${param.filter_EQS_ftype=='港口与航道工程'}"> selected="selected"  </c:if>>港口与航道工程</option>
							<option value="航天航空工程"
								<c:if test="${param.filter_EQS_ftype=='航天航空工程'}"> selected="selected"  </c:if>>航天航空工程</option>
							<option value="通信工程"
								<c:if test="${param.filter_EQS_ftype=='通信工程'}"> selected="selected"  </c:if>>通信工程</option>
							<option value="机电安装工程"
								<c:if test="${param.filter_EQS_ftype=='机电安装工程'}"> selected="selected"  </c:if>>机电安装工程</option>
						</select> <label for="jyXm-info_fstate"><spring:message
								code='jyXm-info.jyXm-info.list.search.fstate' text='工程状态' />:</label> <select
							class="form-control" id="jyXm-info_fstate" name="filter_EQS_fstate"
							value="${param.filter_EQS_fstate}" class=" required" style="width: 150px">
							<option value="">全部</option>
							
							<option value="信息登记"
								<c:if test="${param.filter_EQS_fstate=='信息登记'}"> selected="selected"  </c:if>>信息登记</option>
							<option value="报名登记"
								<c:if test="${param.filter_EQS_fstate=='报名登记'}"> selected="selected"  </c:if>>报名登记</option>
							<option value="资格预审及备案"
								<c:if test="${param.filter_EQS_fstate=='资格预审与备案'}"> selected="selected"  </c:if>>资格预审与备案</option>
							<option value="招标文件登记"
								<c:if test="${param.filter_EQS_fstate=='招标文件登记'}"> selected="selected"  </c:if>>招标文件登记</option>
							<option value="投标文件登记"
								<c:if test="${param.filter_EQS_fstate=='投标文件登记'}"> selected="selected"  </c:if>>投标文件登记</option>
							<option value="投标文件评审"
								<c:if test="${param.filter_EQS_fstate=='投标文件评审'}"> selected="selected"  </c:if>>投标文件评审</option>
							<option value="开标登记"
								<c:if test="${param.filter_EQS_fstate=='开标登记'}"> selected="selected"  </c:if>>开标登记</option>
							<option value="转换成项目"
								<c:if test="${param.filter_EQS_fstate=='转换成项目'}"> selected="selected"  </c:if>>转换成项目</option>
						</select> <label class="control-label"
							for="jyXm-info.jyXm-info.input.fcity"><spring:message
								code="jyBm-info.jyBm-info.input.fprovince" text="所属城市" /></label> <select
							id="jyXm-info_fprovince" type="text" name="filter_EQS_fprovince"
							value="${param.filter_EQS_fprovince}" style="width:100px;"></select>省 <select
							id="jyXm-info_fcity" type="text" name="filter_EQS_fcity"
							value="${param.filter_EQS_fcity}" style="width:100px;"></select>市
						<button class="btn btn-small a-search"
							onclick="document.jyXm-infoForm.submit()">查询</button>
						&nbsp;
					</form>

				</div>
			</article>

			<!-- <article class="m-blank">
			  <div class="pull-left">
		 <region:region-permission permission="jyXm-info:create">
		 	 <button class="btn btn-small a-insert" onclick="loadJyXm()">新建</button>
		 </region:region-permission> 
		  <region:region-permission permission="jyXm-info:delete">
		  <button class="btn btn-small a-remove" onclick="table.removeAll()">删除</button>
		  </region:region-permission>
		  <button class="btn btn-small a-export" onclick="table.exportExcel()">导出</button>
		</div>
		</div>
		</article> -->
				<div class="pull-right">
					每页显示 <select class="m-page-size">
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="50">50</option>
					</select> 条
				</div>

				<div class="m-clear"></div>

			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="jyXm-info.jyXm-info.list.title" text="列表" />
					</h4>
				</header>
				<div class="content">
					<form id="jyXm-infoGridForm" name="jyXm-infoGridForm" method='post'
						action="jyXm-info-remove.do" class="m-form-blank">
						<table id="jyXm-infoGrid" class="m-table table-hover table-bordered">
							<thead>
								<tr>
									<th width="10" class="m-table-check"><input
										type="checkbox" name="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th>
									<th class="sorting" name="fkbdate">开标时间</th>
									<th class="sorting" name="fname">工程名称</th>
									<th class="sorting" name="fweituoren">开标人</th>
									<th class="sorting" name="ftbzjsfdc">投标总监及是否到场</th>
									<th class="sorting" name="fzbkzj">投标控制价</th>
									<th class="sorting" name="fzbstatus">是否中标</th>
									<th class="sorting" name="fshuxing">属性</th>
									<th width="80">&nbsp;</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach items="${page.result}" var="item">
									<tr>
										<td><input type="checkbox" class="selectedItem a-check"
											name="selectedItem" value="${item.fid}"></td>
										<td><fmt:formatDate value="${item.fkbdate}"
												pattern="yyyy-MM-dd HH:mm" /></td>
										<td>${item.fname}</td>
										<td>${ryMap[item.fweituoren].fname}</td>
										<td>${item.ftbzjsfdc}</td>
										<%-- <td>${item.fscale}</td> --%>
										<td>${item.fzbkzj}</td>
										<td>${item.fzbstatus}</td>
										<td>${item.fshuxing}</td>
										<td><a href="jyXm-info-input.do?xmid=${item.fid}&state=kaibiao"
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
