<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "hr-home");%>
<%pageContext.setAttribute("currentMenu", "hrPx");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.hrKs-info.list.title" text="列表"/></title>
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
        'filter_LIKES_name': '${param.filter_LIKES_name}',
            'filter_GTD_fksdate': '${param.filter_GTD_fksdate}',
            'filter_LTD_fksdate': '${param.filter_LTD_fksdate}'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'hrKs-infoGridForm',
	exportUrl: 'hrKs-info-export.do'
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
<!-- <div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<ul class="breadcrumb">
				<li>
					<a href="hr-home.do">人力资源</a> <span class="divider">/</span>
				</li>
				<li>
					员工培训<span class="divider">/</span>
				</li>
				<li class="active">
					报名考试
				</li>
			</ul>
		</div>
	</div>
</div> -->
	  <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="hrKs-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="hrKs-infoSearch" class="content content-inner">

		  <form name="hrKs-infoForm" method="post" action="hrKs-info-list.do" class="form-inline">
		    <label for="hrKs-info_name"><spring:message code='hrKs-info.hrKs-info.list.search.name' text='名称'/>:</label>
		    <input type="text" id="hrKs-info_name" name="filter_LIKES_name" value="${param.filter_LIKES_name}">
		     <label for="hrPx-info_name"><spring:message code='hrPx-info.hrPx-info.list.search.name' text='考试时间'/>: 从</label>
		      <div class="input-append datepicker date" style="padding-left: 0px;">
		    <input id="commRy-info_ruzhi" type="text" name="filter_GTD_fksdate" value="${param.filter_GTD_fksdate}" size="40" class="text "  style="background-color:white;cursor:default; width: 160px;">
		    <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
		  </div> 至
		   <div class="input-append datepicker date" style="padding-left: 0px;">
		    <input id="commRy-info_ruzhi" type="text" name="filter_LTD_fksdate" value="${param.filter_LTD_fksdate}" size="40" class="text "  style="background-color:white;cursor:default; width: 160px;">
		    <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
		  </div>
			<button class="btn btn-small a-search" onclick="document.hrKs-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="hrKs-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='hrKs-info-input.do'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="hrKs-info:delete">
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
		  <h4 class="title"><spring:message code="hrKs-info.hrKs-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="hrKs-infoGridForm" name="hrKs-infoGridForm" method='post' action="hrKs-info-remove.do" class="m-form-blank">
  <table id="hrKs-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="fkstype">考试类别</th>
        	<th class="sorting" name="fbmdate">报名时间</th>
        	<th class="sorting" name="fjfdate">缴费时间</th>
        	<th class="sorting" name="fjfmoney">缴费金额</th>
        	<th class="sorting" name="fzkzdate">准考证领取时间</th>
        	<th class="sorting" name="fksdate">考试时间</th>
        	<th class="sorting" name="fzl">考试相关资料</th>
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	  <td>${item.fkstype}</td>
      	  <td>${item.fbmdate}</td>
      	  <td>${item.fjfdate}</td>
      	  <td>${item.fjfmoney}</td>
      	  <td>${item.fzkzdate}</td>
      	  <td>${item.fksdate}</td>
      	  <td>${item.fzl}</td>
        <td>
          <a href="hrKs-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>&nbsp;
           <a href="hrKsRy-info-list.do?ksid=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/>
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
