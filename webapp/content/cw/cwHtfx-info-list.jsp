<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "cw-home");%>
<%pageContext.setAttribute("currentMenu", "cw-ht");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.cwHtfx-info.list.title" text="列表" /></title>
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
    	'id':${param.id},
        'filter_LIKES_fhetongname': '${filter_LIKES_fhetongname}'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'cwHtfx-infoGridForm',
	exportUrl: 'cwHtfx-info-export.do'
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

	  <article class="m-widget"  hidden="hidden">
      <div id="cwHtfx-infoSearch" class="content content-inner" hidden="hidden">

		  <form name="cwHtfx-infoForm" method="post" action="cwHtfx-info-list.do" class="form-inline">
		    <label for="cwHtfx-info_fhetongname"><spring:message code='cwHtfx-info.cwHtfx-info.list.search.fhetongname' text='合同名称'/>:</label>
		    <input type="text" id="cwHtfx-info_fhetongname" name="filter_LIKES_fhetongname" value="${param.filter_LIKES_fhetongname}">
			<button class="btn btn-small a-search" onclick="document.cwHtfx-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="cwHtfx-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='cwHtfx-info-input.do'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="cwHtfx-info:delete">
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
		  <h4 class="title"><spring:message code="cwHtfx-info.cwHtfx-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="cwHtfx-infoGridForm" name="cwHtfx-infoGridForm" method='post' action="cwHtfx-info-remove.do" class="m-form-blank">
  <table id="cwHtfx-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="fhetongname">合同名称</th>
        	<th class="sorting" name="fhetongjine">合同金额</th>
        	<th class="sorting" name="fsjzsr">实际总收入</th>
        	<th class="sorting" name="fyszk">应收账款</th>
        	<th class="sorting" name="fhsl">回收率</th>
        	<th class="sorting" name="fysjlf">应收监理费</th>
        	<th class="sorting" name="flyl">履约率</th>
        	<th class="sorting" name="fgcjd">工程进度</th>
        	<th class="sorting" name="fqksm">情况说明</th>
        	<th class="sorting" name="fmemo">备注</th>
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	 	 <td class="span3">${item.fhetongname}</td>
      	 	 <td>${item.fhetongjine}</td>
      	 	 <td>${item.fsjzsr}</td>
      	 	 <td>${item.fyszk}</td>
      	 	 <td>${item.fhsl}</td>
      	 	 <td>${item.fysjlf}</td>
      	 	 <td>${item.flyl}</td>
      	 	 <td>${item.fgcjd}</td>
      	 	 <td>${item.fqksm}</td>
      	 	 <td>${item.fmemo}</td>
        <td>
          <a href="cwHtfx-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
