<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "gcgl-home");
%>
<%
	pageContext.setAttribute("currentMenu", "gcgl-jlf");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="dev.gcgl-commHt-info.list.title"
		text="列表" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/js/linkage.js"></script>
<script type="text/javascript">
	window.onload = function() {
		pc_init();
		setProvCity("${param.fprovince}", "${param.fcity}");
	};
	var config = {
		id : 'gcgl-commHt-infoGrid',
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
			'filter_LIKES_ffzrname' : '${param.filter_LIKES_ffzrname}',
			'fprovince' : '${param.fprovince}',
			'fcity' : '${param.fcity}',
			'filter_LIKES_ftotalMoney' : '${param.filter_LIKES_ftotalMoney}',
			'filter_GTN_fjianlifei' : '${param.filter_GTN_fjianlifei}',
			'filter_LTN_fjianlifei' : '${param.filter_LTN_fjianlifei}',
			'filter_GTD_fstartdate' : '${param.filter_GTD_fstartdate}',
			'filter_LTD_fstartdate' : '${param.filter_LTD_fstartdate}',
			'filter_LIKES_fmemo4' : '${param.filter_LIKES_fmemo4}',
			'filter_LIKES_fjsstate' : '${param.filter_LIKES_fjsstate}'
		/* 'filter_EQS_fprovince':${param.filter_EQS_fprovince},
		'filter_EQS_fcity':${param.filter_EQS_fcity}, */
		},
		selectedItemClass : 'selectedItem',
		gridFormId : 'gcgl-commHt-infoGridForm',
		exportUrl : 'gcgl-commHt-info-export.do'
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
		<%@include file="/menu/gcgl-workspace.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span10">
			<article class="m-widget">
				<header class="header">
					<h4 class="title">查询</h4>
					<div class="ctrl">
						<a class="btn"><i id="gcgl-commHt-infoSearchIcon"
							class="icon-chevron-up"></i></a>
					</div>
				</header>
				<div id="gcgl-commHt-infoSearch" class="content content-inner">
					<form name="gcgl-commHt-infoForm" method="post"
						action="gcgl-commHt-info-list.do" class="form-inline">
						<label for="xz-commHt-info_fhetongno"><spring:message
								code='xz-commHt-info.xz-commHt-info.list.search.fhetongno'
								text='编号' />:</label> <input type="text" id="xz-commHt-info_fhetongno"
							style="width: 80px;" name="filter_LIKES_fhetongno"
							value="${param.filter_LIKES_fhetongno}"> <label
							for="xz-commHt-info_fhtname"><spring:message
								code='xz-commHt-info.xz-commHt-info.list.search.fhtname'
								text='合同名称' />:</label> <input type="text" id="xz-commHt-info_fhtname"
							style="width: 80px;" name="filter_LIKES_fhtname"
							value="${param.filter_LIKES_fhtname}">&nbsp;<label
							for="xz-commHt-info_fmemo4"><spring:message
								code='xz-commHt-info.xz-commHt-info.list.search.fmemo4'
								text='属性' />:</label> <input type="text" id="xz-commHt-info_fmemo4"
							style="width: 80px;" name="filter_LIKES_fmemo4"
							value="${param.filter_LIKES_fmemo4}">&nbsp; <label
							for="xz-commHt-info_fzongjianname"><spring:message
								code='xz-commHt-info.xz-commHt-info.list.search.ffzrname'
								text='负责人' />:</label> <input type="text" id="xz-commHt-info_ffzrname"
							style="width: 80px;" name="filter_LIKES_ffzrname"
							value="${param.filter_LIKES_ffzrname}"> &nbsp;<select
							class="form-control" id="xz-commHt-info_fprojecttype"
							name="filter_LIKES_fprojecttype"
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
								<c:if test="${model.fprojecttype=='机电安装工程'}"> selected="selected"  </c:if>>机电安装工程</option>
						</select>&nbsp; <label for="gcglYingShou-info_fdzdate"><spring:message
								code='gcglYingShou-info.gcglYingShou-info.list.search.fdzdate'
								text='监理费' />:</label> <input type="number"
							id="xz-commHt-info_fjianlifei" style="width: 60px;"
							name="filter_GTN_fjianlifei"
							value="${param.filter_GTN_fjianlifei}" /> ~ <input type="number"
							id="xz-commHt-info_fjianlifei" style="width: 60px;"
							name="filter_LTN_fjianlifei"
							value="${param.filter_LTN_fjianlifei}" /> <label
							for="gcglYingShou-info_fdzdate"><spring:message
								code='gcglYingShou-info.gcglYingShou-info.list.search.fdzdate'
								text='开工时间' />:</label>
						<div class="input-append datepicker date"
							style="padding-left: 0px;">
							<input id="gcglYingShou-info_fstartdate" type="text"
								name="filter_GTD_fstartdate"
								value="${param.filter_GTD_fstartdate}" size="40" class="text "
								style="background-color:white;cursor:default; width: 80px;">
							<span class="add-on"
								style="padding-top: 2px; padding-bottom: 2px;"><i
								class="icon-calendar"></i></span>
						</div>
						至
						<div class="input-append datepicker date"
							style="padding-left: 0px;">
							<input id="gcglYingShou-info_fstartdate" type="text"
								name="filter_LTD_fstartdate"
								value="${param.filter_LTD_fstartdate}" size="40" class="text "
								style="background-color:white;cursor:default; width: 80px;">
							<span class="add-on"
								style="padding-top: 2px; padding-bottom: 2px;"><i
								class="icon-calendar"></i></span>
						</div>
						&nbsp; <select id="commHt-info_fprovince" type="text"
							name="fprovince" value="${param.fprovince}" style="width:80px;"></select>省
						<select id="commHt-info_fcity" type="text" name="fcity"
							value="${param.fcity}" style="width:80px;"></select>市&nbsp; <label
							for="commHt-info_fjsstate"><spring:message
								code='xz-commHt-info.xz-commHt-info.list.search.fjsstate'
								text='结算状态' />:</label> <select id="commHt-info_fjsstate" style="width: 100px"
							name="filter_LIKES_fjsstate" size="" class="text ">
							<option value=""
								<c:if test="${param.filter_LIKES_fjsstate=='' }">selected="selected"</c:if>>全部</option>
							<option value="未结算"
								<c:if test="${param.filter_LIKES_fjsstate=='未结算' }">selected="selected"</c:if>>未结算</option>
							<option value="已结算"
								<c:if test="${param.filter_LIKES_fjsstate=='已结算' }">selected="selected"</c:if>>已结算</option>
								
						</select>
						<button class="btn btn-small a-search"
							onclick="document.gcgl-commHt-infoForm.submit()">查询</button>
						&nbsp;
					</form>
				</div>
			</article>
			<article class="m-blank">
				<div class="pull-left">
					<!-- <region:region-permission permission="gcgl-commHt-info:create">
						<button class="btn btn-small a-insert"
							onclick="location.href='gcgl-commHt-info-input.do'">新建合同</button>
					</region:region-permission> -->
					<!-- 	<a class="btn btn-small a-insert"
							href="gcglXm-info-input.do">新建项目</a> -->
					<!-- 	<region:region-permission permission="gcgl-commHt-info:delete">
						<button class="btn btn-small a-remove" onclick="table.removeAll()">删除</button>
					</region:region-permission> -->
					<%--<button class="btn btn-small a-export"
						onclick="table.exportExcel()">导出</button>--%>
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
						<spring:message code="gcgl-commHt-info.gcgl-commHt-info.list.title"
							text="列表" />
					</h4>
				</header>
				<div class="content">
					<form id="gcgl-commHt-infoGridForm" name="gcgl-commHt-infoGridForm"
						method='post' action="gcgl-commHt-info-remove.do"
						class="m-form-blank " style=" overflow-x: scroll;">
						<div style="height:5px "></div>
						<table id="gcgl-commHt-infoGrid"
							class="m-table  table-hover table-responsive table-bordered table-striped "
							data-toggle="table" >
							<thead>
								<tr>
									<th style="width:10px" class="m-table-check"><input
										type="checkbox" name="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th>
									<th class="sorting" id="fhetongno">合同编号</th>
									<th class="sorting" id="fhtname">合同名称</th>
									<!-- <th class="sorting" id="fjiafang">业主</th>
									<th class="sorting" id="fzongjian">总监</th>
									<th class="sorting" id="fadrr">工程地点</th>
									<th class="sorting" id="ftotalMoney">工程总投资</th>
									<th class="sorting" id="fscale">工程规模</th>
									<th class="sorting" id="fqiandingdate">签订时间</th>
									<th class="sorting" id="fstartdate">合同开工时间</th>
									<th class="sorting" id="fenddate">合同竣工时间</th>
									<th class="sorting" id="fhtqi">合同期</th>
									<th class="sorting" id="fjianlifei">监理费(万元)</th>
									<th class="sorting" id="fjianlifeilv">监理费率</th>
									<th class="sorting" id="fpaytype">付款方式</th>
									<th class="sorting" id="fzhubanren">负责人</th>
									<th class="sorting" id="fprojecttype">工程类别</th>
									<th class="sorting" id="fywtype">业务类型</th>
									<th class="sorting" id="fmemo4">属性</th>-->
									<!-- <th class="sorting" id="fjsstate">结算状态</th>  -->
									<th class="sorting" id="fgcfzwz">放置位置</th> 
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.result}" var="item">
									<tr 
										ondblclick="window.location='gcgl-commHt-info-input.do?id=${item.fid}'">
										<td><input type="checkbox" class="selectedItem a-check"
											name="selectedItem" value="${item.fid}"></td>
										<td class="span2">${item.fhetongno}</td>
										<%-- <td>${xmMap[item.fxmid].fxmname}</td> --%>
										<td class="span8">${item.fhtname}</td>
										<%-- <td>${item.fjiafang}</td>
										<td>${ryMap[item.fzongjian].fname}</td>
										<td>${item.fadrr}</td>
										<td>${item.ftotalMoney}</td>
										<td>${item.fscale}</td>
										<td>${item.fqiandingdate}</td>
										<td>${item.fstartdate}</td>
										<td>${item.fenddate}</td>
										<td>${item.fhtqi }</td>
										<td>${item.fjianlifei}</td>
										<td>${item.fjianlifeilv}</td>
										<td class="span2">${item.fpaytype}</td>
										<td>${ryMap[item.fzhubanren].fname}</td>
										<td>${item.fprojecttype}</td>
										<td>${item.fywtype}</td>
										<td>${item.fmemo4}</td>--%>
										<%-- <td>${item.fjsstate }</td>  --%>
										<td>${item.fgcfzwz }</td> 
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div style="height:3px "></div>
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
