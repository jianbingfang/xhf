<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-jlb");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.jlDocTemplate-info.list.title" text="列表" /></title>
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
	gridFormId: 'jlDocTemplate-infoGridForm',
	exportUrl: 'jlDocTemplate-info-export.do'
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
	   <%@include file="/menu/gcgl-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">
		<!-- <div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="gcgl-home.do">工程管理</a> <span class="divider">/</span>
							</li>
							<li>监理部系统管理<span class="divider">/</span>
							</li>
							<li class="active">监理文档模板</li>
						</ul>
					</div>
				</div> -->
	  <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="jlDocTemplate-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="jlDocTemplate-infoSearch" class="content content-inner">

		  <form name="jlDocTemplate-infoForm" method="post" action="jlDocTemplate-info-list.do" class="form-inline">
		    <label for="jlDocTemplate-info_name"><spring:message code='jlDocTemplate-info.jlDocTemplate-info.list.search.name' text='名称'/>:</label>
		    <input type="text" id="jlDocTemplate-info_name" name="filter_LIKES_name" value="${param.filter_LIKES_name}">
			<button class="btn btn-small a-search" onclick="document.jlDocTemplate-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="jlDocTemplate-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='jlDocTemplate-info-input.do'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="jlDocTemplate-info:delete">
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
		  <h4 class="title"><spring:message code="jlDocTemplate-info.jlDocTemplate-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="jlDocTemplate-infoGridForm" name="jlDocTemplate-infoGridForm" method='post' action="jlDocTemplate-info-remove.do" class="m-form-blank">
  <table id="jlDocTemplate-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="fname">模板名称</th>
        	<th class="sorting" name="fcode">模板代码</th>
        	 <!--<th class="sorting" name="fcontent">模板内容</th>
        	<th class="sorting" name="fcreatedate">创建时间</th>
        	<th class="sorting" name="fupdatedate">修订时间</th>
        	<th class="sorting" name="fcreateuser">创建人</th>
        	<th class="sorting" name="fupdateuser">修订人</th> -->
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	 	 <td>${item.fname}</td>
      	 	 <td>${item.fcode}</td>	
      	 	 <%--<td>${item.fcontent}</td>
    	  	 <td>${item.fcreatedate}</td>
      	 	 <td>${item.fupdatedate}</td>
      	 	 <td>${item.fcreateuser}</td>
      	 	 <td>${item.fupdateuser}</td> --%>
        <td>
          <a href="jlDocTemplate-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
