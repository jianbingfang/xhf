<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "cw-home");
%>
<%
	pageContext.setAttribute("currentMenu", "cw-zk");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="dev.cwYingShou-info.list.title"
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
			'filter_LIKES_fprojectname' : '${param.filter_LIKES_fprojectname}',
			'filter_GTD_fdzdate' : '${param.filter_GTD_fdzdate}',
			'filter_LTD_fdzdate' : '${param.filter_LTD_fdzdate}',
			'filter_LIKES_finviocecode' : '${param.filter_LIKES_finviocecode}',
			'filter_LIKES_freceiptcode' : '${param.filter_LIKES_freceiptcode}',
			'filter_LIKES_fmemo4' : '${param.filter_LIKES_fmemo4}',
			'filter_LIKES_fjsstate' : '${param.filter_LIKES_fjsstate}',
			
		},
		selectedItemClass : 'selectedItem',
		gridFormId : 'cwYingShou-infoGridForm',
		exportUrl : 'cwYingShou-info-export.do'
	};

	var table;

	$(function() {
		table = new Table(config);
		table.configPagination('.m-pagination');
		table.configPageInfo('.m-page-info');
		table.configPageSize('.m-page-size');
	});

	function selectZj(ht) {
		if (ht.id.indexOf("a") > 0) {
			var a =ht.nextSibling;
			while(a.id.indexOf("child") >= 0){
				if(a.hidden ==null || a.hidden=="")
				a.hidden = "hidden";
				else{
					a.hidden ="";
				}
				a =a.nextSibling;
			}
		} else {
			$.ajax({
				url : "${scopePrefix}/cw/cwYingShou-info-list.do",
				type : 'POST',
				data : {
					htid : ht.id,
					'filter_LIKES_fprojectname' : '${param.filter_LIKES_fprojectname}',
					'filter_GTD_fdzdate' : '${param.filter_GTD_fdzdate}',
					'filter_LTD_fdzdate' : '${param.filter_LTD_fdzdate}',
					'filter_LIKES_finviocecode' : '${param.filter_LIKES_finviocecode}',
					'filter_LIKES_freceiptcode' : '${param.filter_LIKES_freceiptcode}',
					'filter_LIKES_fmemo4' : '${param.filter_LIKES_fmemo4}',
					'filter_LIKES_fjsstate' : '${param.filter_LIKES_fjsstate}',
				},
				dataType : 'json',
				success : function(data) {
					var html = '';
					for (var i = 0; i < data.length; i++) {
						var item = data[i];
						html += "<tr id='child"+item.fid+"' >"
						/* 	+'<td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>'
							+ '</td>' */
						+ "<td></td>" 
						+ "<td>" + item.fdebit + "</td>" 
						+"<td>"+ item.fcreditor + "</td>" 
						+ "<td>"+ item.finviocecode + "</td>" 
						+ "<td>" + item.freceiptcode+ "</td>" 
						+ "<td>" + item.fdzdate + "</td>"
						+ "<td></td><td></td>" 
						+ "<td>"+ item.fmemo + "</td>" ;
						html += "</tr>";
					}
					$('#' + ht.id).after(html);
				}
			});
			ht.id = ht.id + "a";
		}

	}
	
	/* function openZj(id){
		window.open("cwYingShou-info-input.do?id="+id);
	} */
</script>
</head>
<body>
	<%@include file="/header.jsp"%>
	<div class="row-fluid">
		<%@include file="/menu/cw-workspace.jsp"%>
			<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
		<!-- start of main -->
		<section id="m-main" class="span10">
			<article class="m-widget">
				<header class="header">
					<h4 class="title">查询</h4>
					<div class="ctrl">
						<a class="btn"><i id="cwYingShou-infoSearchIcon"
							class="icon-chevron-up"></i></a>
					</div>
				</header>
				<div id="cwYingShou-infoSearch" class="content content-inner">
					<form name="cwYingShou-infoForm" method="post"
						action="cwYingShou-treelist.do" class="form-inline">
						<label for="cwYingShou-info_fprojectname"><spring:message
								code='cwYingShou-info.cwYingShou-info.list.search.fprojectname'
								text='项目名称' />:</label> <input type="text" id="cwYingShou-info_fprojectname"
							name="filter_LIKES_fprojectname" value="${param.filter_LIKES_fprojectname}">&nbsp;&nbsp;
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
						<label for="cwYingShou-info_finviocecode"><spring:message
								code='cwYingShou-info.cwYingShou-info.list.search.finviocecode' text='发票号' />:</label>
						<input type="text" id="cwYingShou-info_finviocecode" style="width: 150px"
							name="filter_LIKES_finviocecode" value="${param.filter_LIKES_finviocecode}">&nbsp;&nbsp;
						<label for="cwYingShou-info_freceiptcode"><spring:message
								code='cwYingShou-info.cwYingShou-info.list.search.freceiptcode' text='收据号' />:</label>
						<input type="text" id="cwYingShou-info_freceiptcode" style="width: 150px"
							name="filter_LIKES_freceiptcode" value="${param.filter_LIKES_freceiptcode}">&nbsp;&nbsp;
							<label
							for="commHt-info_fjsstate"><spring:message
								code='xz-commHt-info.xz-commHt-info.list.search.fjsstate'
								text='结算状态' />:</label> <select id="commHt-info_fjsstate" style="width: 100px"
							name="filter_LIKES_fjsstate" size="" class="text ">
							<option value=""
								<c:if test="${param.filter_LIKES_fjsstate=='' }">selected="selected"</c:if>>全部</option>
							<option value="未结算"
								<c:if test="${param.filter_LIKES_fjsstate=='未结算' }">selected="selected"</c:if>>未结算</option>
							<option value="已结算"
								<c:if test="${param.filter_LIKES_fjsstate=='已结算' }">selected="selected"</c:if>>已结算</option>
							
						</select>&nbsp;&nbsp;
								<label
							for="xz-commHt-info_fmemo4"><spring:message
								code='xz-commHt-info.xz-commHt-info.list.search.fmemo4'
								text='属性' />:</label> <input type="text" id="xz-commHt-info_fmemo4"
							style="width: 80px;" name="filter_LIKES_fmemo4"
							value="${param.filter_LIKES_fmemo4}">&nbsp;&nbsp;
						<button class="btn btn-small a-search"
							onclick="document.cwYingShou-infoForm.submit()">查询</button>
						&nbsp;
					</form>
				</div>
			</article>
			<article class="m-widget">
					<div class="row-fluid">
						<div class="span3">
							<label >借方合计:</label>
								<label style="color: blue;font-size: 25px;"><fmt:formatNumber type="number" value="${jiefangheji}" maxFractionDigits="2" /></label>
						</div>
						<div class="span3">
						<label >贷方合计:</label>
								<label style="color: blue;font-size: 25px;"><fmt:formatNumber type="number" value="${daifangheji}" maxFractionDigits="2"/></label>
						</div>
						<div class="span3">
							<label >余额(借贷):</label>
								<label style="color: blue;font-size: 25px;">${jiedaifangxiang}</label>
						</div>
						<div class="span3">
						<label >余额:</label>
								<label style="color: blue;font-size: 25px;"><fmt:formatNumber type="number" value="${hejijine}" maxFractionDigits="2"/></label>
						</div>
					</div>
			</article>
				<!-- 		<article class="m-blank">
				<div class="pull-left">
				  <region:region-permission permission="cwYingShou-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='cwYingShou-info-input.do'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="cwYingShou-info:delete">
		  <button class="btn btn-small a-remove" onclick="table.removeAll()">删除</button> 
		  </region:region-permission>
					<button class="btn btn-small a-export"
						onclick="table.exportExcel()">导出</button>
				</div>
				<div class="pull-right">
					每页显示 <select class="m-page-size">
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="50">50</option>
					</select> 条
				</div>
				<div class="m-clear"></div>
			</article>-->
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="cwYingShou-info.cwYingShou-info.list.title"
							text="应收账款台账" />
					</h4>
				</header>
				<div class="content">
					<form id="cwYingShou-infoGridForm" name="cwYingShou-infoGridForm"
						method='post' action="cwYingShou-info-remove.do"
						class="m-form-blank">
						<table id="cwYingShou-infoGrid" class="m-table table-hover table-bordered">
							<thead>
								<tr>
									<!-- <th width="10" class="m-table-check"><input
										type="checkbox" name="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th> -->
									<th class="sorting" id="fxmid">项目</th>
									<th class="sorting" id="fdebit">借方金额</th>
									<th class="sorting" id="fcreditor">贷方金额</th>
									<th class="sorting" id="finviocecode">发票号</th>
									<th class="sorting" id="freceiptcode">收据号</th>
									<th class="sorting" id="fdzdate">时间</th>
									<th class="sorting" id="fhjjdfx">合计借贷方向</th>
									<th class="sorting" id="fhjje">合计金额</th>
									<th class="sorting" id="fmemo">备注</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.result}" var="item">
									<tr  id="${item[0]}" onclick=selectZj(this) 
														style="background-color: #EEEEEE" class='a'>
										<%-- <td><input type="checkbox" class="selectedItem a-check"
											name="selectedItem" value="${item[0]}"></td> --%>
										<td class="span3">${item[1]}</td>
										<td><fmt:formatNumber type="number" value="${item[2]}" maxFractionDigits="2"/></td>
										<td><fmt:formatNumber type="number" value="${item[3]}" maxFractionDigits="2"/></td>
										<td></td>
										<td></td>
										<td></td>
										<td><c:if test="${item[3]-item[2]>0}">贷方</c:if><c:if test="${item[3]-item[2]==0}">平</c:if><c:if test="${item[3]-item[2]<0}">借方</c:if></td>
										<td><fmt:formatNumber type="number" value="${(item[3]-item[2])<0?-(item[3]-item[2]):(item[3]-item[2])} " maxFractionDigits="2"/></td>
										<td></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</form>
				</div>
			</article>
			<article>
				<div class="m-page-info pull-left">共100条记录 显示1到10条记录</div>
				<div class="pull-right">
					每页显示 <select class="m-page-size">
						<option value="10">10</option>
						<option value="20">20</option>
						<option value="50">50</option>
					</select> 条
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
