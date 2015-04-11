<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "gh-home");%>
<%pageContext.setAttribute("currentMenu", "gh-zf");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.ziFei-info.list.title" text="列表" /></title>
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
    	'ftype':'${param.ftype}',
        'filter_LIKES_name': '${param.filter_LIKES_name}'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'ziFei-infoGridForm',
	exportUrl: 'ziFei-info-export.do?ftype=${param.ftype}'
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
	   <%@include file="/menu/gh-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

	  <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="ziFei-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="ziFei-infoSearch" class="content content-inner">

		  <form name="ziFei-infoForm" method="post" action="ziFei-info-list.do?ftype=1" class="form-inline">
		    <label for="ziFei-info_name"><spring:message code='ziFei-info.ziFei-info.list.search.name' text='名称'/>:</label>
		    <input type="text" id="ziFei-info_name" name="filter_LIKES_name" value="${param.filter_LIKES_name}">
			<button class="btn btn-small a-search" onclick="document.ziFei-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="ziFei-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='ziFei-info-input.do?ftype=1'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="ziFei-info:delete">
		  <button class="btn btn-small a-remove" onclick="table.removeAll()">删除</button>
		  </region:region-permission>
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
		  <h4 class="title"><spring:message code="ziFei-info.ziFei-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="ziFei-infoGridForm" name="ziFei-infoGridForm" method='post' action="ziFei-info-remove.do?ftype=1" class="m-form-blank">
  <table id="ziFei-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="fno">序号</th>
        	<th class="sorting" name="fname">事由</th>
        	<th class="sorting" name="fdate">时间</th>
        	<th class="sorting" name="fprice">金额</th>
        	<th class="sorting" name="fjsren">经手人</th>
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	 	 <td>${item.fno}</td>
      	 	 <td>${item.fname}</td>
      	 	 <td>${item.fdate}</td>
      	 	 <td>${item.fprice}</td>
      	 	 <td>${item.fjsren}</td>
        <td>
          <a href="ziFei-info-input.do?ftype=${param.ftype}&id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
