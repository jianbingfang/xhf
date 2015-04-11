<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "sckf-home");
%>
<%
	pageContext.setAttribute("currentMenu", "sckf-ht");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="dev.commHt-info.list.title"
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
			'filter_LIKES_fthname' : '${param.filter_LIKES_fhtname}'
		},
		selectedItemClass : 'selectedItem',
		gridFormId : 'commHt-infoGridForm',
		exportUrl : 'commHt-info-export.do'
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
			<!-- <div class="container-fluid">
				<ul class="breadcrumb" style="width: 98%">
					<li><a href="sckf-home.do">市场开发</a> <span class="divider">/</span>
					</li>
					<li><a href="sckf-doc-gzlc-list.do">合同管理</a><span
						class="divider">/</span></li>
					<li class="active">合同</li>
				</ul>
			</div> -->
			<article class="m-widget">
				<header class="header">
					<h4 class="title">查询</h4>
					<div class="ctrl">
						<a class="btn"><i id="commHt-infoSearchIcon"
							class="icon-chevron-up"></i></a>
					</div>
				</header>
				<div id="commHt-infoSearch" class="content content-inner">
					<form name="commHt-infoForm" method="post"
						action="commHt-info-list.do" class="form-inline">
						<label for="commHt-info_name"><spring:message
								code='commHt-info.commHt-info.list.search.name' text='名称' />:</label> <input
							type="text" id="commHt-info_name" name="filter_LIKES_fhtname"
							value="${param.filter_LIKES_fhtname}">
						<button class="btn btn-small a-search"
							onclick="document.commHt-infoForm.submit()">查询</button>
						&nbsp;
					</form>
				</div>
			</article>
			<article class="m-blank">
				<div class="pull-left">
					<region:region-permission permission="commHt-info:create">
						<button class="btn btn-small a-insert"
							onclick="location.href='commHt-info-input.do'">新建</button>
					</region:region-permission>
					<region:region-permission permission="commHt-info:delete">
						<button class="btn btn-small a-remove" onclick="table.removeAll()">删除</button>
					</region:region-permission>
					<button class="btn btn-small a-export"
						onclick="table.exportExcel()">导出</button>
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
						<spring:message code="commHt-info.commHt-info.list.title"
							text="列表" />
					</h4>
				</header>
				<div class="content">
					<form id="commHt-infoGridForm" name="commHt-infoGridForm"
						method='post' action="commHt-info-remove.do" class="m-form-blank">
						<table id="commHt-infoGrid" class="m-table table-hover table-bordered">
							<thead>
								<tr>
									<th width="10" class="m-table-check"><input
										type="checkbox" name="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th>
									<!-- 	<th class="sorting" name="fpaytype">付款方式</th>-->
									<!--   	<th class="sorting" name="fscale">工程规模</th>
        	<th class="sorting" name="fprojecttype">工程类别</th> -->
									<th class="sorting" name="fhetongno">合同编号</th>
									<th class="sorting" name="fxmid">合同名称</th>
									<th class="sorting" name="fadrr">工程地点</th>
									<th class="sorting" name="fjiafang">业主名称</th>
									<th class="sorting" name="ftotalMoney">工程总投资</th>
									<th class="sorting" name="fguimo">建筑规模</th>
									<th class="sorting" name="fstartdate">合同开工时间</th>
									<th class="sorting" name="fenddate">合同竣工时间</th>
									<!-- <th class="sorting" name="fhetongno">合同编号</th>
        	<th class="sorting" name="fgettype">获取方式</th>
        	<th class="sorting" name="fjiafang">甲方签约单位</th> -->
									<th class="sorting" name="fjianlifei">监理费</th>
								    <th class="sorting" name="fjianlifeilv">监理费率</th>
									<!--         	<th class="sorting" name="fhetongqi">监理合同期</th> -->
									<!-- <th class="sorting" name="fqicaoren">起草人</th>
        	<th class="sorting" name="fqicaodate">起草时间</th>
        	<th class="sorting" name="fqiandingren">签订人</th>-->
        	
        	
									<th class="sorting" name="fqiandingstatus">签订状态</th>
									<th class="sorting" name="fqiandingdate">签订时间</th>
									<!--<th class="sorting" name="fprovince">所属省份</th>
        	<th class="sorting" name="fcity">所属城市</th>
        	<th class="sorting" name="ftanpanren">谈判人</th> 
        	<th class="sorting" name="ftouzie">投资额</th>
        	<th class="sorting" name="fywtype">业务类型</th>
        	<th class="sorting" name="fyezhuhetongno">业主合同编号</th>
        	<th class="sorting" name="fyifang">乙方签约单位</th>-->
									<th class="sorting" name="fzongjian">总监</th>
									<th class="sorting" name="fzhubanren">主办人</th>
									<th width="80">&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.result}" var="item">
									<tr
										<c:if test="${item.fqiandingstatus==0}">style="background-color: pink;"</c:if>
										<c:if test="${item.fqiandingstatus==1}">style="background-color: orange;"</c:if>
										<c:if test="${item.fqiandingstatus==2}">style="background-color: yellow;"</c:if>
										<c:if test="${item.fqiandingstatus==3}">style="background-color: green;"</c:if>
										<c:if test="${item.fqiandingstatus==4}">style="background-color: gray;"</c:if>>
										<td><input type="checkbox" class="selectedItem a-check"
											name="selectedItem" value="${item.fid}"></td>
										<%--  <td>${item.fpaytype}</td> --%>
										<%-- 	 <td>${item.fscale}</td>
      	 	 <td>${item.fprojecttype}</td> --%>
										<td>${item.fhetongno}</td>
										<td class="span3">${item.fhtname}</td>
										<td>${item.fadrr}</td>
										<td>${item.fjiafang}</td>
										<td>${item.ftotalMoney}</td>
										<td>${item.fguimo}</td>
										<td>${item.fstartdate}</td>
										<td>${item.fenddate}</td>
										<%--  	 <td>${item.fhetongno}</td>
      	 	 <td>${item.fgettype}</td>
      	 	 <td>${item.fjiafang}</td> --%>
										<td>${item.fjianlifei}</td>
										<td>${item.fjianlifeilv}</td>
										<%--  <td>${item.fjianlifeilv}</td> --%>
										<%--       	 	 <td>${item.fhetongqi}</td> --%>
										<%--  <td>${item.fqicaoren}</td>
      	 	 <td>${item.fqicaodate}</td>
      	 	 <td>${item.fqiandingren}</td> --%>
										<td><c:if test="${item.fqiandingstatus==0}">未起草</c:if> <c:if
												test="${item.fqiandingstatus==1}">已经起草</c:if> <c:if
												test="${item.fqiandingstatus==2}">合同谈判 </c:if> <c:if
												test="${item.fqiandingstatus==3}">会签通过</c:if> <c:if
												test="${item.fqiandingstatus==4}">业主签章</c:if> <c:if
												test="${item.fqiandingstatus==5}">返还归档</c:if></td>
										<td>${item.fqiandingdate}</td>
										<%-- 	 <td>${item.fprovince}</td>
      	 	 <td>${item.fcity}</td>
      	 	 <td>${item.ftanpanren}</td>
      	 	 <td>${item.ftouzie}</td>
      	 	 <td>${item.fywtype}</td>
      	 	 <td>${item.fyezhuhetongno}</td>
      	 	 <td>${item.fyezhuname}</td>
      	 	 <td>${item.fyifang}</td> --%>
										<td>${ryMap[item.fzongjian].fname}</td>
										<td>${ryMap[item.fzhubanren].fname}</td>
										<td><a href="commHt-info-input.do?id=${item.fid}"
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
