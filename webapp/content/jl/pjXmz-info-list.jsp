<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jl-wz");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.jl-pjXmz-info.list.title" text="列表" /></title>
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
        'filter_LIKES_name': '${param.filter_LIKES_name}'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'jl-pjXmz-infoGridForm',
	exportUrl: 'jl-pjXmz-info-export.do'
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
	   <%@include file="/menu/jl-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

	  <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="jl-pjXmz-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="jl-pjXmz-infoSearch" class="content content-inner">

		  <form name="jl-pjXmz-infoForm" method="post" action="jl-pjXmz-info-list.do" class="form-inline">
		    <label for="jl-pjXmz-info_name"><spring:message code='jl-pjXmz-info.jl-pjXmz-info.list.search.name' text='名称'/>:</label>
		    <input type="text" id="jl-pjXmz-info_name" name="filter_LIKES_name" value="${param.filter_LIKES_name}">
			<button class="btn btn-small a-search" onclick="document.jl-pjXmz-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="jl-pjXmz-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='jl-pjXmz-info-input.do'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="jl-pjXmz-info:delete">
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
		  <h4 class="title"><spring:message code="jl-pjXmz-info.jl-pjXmz-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="jl-pjXmz-infoGridForm" name="jl-pjXmz-infoGridForm" method='post' action="jl-pjXmz-info-remove.do" class="m-form-blank">
  <table id="jl-pjXmz-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="fxmzno">序号</th>
        	<th class="sorting" name="fstatus">状态</th>
        	<th class="sorting" name="fyijiaodate">领用日期 </th>
        	<th class="sorting" name="fjieshouren">领用人</th>
        	<th class="sorting" name="fguihuadate">归还日期</th>
        	<th class="sorting" name="fyijiaoren">归还人</th>
        	<th class="sorting" name="fmemo">备注</th>
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	 	 <td>${item.fxmzno}</td>
      	 	 <td>${item.fstatus}</td>
      	 	 <td>${item.fyijiaodate}</td>
      	 	  <td>${item.fjieshouren}</td>
      	 	  <td>${item.fguihuadate}</td>
      	 	 <td>${item.fyijiaoren}</td>
      	 	 <td>${item.fmemo}</td>
        <td>
          <a href="jl-pjXmz-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
        </td>
      </tr>
      </c:forEach>
    </tbody>
  
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
