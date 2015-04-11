<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "jl-home");
%>
<%
	pageContext.setAttribute("currentMenu", "jl-ny");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="dev.jlRysq-info.list.title"
		text="列表" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript">
	var config = {
		id : '${lowerName}-infoGrid',
		pageNo : ${page.pageNo},
		pageSize : ${page.pageSize},
		totalCount : ${page.totalCount},
		resultSize : ${page.resultSize},
		pageCount : ${page.pageCount},
		orderBy : '${page.orderBy == null ? "" : page.orderBy}',
		asc : ${page.asc},
		params : {
			'filter_LIKES_name' : '${param.filter_LIKES_name}'
		},
		selectedItemClass : 'selectedItem',
		gridFormId : 'jlRysq-infoGridForm',
		exportUrl : 'jlRysq-info-export.do'
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
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="jlRysq-info.jlRysq-info.list.title"
							text="内业资料台账" />
					</h4>
				</header>
				<div class="content">
					<form id="jlRysq-infoGridForm" name="jlRysq-infoGridForm"
						method='post' action="jlRysq-info-remove.do" class="m-form-blank">
						<table id="jlRysq-infoGrid" class="m-table table-hover table-bordered">
							<thead>
								<tr>
									<th class="sorting" id="fname">文件名称</th>
									<th class="sorting" id="fnumber">已上传数量</th>
									<th class="sorting" id="flastdate">最近更新时间</th>
									<th style="width:80px">&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${model}" var="item">
									<tr>
										<td>${item.fname}</td>
										<td>${item.fnumber}</td>
										<td>${item.flastdate}</td>
										<td><a href="jlShizhong-info-list.do?fszleix=${item.url}"
											class="a-update"><spring:message code="core.list.edit"
													text="详细" /></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</form>
				</div>
			</article>
		</section>
		<!-- end of main -->
	</div>
</body>
</html>