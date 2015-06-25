<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jl-wz");%>
<%pageContext.setAttribute("wzKind", request.getParameter("wzKind"));%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.jl-pjWz-info.list.title" text="列表" /></title>
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
        'filter_LIKES_fwzname': '${param.filter_LIKES_name}'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'jl-pjWz-infoGridForm',
	exportUrl: 'jl-pjWz-info-export.do'
};

var table;

$(function() {
	table = new Table(config);
    table.configPagination('.m-pagination');
    table.configPageInfo('.m-page-info');
    table.configPageSize('.m-page-size');
});

function  backAsk() {
	var len = $('.selectedItem:checked').length;
	if (len == 0) {
		$.showMessage("请至少选择一个需要归还的物资！", {
			 position: 'top',
			 size: '36',
			 fontSize: '20px'
		});
		return false;
	}
	
	var checkeds=$('.selectedItem:checked');
	var checkStr="";
	for(var i=0;i<len;i++){
		checkStr+=$(checkeds[i]).val()+",";
	}
	
	if (confirm("确定要归还?")) {
		location.href='jl-pjWz-info-bakask.do?selectedItem='+checkStr;
		return true;
	} else {
		return false;
	}
}
    </script>
  </head>

  <body>
    <%@include file="/header.jsp"%>

    <div class="row-fluid">
	   <%@include file="/menu/jl-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

	  <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="jl-pjWz-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="jl-pjWz-infoSearch" class="content content-inner">

		  <form name="jl-pjWz-infoForm" method="post" action="jl-pjWz-info-list.do" class="form-inline">
		    <label for="jl-pjWz-info_name"><spring:message code='jl-pjWz-info.jl-pjWz-info.list.search.name' text='名称'/>:</label>
		    <input type="text" id="jl-pjWz-info_name" name="filter_LIKES_fwzname" value="${param.filter_LIKES_name}">
			<button class="btn btn-small a-search" onclick="document.jl-pjWz-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		 <region:region-permission permission="jl-pjWz-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='jl-pjWz-info-input.do?wzKind=${wzKind}'">申请</button>
		  </region:region-permission>
		  <c:if test="${wzKind==1}"> 
			  <region:region-permission permission="jl-pjWz-info:create">
			  <button class="btn btn-small a-insert" onclick="backAsk()">归还</button>
			  </region:region-permission>
		  </c:if>
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
		  <h4 class="title"><spring:message code="jl-pjWz-info.jl-pjWz-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="jl-pjWz-infoGridForm" name="jl-pjWz-infoGridForm" method='post' action="jl-pjWz-info-remove.do" class="m-form-blank">
  <table id="jl-pjWz-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="fwzname">物资名称</th>
        	<th class="sorting" name="fnum">数量</th>
        	<th class="sorting" name="fwzcode">编号</th>
        	<th class="sorting" name="fstatus">状态</th>
        	<!-- <th class="sorting" name="fwztype">物品类型</th> -->
        	<!--<th class="sorting" name="fisassets">是否为固定资产</th>-->
        	<th class="sorting" name="fstartdate">领用时间</th>
        	<th class="sorting" name="flyry">领用人 </th>
        	<th class="sorting" name="fenddate">归还时间</th>
        	<th class="sorting" name="fghry">归还人 </th>
       <!--  <th width="80">&nbsp;</th> -->
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	 	 <td>${wzMap[item.fwzid].fname}</td>
      	 	 <td>${item.fnum}</td>
      	 	 <td>${wzMap[item.fwzid].fcode}</td>
      	 	 <td>
      	 	   <c:if test="${item.fstatus == 1}">
			  		待审核
		 		</c:if>
		 		  <c:if test="${item.fstatus == 2}">
			  		审核通过
		 		</c:if>
		 		  <c:if test="${item.fstatus ==3}">
			  		审核不通过
		 		</c:if>
		 		  <c:if test="${item.fstatus == 4}">
			  		归还中
		 		</c:if>
		 		  <c:if test="${item.fstatus == 5}">
			  		已归还
		 		</c:if>
		  </td>
      	 		<%--<td>${wzMap[item.fwzid].fcode}</td> --%>
      	 		<%--<td>${item.fisassets}</td> --%>
      	 	  <td>${item.fstartdate}</td>
      	 	 <td>${ryMap[item.flyry].fname}</td>
	   	 	<td>${item.fenddate}</td>
      	 	 <td>${ryMap[item.fghry].fname}</td>
        <td>
         <%--  <a href="jl-pjWz-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a> --%>
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
