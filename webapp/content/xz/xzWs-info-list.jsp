<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "xz-home");%>
<%pageContext.setAttribute("currentMenu", "xz-ws");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.xzWs-info.list.title" text="列表" /></title>
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
        'filter_LIKES_fbjbm': '${param.filter_LIKES_fbjbm}',
        'filter_LIKES_fdate': '${param.filter_LIKES_fdate}',
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'xzWs-infoGridForm',
	exportUrl: 'xzWs-info-export.do'
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
	   <%@include file="/menu/xz-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

	  <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="xzWs-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="xzWs-infoSearch" class="content content-inner">

		  <form name="xzWs-infoForm" method="post" action="xzWs-info-list.do" class="form-inline">
		    <label for="xzWs-info_fbjbm"><spring:message code='xzWs-info.xzWs-info.list.search.fbjbm' text='被检部门'/>:</label>
		    <input type="text" id="xzWs-info_fbjbm" name="filter_LIKES_fbjbm" value="${param.filter_LIKES_fbjbm}">
		    	    <label for="xzWs-info_fdate"><spring:message code='xzWs-info.xzWs-info.list.search.fdate' text='检查日期'/>:</label>
		    <input type="text" id="xzWs-info_fdate" name="filter_LIKES_fdate" value="${param.filter_LIKES_fdate}">
			<button class="btn btn-small a-search" onclick="document.xzWs-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="xzWs-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='xzWs-info-input.do?ftype=${ftype}'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="xzWs-info:delete">
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
		  <h4 class="title"><spring:message code="xzWs-info.xzWs-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="xzWs-infoGridForm" name="xzWs-infoGridForm" method='post' action="xzWs-info-remove.do" class="m-form-blank">
  <table id="xzWs-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="fdate">检查日期</th>
        	<th class="sorting" name="fjczcy">检查组成员</th>
        	<th class="sorting" name="fbjbm">被检部门</th>
        	<th class="sorting" name="flfqk">得分情况</th>
        	<th class="sorting" name="fpjjg">评比结果</th>
        	<!-- <th class="sorting" name="ftype">检查类型</th> -->
   <!--      	<th class="sorting" name="fmemo">备注</th>
        	<th class="sorting" name="fmemo1">备注1</th>
        	<th class="sorting" name="fmemo2">备注2</th> -->
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	 	 <td>${item.fdate}</td>
      	 	 <td>${item.fjczcy}</td>
      	 	 <td>${item.fbjbm}</td>
      	 	 <td>${item.flfqk}</td>
      	 	 <td>${item.fpjjg}</td>
      	 	 <%-- <td>${item.ftype}</td> --%>
<%--       	 	 <td>${item.fmemo}</td>
      	 	 <td>${item.fmemo1}</td>
      	 	 <td>${item.fmemo2}</td> --%>
        <td>
          <a href="xzWs-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
