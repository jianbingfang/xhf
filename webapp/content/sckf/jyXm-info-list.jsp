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

<script type="text/javascript"
			src="${scopePrefix}/s/xthena/js/linkage.js"></script>

<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/xmpicker/xmpicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/xmpicker/jyxmpicker.js">
</script>
<script type="text/javascript">


//	window.onload = function() {
//
//	};

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
			'filter_EQS_ftype' : '${param.filter_EQS_ftype}',
			'filter_EQS_fstate' : '${param.filter_EQS_fstate}',
			'filter_EQS_fcity' : '${param.filter_EQS_fcity}',
			'filter_EQS_fprovince' : '${param.filter_EQS_fprovince}'
		},
		selectedItemClass : 'selectedItem',
		gridFormId : 'jyXm-infoGridForm',
		exportUrl : 'jyXm-info-export.do'
	};

	var table;

	$(function() {

		pc_init();
		setProvCity('${param.filter_EQS_fprovince}', '${param.filter_EQS_fcity}');


		table = new Table(config);
		table.configPagination('.m-pagination');
		table.configPageInfo('.m-page-info');
		table.configPageSize('.m-page-size');

		createxmPicker({
			modalId : 'xmPicker',
			url : '${scopePrefix}/sckf/jyXm-toubiao-simple-list.do',
			redUrl : '${scopePrefix}/sckf/jyXm-info-input.do'
		});
	});
</script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
</head>
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/js/linkage.js"></script>
<body>
	<%@include file="/header.jsp"%>
	<div class="row-fluid">
		<%@include file="/menu/sckf-workspace.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span10">
			<!-- 	<div class="container-fluid">
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
					<form name="jyXm-infoForm" method="post" action="jyXm-info-list.do"
						class="form-inline">
						<label for="jyXm-info_fname"><spring:message
								code='jyXm-info.jyXm-info.list.search.fname' text='工程名称' />:</label> <input
							type="text" id="jyXm-info_fname" name="filter_LIKES_fname"
							value="${param.filter_LIKES_fname}" style="width: 100px">
						<label for="jyXm-info_ftype"><spring:message
								code='jyXm-info.jyXm-info.list.search.ftype' text='工程类别' />:</label> <select
							class="form-control" id="jyXm-info_ftype" name="filter_EQS_ftype"
							value="${param.filter_EQS_ftype}" class=" required" style="width: 100px">
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
							<%-- 	
							<option value="1"
								<c:if test="${param.filter_EQS_fstate=='1'}"> selected="selected"  </c:if>>信息登记</option>
							<option value="2"
								<c:if test="${param.filter_EQS_fstate=='2'}"> selected="selected"  </c:if>>报名登记</option>
							<option value="3"
								<c:if test="${param.filter_EQS_fstate=='3'}"> selected="selected"  </c:if>>资格预审与备案</option>
							<option value="4"
								<c:if test="${param.filter_EQS_fstate=='4'}"> selected="selected"  </c:if>>招标文件登记</option>
							<option value="5"
								<c:if test="${param.filter_EQS_fstate=='5'}"> selected="selected"  </c:if>>投标文件登记</option>
							<option value="6"
								<c:if test="${param.filter_EQS_fstate=='6'}"> selected="selected"  </c:if>>投标文件评审</option>
							<option value="7"
								<c:if test="${param.filter_EQS_fstate=='7'}"> selected="selected"  </c:if>>开标登记</option>
							<option value="8"
								<c:if test="${param.filter_EQS_fstate=='8'}"> selected="selected"  </c:if>>转换成项目</option> --%>
						</select> <label class="control-label"
							for="jyXm-info.jyXm-info.input.fcity"><spring:message
								code="jyBm-info.jyBm-info.input.fprovince" text="所属城市" /></label> <select
							id="jyXm-info_fprovince" type="text" name="fprovince"
							value="${param.filter_EQS_fprovince}" style="width:100px;"></select>省 <select
							id="jyXm-info_fcity" type="text" name="fcity"
							value="${param.filter_EQS_fcity}" style="width:100px;"></select>市
						<button class="btn btn-small a-search"
							onclick="document.jyXm-infoForm.submit()">查询</button>
						&nbsp;
					</form>
				</div>
			</article>
			<article class="m-blank">
				<div class="pull-left">
					<region:region-permission permission="jyXm-info:create">
						<button class="btn btn-small a-insert" onclick="loadJyXm()">导入项目</button>
					</region:region-permission>
					<region:region-permission permission="jyXb-info:create2">
						<button class="btn btn-small a-insert"
							onclick="location.href='jyXm-info-input.do'">新建</button>
					</region:region-permission>
					<region:region-permission permission="jyXm-info:delete">
		  				<button class="btn btn-small a-remove" onclick="table.removeAll()">删除</button>
					</region:region-permission>
		  <%--<button class="btn btn-small a-export" onclick="table.exportExcel()">导出</button>--%>
		</div>
			</article>
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
									<th class="sorting" id="fname">工程名称</th>
									<th class="sorting" id="fkbdate">开标时间</th>
									<th class="sorting" id="fscale">规模</th>
									<th class="sorting" id="ftze">投资</th>
									<th class="sorting" id="fzj">投标总监</th>
									<th class="sorting" id="fbmdate">报名时间</th>
									<th class="sorting" id="fzgysstatus">资审</th>
									<th class="sorting" id="fbeianstatus">备案</th>
									<th class="sorting" id="fbzjje">保证金</th>
									<th class="sorting" id="ftype">项目类别</th>
									<th class="sorting" id="fstate">状态</th>
									<th width="80">&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.result}" var="item">
									<tr>
										<td><input type="checkbox" class="selectedItem a-check"
											name="selectedItem" value="${item.fid}"></td>
										<td class="span2">${item.fname}</td>
										<td><fmt:formatDate value="${item.fkbdate}"
												pattern="yyyy-MM-dd HH:mm" /></td>
										<td class="span2">${item.fscale}</td>
										<td>${item.ftze}</td>
										<td>${ryMap[item.fzj].fname}</td>
										<%-- <td>${item.fscale}</td> --%>
										<td>${item.fbmdate}</td>
										<td>${item.fzgysstatus}</td>
										<td>${item.fbeianstatus}</td>
										<td>${item.fbzjje}</td>
										<td>${item.ftype}</td>
										<td>${item.fstate}</td>
										<%-- <td>
											<c:if test="${item.fstate=='1'}"> 信息登记 </c:if>
												<c:if test="${item.fstate=='2'}"> 报名登记 </c:if>
												<c:if test="${item.fstate=='3'}"> 资格预审与备案</c:if>
												<c:if test="${item.fstate=='4'}"> 招标文件登记 </c:if>
												<c:if test="${item.fstate=='5'}"> 投标文件登记 </c:if>
												<c:if test="${item.fstate=='6'}"> 投标文件评审 </c:if>
												<c:if test="${item.fstate=='7'}"> 开标登记</c:if>
												<c:if test="${item.fstate=='8'}"> 转换成项目 </c:if>
										</td> --%>
										<td><a href="jyXm-info-input.do?xmid=${item.fid}"
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
