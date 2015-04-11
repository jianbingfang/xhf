<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-zjhy");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.pjHuiyi-zt-info.list.title" text="列表" /></title>
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
	gridFormId: 'pjHuiyi-zt-infoGridForm',
	exportUrl: 'pjHuiyi-zt-info-export.do'
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

	  <!-- start of main -->

	  <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="pjHuiyi-zt-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="pjHuiyi-zt-infoSearch" class="content content-inner">

		  <form name="pjHuiyi-zt-infoForm" method="post" action="pjHuiyi-zt-info-list.do" class="form-inline">
		    <label for="pjHuiyi-zt-info_name"><spring:message code='pjHuiyi-zt-info.pjHuiyi-zt-info.list.search.name' text='名称'/>:</label>
		    <input type="text" id="pjHuiyi-zt-info_name" name="filter_LIKES_name" value="${param.filter_LIKES_name}">
			<button class="btn btn-small a-search" onclick="document.pjHuiyi-zt-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="pjHuiyi-zt-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='pjHuiyi-zt-info-input.do'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="pjHuiyi-zt-info:delete">
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
		  <h4 class="title"><spring:message code="pjHuiyi-zt-info.pjHuiyi-zt-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="pjHuiyi-zt-infoGridForm" name="pjHuiyi-zt-infoGridForm" method='post' action="pjHuiyi-zt-info-remove.do" class="m-form-blank">
  <table id="pjHuiyi-zt-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="fhyname">名称</th>
        	<th class="sorting" name="fhydate">时间</th>
        	<th class="sorting" name="fhyaddr">地点</th>
       <!--  	<th class="sorting" name="fhyyc">会议议程</th>
        	<th class="sorting" name="fhyjy">会议纪要</th>
        	<th class="sorting" name="fqdbname">签到表</th>
        	<th class="sorting" name="fycname">会议议程</th>
        	<th class="sorting" name="fhuiytype">会议类型</th> -->
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	 	 <td>${item.fhyname}</td>
      	 	 <td>${item.fhydate}</td>
      	 	 <td>${item.fhyaddr}</td>
      <%-- 	 	 <td>${item.fhyyc}</td>
      	 	 <td>${item.fhyjy}</td>
      	 	 <td>${item.fqdbname}</td>
      	 	 <td>${item.fycname}</td>
      	 	 <td>${item.fhuiytype}</td> --%>
        <td>
          <a href="pjHuiyi-zt-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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

	  <!-- end of main -->
	</div>

  </body>

</html>
