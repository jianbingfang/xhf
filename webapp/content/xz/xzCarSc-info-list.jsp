<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "xz-home");%>
<%pageContext.setAttribute("currentMenu", "xz-cl");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.xzCarSc-info.list.title" text="审车登记 - 车辆管理 - 行政管理" /></title>
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
    	'fcarid':'param.fcarid',
        'filter_LIKES_fmemo1': '${param.filter_LIKES_fmemo1}'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'xzCarSc-infoGridForm',
	exportUrl: 'xzCarSc-info-export.do'
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
<%--  <div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<ul class="breadcrumb">
				<li>
					<a href="xz-workspace.do">行政管理</a> <span class="divider">/</span>
				</li>
				<li>
					车辆管理<span class="divider">/</span>
				</li>
				<li class="active">
					审车登记
				</li>
			</ul>
		</div>
	</div>
</div>
	  <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="xzCarSc-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="xzCarSc-infoSearch" class="content content-inner">

		  <form name="xzCarSc-infoForm" method="post" action="xzCarSc-info-list.do" class="form-inline">
		    <label for="xzCarSc-info_fmemo1"><spring:message code='xzCarSc-info.xzCarSc-info.list.search.fmemo1' text='车牌号'/>:</label>
		    <input type="text" id="xzCarSc-info_fmemo1" name="filter_LIKES_fmemo1" value="${param.filter_LIKES_fmemo1}">
			<button class="btn btn-small a-search" onclick="document.xzCarSc-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article> --%>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="xzCarSc-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='xzCarSc-info-input.do?fcarid=${param.fcarid}'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="xzCarSc-info:delete">
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
		  <h4 class="title"><spring:message code="xzCarSc-info.xzCarSc-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="xzCarSc-infoGridForm" name="xzCarSc-infoGridForm" method='post' action="xzCarSc-info-remove.do" class="m-form-blank">
  <table id="xzCarSc-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="fmemo1">车牌号</th>
        	<th class="sorting" name="fscdate">本次审车时间</th>
        	<th class="sorting" name="fnextdate">下次审车时间</th>
        	<th class="sorting" name="fryid">负责人</th>
        	<th class="sorting" name="fscmoney">审车费用</th>
        	
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	 	 <td>${item.fmemo1}</td>
      	 	 <td>${item.fscdate}</td>
      	 	 <td>${item.fnextdate}</td>
      	 <td>${ryMap[item.fryid].fname}</td>
      	 	 <td>${item.fscmoney}</td>
        <td>
          <a href="xzCarSc-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
