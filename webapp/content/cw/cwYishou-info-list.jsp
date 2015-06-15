<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "cw-home");%>
<%pageContext.setAttribute("currentMenu", "cw-zk");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.cwYiShou-info.list.title" text="列表" /></title>
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
		'filter_GTD_fdzdate' : '${param.filter_GTD_fdzdate}',
		'filter_LTD_fdzdate' : '${param.filter_LTD_fdzdate}',
    	'filter_LIKES_fprojectname' : '${param.filter_LIKES_fprojectname}',
    	'filter_LIKES_fmemo4' : '${param.filter_LIKES_fmemo4}',
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'cwYiShou-infoGridForm',
	exportUrl: 'cwYiShou-info-export.do'
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
	   <%@include file="/menu/cw-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

	  <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="cwYiShou-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="cwYiShou-infoSearch" class="content content-inner">

		  <form name="cwYiShou-infoForm" method="post" action="cwYiShou-info-list.do" class="form-inline">
		   <label for="cwYingShou-info_fprojectname"><spring:message
								code='cwYingShou-info.cwYingShou-info.list.search.fprojectname'
								text='合同名称' />:</label> <input type="text" id="cwYingShou-info_fprojectname"
							name="filter_LIKES_fprojectname" value="${param.filter_LIKES_fprojectname}">&nbsp;&nbsp;
							<label for="cwYingShou-info_fmemo4"><spring:message
								code='cwYingShou-info.cwYingShou-info.list.search.fmemo4'
								text='属性' />:</label> <input type="text" id="cwYingShou-info_fmemo4"
							name="filter_LIKES_fmemo4" value="${param.filter_LIKES_fmemo4}">&nbsp;&nbsp;
								<label for="cwYingShou-info_fdzdate"><spring:message
								code='cwYingShou-info.cwYingShou-info.list.search.fdzdate' text='时间' />:</label>
						<div class="input-append datepicker date"
							style="padding-left: 0px;">
							<input id="cwYingShou-info_fdzdate" type="text"
								name="filter_GTD_fdzdate" value="${param.filter_GTD_fdzdate}"
								size="40" class="text "
								style="background-color:white;cursor:default; width: 100px;">
							<span class="add-on"
								style="padding-top: 2px; padding-bottom: 2px;"><i
								class="icon-calendar"></i></span>
						</div>
						至
						<div class="input-append datepicker date"
							style="padding-left: 0px;">
							<input id="cwYingShou-info_fdzdate" type="text"
								name="filter_LTD_fdzdate" value="${param.filter_LTD_fdzdate}"
								size="40" class="text "
								style="background-color:white;cursor:default; width: 100px;">
							<span class="add-on"
								style="padding-top: 2px; padding-bottom: 2px;"><i
								class="icon-calendar"></i></span>
						</div>&nbsp;&nbsp;
			<button class="btn btn-small a-search" onclick="document.cwYiShou-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="cwYiShou-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='cwYiShou-info-input.do'">新建</button>
		  </region:region-permission>
	 	  <region:region-permission permission="cwYiShou-info:delete">
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
		  <h4 class="title"><spring:message code="cwYiShou-info.cwYiShou-info.list.title" text="已收账款明细"/></h4>
		</header>
        <div class="content">
<form id="cwYiShou-infoGridForm" name="cwYiShou-infoGridForm" method='post' action="cwYiShou-info-remove.do" class="m-form-blank">
  <table id="cwYiShou-infoGrid" class="m-table  table-hover table-responsive table-bordered table-striped ">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="fxmid">合同</th>
<!--         	<th class="sorting" name="finviocecode">发票号</th>
        	<th class="sorting" name="freceiptcode">收据号</th>
        	<th class="sorting" name="finvoicedate">开票时间</th> -->
        	<th class="sorting" name="fdzdate">到账时间</th>
        <!-- 	<th class="sorting" name="fdebit">借方金额</th> -->
        	<th class="sorting" name="fcreditor">贷方金额</th>
        	<th class="sorting" name="foprator">经办人</th>
       <!--  	<th class="sorting" name="fqmmoney">期末借贷余额</th> -->
       <!--  	<th class="sorting" name="fhjjdfx">合计借贷方向</th>
        	<th class="sorting" name="fhjje">合计金额</th> -->
        	<!-- <th class="sorting" name="fmemo">备注</th> -->
      <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	 	  <td class="span3">${htMap[item.fxmid].fhtname}</td>
<%--       	 	 <td>${item.finviocecode}</td>
      	 	 <td>${item.freceiptcode}</td>
      	 	 <td>${item.finvoicedate}</td> --%>
      	 	 <td>${item.fdzdate}</td>
      	 <%-- 	 <td>${item.fdebit}</td> --%>
      	 	 <td><fmt:formatNumber type="number" value="${item.fmemo1}" maxFractionDigits="2" /></td>
      	 	 <td>${ryMap[item.foprator].fname}</td>
      	 	<%--  <td>${item.fqmmoney}</td> --%>
      	 	 <%-- <td>${item.fhjjdfx}</td>
      	 	 <td>${item.fhjje}</td> --%>
      	 	<%--  <td>${item.fmemo}</td> --%>

       <td>
          <a href="cwYiShou-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
