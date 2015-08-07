<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jljindugenzong");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.jljindugenzong-info.list.title" text="列表" /></title>
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
		'filter_LIKES_fname': '${param.filter_LIKES_name}',
		'filter_EQS_ftype': '${type}'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'jljindugenzong-infoGridForm',
	exportUrl: 'jljindugenzong-info-export.do'
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
		    <a class="btn"><i id="jljindugenzong-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="jljindugenzong-infoSearch" class="content content-inner">

		  <form name="jljindugenzong-infoForm" method="post" action="jljindugenzong-info-list.do?type=${type}" class="form-inline">
		    <label for="jljindugenzong-info_name"><spring:message code='jljindugenzong-info.jljindugenzong-info.list.search.name' text='名称'/>:</label>
		    <input type="text" id="jljindugenzong-info_name" name="filter_LIKES_fname" value="${param.filter_LIKES_name}">
			<button class="btn btn-small a-search" onclick="document.jljindugenzong-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="jljindugenzong-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='jljindugenzong-info-input.do?type=${type}'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="jljindugenzong-info:delete">
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
				<h4 class="title">
					<spring:message
						code="jljindugenzong-info.jljindugenzong-info.list.title"
						text="列表" />
				</h4>
			</header>
			<div class="content">
				<form id="jljindugenzong-infoGridForm" 
					name="jljindugenzong-infoGridForm" method='post'
					action="jljindugenzong-info-remove.do" class="m-form-blank">
					<table id="jljindugenzong-infoGrid" class="m-table table-hover table-bordered">
						<thead>
							<tr>
								<th width="10" class="m-table-check"><input type="checkbox"
									name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
								<th class="sorting" name="fname">名称</th>
								<th class="sorting" name="fstartdate">计划开始时间</th>
								<th class="sorting" name="fenddate">计划结束时间</th>
						<!-- 		<th class="sorting" name="fstatus">进度状态</th> -->
								<th width="200">&nbsp;</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${page.result}" var="item">
								<tr>
									<td><input type="checkbox" class="selectedItem a-check"
										name="selectedItem" value="${item.fid}"></td>
									<td>${item.fname}</td>
									<td>${item.fstartdate}</td>
									<td>${item.fenddate}</td>
									<%-- <td>${item.fstatus}</td> --%>
									<td><a href="jljindugenzong-info-input.do?id=${item.fid}&type=${type}"
										class="a-update"><spring:message code="core.list.edit"
												text="编辑" /></a> &nbsp;&nbsp;&nbsp;&nbsp; <a
										href="jljindugenzongDetail-info-input.do?fgzid=${item.fid}"
										class="a-update"><spring:message code="core.list.edit"
												text="跟踪进度" /></a></td>
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
