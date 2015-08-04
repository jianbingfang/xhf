<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "xz-home");
%>
<%
	pageContext.setAttribute("currentMenu", "xz-wz");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="dev.wzList-info.list.title"
		text="列表" /></title>
<%@include file="/common/s.jsp"%>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/xmpicker/xmpicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/xmpicker/xmpicker.js"></script>
<script type="text/javascript">
	var gdconfig = {
		id : 'wzList-infoGrid',
		pageNo : ${page.pageNo},
		pageSize : ${page.pageSize},
		totalCount : ${page.totalCount},
		resultSize : ${page.resultSize},
		pageCount : ${page.pageCount},
		orderBy : '${page.orderBy == null ? "" : page.orderBy}',
		asc : ${page.asc},
		params : {
			'filter_LIKES_fname' : '${param.filter_LIKES_fname}'
		},
		selectedItemClass : 'selectedItem',
		gridFormId : 'wzList-infoGridForm',
		exportUrl : 'wzList-info-export.do'
	};
	createxmPicker({
		modalId : 'xmPicker',
		url : '${scopePrefix}/gcgl/pjXm-simple-list.do'
	});
	createryPicker({
		modalId : 'ryPicker',
		url : '${scopePrefix}/hr/commRy-simple-list.do'
	});
	var gdtable;

	$(function() {
		gdtable = new Table(gdconfig);
		gdtable.configPagination('.m-pagination');
		gdtable.configPageInfo('.m-page-info');
		gdtable.configPageSize('.m-page-size');
	});
</script>
</head>
<body>
	<%@include file="/header.jsp"%>
	<div class="row-fluid">
		<%@include file="/menu/xz-workspace.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span10">
			<div class="span12">
				<div class="tabbable" id="tabs-573266">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#panel-564685" data-toggle="tab">固定资产</a>
						</li>
						<li><a href="#panel-294002" data-toggle="tab">低值易耗品</a></li>
						<li><a href="#panel-294003" data-toggle="tab">消耗品</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="panel-564685">
							<p>
								<iframe src="wzList-gz-info-list.do" height="800" width="100%"
									style="border: 0px;"></iframe>
							</p>
						</div>
						<div class="tab-pane" id="panel-294002">
							<p>
								<iframe src="wzList-dh-info-list.do?ftype=2" height="800" width="100%"
                                        style="border: 0px;"></iframe>
							</p>
						</div>
						<div class="tab-pane" id="panel-294003">
                            <p>
								<iframe src="wzList-dh-info-list.do?ftype=3" height="800" width="100%"
                                        style="border: 0px;"></iframe>
                            </p>
						</div>
					</div>
				</div>
			</div>
			<div class="m-spacer"></div>
		</section>
		<!-- end of main -->
	</div>
</body>
</html>
