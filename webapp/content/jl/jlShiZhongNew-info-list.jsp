<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "comm-home");%>
<%pageContext.setAttribute("currentMenu", "jlShiZhongNew");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.jlShiZhongNew-info.list.title" text="列表" /></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
var config = {
    id: 'jlShiZhongNew-infoGrid',
    pageNo: ${page.pageNo},
    pageSize: ${page.pageSize},
    totalCount: ${page.totalCount},
    resultSize: ${page.resultSize},
    pageCount: ${page.pageCount},
    orderBy: '${page.orderBy == null ? "" : page.orderBy}',
    asc: ${page.asc},
    params: {
        'filter_LIKES_name': '${param.filter_LIKES_name}',
        'defineCode': '${defineCode}'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'jlShiZhongNew-infoGridForm',
	exportUrl: 'jlShiZhongNew-info-export.do'
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
		    <a class="btn"><i id="jlShiZhongNew-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="jlShiZhongNew-infoSearch" class="content content-inner">

		  <form name="jlShiZhongNew-infoForm" method="post" action="jlShiZhongNew-info-listUserDefined.do?defineCode=${defineCode}" class="form-inline">
		    <label for="jlShiZhongNew-info_name"><spring:message code='jlShiZhongNew-info.jlShiZhongNew-info.list.search.name' text='名称'/>:</label>
		    <input type="text" id="jlShiZhongNew-info_name" name="filter_LIKES_name" value="${param.filter_LIKES_name}">
			<button class="btn btn-small a-search" onclick="document.jlShiZhongNew-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="jlShiZhongNew-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='jlShiZhongNew-info-inputUserDefined.do?defineCode=${defineCode}'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="jlShiZhongNew-info:delete">
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
		  <h4 class="title"><spring:message code="jlShiZhongNew-info.jlShiZhongNew-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="jlShiZhongNew-infoGridForm" name="jlShiZhongNew-infoGridForm" method='post' action="jlShiZhongNew-info-removeUserDefined.do" class="m-form-blank">
  <table id="jlShiZhongNew-infoGrid" class="m-table table-hover">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	 <c:forEach items="${userDefineds}" var="item">
        	 	<c:if test="${item.fisgridshow==1}">
			      	 <th class="sorting" name="${item.fcname}">${item.fname}</th>
			    </c:if>
     		 </c:forEach>
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
    <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
        	<c:forEach items="${userDefineds}" var="item1">
        	 	<c:if test="${item1.fisgridshow==1}">
        	 		 <td>${item[item1.fcname]}</td>
			    </c:if>
     		 </c:forEach>
        <td>
          <a href="jlShiZhongNew-info-inputUserDefined.do?id=${item.fid}&defineCode=${defineCode}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
