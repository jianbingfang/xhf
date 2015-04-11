<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "hr-home");%>
<%pageContext.setAttribute("currentMenu", "hrGwbm");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.hrGwbm-info.list.title" text="岗位需求 - 员工招聘 - 人力资源" /></title>
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
        'filter_LIKES_fname': '${param.filter_LIKES_fname}'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'hrGwbm-infoGridForm',
	exportUrl: 'hrGwbm-info-export.do'
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
				<li>
					<a href="hr-home.do">人力资源</a> <span class="divider">/</span>
				</li>
				<li>
					员工招聘<span class="divider">/</span>
				</li>
				<li class="active">
					岗位需求
				</li>
			</ul>
		</div>
	</div>
</div> -->
	  <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="hrGwbm-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="hrGwbm-infoSearch" class="content content-inner">

		  <form name="hrGwbm-infoForm" method="post" action="hrGwbm-info-list.do" class="form-inline">
		    <label for="hrGwbm-info_name"><spring:message code='hrGwbm-info.hrGwbm-info.list.search.name' text='名称'/>:</label>
		    <input type="text" id="hrGwbm-info_name" name="filter_LIKES_fname" value="${param.filter_LIKES_fname}">
			<button class="btn btn-small a-search" onclick="document.hrGwbm-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="hrGwbm-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='hrGwbm-info-input.do'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="hrGwbm-info:delete">
		  <button class="btn btn-small a-remove" onclick="table.removeAll()">删除</button>
		  </region:region-permission>
		 <!--  <button class="btn btn-small a-export" onclick="table.exportExcel()">导出</button> -->
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
		  <h4 class="title"><spring:message code="hrGwbm-info.hrGwbm-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="hrGwbm-infoGridForm" name="hrGwbm-infoGridForm" method='post' action="hrGwbm-info-remove.do" class="m-form-blank">
  <table id="hrGwbm-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="fname">岗位名称</th>
        	<th class="sorting" name="fzpsl">招聘人数</th>
        	<th class="sorting" name="fdqsl">当前员工数量</th>
        	<th class="sorting" name="fyjsl">预计员工数量</th>
        	<th class="sorting" name="fzssl">正式员工数量</th>
        	<th class="sorting" name="fstatus">状态</th>
        	<th class="sorting" name="fgwxc">岗位薪酬福利</th>
        	<th class="sorting" name="fbmid">部门</th>
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	  <td>${item.fname}</td>
      	  <td>${item.fzpsl}</td>
      	  <td>${item.fdqsl}</td>
      	  <td>${item.fyjsl}</td>
      	  <td>${item.fzssl}</td>
      	  <td>
      	  		<c:if test="${item.fstatus==1}">	
		    		招聘中
		    	</c:if>
		    	<c:if test="${item.fstatus==2}">	
		    		暂停
		    	</c:if>
      	  </td>
      	  <td>${item.fgwxc}</td>
      	  <td> <c:forEach items="${deptList}" var="item2">
  				<c:if test="${item2.id==item.fbmid}">	
		    		${item2.name}
		    	</c:if>
		  	</c:forEach>
		  </td>
        <td>
          <a href="hrGwbm-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
