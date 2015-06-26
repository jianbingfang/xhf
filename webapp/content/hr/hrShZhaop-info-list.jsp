<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "hr-home");%>
<%pageContext.setAttribute("currentMenu", "hrGwbm");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.hrShZhaop-info.list.title" text="列表" /></title>
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
	gridFormId: 'hrShZhaop-infoGridForm',
	exportUrl: 'hrShZhaop-info-export.do'
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

    <div class="row-fluid">

	  <!-- start of main -->

	  <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="hrShZhaop-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="hrShZhaop-infoSearch" class="content content-inner">

		  <form name="hrShZhaop-infoForm" method="post" action="hrShZhaop-info-list.do" class="form-inline">
		    <label for="hrShZhaop-info_name"><spring:message code='hrShZhaop-info.hrShZhaop-info.list.search.name'
															 text='岗位名称'/>:</label>
		    <input type="text" id="hrShZhaop-info_name" name="filter_LIKES_fgwname" value="${param.filter_LIKES_fgwname}">
			<button class="btn btn-small a-search" onclick="document.hrShZhaop-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="hrShZhaop-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='hrShZhaop-info-input.do'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="hrShZhaop-info:delete">
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
		  <h4 class="title"><spring:message code="hrShZhaop-info.hrShZhaop-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="hrShZhaop-infoGridForm" name="hrShZhaop-infoGridForm" method='post' action="hrShZhaop-info-remove.do" class="m-form-blank">
  <table id="hrShZhaop-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="ffbtype">发布方式</th>
        	<th class="sorting" name="fgwname">岗位名称</th>
        	<th class="sorting" name="fzhiwu">职务</th>
        	<th class="sorting" name="fzhaopinnum">招聘人数</th>
        	<th class="sorting" name="fgwzhize">岗位职责</th>
        	<th class="sorting" name="fgwyaoqiu">岗位要求</th>
        	<th class="sorting" name="fgzaddr">工作地点</th>
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	 	 <td>${item.ffbtype}</td>
      	 	 <td>${item.fgwname}</td>
      	 	 <td>${item.fzhiwu}</td>
      	 	 <td>${item.fzhaopinnum}</td>
      	 	 <td>${item.fgwzhize}</td>
      	 	 <td>${item.fgwyaoqiu}</td>
      	 	 <td>${item.fgzaddr}</td>
        <td>
          <a href="hrShZhaop-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
