<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "xz-home");%>
<%pageContext.setAttribute("currentMenu", "xz-da");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.xzRedTape-nb-info.list.title" text="红头文件（内）- 公司档案管理 - 行政管理" /></title>
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
        'filter_LIKES_ftaptitle': '${param.filter_LIKES_ftaptitle}'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'xzRedTape-nb-infoGridForm',
	exportUrl: 'xzRedTape-nb-info-export.do'
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
		    <a class="btn"><i id="xzRedTape-nb-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="xzRedTape-nb-infoSearch" class="content content-inner">

		   <form name="xzRedTape-nb-infoForm" method="post" action="xzRedTape-nb-info-list.do" class="form-inline">
		    <label for="xzRedTape-nb-info_ftaptitle"><spring:message
					code='xzRedTape-nb-info.xzRedTape-nb-info.list.search.ftaptitle' text='标题'/>:</label>
		  <%--   <input type="text" id="xzRedTape-wb-info_ftaptitle" name="filter_LIKES_ftaptitle" value="${param.filter_LIKES_ftaptitle}">
		    <label for="xzRedTape-wb-info_fsend"><spring:message code='xzRedTape-wb-info.xzRedTape-wb-info.list.search.fsend' text='发文单位'/>:</label> --%>
		    <input type="text" id="xzRedTape-nb-info_ftaptitle" name="filter_LIKES_ftaptitle"
				   value="${param.filter_LIKES_ftaptitle}">
		      <label for="hrPx-info_fcreatedate"><spring:message code='hrPx-info.hrPx-info.list.search.fcreatedate' text='日期'/>: 从</label>
		      <div class="input-append datepicker date" style="padding-left: 0px;">
		    <input id="commRy-info_fcreatedate" type="text" name="filter_GTD_fcreatedate" value="${param.filter_GTD_fcreatedate}" size="40" class="text "  style="background-color:white;cursor:default; width: 160px;">
		    <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
		  </div> 至
		   <div class="input-append datepicker date" style="padding-left: 0px;">
		    <input id="commRy-info_fcreatedate" type="text" name="filter_LTD_fcreatedate" value="${param.filter_LTD_fcreatedate}" size="40" class="text "  style="background-color:white;cursor:default; width: 160px;">
		    <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
		  </div>
			<button class="btn btn-small a-search" onclick="document.xzRedTape-nb-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="xzRedTape-nb-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='xzRedTape-nb-info-input.do'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="xzRedTape-nb-info:delete">
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
		  <h4 class="title"><spring:message code="xzRedTape-nb-info.xzRedTape-nb-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="xzRedTape-nb-infoGridForm" name="xzRedTape-nb-infoGridForm" method='post' action="xzRedTape-nb-info-remove.do" class="m-form-blank">
  <table id="xzRedTape-nb-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        <th class="sorting" name="fcode">编号</th>
        	<th class="sorting" name="ftapeno">文件号</th>
        	<th class="sorting" name="ftaptitle">标题</th>
<!--         	<th class="sorting" name="fsend">发文单位</th>
        	<th class="sorting" name="frecive">接收单位</th> -->
        	<th class="sorting" name="fcreatedate">日期</th>
        	<th class="sorting" name="fzkstate">在库状态</th>
        	<th class="sorting" name="fmemo">备注</th>
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
        <td>${item.fcode}</td>
      	 	 <td>${item.ftapeno}</td>
      	 	 <td>${item.ftaptitle}</td>
<%--       	 	 <td>${item.fsend}</td>
      	 	 <td>${item.frecive}</td> --%>
      	 	 <td>${item.fcreatedate}</td>
      	 	 <td><c:if test="${item.fzkstate=='在库'}"> <font color="green">在库</font>  </c:if>
			<c:if test="${item.fzkstate=='未在库'}"> <font color="red">未在库</font>  </c:if></td>
      	 	 <td>${item.fmemo}</td>
        <td>
          <a href="xzRedTape-nb-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
