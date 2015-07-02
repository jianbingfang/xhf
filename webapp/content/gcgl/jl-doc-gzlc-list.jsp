<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-jlb");%>
<!doctype html>
<html lang="en">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.jl-plain-info.list.title" text="列表"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
var config = {
    id: 'jl-doc-gzlc-infoGrid',
    pageNo: ${page.pageNo},
    pageSize: ${page.pageSize},
    totalCount: ${page.totalCount},
    resultSize: ${page.resultSize},
    pageCount: ${page.pageCount},
    orderBy: '${page.orderBy == null ? "" : page.orderBy}',
    asc: ${page.asc},
    params: {
       // 'filter_LIKES_name': '${param.filter_LIKES_name}',
        //'filter_EQS_fmodulecode': 'hr'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'jl-doc-gzlc-infoGridForm',
	exportUrl: 'jl-doc-gzlc-export.do'
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
	 <%@include file="/menu/gcgl-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">
      <!-- 	<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="jl-home.do">监理部</a> <span class="divider">/</span>
							</li>
							<li>管理流程<span class="divider">/</span>
							</li>
							<li class="active">工作流程</li>
						</ul>
					</div>
				</div>
			</div> -->
<%-- 
	  <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="jl-plain-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="jl-plain-infoSearch" class="content content-inner">

		  <form name="jl-plain-infoForm" method="post" action="jl-doc-gzlc-list.do" class="form-inline">
		    <label for="jl-plain-info_name"><spring:message code='jl-plain-info.jl-plain-info.list.search.name' text='名称'/>:</label>
		    <input type="text" id="jl-plain-info_name" name="filter_LIKES_name" value="${param.filter_LIKES_name}">
			<button class="btn btn-small a-search" onclick="document.jl-plain-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>
 --%>
	  <article class="m-blank">
	    <div class="pull-left">
		   <region:region-permission permission="jl-plain-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='jl-doc-gzlc-input.do'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="jl-plain-info:delete">
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
		  <h4 class="title"><spring:message code="jl-plain-info.jl-plain-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="jl-doc-gzlc-infoGridForm" name="jl-doc-gzlc-infoGridForm" method='post' action="jl-doc-gzlc-remove.do" class="m-form-blank">
  <table id="jl-doc-gzlc-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
       <%--  <th class="sorting" name="fcode"><spring:message code="jl-plain-info.jl-plain-info.list.name" text="序号"/></th> --%>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        <th class="sorting" name="ftitle">制度名称</th>
       <!--  <th class="sorting" name="fstatus">状态</th>
        <th class="sorting" name="fstartdate">开始时间</th>
        <th class="sorting" name="fenddate">废止时间</th> -->
        <th class="" name="name">操作</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
       
         <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
        <%-- <td>${items.index}</td> --%>
         <td><a style="color:#005580;" href="../comm/comm-doc-input.do?id=${item.fid}" target="_blank" >${item.ftitle}</a></td>
         <%--  <td><c:if test="${item.fstatus==1}"><font color="#0066CC">试行</font></c:if>
	        <c:if test="${item.fstatus==2}"><font color="red">实行</font></c:if>
	        <c:if test="${item.fstatus==3}"><font color="#FF3333">废除</font></c:if>
        </td>
      <td>${item.fstartdate}</td>
        <td>${item.fenddate}</td> --%>
        <td>
      <a href="jl-doc-gzlc-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a> 
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
