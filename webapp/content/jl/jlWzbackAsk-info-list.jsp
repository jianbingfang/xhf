<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jl-cd");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.jlWzbackAsk-info.list.title" text="列表" /></title>
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
	gridFormId: 'jlWzbackAsk-infoGridForm',
	exportUrl: 'jlWzbackAsk-info-export.do'
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
<%--
	  <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="jlWzbackAsk-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="jlWzbackAsk-infoSearch" class="content content-inner">

		  <form name="jlWzbackAsk-infoForm" method="post" action="jlWzbackAsk-info-list.do" class="form-inline">
		    <label for="jlWzbackAsk-info_name"><spring:message code='jlWzbackAsk-info.jlWzbackAsk-info.list.search.name' text='名称'/>:</label>
		    <input type="text" id="jlWzbackAsk-info_name" name="filter_LIKES_name" value="${param.filter_LIKES_name}">
			<button class="btn btn-small a-search" onclick="document.jlWzbackAsk-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>
--%>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="jlWzbackAsk-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='jlWzbackAsk-info-input.do'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="jlWzbackAsk-info:delete">
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
		  <h4 class="title"><spring:message code="jlWzbackAsk-info.jlWzbackAsk-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="jlWzbackAsk-infoGridForm" name="jlWzbackAsk-infoGridForm" method='post' action="jlWzbackAsk-info-remove.do" class="m-form-blank">
  <table id="jlWzbackAsk-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="faskuser">申请人</th>
        	<th class="sorting" name="faskdate">申请时间</th>
        	<th class="sorting" name="freceiveuser">接收人</th>
        	<th class="sorting" name="freceivedate">接收时间</th>
        	<th class="sorting" name="fbwztype">资产类型</th>
        	<th class="sorting" name="ffileid">下载附件</th>
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	 	 <td>${ryMap[item.faskuser].fname}</td>
      	 	 <td>${item.faskdate}</td>
      	 	 <td>${ryMap[item.freceiveuser].fname}</td>
      	 	 <td>${item.freceivedate}</td>
      	 	 <td>${item.fbwztype}</td>
      	 	 <td>${item.ffileid}</td>
        <td>
          <a href="jlWzbackAsk-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
		  没有数据
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
