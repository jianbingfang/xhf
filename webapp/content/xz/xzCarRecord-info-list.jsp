<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "xz-home");%>
<%pageContext.setAttribute("currentMenu", "xz-cl");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.xzCarRecord-info.list.title" text="车辆使用记录 - 车辆管理 - 行政管理" /></title>
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
        'filter_LIKES_fmemo1': '${param.filter_LIKES_fmemo1}'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'xzCarRecord-infoGridForm',
	exportUrl: 'xzCarRecord-info-export.do'
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
 <%-- <div class="container-fluid">
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
					车辆使用记录
				</li>
			</ul>
		</div>
	</div>
</div>
	  <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="xzCarRecord-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="xzCarRecord-infoSearch" class="content content-inner">

		  <form name="xzCarRecord-infoForm" method="post" action="xzCarRecord-info-list.do" class="form-inline">
		    <label for="xzCarRecord-info_fmemo1"><spring:message code='xzCarRecord-info.xzCarRecord-info.list.search.fmemo1' text='车牌号'/>:</label>
		    <input type="text" id="xzCarRecord-info_fmemo1" name="filter_LIKES_fmemo1" value="${param.filter_LIKES_fmemo1}">
			<button class="btn btn-small a-search" onclick="document.xzCarRecord-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article> --%>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="xzCarRecord-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='xzCarRecord-info-input.do?fcarid=${fcarid}'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="xzCarRecord-info:delete">
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
		  <h4 class="title"><spring:message code="xzCarRecord-info.xzCarRecord-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="xzCarRecord-infoGridForm" name="xzCarRecord-infoGridForm" method='post' action="xzCarRecord-info-remove.do" class="m-form-blank">
  <table id="xzCarRecord-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="fmemo1">编号</th>
        	<th class="sorting" name="fmemo1">车牌号</th>
        	<th class="sorting" name="foutdate">出车时间</th>
        	<th class="sorting" name="fry">使用人</th>
        	<th class="sorting" name="fbackdate">归还时间</th>
        	<th class="sorting" name="fdriveline">行车线路</th>
        	<th class="sorting" name="ftotalkm">总公里数</th>
        	<th class="sorting" name="fxckm">行车里程</th>
        	<th class="sorting" name="fcarstate">车辆状况</th>
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
        <td>${item.fmemo1}</td>
      	 	  <td>${item.fmemo1}</td>
      	 	 <td>${item.foutdate}</td>
      	 	 <td>${item.fry}</td>
      	 	 <td>${item.fbackdate}</td>
      	 	 <td>${item.fdriveline}</td>
      	 	 <td>${item.ftotalkm}</td>
      	 	 <td>${item.fxckm}</td>
      	 	 <td>${item.fcarstate}</td>
        <td>
          <a href="xzCarRecord-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
