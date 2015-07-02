<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-xmgl");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.pjFirstCheck-info.list.title" text="列表" /></title>
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
        'filter_LIKES_fxmname': '${param.filter_LIKES_name}'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'pjFirstCheck-infoGridForm',
	exportUrl: 'pjFirstCheck-info-export.do'
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
		    <a class="btn"><i id="pjFirstCheck-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="pjFirstCheck-infoSearch" class="content content-inner">

		  <form name="pjFirstCheck-infoForm" method="post" action="pjFirstCheck-info-list.do" class="form-inline">
		    <label for="pjFirstCheck-info_name"><spring:message code='pjFirstCheck-info.pjFirstCheck-info.list.search.name' text='名称'/>:</label>
		    <input type="text" id="pjFirstCheck-info_name" name="filter_LIKES_fxmname" value="${param.filter_LIKES_name}">
			<button class="btn btn-small a-search" onclick="document.pjFirstCheck-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="pjFirstCheck-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='pjFirstCheck-info-input.do'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="pjFirstCheck-info:delete">
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
		  <h4 class="title"><spring:message code="pjFirstCheck-info.pjFirstCheck-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="pjFirstCheck-infoGridForm" name="pjFirstCheck-infoGridForm" method='post' action="pjFirstCheck-info-remove.do" class="m-form-blank">
  <table id="pjFirstCheck-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="fcheckno">序号</th>
        	<th class="sorting" name="fxmid">项目</th>
        	<th class="sorting" name="fcheckerid">检查人</th>
        	<th class="sorting" name="fdate">检查日期</th>
        	<th class="sorting" name="fgoal">得分</th>
        	<th class="sorting" name="fproblem">存在问题</th>
        	<th class="sorting" name="ffuchadate">复查时间</th>
        	<th class="sorting" name="fcucharenid">复查人</th>
        	<th class="sorting" name="ffucharesult">复查结果</th>
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	 	 <td>${item.fid}</td>
      	 	 <td>${xmMap[item.fxmid].fxmname}</td>
      	 	 <td>${ryMap[item.fcheckerid].fname}</td>
      	 	 <td>${item.fdate}</td>
      	 	 <td>${item.fgoal}</td>
      	 	 <td>${item.fproblem}</td>
      	 	 <td>${item.ffuchadate}</td>
      	 	 <td>${ryMap[item.fcucharenid].fname}</td>
      	 	 <td>${item.ffucharesult}</td>
        <td>
          <a href="pjFirstCheck-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
