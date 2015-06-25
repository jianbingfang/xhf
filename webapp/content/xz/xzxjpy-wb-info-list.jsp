<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "xz-home");%>
<%pageContext.setAttribute("currentMenu", "xz-py");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.xzxjpy-info.list.title" text="列表" /></title>
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
        'filter_LIKES_fwjno': '${param.filter_LIKES_fwjno}',
        'filter_LIKES_ftitle': '${param.filter_LIKES_ftitle}',
        'filter_LIKES_fzj': '${param.filter_LIKES_fzj}',
        'filter_LIKES_fjlgcs': '${param.filter_LIKES_fjlgcs}',
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'xzxjpy-wb-infoGridForm',
	exportUrl: 'xzxjpy-info-export.do'
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
		    <a class="btn"><i id="xzxjpy-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="xzxjpy-infoSearch" class="content content-inner">

		  <form name="xzxjpy-wb-infoForm" method="post" action="xzxjpy-wb-info-list.do" class="form-inline">
		     <label for="xzxjpy-info_fwjno"><spring:message code='xzxjpy-info.xzxjpy-info.list.search.fwjno' text='文件号'/>:</label>
		    <input type="text" id="xzxjpy-info_fwjno" name="filter_LIKES_fwjno" value="${param.filter_LIKES_fwjno}" style="width: 100px;">
		    <label for="xzxjpy-info_ftitle"><spring:message code='xzxjpy-info.xzxjpy-info.list.search.ftitle' text='标题'/>:</label>
		    <input type="text" id="xzxjpy-info_ftitle" name="filter_LIKES_ftitle" value="${param.filter_LIKES_ftitle}" style="width: 100px;">
		    <label for="xzxjpy-info_fzj"><spring:message code='xzxjpy-info.xzxjpy-info.list.search.fzj' text='总监'/>:</label>
		    <input type="text" id="xzxjpy-info_fzj" name="filter_LIKES_fzj" value="${param.filter_LIKES_fzj}" style="width: 100px;">
		    <label for="xzxjpy-info_fjlgcs"><spring:message code='xzxjpy-info.xzxjpy-info.list.search.fjlgcs' text='优秀监理工程师'/>:</label>
		    <input type="text" id="xzxjpy-info_fjlgcs" name="filter_LIKES_fjlgcs" value="${param.filter_LIKES_fjlgcs}" style="width: 100px;">
			<button class="btn btn-small a-search" onclick="document.xzxjpy-wb-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="xzxjpy-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='xzxjpy-wb-info-input.do'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="xzxjpy-info:delete">
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
		  <h4 class="title"><spring:message code="xzxjpy-info.xzxjpy-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="xzxjpy-wb-infoGridForm" name="xzxjpy-wb-infoGridForm" method='post' action="xzxjpy-wb-info-remove.do"
	  class="m-form-blank">
  <table id="xzxjpy-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="fwjno">文件号</th>
        	<th class="sorting" id="ftitle">标题</th>
        	<th class="sorting" id="fzj">优秀总监</th>
        	<th class="sorting" id="fjlgcs">优秀监理工程师</th>
<!--         	<th class="sorting" id="fdate">评先时间</th>
        	<th class="sorting" id="ffwdw">发文单位</th>
        	<th class="sorting" id="fjiangjin">奖金</th>
        	<th class="sorting" id="fljry">领奖人员</th>
        	<th class="sorting" id="fjnfy">交纳费用</th>
        	<th class="sorting" id="fmemo">备注</th> -->
        	<th class="sorting" id="ffzwz">放置位置</th>
     		<th class="sorting" name="fzkstate">在库状态</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	 	 <td>${item.fwjno}</td>
      	 	 <td><a href="xzxjpy-wb-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="${item.ftitle}"/></a></td>
      	 	 <td>${item.fzj}</td>
      	 	 <td>${item.fjlgcs}</td>
      	 	 <td>${item.ffzwz}</td>
      	 	 	 <td><c:if test="${item.fzkstate=='在库'}"> <font color="green">在库</font>  </c:if>
			<c:if test="${item.fzkstate=='未在库'}"> <font color="red">未在库</font>  </c:if></td>
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
