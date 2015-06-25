<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "xz-home");
%>
<%
	pageContext.setAttribute("currentMenu", "xz-da");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="dev.xzZj-info.list.title"
		text="公司证件 - 公司档案管理 - 行政管理" /></title>
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
			'filter_LIKES_fname' : '${param.filter_LIKES_fname}',
			'filter_GTD_fendate' : '${param.filter_GTD_fendate}',
			'filter_LTD_fendate' : '${param.filter_LTD_fendate}'
		},
		selectedItemClass : 'selectedItem',
		gridFormId : 'xzZj-infoGridForm',
		exportUrl : 'xzZj-info-export.do'
	};

	var table;

	$(function() {
		table = new Table(config);
		table.configPagination('.m-pagination');
		table.configPageInfo('.m-page-info');
		table.configPageSize('.m-page-size');
	});

	function selectZj(ry,fname) {
		if (ry.id.indexOf("a") > 0) {
			var a = ry.nextSibling;
			while (a.id.indexOf("child") >= 0) {
				if (a.hidden == null || a.hidden == "")
					a.hidden = "hidden";
				else {
					a.hidden = "";
				}
				a = a.nextSibling;
			}
		} else {
			$.ajax({
				url : "${scopePrefix}/xz/xzZj-info-list.do",
				type : 'POST',
				data : {
					fname : fname,
				},
				dataType : 'json',
				success : function(data) {
					var html = '';
					for (var i = 0; i < data.length; i++) {
						var item = data[i];
						if (item.fyxqks == null) {
							item.fyxqks = "";
						}
						if (item.fyxjs == null) {
							item.fyxjs = "";
						}
						html += "<tr id='child" + item.fid
								+ "' ondblclick='openZj(" + item.fid + ")' >"
								+'<td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value='+item.fid+'></td>'
								+"</td>"

//								 //+ "<td></td>"  /* + "<td>" + item.fname + "</td>" */
								+ "<td>" + item.fcode + "</td>" + "<td>"
								+ item.fnum + "</td>" + "<td>" + item.fendate
								+ "</td>" + "<td>" + item.fzkstate + "</td>";
							/* 	+ "<td>" + item.fyxjs + "</td>" + "<td>"
								+ item.fwz + "</td>" + "<td>"; */
						if (item.fstatus == '在库') {
							html += '<font color="green">在库</font>';
						} else {
							html += '<font color="red">未在库</font>';
						}
						html += "</td>" + "</tr>";
					}
					$('#' + ry.id).after(html);
				}
			});
			ry.id = ry.id + "a";
		}

	}


	function removeflow(){
		var checkboxs=getcheckeditem();

		removeitem(checkboxs);
	}



	function removeitem(checkboxs) {
		$.ajax({
			url :  "${scopePrefix}/xz/xzZj-info-removeitem.do",
			type : 'POST',
			traditional :true,
			dataType:'json',
			data : {
				'selecteditems' : checkboxs
			},
			async : false,
			success : function(data) {

				window.location.href="xzZj-treelist.do";

			}
		});
	}



	function getcheckeditem(){
		var inputs = document.getElementsByTagName("input");//获取所有的input标签对象
		var checkboxArray = [];//初始化空数组，用来存放checkbox对象。

		for(var i=0;i<inputs.length;i++){
			var obj = inputs[i];
			if(obj.type=='checkbox' ){
				if (inputs[i].checked)
				{
					//这个地方是获取你选定了的的checkbox的Value
					var valuetext=inputs[i].value;
					checkboxArray.push(valuetext);
				}
			}
		}
		return checkboxArray.join('@');
	};


	function openZj(id) {
		window.open("xzZj-info-input.do?id=" + id);
	}
</script>
</head>
<body>
	<%@include file="/header.jsp"%>
	<div class="row-fluid">
		<%@include file="/menu/xz-workspace.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span10">
			<article class="m-widget">
				<header class="header">
					<h4 class="title">查询</h4>
					<div class="ctrl">
						<a class="btn"><i id="xzZj-infoSearchIcon"
							class="icon-chevron-up"></i></a>
					</div>
				</header>
				<div id="xzZj-infoSearch" class="content content-inner">
					<form name="xzZj-infoForm" method="post" action="xzZj-treelist.do"
						class="form-inline">
						<label for="xzZj-info_fname"><spring:message
								code='xzZj-info.xzZj-info.list.search.fname' text='证件名称' />:</label> <input
							type="text" id="xzZj-info_fname" name="filter_LIKES_fname"
							value="${param.filter_LIKES_fname}"> <label
							for="xzZj-info_fendate"><spring:message
								code='xzZj-info.xzZj-info.list.search.fendate' text='到期时间' />:</label>
						<div class="input-append datepicker date"
							style="padding-left: 0px;">
							<input id="commRy-info_fendate" type="text"
								name="filter_GTD_fendate" value="${param.filter_GTD_fendate}"
								size="40" class="text "
								style="background-color:white;cursor:default; width: 160px;">
							<span class="add-on"
								style="padding-top: 2px; padding-bottom: 2px;"><i
								class="icon-calendar"></i></span>
						</div>
						至
						<div class="input-append datepicker date"
							style="padding-left: 0px;">
							<input id="commRy-info_fendate" type="text"
								name="filter_LTD_fendate" value="${param.filter_LTD_fendate}"
								size="40" class="text "
								style="background-color:white;cursor:default; width: 160px;">
							<span class="add-on"
								style="padding-top: 2px; padding-bottom: 2px;"><i
								class="icon-calendar"></i></span>
						</div>
						<button class="btn btn-small a-search"
							onclick="document.xzZj-infoForm.submit()">查询</button>
						&nbsp;
					</form>
				</div>
			</article>
			<article class="m-blank">
				<div class="pull-left">
					<region:region-permission permission="xzZj-info:create">
						<button class="btn btn-small a-insert"
							onclick="location.href='xzZj-info-input.do'">新建</button>
					</region:region-permission>
					<region:region-permission permission="xzZj-info:delete">
						<button class="btn btn-small a-remove" onclick="removeflow()">删除</button>
					</region:region-permission>
					<%--<button class="btn btn-small a-export"--%>
						<%--onclick="table.exportExcel()">导出</button>--%>
				</div>
				<!-- <div class="pull-right">
					每页显示 <select class="m-page-size">
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="50">50</option>
					</select> 条
				</div> -->
				<div class="m-clear"></div>
			</article>
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="xzZj-info.xzZj-info.list.title" text="列表" />
					</h4>
				</header>
				<div class="content">
					<form id="xzZj-infoGridForm" name="xzZj-infoGridForm" method='post'
						action="xzZj-info-remove.do" class="m-form-blank">
						<table id="xzZj-infoGrid"
							class="m-table table-hover table-bordered">
							<thead>
								<tr>
								<!-- 	<th style="width:10px" class="m-table-check"><input
										type="checkbox" name="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th> -->
									<th class="sorting" id="fname">证件名称</th>
									<th class="sorting" id="fcode">证件编号</th>
									<th class="sorting" id="fnum">份数</th>
									<th class="sorting" id="fendate">到期时间</th>
									<th class="sorting" id="fzkstate">在库状态</th>
									<!-- <th class="sorting" id="ffzwz">放置位置</th>  -->
									<!-- <th style="width:80px">&nbsp;</th> -->
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${zjList}" var="item">
									<tr id="${item.fid}" onclick=selectZj(this,'${item.fname}')
										style="background-color: #EEEEEE" class='a'>
										 <%--<td></td>--%>
										<%--<td><input type="checkbox"--%>
															<%--class="selectedItem a-check" name="selectedItem"--%>
															<%--value="${item.fid}"></td>--%>
										<td colspan="5">${item.fname}</td>
									<!-- 	<td></td>
										<td></td>
										<td></td>
										<td></td> -->
									</tr>
								</c:forEach>
								<%-- <c:forEach items="${page.result}" var="item">
									<tr>
										<td><input type="checkbox" class="selectedItem a-check"
											name="selectedItem" value="${item.fid}"></td>
											<td><a href="xzZj-info-input.do?id=${item.fid}"
											class="a-update"><spring:message code="core.list.edit"
													text="${item.fname}" /></a></td>
										<td>${item.fcode}</td>
										<td>${item.fnum}</td>
										<td>${item.fendate}</td>
										<td><c:if test="${item.fzkstate=='在库'}"> <font color="green">在库</font>  </c:if>
											<c:if test="${item.fzkstate=='未在库'}"> <font color="red">未在库</font>  </c:if></td>
										<td>${item.ffzwz}</td>
										<td><a href="xzZj-info-input.do?id=${item.fid}"
											class="a-update"><spring:message code="core.list.edit"
													text="编辑" /></a></td>
									</tr>
								</c:forEach> --%>
							</tbody>
						</table>
					</form>
				</div>
			</article>
			<!-- <article>
				<div class="m-page-info pull-left">共100条记录 显示1到10条记录</div>
				<div class="btn-group m-pagination pull-right">
					<button class="btn btn-small">&lt;</button>
					<button class="btn btn-small">1</button>
					<button class="btn btn-small">&gt;</button>
				</div>
				<div class="m-clear"></div>
			</article> -->
			<div class="m-spacer"></div>
		</section>
		<!-- end of main -->
	</div>
</body>
</html>
