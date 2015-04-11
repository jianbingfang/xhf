<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "xz-home");%>
<%pageContext.setAttribute("currentMenu", "xz-wz");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.wzAskList-info.list.title" text="物品台账 - 物资管理 - 行政管理" /></title>
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
	gridFormId: 'wzAskList-infoGridForm',
	exportUrl: 'wzAskList-info-export.do'
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
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<ul class="breadcrumb">
				<li>
					<a href="xz-workspace.do">行政管理</a> <span class="divider">/</span>
				</li>
				<li>
					物资管理<span class="divider">/</span>
				</li>
				<li class="active">
					物品台账
				</li>
			</ul>
		</div>
	</div>
</div>
	  <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="wzAskList-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="wzAskList-infoSearch" class="content content-inner">

		  <form name="wzAskList-infoForm" method="post" action="wzAskList-info-list.do" class="form-inline">
		    <label for="wzAskList-info_name"><spring:message code='wzAskList-info.wzAskList-info.list.search.name' text='名称'/>:</label>
		    <input type="text" id="wzAskList-info_name" name="filter_LIKES_name" value="${param.filter_LIKES_name}">
			<button class="btn btn-small a-search" onclick="document.wzAskList-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="wzAskList-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='wzAskList-info-input.do'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="wzAskList-info:delete">
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
		  <h4 class="title"><spring:message code="wzAskList-info.wzAskList-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="wzAskList-infoGridForm" name="wzAskList-infoGridForm" method='post' action="wzAskList-info-remove.do" class="m-form-blank">
  <table id="wzAskList-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="faskid">申请单id</th>
        	<th class="sorting" name="fwzname">物资名称</th>
        	<th class="sorting" name="fnum">数量</th>
        	<th class="sorting" name="fmemo">备注</th>
        	<th class="sorting" name="fwzcode">物资代码</th>
        	<th class="sorting" name="fwzid">物资id</th>
        	<th class="sorting" name="fmemo1">备注1</th>
        	<th class="sorting" name="fmemo2">备注2</th>
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	 	 <td>${item.faskid}</td>
      	 	 <td>${item.fwzname}</td>
      	 	 <td>${item.fnum}</td>
      	 	 <td>${item.fmemo}</td>
      	 	 <td>${item.fwzcode}</td>
      	 	 <td>${item.fwzid}</td>
      	 	 <td>${item.fmemo1}</td>
      	 	 <td>${item.fmemo2}</td>
        <td>
          <a href="wzAskList-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
