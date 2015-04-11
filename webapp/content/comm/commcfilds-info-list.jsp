<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "comm-home");%>
<%pageContext.setAttribute("currentMenu", "user-defined");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.commcfilds-info.list.title" text="列表" /></title>
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
	gridFormId: 'commcfilds-infoGridForm',
	exportUrl: 'commcfilds-info-export.do'
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
	   <%@include file="/menu/scope.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

	  <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="commcfilds-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="commcfilds-infoSearch" class="content content-inner">

		  <form name="commcfilds-infoForm" method="post" action="commcfilds-info-list.do" class="form-inline">
		    <label for="commcfilds-info_name"><spring:message code='commcfilds-info.commcfilds-info.list.search.name' text='名称'/>:</label>
		    <input type="text" id="commcfilds-info_name" name="filter_LIKES_name" value="${param.filter_LIKES_name}">
			<button class="btn btn-small a-search" onclick="document.commcfilds-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="commcfilds-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='commcfilds-info-input.do'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="commcfilds-info:delete">
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
		  <h4 class="title"><spring:message code="commcfilds-info.commcfilds-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="commcfilds-infoGridForm" name="commcfilds-infoGridForm" method='post' action="commcfilds-info-remove.do" class="m-form-blank">
  <table id="commcfilds-infoGrid" class="m-table table-hover">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="fcode">分类代码</th>
        	<th class="sorting" name="fname">字段名称</th>
        	<th class="sorting" name="ftype">字段类型</th>
        	<!-- <th class="sorting" name="fvalues">备选值</th>
        	<th class="sorting" name="fdvalue">默认值</th> -->
        	<th class="sorting" name="fisshow">是否显示</th>
        	<th class="sorting" name="fisgridshow">是否列表显示</th>
        	<th class="sorting" name="forderstr">显示顺序</th>
        	<th class="sorting" name="flength">字段长度</th>
        	<th class="sorting" name="fcname">数据库字段名称</th>
        	<th class="sorting" name="freqired">是否必填</th>
        	<th class="sorting" name="fissys">是否是系统字段</th>
        	<th class="sorting" name="fcolwidth">字段宽度</th>
        	<th class="sorting" name="fheight">高度</th>
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	 	 <td>${item.fcode}</td>
      	 	 <td>${item.fname}</td>
      	 	 <td>
      	 	 	 <c:if test="${item.ftype==1}"> 文本 </c:if>
  				 <c:if test="${item.ftype==2}"> 数字  </c:if>
  				 <c:if test="${item.ftype==3}"> 选择</c:if>
  				 <c:if test="${item.ftype==4}"> 单选  </c:if>
  				 <c:if test="${item.ftype==5}"> 日期  </c:if>
  				 <c:if test="${item.ftype==6}"> 时间  </c:if>
  				 <c:if test="${item.ftype==7}"> 编辑框  </c:if>
  				 <c:if test="${item.ftype==8}"> 文件域  </c:if>
			 </td>
      	 	 <%-- <td>${item.fvalues}</td>
      	 	 <td>${item.fdvalue}</td> --%>
      	 	 <td>
      	 	 	<c:if test="${item.fisshow==1}">是</c:if>
      	 	 	<c:if test="${item.fisshow==0}">否</c:if>
      	 	 </td>
      	 	 <td>
      	 	 	<c:if test="${item.fisgridshow==1}">是</c:if>
      	 	 	<c:if test="${item.fisgridshow==0}">否</c:if>
      	 	 </td>
      	 	 
      	 	 <td>${item.forderstr}</td>
      	 	 <td>${item.flength}</td>
      	 	 <td>${item.fcname}</td>
      	 	 <td>
      	 	 	<c:if test="${item.freqired==1}">是</c:if>
      	 	 	<c:if test="${item.freqired==0}">否</c:if>
      	 	 </td>
      	 	 <td>
      	 	 	<c:if test="${item.fissys==1}">是</c:if>
      	 	 	<c:if test="${item.fissys==0}">否</c:if>
      	 	 </td>
      	 	 <td>${item.fcolwidth}</td>
      	 	 <td>${item.fheight}</td>
        <td>
          <a href="commcfilds-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
