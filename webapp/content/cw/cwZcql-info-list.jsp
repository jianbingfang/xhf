<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "cw-home");%>
<%pageContext.setAttribute("currentMenu", "cw-zc");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.cwZc-info.list.title" text="列表" /></title>
    <%@include file="/common/s.jsp"%>
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
   	 'fstatus': '${param.fstatus}',
        'filter_LIKES_name': '${param.filter_LIKES_name}'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'cwZc-infoGridForm',
	exportUrl: 'cwZc-info-export.do'
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
	   <%@include file="/menu/cw-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

	  <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="cwZc-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="cwZc-infoSearch" class="content content-inner">

		  <form name="cwZc-infoForm" method="post" action="cwZc-info-list.do" class="form-inline">
		    <label for="cwZc-info_name"><spring:message code='cwZc-info.cwZc-info.list.search.name' text='名称'/>:</label>
		    <input type="text" id="cwZc-info_name" name="filter_LIKES_name" value="${param.filter_LIKES_name}">
			<button class="btn btn-small a-search" onclick="document.cwZc-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		<!--   <region:region-permission permission="cwZc-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='cwZc-info-input.do'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="cwZc-info:delete">
		  <button class="btn btn-small a-remove" onclick="table.removeAll()">删除</button>
		  </region:region-permission> -->
		  <button class="btn btn-small a-export" onclick="table.exportExcel()">导出</button>
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
		  <h4 class="title"><spring:message code="cwZc-info.cwZc-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="cwZc-infoGridForm" name="cwZc-infoGridForm" method='post' action="cwZc-info-remove.do" class="m-form-blank">
  <table id="cwZc-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" id="fcode">编号</th>
        	<th class="sorting" id="fname">名称</th>
        	<th class="sorting" id="ftype">分类</th>
        	<th class="sorting" id="fqldate">清理时间</th>
        	<th class="sorting" id="fqlprice">清理金额</th>
        	<th class="sorting" id="fmemo">备注</th>
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	 	 <td>${item.fcode}</td>
      	 	  <td>${item.fname}</td>
      	 	 <td>${item.ftype}</td>
      	 	 <td>${item.fqldate}</td>
      	 	 <td>${item.fqlprice}</td>
      	 	 <td>${item.fmemo}</td>
        <td>
           <a href="cwZc-info-input.do?id=${item.fid}&fstatus=2" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
