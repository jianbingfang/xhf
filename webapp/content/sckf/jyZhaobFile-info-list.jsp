<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "sckf-home");%>
<%pageContext.setAttribute("currentMenu", "sckf-nytz");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.jyZhaobFile-info.list.title" text="列表" /></title>
    <%@include file="/common/s.jsp"%>


    <link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/jyxmpicker/jyxmpicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/jyxmpicker/jyxmpicker.js">
	</script>

    <script type="text/javascript">
var config = {
    id: '${lowerName}-infoGrid',
    pageNo: ${page.pageNo},
    pageSize: ${page.pageSize},
    totalCount: ${page.totalCount},
    resultSize: ${page.resultSize},
    pageCount: ${page.pageCount},
    orderBy: '${page.orderBy == null ? "" : page.orderBy}',
    asc: ${page.asc},
    params: {
        'filter_LIKES_name': '${param.filter_LIKES_name}'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'jyZhaobFile-infoGridForm',
	exportUrl: 'jyZhaobFile-info-export.do'
};

var table;

$(function() {
	table = new Table(config);
    table.configPagination('.m-pagination');
    table.configPageInfo('.m-page-info');
    table.configPageSize('.m-page-size');

	createjyxmPicker({
		modalId : 'jyxmPicker',
		url : '${scopePrefix}/sckf/jyXm-toubiao-simple-list.do',
		redUrl : '${scopePrefix}/sckf/jyZhaobFile-info-input.do'
	});

	
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
		    <a class="btn"><i id="jyZhaobFile-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="jyZhaobFile-infoSearch" class="content content-inner">

		  <%--<form name="jyZhaobFile-infoForm" method="post" action="jyZhaobFile-info-list.do" class="form-inline">--%>
		    <%--<label for="jyZhaobFile-info_name"><spring:message code='jyZhaobFile-info.jyZhaobFile-info.list.search.name' text='名称'/>:</label>--%>
		    <%--<input type="text" id="jyZhaobFile-info_name" name="filter_LIKES_name" value="${param.filter_LIKES_name}">--%>
			<%--<button class="btn btn-small a-search" onclick="document.jyZhaobFile-infoForm.submit()">查询</button>&nbsp;--%>
		  <%--</form>--%>


			<form name="jyZhaobFile-infoForm" method="post" action="jyZhaobFile-info-list.do" class="form-inline">

				<label for="xmBxRecord-info_xmid"><spring:message code='jyXmYj-info.jyXmYj-info.list.search.name'
																  text='项目名称'/>:</label>
				<div class="input-append jyxmPicker">
					<input id="xmBxRecord-info_xmid" type="hidden" name="filter_EQL_fxmid"
						   value="${model.fxmid}"> <input
						id="xmBxRecord-info_xmmc" type="text"
						value="${xmMap[model.fxmid].fname}" disabled
						class=" required" style="width: 175px;" value=""> <span
						class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
						class="icon-th-list"></i></span>
				</div>

				<%--<input type="text" id="jyXmYj-info_name" name="filter_LIKES_fname" value="${param.filter_LIKES_fname}">--%>
				<button class="btn btn-small a-search" onclick="document.jyZhaobFile-infoForm.submit()">查询</button>&nbsp;
			</form>


		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="jyZhaobFile-info:create">
		  <button class="btn btn-small a-insert" onclick="window.location.href ='jyZhaobFile-info-input.do'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="jyZhaobFile-info:delete">
		  <button class="btn btn-small a-remove" onclick="table.removeAll()">删除</button>
		  </region:region-permission>
		  <%--<button class="btn btn-small a-export" onclick="table.exportExcel()">导出</button>--%>
		</div>

		<div class="pull-right">
		  每页显示
		  <select class="m-page-size">
		    <option value="10">10</option>
		    <option value="20">20</option>
		    <option value="50">50</option>
		  </select>
		  条
		</div>

	    <div class="m-clear"></div>
	  </article>

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="jyZhaobFile-info.jyZhaobFile-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="jyZhaobFile-infoGridForm" name="jyZhaobFile-infoGridForm" method='post' action="jyZhaobFile-info-remove.do" class="m-form-blank">
  <table id="jyZhaobFile-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="fxmid">项目名称</th>
        	<th class="sorting" name="fxmid">开标时间</th>
        	<th class="sorting" name="fxmid">中标金额</th>
        	<th class="sorting" name="fweizhi">放置位置</th>
        	<th class="sorting" name="fdahno">档案盒编号</th>
        	<th class="sorting" name="ffilename">附件名称</th>
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	 	 <td>${xmMap[item.fxmid].fname}</td>
      	 	 <td>${xmMap[item.fxmid].fkbdate}</td>
      	 	 <td>${xmMap[item.fxmid].fzbmoney}</td>
      	 	 <td>${item.fweizhi}</td>
      	 	 <td>${item.fdahno}</td>
      	 	 <td>${item.ffilename}</td>
        <td>
          <a href="jyZhaobFile-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
        </td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
</form>
        </div>
      </article>

	  <article>
	    <div class="m-page-info pull-left">
		  共100条记录 显示1到10条记录
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
