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
        'filter_LIKES_ftitle': '${param.filter_LIKES_ftitle}'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'xzxjpy-infoGridForm',
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

		  <form name="xzxjpy-infoForm" method="post" action="xzxjpy-info-list.do" class="form-inline">
		    <label for="xzxjpy-info_ftitle"><spring:message code='xzxjpy-info.xzxjpy-info.list.search.ftitle'
															text='标题'/>:</label>
		    <input type="text" id="xzxjpy-info_ftitle" name="filter_LIKES_ftitle" value="${param.filter_LIKES_ftitle}">
			<button class="btn btn-small a-search" onclick="document.xzxjpy-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="xzxjpy-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='xzxjpy-info-input.do'">新建</button>
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
<form id="xzxjpy-infoGridForm" name="xzxjpy-infoGridForm" method='post' action="xzxjpy-info-remove.do" class="m-form-blank">
  <table id="xzxjpy-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" id="fwjno">文件号</th>
        	<th class="sorting" id="ftitle">标题</th>
        	<th class="sorting" id="fzj">优秀总监</th>
        	<th class="sorting" id="fjlgcs">优秀监理工程师</th>
<!--         	<th class="sorting" name="fdate">评先时间</th>
        	<th class="sorting" name="ffwdw">发文单位</th>
        	<th class="sorting" name="fjiangjin">奖金</th>
        	<th class="sorting" name="fljry">领奖人员</th>
        	<th class="sorting" name="fjnfy">交纳费用</th>
        	<th class="sorting" name="fmemo">备注</th> -->
        	<th class="sorting" id="ffzwz">放置位置</th>
        	<th class="sorting" id="fzkstate">在库状态</th>
		  <th class="sorting" id="">操作</th>
<!--         	<th class="sorting" name="ftype">类型（内部，外部）</th> -->
    <!--     <th width="80">&nbsp;</th> -->
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	 	 <td>${item.fwjno}</td>
      	 	 <td><a href="xzxjpy-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="${item.ftitle}"/></a></td>
      	 	 <td>${item.fzj}</td>
      	 	 <td>${item.fjlgcs}</td>
     <%-- <td>${item.fdate}</td>
      	 	 <td>${item.ffwdw}</td>
      	 	 <td>${item.fjiangjin}</td>
      	 	 <td>${item.fljry}</td>
      	 	 <td>${item.fjnfy}</td>
      	 	 <td>${item.fmemo}</td> --%>
      	 	 <td>${item.ffzwz}</td>
      	 	 	 <td><c:if test="${item.fzkstate=='在库'}"> <font color="green">在库</font>  </c:if>
			<c:if test="${item.fzkstate=='未在库'}"> <font color="red">未在库</font>  </c:if></td>
			
    <%--  <td>${item.ftype}</td> --%>
        <td>
          <a href="xzxjpy-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
