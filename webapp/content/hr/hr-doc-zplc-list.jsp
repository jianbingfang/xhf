<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "hr-home");%>
<%pageContext.setAttribute("currentMenu", "hr-xc");%>
<!doctype html>
<html lang="en">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.hr-plain-info.list.title" text="基本工资计算器- 员工招聘 - 人力资源"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
var config = {
    id: 'hr-doc-zplc-infoGrid',
    pageNo: ${page.pageNo},
    pageSize: ${page.pageSize},
    totalCount: ${page.totalCount},
    resultSize: ${page.resultSize},
    pageCount: ${page.pageCount},
    orderBy: '${page.orderBy == null ? "" : page.orderBy}',
    asc: ${page.asc},
    params: {
       // 'filter_LIKES_name': '${param.filter_LIKES_name}',
        //'filter_EQS_fmodulecode': 'hr'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'hr-doc-zplc-infoGridForm',
	exportUrl: 'hr-doc-zplc-export.do'
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
	  <%@include file="/menu/plain-info.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">
	  <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="hr-plain-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="hr-plain-infoSearch" class="content content-inner">

		  <form name="hr-plain-infoForm" method="post" action="hr-doc-zplc-list.do" class="form-inline">
		    <label for="hr-plain-info_name"><spring:message code='hr-plain-info.hr-plain-info.list.search.name' text='名称'/>:</label>
			<button class="btn btn-small a-search" onclick="document.hr-plain-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="hr-plain-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='hr-doc-zplc-input.do'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="hr-plain-info:delete">
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
		  <h4 class="title"><spring:message code="hr-plain-info.hr-plain-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="hr-doc-zplc-infoGridForm" name="hr-doc-zplc-infoGridForm" method='post' action="hr-doc-zplc-remove.do" class="m-form-blank">
  <table id="hr-doc-zplc-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
       <%--  <th class="sorting" name="fcode"><spring:message code="hr-plain-info.hr-plain-info.list.name" text="序号"/></th> --%>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        <th class="sorting" id="ftitle">制度名称</th>
        <th class="sorting" id="fstatus">状态</th>
        <th class="sorting" id="fstartdate">开始时间</th>
        <th class="sorting" id="fenddate">废止时间</th>
        <th class="sorting" id="fuserid">编制人</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr ondblclick="window.location='hr-doc-zplc-input.do?id=${item.fid}'">
       
         <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
        <%-- <td>${items.index}</td> --%>
         <td><a style="color:#005580;" href="../comm/comm-doc-input.do?id=${item.fid}" target="_blank" >${item.ftitle}</a></td>
          <td><a style="color:#005580;" href="../comm/comm-doc-input.do?id=${item.fid}" target="_blank" >${item.ftitle}</a></td>
	        <c:if test="${item.fstatus==2}">实行</c:if>
	        <c:if test="${item.fstatus==3}"><font color="#FF3333">废除</font></c:if>
        </td>
        <td>${item.fstartdate}</td>
        <td>${item.fenddate}</td>
        <td>${item.fcreator}</td>
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
