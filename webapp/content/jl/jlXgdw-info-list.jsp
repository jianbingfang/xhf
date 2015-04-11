<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jl-jbxx");%>

<%pageContext.setAttribute("dwType",request.getParameter("dwType"));%>
<!doctype html>
<html lang="en">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.jlXgdw-info.list.title" text="列表" /></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
var config = {
    id: 'jlXgdw-infoGrid',
    pageNo: ${page.pageNo},
    pageSize: ${page.pageSize},
    totalCount: ${page.totalCount},
    resultSize: ${page.resultSize},
    pageCount: ${page.pageCount},
    orderBy: '${page.orderBy == null ? "" : page.orderBy}',
    asc: ${page.asc},
    params: {
        'filter_EQS_fdwtype': '${dwType}'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'jlXgdw-infoGridForm',
	exportUrl: 'jlXgdw-info-export.do'
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
	  <!-- start of main -->
<%-- 	  <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="jlXgdw-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="jlXgdw-infoSearch" class="content content-inner">
		  	<form name="jlXgdw-infoForm" method="post" action="jlXgdw-info-list.do" class="form-inline">
		    <label for="jlXgdw-info_name"><spring:message code='jlXgdw-info.jlXgdw-info.list.search.name' text='名称'/>:</label>
		    <input type="text" id="jlXgdw-info_name" name="filter_LIKES_name" value="${param.filter_LIKES_name}">
			<button class="btn btn-small a-search" onclick="document.jlXgdw-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article> --%>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="jlXgdw-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='jlXgdw-info-input.do?dwType=${dwType}'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="jlXgdw-info:delete">
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
		  <h4 class="title"><spring:message code="jlXgdw-info.jlXgdw-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="jlXgdw-infoGridForm" name="jlXgdw-infoGridForm" method='post' action="jlXgdw-info-remove.do" class="m-form-blank">
  <table id="jlXgdw-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="fdwtype">参建单位</th>
        	<th class="sorting" name="fdw">单位名称</th>
        	<th class="sorting" name="fcontact">联系人</th>
        	<th class="sorting" name="fzhiw">职务</th>
        	<th class="sorting" name="ftel">联系方式</th>
        	<th class="sorting" name="fmail">邮箱</th>
        	<th class="sorting" name="fmemo">备注</th>
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	 	 <td> 
      	 	   <c:if test="${item.fdwtype=='1'}"> 建设单位</c:if>
      	 	   <c:if test="${item.fdwtype=='2'}"> 项目管理单位</c:if>
      	 	   <c:if test="${item.fdwtype=='3'}"> 设计单位</c:if>
      	 	   <c:if test="${item.fdwtype=='4'}"> 施工单位</c:if>
      	 	   <c:if test="${item.fdwtype=='5'}"> 勘察单位</c:if>
      	 	   <c:if test="${item.fdwtype=='6'}"> 监理单位</c:if>
      	 	   <c:if test="${item.fdwtype=='7'}"> 其他单位</c:if>
			</td>
			 <td>${item.fdw}</td>
      	 	 <td>${item.fcontact}</td>
      	 	 <td>${item.fzhiw}</td>
      	 	 <td>${item.ftel}</td>
      	 	 <td>${item.fmail}</td>
      	 	 <td>${item.fmemo}</td>
        <td>
          <a href="jlXgdw-info-input.do?id=${item.fid}&dwType=${dwType}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
