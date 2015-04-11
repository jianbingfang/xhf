<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "dzb-home");%>
<%pageContext.setAttribute("currentMenu", "dzb-dy");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.dy-info.list.title" text="列表" /></title>
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
    	'ftype':'${param.ftype}',
        'filter_LIKES_name': '${param.filter_LIKES_name}'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'dy-infoGridForm',
	exportUrl: 'dy-info-export.do?ftype=${param.ftype}'
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
	   <%@include file="/menu/dzb-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

	  <%-- <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="dy-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="dy-infoSearch" class="content content-inner">

		  <form name="dy-infoForm" method="post" action="dy-info-list.do" class="form-inline">
		    <label for="dy-info_name"><spring:message code='dy-info.dy-info.list.search.name' text='名称'/>:</label>
		    <input type="text" id="dy-info_name" name="filter_LIKES_name" value="${param.filter_LIKES_name}">
			<button class="btn btn-small a-search" onclick="document.dy-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article> --%>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="dy-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='dy-info-input.do?ftype=${param.ftype}'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="dy-info:delete">
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
		  <h4 class="title"><spring:message code="dy-info.dy-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="dy-infoGridForm" name="dy-infoGridForm" method='post' action="dy-info-remove.do?ftype=${param.ftype}" class="m-form-blank">
  <table id="dy-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="fno">编号</th>
        	<th class="sorting" name="fname">姓名</th>
        	<th class="sorting" name="fsex">性别</th>
<!--         	<th class="sorting" name="fprovince">省</th>
        	<th class="sorting" name="fcity">城市</th>
        	<th class="sorting" name="fminzu">民族</th>
        	<th class="sorting" name="fbirthday">出生日期</th>
        	<th class="sorting" name="fcjgzdate">参加工作时间</th> -->
        	<!-- <th class="sorting" name="frddate">入党时间</th> -->
<!--         	<th class="sorting" name="fsfzh">身份证号</th>
        	<th class="sorting" name="fwhcd">文化程度</th>
        	<th class="sorting" name="faddress">家庭住址</th> -->
        	<th class="sorting" name="flxdh">联系电话</th>
   	<th class="sorting" name="fgzdw">工作单位及职务</th>
        	<th class="sorting" name="fszdzb">所在党支部</th>
        	<th class="sorting" name="fqdwjjfzdate">确定为积极分子时间</th> 
   <!--      	<th class="sorting" name="fmemo">备注</th>
        	<th class="sorting" name="fmemo1">备注</th>
        	<th class="sorting" name="fmemo2">备注</th>
        	<th class="sorting" name="fmemo3">备注</th>
        	<th class="sorting" name="ftype">党员类型</th> -->
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	 	 <td>${item.fno}</td>
      	 	 <td>${item.fname}</td>
      	 	 <td>${item.fsex}</td>
      	<%--  	 <td>${item.fprovince}</td>
      	 	 <td>${item.fcity}</td>
      	 	 <td>${item.fminzu}</td>
      	 	 <td>${item.fbirthday}</td>
      	 	 <td>${item.fcjgzdate}</td> --%>
      	 	 <%-- <td>${item.frddate}</td> --%>
      	 	<%--  <td>${item.fsfzh}</td>
      	 	 <td>${item.fwhcd}</td>
      	 	 <td>${item.faddress}</td> --%>
      	 	 <td>${item.flxdh}</td>
      	 	 <td>${item.fgzdw}</td>
      	 	 <td>${item.fszdzb}</td>
      	 	 <td>${item.fqdwjjfzdate}</td>
<%--       	 	 <td>${item.fmemo}</td>
      	 	 <td>${item.fmemo1}</td>
      	 	 <td>${item.fmemo2}</td>
      	 	 <td>${item.fmemo3}</td> --%>
      	 	<%--  <td>${item.ftype}</td> --%>
        <td>
          <a href="dy-info-input.do?ftype=${param.ftype}&id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
