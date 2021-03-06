<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-xmgl");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.pjpeixun-info.list.title" text="列表" /></title>
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
        'filter_LIKES_fpxzt': '${param.filter_LIKES_name}'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'pjpeixun-infoGridForm',
	exportUrl: 'pjpeixun-info-export.do'
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
	<!-- <div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="gcgl-home.do">工程管理</a> <span class="divider">/</span>
							</li>
							<li>项目管理<span class="divider">/</span>
							</li>
							<li class="active">培训</li>
						</ul>
					</div>
				</div>
			</div> -->
	  <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="pjpeixun-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="pjpeixun-infoSearch" class="content content-inner">

		  <form name="pjpeixun-infoForm" method="post" action="pjpeixun-info-list.do" class="form-inline">
		    <label for="pjpeixun-info_name"><spring:message code='pjpeixun-info.pjpeixun-info.list.search.name' text='名称'/>:</label>
		    <input type="text" id="pjpeixun-info_name" name="filter_LIKES_fpxzt" value="${param.filter_LIKES_name}">
			<button class="btn btn-small a-search" onclick="document.pjpeixun-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="pjpeixun-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='pjpeixun-info-input.do'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="pjpeixun-info:delete">
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
		  <h4 class="title"><spring:message code="pjpeixun-info.pjpeixun-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
        
<form id="pjpeixun-infoGridForm" name="pjpeixun-infoGridForm" method='post' action="pjpeixun-info-remove.do" class="m-form-blank">
  <table id="pjpeixun-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th>序号</th>
		    <th class="sorting" name="fpxzt">培训主题</th>
        	<th class="sorting" name="fpxdate">培训时间</th>
        	<th class="sorting" name="fpxaddr">培训地点</th>
        	<th class="sorting" name="fzhuchiren">主持人</th>
        	<th class="sorting" name="fpxtype">培训类别</th>
        	<th class="sorting" name="fpxmethod">方式</th>
        	<!-- <th class="sorting" name="frs">参加人数</th> -->
        	<th class="sorting" name="fcontent">培训内容</th>
        <th width="80">操作</th>
      </tr>
    </thead>

    <tbody>
	<c:forEach items="${page.result}" var="item" varStatus="status">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
		  <td>${status.count}</td>
		     <td>${item.fpxzt}</td>
      	 	 <td>${item.fpxdate}</td>
      	 	 <td>${item.fpxaddr}</td>
      	 	 <td>${item.fzhuchiren}</td>
      	 	 <td>${item.fpxtype}</td>
      	 	 <td>${item.fpxmethod}</td>
      	 	<%--  <td>${item.frs}</td> --%>
      	 	 <td>${item.fcontent}</td>
        <td>
          <a href="pjpeixun-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
