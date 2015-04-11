<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-xmry");%>

<%pageContext.setAttribute("fxmid", request.getParameter("fxmid"));%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.pjRy-info.list.title" text="列表" /></title>
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
	gridFormId: 'pjRy-infoGridForm',
	exportUrl: 'pjRy-info-export.do'
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
							<li>项目人员管理<span class="divider">/</span>
							</li>
							<li class="active">项目人员台账</li>
						</ul>
					</div>
				</div>
			</div> -->
	  <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="pjRy-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="pjRy-infoSearch" class="content content-inner">

		  <form name="pjRy-infoForm" method="post" action="pjRy-info-list.do" class="form-inline">
		    <label for="pjRy-info_name"><spring:message code='pjRy-info.pjRy-info.list.search.name' text='名称'/>:</label>
		    <input type="text" id="pjRy-info_name" name="filter_LIKES_name" value="${param.filter_LIKES_name}">
			<button class="btn btn-small a-search" onclick="document.pjRy-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
	<!-- 	  <region:region-permission permission="pjRy-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='pjRy-info-input.do'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="pjRy-info:delete">
		  <button class="btn btn-small a-remove" onclick="table.removeAll()">删除</button>
		  </region:region-permission> -->
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
		  <h4 class="title"><spring:message code="pjRy-info.pjRy-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="pjRy-infoGridForm" name="pjRy-infoGridForm" method='post' action="pjRy-info-remove.do" class="m-form-blank">
 <table id="pjRy-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="fxmid">项目名称</th>
        	<th class="sorting" name="fryid">姓名</th>
        	<th class="sorting" name="fgangwei">职务</th>
        	<th class="sorting" name="fxueli">学历</th>
        	<th class="sorting" name="fzhicheng">职称</th>
        	<th class="sorting" name="ftel">电话</th>
        <!-- 	<th class="sorting" name="fstartdate">进入项目时间</th>
        	<th class="sorting" name="fenddate">离开项目时间</th>
        	<th class="sorting" name="fmemo">备注</th> -->
        <th width="80">&nbsp;</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	 	 <td >${xmMap[item.fxmid].fxmname}</td> 
      	 	 <td>${ryMap[item.fryid].fname}</td>
      	 	 <td>${item.fgangwei}</td>	 
      	 	 <td>
      	 	 	<c:if test="${ryMap[item.fryid].fxueli==-1}">
      	 	 		小学
      	 	 	</c:if>
      	 	 	<c:if test="${ryMap[item.fryid].fxueli==0}">
      	 	 		初中
      	 	 	</c:if>
      	 	 	<c:if test="${ryMap[item.fryid].fxueli==1}">
      	 	 		中专
      	 	 	</c:if>
      	 	 	<c:if test="${ryMap[item.fryid].fxueli==2}">
      	 	 		大专
      	 	 	</c:if>
      	 	 	<c:if test="${ryMap[item.fryid].fxueli==3}">
      	 	 		本科
      	 	 	</c:if>
      	 	 	<c:if test="${ryMap[item.fryid].fxueli==4}">
      	 	 		硕士
      	 	 	</c:if>
      	 	 	<c:if test="${ryMap[item.fryid].fxueli==5}">
      	 	 		博士
      	 	 	</c:if>
      	 	 </td>
      	 	 <td>${item.fzhicheng}</td>	 
      	 	 <td>${ryMap[item.fryid].ftel}</td>
      <%-- 	 	 <td>${item.fstartdate}</td>
      	 	 <td>${item.fenddate}</td>
      	 	 <td>${item.fmemo}</td> --%>
        <td>
          <a href="pjRy-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
