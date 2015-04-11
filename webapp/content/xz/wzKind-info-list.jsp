<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "xz-home");%>
<%pageContext.setAttribute("currentMenu", "xz-wz");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.wzKind-info.list.title" text="物品分类 - 物资管理 - 行政管理" /></title>
    <%@include file="/common/s.jsp"%>
      <link type="text/css" rel="stylesheet" href="${scopePrefix}/s/xthena/css/multilevel-dropdown.css">
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
        'filter_LIKES_fkindname': '${param.filter_LIKES_fkindname}'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'wzKind-infoGridForm',
	exportUrl: 'wzKind-info-export.do'
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
					物品分类
				</li>
			</ul>
		</div>
	</div>
</div>
	  <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="wzKind-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="wzKind-infoSearch" class="content content-inner">

		  <form name="wzKind-infoForm" method="post" action="wzKind-info-list.do" class="form-inline">
		    <label for="wzKind-info_fkindname"><spring:message code='wzKind-info.wzKind-info.list.search.fkindname' text='分类名称'/>:</label>
		    <input type="text" id="wzKind-info_fkindname" name="filter_LIKES_fkindname" value="${param.filter_LIKES_fkindname}">
			<button class="btn btn-small a-search" onclick="document.wzKind-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="wzKind-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='wzKind-info-input.do'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="wzKind-info:delete">
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
		  <h4 class="title"><spring:message code="wzKind-info.wzKind-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="wzKind-infoGridForm" name="wzKind-infoGridForm" method='post' action="wzKind-info-remove.do" class="m-form-blank">
  <table id="wzKind-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="fkindname">分类名称</th>
        	<th class="sorting" name="fpid">上级</th>
        	<th class="sorting" name="fisasset">是否为固定资产</th>
        	<th class="sorting" name="fstatus">状态</th>
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	 	 <td>${item.fkindname}</td>
      	 	 <td>
      	 	 <c:forEach items="${kindList}" var="item1">
			    <c:if test="${item1.fid==item.fpid}"> ${item1.fkindname}</c:if>
			  </c:forEach>
			  </td>
	      	 	 <td>${item.fisasset}</td>
      	 	 <td>${item.fstatus}</td>
        <td>
          <a href="wzKind-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
