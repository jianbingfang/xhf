<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "hr-home");
%>
<%
	pageContext.setAttribute("currentMenu", "commRy");
%>
<!doctype html>
<html lang="zh">

<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="dev.hrShtc-info.list.title"
		text="社会统筹 - 员工管理 - 人力资源" /></title>
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
        'filter_LIKES_fmemo1': '${param.filter_LIKES_fmemo1}'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'hrShtc-infoGridForm',
	exportUrl: 'hrShtc-info-export.do'
};

var table;

$(function() {
	table = new Table(config);
    table.configPagination('.m-pagination');
    table.configPageInfo('.m-page-info');
    table.configPageSize('.m-page-size');
});

function updateAll(){
	$('#batchUpdateDiv').modal();
}

function doUpdateAll(){
	$('#hrShtc-infoForm').submit();
}
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
							<li><a href="hr-home.do">人力资源</a> <span class="divider">/</span>
							</li>
							<li>员工管理<span class="divider">/</span>
							</li>
							<li class="active">社会统筹</li>
						</ul>
					</div>
				</div>
			</div> -->
			<article class="m-widget">
				<header class="header">
					<h4 class="title">查询</h4>
					<div class="ctrl">
						<a class="btn"><i id="hrShtc-infoSearchIcon"
							class="icon-chevron-up"></i></a>
					</div>
				</header>
				<div id="hrShtc-infoSearch" class="content content-inner">

					<form name="hrShtc-infoForm" method="post"
						action="hrShtc-info-list.do" class="form-inline">
						<label for="hrShtc-info_name"><spring:message
								code='hrShtc-info.hrShtc-info.list.search.name' text='姓名' />:</label> <input
							type="text" id="hrShtc-info_name" name="filter_LIKES_fmemo1"
							value="${param.filter_LIKES_fmemo1}">
						<button class="btn btn-small a-search"
							onclick="document.hrShtc-infoForm.submit()">查询</button>
						&nbsp;
					</form>

				</div>
			</article>

			<article class="m-blank">
				<div class="pull-left">
					<region:region-permission permission="hrShtc-info:create">
						<button class="btn btn-small a-insert"
							onclick="location.href='hrShtc-info-input.do'">新建</button>
					</region:region-permission>
					<region:region-permission permission="hrShtc-info:delete">
						<button class="btn btn-small a-remove" onclick="table.removeAll()">删除</button>
					</region:region-permission>
					<region:region-permission permission="hrShtc-info:update">
						<button class="btn btn-small a-update" onclick="updateAll()">批量修改</button>
					</region:region-permission>
					<%--<button class="btn btn-small a-export"--%>
						<%--onclick="table.exportExcel()">导出</button>--%>
				</div>

				<div class="pull-right">
					每页显示 <select class="m-page-size">
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="50">50</option>
					</select> 条
				</div>

				<div class="m-clear"></div>
			</article>

			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="hrShtc-info.hrShtc-info.list.title"
							text="列表" />
					</h4>
				</header>
				<div class="content">
					<form id="hrShtc-infoGridForm" name="hrShtc-infoGridForm"
						method='post' action="hrShtc-info-remove.do" class="m-form-blank">
						<table id="hrShtc-infoGrid" class="m-table table-hover table-bordered">
							<thead>
								<tr>
									<th width="10" class="m-table-check"><input
										type="checkbox" name="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th>
									<th class="sorting" id="fryid">姓名</th>
									<th class="sorting" id="ftctype">险种</th>
									<th class="sorting" id="fstartdate">开始时间</th>
									<th class="sorting" id="fjnjs">缴纳基数</th>
									<th class="sorting" id="fbryj">本人应缴</th>
									<th class="sorting" id="fgsyj">公司应缴</th>
									<th class="sorting" id="flastdate">最后缴纳日期</th>
									<th class="sorting" id="fjsr">经手人</th>
									<th width="80">操作&nbsp;</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach items="${page.result}" var="item">
									<tr>
										<td><input type="checkbox" class="selectedItem a-check"
											name="selectedItem" value="${item.fid}"></td>
										<td>${ryMap[item.fryid].fname}</td>
										<td>${item.ftctype}</td>
										<td>${item.fstartdate}</td>
										<td>${item.fjnjs}</td>
										<td>${item.fbryj}</td>
										<td>${item.fgsyj}</td>
										<td>${item.flastdate}</td>
										<td>${ryMap[item.fjsr].fname}</td>
										<td><a href="hrShtc-info-input.do?id=${item.fid}"
											class="a-update"><spring:message code="core.list.edit"
													text="编辑" /></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</form>
				</div>
			</article>

			<article>
				<div class="m-page-info pull-left">共100条记录 显示1到10条记录</div>

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

	<div id="batchUpdateDiv" class="modal hide fade"
		style="width: 760px;height: 300px;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
					</button>
					<h4 class="modal-title">批量修改</h4>
				</div>
				<form id="hrShtc-infoForm" method="post"
					action="hrShtc-info-batchUpdate.do" class="form-horizontal">
					<div class="control-group">
						<div class="span10">
							<label class="control-label" for="hrShtc-info_ftctype"><spring:message
									code="hrShtc-info.hrShtc-info.input.ftctype" text="养老保险" /></label>
							<div class="controls">
								<input id="hrShtc-info_fjnjs" style="width: 120px;"
									placeholder="缴纳基数" type="text" name="fjnjs" size=""
									class="text required" minlength="" maxlength=""> <input
									id="hrShtc-info_fbryj" style="width: 120px;" placeholder="个人承担"
									type="text" name="fbryj" size="" class="text required"
									minlength="" maxlength=""> <input
									id="hrShtc-info_fgsyj" style="width: 120px;" placeholder="公司承担"
									type="text" name="fgsyj" size="" class="text required"
									minlength="" maxlength="">
							</div>
						</div>
					</div>

					<div class="control-group">
						<div class="span10">
							<label class="control-label" for="hrShtc-info_ftctype"><spring:message
									code="hrShtc-info.hrShtc-info.input.ftctype" text="医疗保险" /></label>
							<div class="controls">
								<input id="hrShtc-info_fjnjs" style="width: 120px;"
									placeholder="缴纳基数" type="text" name="fjnjsyl"
									value="${model.fjnjsyl}" size="" class="text required"
									minlength="" maxlength=""> <input
									id="hrShtc-info_fbryj" style="width: 120px;" placeholder="个人承担"
									type="text" name="fbryjyl" value="${model.fbryjyl}" size=""
									class="text required" minlength="" maxlength=""> <input
									id="hrShtc-info_fgsyj" style="width: 120px;" placeholder="公司承担"
									type="text" name="fgsyjyl" value="${model.fgsyjyl}" size=""
									class="text required" minlength="" maxlength="">
							</div>
						</div>
					</div>

					<div class="control-group">
						<div class="span10">
							<label class="control-label" for="hrShtc-info_ftctype"><spring:message
									code="hrShtc-info.hrShtc-info.input.ftctype" text="意外险" /></label>
							<div class="controls">
								<input id="hrShtc-info_fjnjs" style="width: 120px;"
									placeholder="缴纳基数" type="text" name="fjnjsyw"
									value="${model.fjnjsyw}" size="" class="text required"
									minlength="" maxlength=""> <input
									id="hrShtc-info_fbryj" style="width: 120px;" placeholder="个人承担"
									type="text" name="fbryjyw" value="${model.fbryjyw}" size=""
									class="text required" minlength="" maxlength=""> <input
									id="hrShtc-info_fgsyj" style="width: 120px;" placeholder="公司承担"
									type="text" name="fgsyjyw" value="${model.fgsyjyw}" size=""
									class="text required" minlength="" maxlength="">
							</div>
						</div>
					</div>
				</form>
				<div class="modal-footer">
					'
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button id="uploadPickerBtnSelect" onclick="doUpdateAll()"
						type="button" class="btn btn-primary">保存</button>
				</div>
			</div>
</body>

</html>
