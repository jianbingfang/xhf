<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "xz-home");%>
<%pageContext.setAttribute("currentMenu", "xz-cl");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.xzCarOilRecord-info.list.title" text="加油记录 - 车辆管理 - 行政管理" /></title>
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
    	'fcarid':'${param.fcarid}',
        'filter_LIKES_fmemo1': '${param.filter_LIKES_fmemo1}'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'xzCarOilRecord-infoGridForm',
	exportUrl: 'xzCarOilRecord-info-export.do'
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
					加油记录
				</li>
			</ul>
		</div>
	</div>
</div>
	  <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="xzCarOilRecord-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="xzCarOilRecord-infoSearch" class="content content-inner">

		  <form name="xzCarOilRecord-infoForm" method="post" action="xzCarOilRecord-info-list.do" class="form-inline">
		    <label for="xzCarOilRecord-info_fmemo1"><spring:message code='xzCarOilRecord-info.xzCarOilRecord-info.list.search.fmemo1' text='车牌号'/>:</label>
		    <input type="text" id="xzCarOilRecord-info_fmemo1" name="filter_LIKES_fmemo1" value="${param.filter_LIKES_fmemo1}">
			<button class="btn btn-small a-search" onclick="document.xzCarOilRecord-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article> --%>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="xzCarOilRecord-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='xzCarOilRecord-info-input.do?fcarid=${param.fcarid}'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="xzCarOilRecord-info:delete">
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
		  <h4 class="title"><spring:message code="xzCarOilRecord-info.xzCarOilRecord-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="xzCarOilRecord-infoGridForm" name="xzCarOilRecord-infoGridForm" method='post' action="xzCarOilRecord-info-remove.do" class="m-form-blank">
  <table id="xzCarOilRecord-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="fmemo1">车牌号</th>
        	<th class="sorting" name="foildate">加油时间</th>
        	<th class="sorting" name="foilmoney">加油金额</th>
        	<th class="sorting" name="foillitre">加油量</th>
        	<!-- <th class="sorting" name="fbxry">报销人</th> -->
        	<!-- <th class="sorting" name="fbxdate">报销时间</th> -->
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	 	 <td>${item.fmemo1}</td>
      	 	 <td>${item.foildate}</td>
      	 	 <td>${item.foilmoney}</td>
      	 	 <td>${item.foillitre}</td>
      	 	 <%-- <td>${item.fbxry}</td> --%>
      	 	 <%-- <td>${item.fbxdate}</td> --%>
        <td>
          <a href="xzCarOilRecord-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
