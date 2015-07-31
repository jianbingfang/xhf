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


        <article class="m-blank  multiple" >
            <div class="pull-left">
                <region:region-permission permission="jlShizhong-info:create">
                    <button class="btn btn-small a-insert" onclick="location.href='jlShizhong-info-input.do?fszleix=<%= request.getParameter("fszleix")%>&style=${divStyle}'">新建</button>
                </region:region-permission>
                <region:region-permission permission="jlShizhong-info:delete">
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

<form id="pjGuifantuji-infoGridForm" name="pjGuifantuji-infoGridForm" method='post' action="pjGuifantuji-info-remove.do" class="m-form-blank">
  <table id="pjGuifantuji-infoGrid" class="m-table table-hover table-bordered">
      <thead>
         <tr>
         <th width="10" class="m-table-check"><input type="checkbox"
                                                          name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
         <th class="sorting" id="fname">名称</th>
         <th class="sorting" id="ffileurl">档案</th>
         <th width="80">&nbsp;</th>
         </tr>
      </thead>



    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
          <td></td>
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
