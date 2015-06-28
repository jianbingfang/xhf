<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-ny");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.pjjx-info.list.title" text="列表" /></title>
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
        'filter_LIKES_fjxqihao': '${param.filter_LIKES_name}'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'pjjx-infoGridForm',
	exportUrl: 'pjjx-info-export.do'
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
		    <a class="btn"><i id="pjjx-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="pjjx-infoSearch" class="content content-inner">

		  <form name="pjjx-infoForm" method="post" action="pjjx-info-list.do" class="form-inline">
		    <label for="pjjx-info_name"><spring:message code='pjjx-info.pjjx-info.list.search.name' text='期号'/>:</label>
		    <input type="text" id="pjjx-info_name" name="filter_LIKES_fjxqihao" value="${param.filter_LIKES_name}">
			<button class="btn btn-small a-search" onclick="document.pjjx-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="pjjx-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='pjjx-info-input.do'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="pjjx-info:delete">
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
		  <h4 class="title"><spring:message code="pjjx-info.pjjx-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="pjjx-infoGridForm" name="pjjx-infoGridForm" method='post' action="pjjx-info-remove.do" class="m-form-blank">
  <table id="pjjx-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="fjxno">序号</th>
        	<th class="sorting" name="fjxqihao">期号</th>
        	<th class="sorting" name="fjxdate">发放时间</th>
        	<!-- <th class="sorting" name="ffilename">备注</th> -->
        	<th class="sorting" name="fmemo">备注</th>
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	 	 <td>${item.fid}</td>
      	 <%-- 	 <td>${ryMap[item.fjingshourenid].fname}</td> --%>
      	 	 <td>${item.fjxqihao}</td>
      	 	 <td>${item.fjxdate}</td>
      	 	<%--  <td>${item.ffilename}</td> --%>
      	 	<td>${item.fmemo}</td>
        <td>
          <a href="pjjx-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
