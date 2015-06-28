<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "hr-home");%>
<%pageContext.setAttribute("currentMenu", "hrGwbm");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.hrypRecord-info.list.title" text="列表" /></title>
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
	gridFormId: 'hrypRecord-infoGridForm',
	exportUrl: 'hrypRecord-info-export.do'
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

	  <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="hrypRecord-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="hrypRecord-infoSearch" class="content content-inner">

		  <form name="hrypRecord-infoForm" method="post" action="hrypRecord-info-list.do" class="form-inline">
		    <label for="hrypRecord-info_name"><spring:message code='hrypRecord-info.hrypRecord-info.list.search.name'
															  text='姓名'/>:</label>
		    <input type="text" id="hrypRecord-info_name" name="filter_LIKES_fname" value="${param.filter_LIKES_fname}">
			<button class="btn btn-small a-search" onclick="document.hrypRecord-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="hrypRecord-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='hrypRecord-info-input.do'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="hrypRecord-info:delete">
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
		  <h4 class="title"><spring:message code="hrypRecord-info.hrypRecord-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="hrypRecord-infoGridForm" name="hrypRecord-infoGridForm" method='post' action="hrypRecord-info-remove.do" class="m-form-blank">
  <table id="hrypRecord-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<!-- <th class="sorting" name="fidno">身份证号</th> -->
        	<th class="sorting" name="fname">姓名</th>
        	<th class="sorting" name="fsex">性别</th>
        	<th class="sorting" name="fbirdate">出生日期</th>
        	<th class="sorting" name="fminzu">民族</th>
        	<!-- <th class="sorting" name="faddr">家庭住址</th>
        	<th class="sorting" name="femail">邮箱</th> -->
        	<th class="sorting" name="fbydate">毕业时间</th>
        	<th class="sorting" name="fbyxuexiao">毕业学校</th>
        	<th class="sorting" name="fbyzhuanye">毕业专业</th>
        	<th class="sorting" name="fxueli">学历</th>
        	<th class="sorting" name="fxueli2">第二学历</th>
        	<th class="sorting" name="fgw">岗位</th>
        	<th class="sorting" name="fdate">应聘时间</th>
        	<!-- <th class="sorting" name="finfo">简介</th>
        	<th class="sorting" name="fworkaddr">期望工作地点</th>
        	<th class="sorting" name="fgzqiw">期望薪资</th>
        	<th class="sorting" name="ftel">联系方式</th>
        	<th class="sorting" name="fcontact">联系人</th>
        	<th class="sorting" name="fcontactr">关系</th>
        	<th class="sorting" name="fcontacttel">联系人联系方式</th>
        	<th class="sorting" name="fmemo">备注</th> -->
        <th width="80">操作&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	 	<%--  <td>${item.fidno}</td> --%>
      	 	 <td>${item.fname}</td>
      	 	 <td>${item.fsex}</td>
      	 	 <td>${item.fbirdate}</td>
      	 	 <td>${item.fminzu}</td>
      	 	 <%-- <td>${item.faddr}</td>
      	 	 <td>${item.femail}</td> --%>
      	 	 <td>${item.fbydate}</td>
      	 	 <td>${item.fbyxuexiao}</td>
      	 	 <td>${item.fbyzhuanye}</td>
      	 	 <td>${item.fxueli}</td>
      	 	 <td>${item.fxueli2}</td>
      	 	 <td>${item.fgw}</td>
      	 	 <td>${item.fdate}</td>
      	 	 <%-- <td>${item.finfo}</td>
      	 	 <td>${item.fworkaddr}</td>
      	 	 <td>${item.fgzqiw}</td>
      	 	 <td>${item.ftel}</td>
      	 	 <td>${item.fcontact}</td>
      	 	 <td>${item.fcontactr}</td>
      	 	 <td>${item.fcontacttel}</td>
      	 	 <td>${item.fmemo}</td> --%>
        <td>
          <a href="hrypRecord-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
