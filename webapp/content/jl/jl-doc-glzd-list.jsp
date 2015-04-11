<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jl-zd");%>
<!doctype html>
<html lang="en">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.jl-plain-info.list.title" text="列表"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
var config = {
    id: 'jl-doc-glzd-infoGrid',
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
	gridFormId: 'jl-doc-glzd-infoGridForm',
	exportUrl: 'jl-doc-glzd-export.do'
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
	  <%@include file="/menu/jl-workspace.jsp"%>
	  <!-- start of main -->
      <section id="m-main" class="span10">
         	<!-- <div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="jl-home.do">监理部</a> <span class="divider">/</span>
							</li>
							<li>公司规定<span class="divider">/</span>
							</li>
							<li class="active">管理制度</li>
						</ul>
					</div>
				</div>
			</div> -->
	      <c:forEach items="${page.result}" var="item">
	     	 <p><a  href="jl-doc-glzd-input.do?id=${item.fid}" style="font-size: 16px;" >《${item.ftitle}》</a></p>
	      </c:forEach>
      </section>
	  <!-- end of main -->
	</div>

  </body>

</html>
