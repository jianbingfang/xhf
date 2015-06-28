<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "hr-home");%>
<%pageContext.setAttribute("currentMenu", "hrKq");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.hrKq-info.list.title" text="考勤统计 - 考勤管理 - 人力资源"/></title>
    <%@include file="/common/s.jsp"%>

	  <link type="text/css" rel="stylesheet"
			href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
	  <script type="text/javascript"
			  src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>

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
	gridFormId: 'hrKq-infoGridForm',
	exportUrl: 'hrKq-info-export.do'
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
	  <%@include file="/menu/hr-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">
			<!-- <div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="hr-home.do">人力资源</a> <span class="divider">/</span>
							</li>
							<li>考勤管理<span class="divider">/</span>
							</li>
							<li class="active">考勤统计</li>
						</ul>
					</div>
				</div>
			</div> -->
			<article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="hrKq-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="hrKq-infoSearch" class="content content-inner">

		  <form name="hrKq-infoForm" method="post" action="hrKq-info-list.do" class="form-inline">
		    <label for="hrKq-info_name"><spring:message code='hrKq-info.hrKq-info.list.search.name'
														text='考勤表名称'/>:</label>
		    <input type="text" id="hrKq-info_name" name="filter_LIKES_fname" value="${param.filter_LIKES_fname}">
			<button class="btn btn-small a-search" onclick="document.hrKq-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="hrKq-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='hrKq-info-input.do'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="hrKq-info:delete">
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
		  <h4 class="title"><spring:message code="hrKq-info.hrKq-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="hrKq-infoGridForm" name="hrKq-infoGridForm" method='post' action="hrKq-info-remove.do" class="m-form-blank">
  <table id="hrKq-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="fupdatedate">上传时间</th>
        	<th class="sorting" name="fcode">编号</th>
        	<th class="sorting" name="fname">考勤表名称</th>
        	<th class="sorting" name="fmonth">月份</th>
        	<th class="sorting" name="fmakeuserid">编制人</th>
        <th width="80">操作&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	  <td>${item.fupdatedate}</td>
      	  <td>${item.fcode}</td>
      	  <td> <a href="${item.furl}" class="a-update"><spring:message code="core.list.edit" text="${item.fname}"/></a></td>
      	  <td>${item.fmonth}</td>
      	  <td>${ryMap[item.fmakeuserid].fname}</td>
        <td>
          <a href="hrKq-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
