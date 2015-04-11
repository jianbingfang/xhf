<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "jl-home");%>
<%pageContext.setAttribute("currentMenu", "pjGuifantuji");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.pjGuifantuji-info.list.title" text="列表" /></title>
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
	gridFormId: 'pjGuifantuji-infoGridForm',
	exportUrl: 'pjGuifantuji-info-export.do'
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


      <article class="m-widget">
     
<form id="pjGuifantuji-infoGridForm" name="pjGuifantuji-infoGridForm" method='post' action="pjGuifantuji-info-remove.do" class="m-form-blank">
  <table id="pjGuifantuji-infoGrid" class="m-table table-hover table-bordered">

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
      	 	 <td>${item.fname}</td>
      	 	 <td><a href="${item.ffileurl}">${item.ffilename}</a></td>
      	 	 <td>${item.finfo}</td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
</form>
        </div>
      </article>

      <div class="m-spacer"></div>

	  <!-- end of main -->
	</div>

  </body>

</html>
