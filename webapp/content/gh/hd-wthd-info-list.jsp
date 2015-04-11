<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gh-home");%>
<%pageContext.setAttribute("currentMenu", "gh-hd");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.hd-info.list.title" text="列表" /></title>
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
    	'ftype':'${param.ftype}',
        'filter_LIKES_fpxzt': '${param.filter_LIKES_fpxzt}'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'hd-infoGridForm',
	exportUrl: 'hd-info-export.do?ftype=3'
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
	   <%@include file="/menu/gh-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

	  <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="hd-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="hd-infoSearch" class="content content-inner">

		  <form name="hd-infoForm" method="post" action="gh-hd-info-list.do?ftype=3" class="form-inline">
		    <label for="hd-info_name"><spring:message code='hd-info.hd-info.list.search.name' text='主题'/>:</label>
		    <input type="text" id="hd-info_fpxzt" name="filter_LIKES_fpxzt" value="${param.filter_LIKES_fpxzt}">
			<button class="btn btn-small a-search" onclick="document.hd-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="hd-info:create">
 <button class="btn btn-small a-insert" onclick="location.href='gh-hd-info-input.do?ftype=3'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="hd-info:delete">
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
		  <h4 class="title"><spring:message code="hd-info.hd-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="hd-infoGridForm" name="hd-infoGridForm" method='post' action="gh-hd-info-remove.do?ftype=3" class="m-form-blank">
  <table id="hd-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="fpxzt">活动主题</th>
        	<th class="sorting" name="fdate">时间</th>
        	<th class="sorting" name="faddress">地点</th>
        	<th class="sorting" name="fcjry">参加人员</th>
        <!-- 	<th class="sorting" name="fpxnr">培训内容</th>
        	<th class="sorting" name="furl">图片上传</th> -->
        	<th class="sorting" name="fprice">消费金额（元）</th>
        	<th class="sorting" name="fmemo">备注</th>
<!--         	<th class="sorting" name="fmemo1">备注1</th>
        	<th class="sorting" name="fmemo2">备注2</th> -->
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	 	 <td>${item.fpxzt}</td>
      	 	 <td>${item.fdate}</td>
      	 	 <td>${item.faddress}</td>
      	 	 <td>${item.fcjry}</td>
      	 	 <%-- <td>${item.fpxnr}</td>
      	 	 <td>${item.furl}</td> --%>
      	 	 <td>${item.fprice}</td>
      	 	 <td>${item.fmemo}</td>
      	 	<%--  <td>${item.fmemo1}</td>
      	 	 <td>${item.fmemo2}</td> --%>
        <td>
          <a href="hd-info-input.do?ftype=3&id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
