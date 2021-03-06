<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "hr-home");%>
<%pageContext.setAttribute("currentMenu", "hrJiaban");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.hrJiaban-info.list.title" text="列表" /></title>
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
	gridFormId: 'hrJiaban-infoGridForm',
	exportUrl: 'hrJiaban-info-export.do'
};

var table;

$(function() {
	table = new Table(config);
    table.configPagination('.m-pagination');
    table.configPageInfo('.m-page-info');
    table.configPageSize('.m-page-size');

	createryPicker({
		modalId : 'ryPicker',
		url : '${scopePrefix}/hr/commRy-simple-list.do'
	});
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
		    <a class="btn"><i id="hrJiaban-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="hrJiaban-infoSearch" class="content content-inner">

		  <form name="hrJiaban-infoForm" method="post" action="hrJiaban-info-list.do" class="form-inline">
		    <label for="hrJiaban-info_name"><spring:message code='hrJiaban-info.hrJiaban-info.list.search.name' text='名称'/>:</label>
		    <%--<input type="text" id="hrJiaban-info_name" name="filter_LIKES_name" value="${param.filter_LIKES_name}">--%>
			<%----%>
			  <div class="input-append ryPicker">
				  <input id="hrRyyj-info_fryid" type="hidden" name="filter_EQL_fryid"
						 value="${model.fryid}" class="text required"  > <input
					  id="hrShtc-info_userName" type="text" value="${ryMap[model.fryid].fname}"
					  class=" text required" disabled style="width: 175px;" value="">
							<span class="add-on"
								  style="padding-top: 2px; padding-bottom: 2px;"><i
									class="icon-user"></i></span>
			  </div>

			  <button class="btn btn-small a-search" onclick="document.hrJiaban-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="hrJiaban-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='hrJiaban-info-input.do'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="hrJiaban-info:delete">
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
		  <h4 class="title"><spring:message code="hrJiaban-info.hrJiaban-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="hrJiaban-infoGridForm" name="hrJiaban-infoGridForm" method='post' action="hrJiaban-info-remove.do" class="m-form-blank">
  <table id="hrJiaban-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="fryid">人员</th>
        	<th class="sorting" name="fdept">部门</th>
        	<th class="sorting" name="fstatus">状态</th>
        	<th class="sorting" name="fstartdate">开始时间</th>

        	<th class="sorting" name="fhours">小时数</th>
        	<th class="sorting" name="fjiabancontent">加班工作内容</th>
        	<th class="sorting" name="fresult">加班完成情况</th>
		  <th class="sorting" name="fmemo">备注</th>
        <th width="80">操作&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
       		<td>${ryMap[item.fryid].fname}</td>
      	 	 <td>${deptMap[item.fdept]}</td>>
      	 	 <td>${item.fstatus}</td>
      	 	 <td>${item.fstartdate}</td>

      	 	 <td>${item.fhours}</td>
      	 	 <td>${item.fjiabancontent}</td>
      	 	 <td>${item.fresult}</td>
		  <td>${item.fmemo}</td>
        <td>
          <a href="hrJiaban-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
