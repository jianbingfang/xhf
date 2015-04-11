<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "xz-home");%>
<%pageContext.setAttribute("currentMenu", "xz-da");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.hetong-info.list.title" text="列表" /></title>
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
	gridFormId: 'hetong-infoGridForm',
	exportUrl: 'hetong-info-export.do'
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

	  <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="hetong-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="hetong-infoSearch" class="content content-inner">

		  <form name="hetong-infoForm" method="post" action="hetong-info-list.do" class="form-inline">
		    <label for="hetong-info_name"><spring:message code='hetong-info.hetong-info.list.search.name' text='名称'/>:</label>
		    <input type="text" id="hetong-info_name" name="filter_LIKES_name" value="${param.filter_LIKES_name}">
		    <label for="hetong-info_name"><spring:message code='hetong-info.hetong-info.list.search.name' text='名称'/>:</label>
		    <input type="text" id="hetong-info_name" name="filter_LIKES_name" value="${param.filter_LIKES_name}">
		    <label for="hetong-info_name"><spring:message code='hetong-info.hetong-info.list.search.name' text='名称'/>:</label>
		    <input type="text" id="hetong-info_name" name="filter_LIKES_name" value="${param.filter_LIKES_name}">
			<button class="btn btn-small a-search" onclick="document.hetong-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="hetong-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='hetong-info-input.do'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="hetong-info:delete">
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
		  <h4 class="title"><spring:message code="hetong-info.hetong-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="hetong-infoGridForm" name="hetong-infoGridForm" method='post' action="hetong-info-remove.do" class="m-form-blank">
  <table id="hetong-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="fcode">编号</th>
        	<th class="sorting" name="fname">名称</th>
        	<th class="sorting" name="faddress">地址</th>
        	<th class="sorting" name="fgcgm">合同规模</th>
        	<th class="sorting" name="fry">总监</th>
        	<th class="sorting" name="fhtdate">合同签订日期</th>
        	<th class="sorting" name="fstartdate">合同开始日期</th>
        	<th class="sorting" name="fenddate">合同截止日期</th>
        	<th class="sorting" name="fweituoren">委托人</th>
        	<th class="sorting" name="fzaojia">工程造价</th>
        	<th class="sorting" name="fjianliqufei">监理取费</th>
        	<th class="sorting" name="fjianlifei">监理费</th>
        	<th class="sorting" name="fpaytype">付款方式</th>
        	<th class="sorting" name="fflow">合同状态</th>
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	 	 <td>${item.fcode}</td>
      	 	 <td>${item.fname}</td>
      	 	 <td>${item.faddress}</td>
      	 	 <td>${item.fgcgm}</td>
      	 	 <td>${item.fry}</td>
      	 	 <td>${item.fhtdate}</td>
      	 	 <td>${item.fstartdate}</td>
      	 	 <td>${item.fenddate}</td>
      	 	 <td>${item.fweituoren}</td>
      	 	 <td>${item.fzaojia}</td>
      	 	 <td>${item.fjianliqufei}</td>
      	 	 <td>${item.fjianlifei}</td>
      	 	 <td>${item.fpaytype}</td>
      	 	 <td>${item.fflow}</td>
        <td>
          <a href="hetong-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
