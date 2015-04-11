<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "hr-home");%>
<%pageContext.setAttribute("currentMenu", "hrGwbm");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.hrZhaopPlain-info.list.title" text="列表" /></title>
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
	gridFormId: 'hrZhaopPlain-infoGridForm',
	exportUrl: 'hrZhaopPlain-info-export.do'
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
	   <%@include file="/menu/hr-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

	  <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="hrZhaopPlain-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="hrZhaopPlain-infoSearch" class="content content-inner">

		  <form name="hrZhaopPlain-infoForm" method="post" action="hrZhaopPlain-info-list.do" class="form-inline">
		    <label for="hrZhaopPlain-info_name"><spring:message code='hrZhaopPlain-info.hrZhaopPlain-info.list.search.name' text='名称'/>:</label>
		    <input type="text" id="hrZhaopPlain-info_name" name="filter_LIKES_name" value="${param.filter_LIKES_name}">
			<button class="btn btn-small a-search" onclick="document.hrZhaopPlain-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="hrZhaopPlain-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='hrZhaopPlain-info-input.do'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="hrZhaopPlain-info:delete">
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
		  <h4 class="title"><spring:message code="hrZhaopPlain-info.hrZhaopPlain-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="hrZhaopPlain-infoGridForm" name="hrZhaopPlain-infoGridForm" method='post' action="hrZhaopPlain-info-remove.do" class="m-form-blank">
  <table id="hrZhaopPlain-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="fdept">部门</th>
        	<th class="sorting" name="fgw">岗位</th>
        	<th class="sorting" name="fzhiwu">职务</th>
        	<th class="sorting" name="fcurnum">当前员工数量</th>
        	<th class="sorting" name="fplainnum">拟招人数</th>
        	<!-- <th class="sorting" name="frytiaozheng">人员内部调整</th>
        	<th class="sorting" name="fgwzhize">岗位职责</th>
        	<th class="sorting" name="fgwyaoqiu">岗位要求</th>
        	<th class="sorting" name="fshenpistatus">领导审批</th> -->
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	 	 <td>${deptMap[item.fdept]}</td>
      	 	 <td>${gwInfos[item.fgw].fgwname}</td>
      	 	 <td>${item.fzhiwu}</td>
      	 	 <td>${item.fcurnum}</td>
      	 	 <td>${item.fplainnum}</td>
      	<%--  	 <td>${item.frytiaozheng}</td>
      	 	 <td>${item.fgwzhize}</td>
      	 	 <td>${item.fgwyaoqiu}</td>
      	 	 <td>${item.fshenpistatus}</td> --%>
        <td>
          <a href="hrZhaopPlain-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
