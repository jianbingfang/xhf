<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jljindugenzongDetail");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.jljindugenzongDetail-info.list.title" text="列表" /></title>
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
	gridFormId: 'jljindugenzongDetail-infoGridForm',
	exportUrl: 'jljindugenzongDetail-info-export.do'
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

	  <!-- start of main -->

	  <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="jljindugenzongDetail-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="jljindugenzongDetail-infoSearch" class="content content-inner">

		  <form name="jljindugenzongDetail-infoForm" method="post" action="jljindugenzongDetail-info-list.do" class="form-inline">
		    <label for="jljindugenzongDetail-info_name"><spring:message code='jljindugenzongDetail-info.jljindugenzongDetail-info.list.search.name' text='名称'/>:</label>
		    <input type="text" id="jljindugenzongDetail-info_name" name="filter_LIKES_name" value="${param.filter_LIKES_name}">
			<button class="btn btn-small a-search" onclick="document.jljindugenzongDetail-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="jljindugenzongDetail-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='jljindugenzongDetail-info-input.do'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="jljindugenzongDetail-info:delete">
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
		  <h4 class="title"><spring:message code="jljindugenzongDetail-info.jljindugenzongDetail-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="jljindugenzongDetail-infoGridForm" name="jljindugenzongDetail-infoGridForm" method='post' action="jljindugenzongDetail-info-remove.do" class="m-form-blank">
  <table id="jljindugenzongDetail-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="fname">名称</th>
        	<th class="sorting" name="fstartdate">计划开始时间</th>
        	<th class="sorting" name="fenddate">计划结束时间</th>
        	<th class="sorting" name="feditdate">计划编辑时间</th>
        	<th class="sorting" name="fcompdate">跟踪完成时间</th>
        	<th class="sorting" name="frealstart">实际开始时间</th>
        	<th class="sorting" name="frealend">实际结束时间</th>
        	<th class="sorting" name="fanalyze">进度分析</th>
        	<th class="sorting" name="ftype">计划类型</th>
        	<th class="sorting" name="fstatus">进度状态</th>
        	<th class="sorting" name="fmemo">备注</th>
        	<th class="sorting" name="fmemo1">备注1</th>
        	<th class="sorting" name="fmemo2">备注2</th>
        	<th class="sorting" name="fpercent">占总进度的百分比</th>
        	<th class="sorting" name="frealpercent">实际进度的百分比</th>
        	<th class="sorting" name="fgzid"></th>
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	 	 <td>${item.fname}</td>
      	 	 <td>${item.fstartdate}</td>
      	 	 <td>${item.fenddate}</td>
      	 	 <td>${item.feditdate}</td>
      	 	 <td>${item.fcompdate}</td>
      	 	 <td>${item.frealstart}</td>
      	 	 <td>${item.frealend}</td>
      	 	 <td>${item.fanalyze}</td>
      	 	 <td>${item.ftype}</td>
      	 	 <td>${item.fstatus}</td>
      	 	 <td>${item.fmemo}</td>
      	 	 <td>${item.fmemo1}</td>
      	 	 <td>${item.fmemo2}</td>
      	 	 <td>${item.fpercent}</td>
      	 	 <td>${item.frealpercent}</td>
      	 	 <td>${item.fgzid}</td>
        <td>
          <a href="jljindugenzongDetail-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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

	  <!-- end of main -->
	</div>

  </body>

</html>
