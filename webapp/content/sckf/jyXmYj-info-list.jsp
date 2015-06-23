<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "sckf-home");%>
<%pageContext.setAttribute("currentMenu", "jyXmYj");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.jyXmYj-info.list.title" text="列表" /></title>
    <%@include file="/common/s.jsp"%>
   
    <link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/jyxmpicker/jyxmpicker.css">


<script type="text/javascript"
	src="${scopePrefix}/s/xthena/jyxmpicker/jyxmpicker.js">
	</script>
	
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
	gridFormId: 'jyXmYj-infoGridForm',
	exportUrl: 'jyXmYj-info-export.do'
};

var table;

$(function() {
	table = new Table(config);
    table.configPagination('.m-pagination');
    table.configPageInfo('.m-page-info');
    table.configPageSize('.m-page-size');
    
    createjyxmPicker({
		modalId : 'jyxmPicker',
		url : '${scopePrefix}/sckf/jyXm-toubiao-simple-list.do',
		redUrl : '${scopePrefix}/sckf/jyXmYj-info-input.do'
	});
});


//function showXMpicker() {
//	$('#pjrydiv').modal();
//	$('#Body').html("");
//	// loadRyList();
//}

	</script>
  </head>


  <%--<div id="pjrydiv" class="modal hide fade">--%>
	  <%--<div class="modal-header">--%>
		  <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>--%>
		  <%--<h3>选择项目</h3>--%>
	  <%--</div>--%>
	  <%--<div class="modal-body">--%>
		  <%--<article class="m-blank">--%>
			  <%--<div class="pull-left">--%>
				  <%--<form name="ryForm" method="post" action="javascript:void(0);return false;"--%>
						<%--class="form-inline m-form-bottom">--%>
					  <%--<label for="ry_ryname">姓名:</label>--%>
					  <%--<input type="text" style="width:100px;" id="filter_LIKES_fname1" name="filter_LIKES_fname"--%>
							 <%--value="">--%>
					  <%--<label for="ry_rycard">工号:</label>--%>
					  <%--<input type="text" style="width:100px;" id="filter_LIKES_fcardno" name="filter_LIKES_fcardno"--%>
							 <%--value="">--%>
					  <%--&lt;%&ndash;<button id="search" class="btn btn-small" onclick="document.xzZjOrder-infoForm.submit()">查询</button>&ndash;%&gt;--%>

					  <%--<button id="search" class="btn btn-small">查询</button>--%>
				  <%--</form>--%>
			  <%--</div>--%>
			  <%--<div class="m-clear"></div>--%>
		  <%--</article>--%>
		  <%--<article class="m-widget">--%>
			  <%--<header class="header">--%>
				  <%--<h4 class="title">人员列表</h4>--%>
			  <%--</header>--%>
			  <%--<div class="content">--%>
				  <%--<form id="ryPickerForm" name="ryPickerForm" method="post" action="#" class="m-form-blank">--%>

					  <%--<table id="ryPickerGrid" class="m-table table-hover table-bordered">--%>
						  <%--<thead>--%>
						  <%--<tr>--%>
							  <%--<th width="10" class="m-table-check">&nbsp;</th>--%>
							  <%--<th>工号</th>--%>
							  <%--<th>姓名</th>--%>
							  <%--<th>性别</th>--%>
						  <%--</tr>--%>
						  <%--</thead>--%>
						  <%--<tbody id="ryPickerBody">--%>
						  <%--</tbody>--%>
					  <%--</table>--%>
				  <%--</form>--%>
			  <%--</div>--%>
		  <%--</article>--%>
	  <%--</div>--%>
	  <%--<div class="modal-footer">--%>
		  <%--<span id="ryPickerResult"></span>--%>
		  <%--<a id="ryPickerBtnClose" href="#" class="btn" data-dismiss="modal">关闭</a>--%>
		  <%--<a id="ryPickerBtnSelect" href="#" onclick="selectry()" class="btn btn-primary">选择</a>--%>
	  <%--</div>--%>
  <%--</div>--%>

  <body>
    <%@include file="/header.jsp"%>

    <div class="row-fluid">
	   <%@include file="/menu/sckf-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

	  <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="jyXmYj-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="jyXmYj-infoSearch" class="content content-inner">


			<%--<div class="input-append jyxmPicker">--%>
				<%--<input id="xmBxRecord-info_xmid" type="hidden" name="fxmid"--%>
					   <%--value="${model.fxmid}"> <input--%>
					<%--id="xmBxRecord-info_xmmc" type="text"--%>
					<%--value="${xmMap[model.fxmid].fname}" disabled--%>
					<%--class=" required" style="width: 175px;" value=""> <span--%>
					<%--class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i--%>
					<%--class="icon-th-list"></i></span>--%>
			<%--</div>--%>


				<%--<div class="controls">--%>
					<%--<div class="input-append ryPicker">--%>
						<%--<input id="ryBxRecord-info_fryid" type="hidden" name="fry" value="${model.fry}">--%>
						<%--<input id="ryBxRecord-info_userName" type="text" value="${userName}" disabled="disabled"--%>
							   <%--style="width: 175px;" value="">--%>
					<%--<span class="add-on" onclick="loadJyXm()"--%>
						  <%--style="padding-top: 2px;   padding-bottom: 2px;"><i class="icon-user"></i></span>--%>
						<%--&lt;%&ndash;<button class="btn btn-small a-search" onclick="searchitem()">查询&ndash;%&gt;--%>
						<%--&lt;%&ndash;</button>&ndash;%&gt;--%>
						<%--&lt;%&ndash;&nbsp;&ndash;%&gt;--%>
					<%--</div>--%>

		  <form name="jyXmYj-infoForm" method="post" action="jyXmYj-info-list.do" class="form-inline">

		    <label for="xmBxRecord-info_xmid"><spring:message code='jyXmYj-info.jyXmYj-info.list.search.name'
														  text='项目名称'/>:</label>
			  <div class="input-append jyxmPicker">
				  <input id="xmBxRecord-info_xmid" type="hidden" name="filter_EQL_fxmid"
						 value="${model.fxmid}"> <input
					  id="xmBxRecord-info_xmmc" type="text"
					  value="${xmMap[model.fxmid].fname}" disabled
					  class=" required" style="width: 175px;" value=""> <span
					  class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
					  class="icon-th-list"></i></span>
			  </div>

			  <%--<input type="text" id="jyXmYj-info_name" name="filter_LIKES_fname" value="${param.filter_LIKES_fname}">--%>
			<button class="btn btn-small a-search" onclick="document.jyXmYj-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		  <%--<region:region-permission permission="jyXmYj-info:create">--%>
		  	 <%--<button class="btn btn-small a-insert" onclick="loadJyXm()">新建</button>--%>
		  <%--</region:region-permission>--%>
		  <region:region-permission permission="jyXmYj-info:delete">
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
		  <h4 class="title"><spring:message code="jyXmYj-info.jyXmYj-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="jyXmYj-infoGridForm" name="jyXmYj-infoGridForm" method='post' action="jyXmYj-info-remove.do" class="m-form-blank">
  <table id="jyXmYj-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="fname">项目名称</th>
        	<th class="sorting" name="ffankui">业主单位</th>
        	<th class="sorting" name="fxmid">投资额</th>
        	<th class="sorting" name="ftbry">规模</th>
        	<th class="sorting" name="ftbry">地址</th>
        	<th class="sorting" name="fyijiaostatus">移交状态</th>
        	<th class="sorting" name="ffankui">反馈</th>
        	<th class="sorting" name="fzj">总监</th>
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
        	 <td>${xmMap[item.fxmid].fname}</td>
      	 	 <td>${xmMap[item.fxmid].fjsdw}</td>
      	 	 <td>${xmMap[item.fxmid].ftze}</td>
      	 	 <td>${xmMap[item.fxmid].fscale}</td>
      	 	 <td>${xmMap[item.fxmid].fprovince}${xmMap[item.fxmid].fcity}</td>
      	 	 <td>${item.fyijiaostatus}</td>
      	 	 <td>${item.ffankui}</td>
      	 	 <td>${ryMap[item.fzj].fname}</td>
        <td>
          <a href="jyXmYj-info-input.do?id=${item.fid}&xmid=${item.fxmid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
