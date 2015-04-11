<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jlShizhong");%>
<%pageContext.setAttribute("divStyle", request.getParameter("divStyle"));%>
<%pageContext.setAttribute("fszleix", request.getParameter("fszleix"));%>


<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.jlShizhong-info.list.title" text="列表" /></title>
    <%@include file="/common/s.jsp"%>
<%--     <link rel="stylesheet" href="style.css" type="text/css">
<script src="${ctx}/s/xthena/amcharts/amcharts.js" type="text/javascript"></script>
<script src="${ctx}/s/xthena/amcharts/serial.js" type="text/javascript"></script> --%>
 <script type="text/javascript">
var config = {
    id: '${divStyle}-infoGrid',
    pageNo: ${page.pageNo},
    pageSize: ${page.pageSize},
    totalCount: ${page.totalCount},
    resultSize: ${page.resultSize},
    pageCount: ${page.pageCount},
    orderBy: '${page.orderBy == null ? "" : page.orderBy}',
    asc: ${page.asc},
    params: {
        'filter_LIKES_name': '${param.filter_LIKES_name}',
        'fszleix':'${fszleix}',
        'divStyle':'${divStyle}'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: '${divStyle}-infoGridForm',
	exportUrl: 'jlShizhong-info-export.do'
};

var table;

$(function() {
    loadStyle();
    
    window.parent.tabShow();
    
  //editor.config.toolbar='full';
	$("#confirmBtn").click(function() {
		getFiles();
	});
	loadFile();
	
	table = new Table(config);
    table.configPagination('.m-pagination');
    table.configPageInfo('.m-page-info');
    table.configPageSize('.m-page-size');
});

function loadStyle(){
	var style='${divStyle}';
	$('.style').hide();
	$('.'+style).show();
	
	config.id=style+"-infoGrid";
	if(style.indexOf('single')>=0){
		$('.multiple').hide();
	};
}

function fszleixSave(){
	$.ajax({
		url : '${scopePrefix}/jl/jlShizhong-info-save-ajax.do',
		contentType: 'application/x-www-form-urlencoded; charset=utf-8',
		type:'POST',
		data: {
			'jlShizhong.fid': $('#jlShizhong-info_fid').val(),
			'jlShizhong.fszleix': $('#jlShizhong-info_fszleix').val(),
			'jlShizhong.fastus': $('#jlShizhong-info_fastus :selected').val()
		},
		async : false,
		success : function(data) {
			if(data){
				alert(data);
			}
		},
		error:function(){
			alert("保存失败！");
		}
	});
}

function removeFujian(fujianid){
	$.ajax({
		url : '${scopePrefix}/jl/jlShizhong-info-deleteFujian-ajax.do',
		contentType: 'application/x-www-form-urlencoded; charset=utf-8',
		type:'POST',
		data: {
			'fujianid':fujianid,
		},
		success : function(data) {
			if(data){
				alert(data);
				$('[fujianid="' + fujianid + '"]').remove();
			}
			
		},
		error:function(){
			alert("保存失败！");
		}
	});
}


function removeFile(fujianid){
	$('[fujianindex="' + fujianid + '"]').remove();
}


function loadFile(){
	$.ajax({
		url : '${scopePrefix}/jl/jlShizhong-file-list-ajax.do',
		contentType: 'application/x-www-form-urlencoded; charset=utf-8',
		type:'POST',
		data: {
			'szid': "${page.result[0].fid}",
		},
		async : false,
		dataType:'json',
		success : function(data) {
			for(var i=0;i<data.length;i++){
				$('#filesUl').append(
					'<li fujianid="'+data[i].fid+'" style="width:300px; height: 35px;">'
					+'<div>'
					+'<p style="width:180px; float:left;">'+data[i].fname+'</p>'
					+'<a class="btn" style="float:right;"'
					+'href="javascript:void(0)" onclick="removeFujian('+data[i].fid+')">删除</a>'
					+'<a class="btn" style="float:right;" href="'+data[i].furl+'"'
					+'target="_blank">下载</a>'
					+'</div> <input type="hidden" class="btn-link" value="'+data[i].fname+'">'
					+'<input type="hidden" class="form-control"'
					+'value="'+data[i].furl+'"><br />'
					+'</li>'
				);
			}
		},
		error:function(){
			alert("加载附件失败！");
		}
	});
	
}

function singleUploadSave(){
	var fujians=$("input[name^='jlFujian']");
	var dataStr='{"jlShizhong.fid":"'+ $('#jgyszl-info_fid').val()+'","jlShizhong.fszleix":"'+ $('#jgyszl-info_fszleix').val()+'",';
	
	 for(var i=0;i<fujians.length;i++){
		dataStr+='"'+$(fujians[i]).attr("name")+'":"'+$(fujians[i]).val()+'",';
	 } 
	dataStr=dataStr.substring(0,dataStr.length-1);
	dataStr+="}";
	//alert(dataStr);
	//alert(jQuery.parseJSON(dataStr));
	
	 $.ajax({
		url : '${scopePrefix}/jl/jlShizhong-info-save-ajax.do',
		contentType: 'application/x-www-form-urlencoded; charset=utf-8',
		type:'POST',
		data:jQuery.parseJSON(dataStr),
		async : false,
		success : function(data) {
			if(data){
				alert(data);
				history.go(0);
			}
		},
		error:function(){
			alert("保存失败！");
		}
	}); 
}

function jgyszlSave(){
	$.ajax({
		url : '${scopePrefix}/jl/jlShizhong-info-save-ajax.do',
		contentType: 'application/x-www-form-urlencoded; charset=utf-8',
		type:'POST',
		data: {
			'jlShizhong.fid': $('#jgyszl-info_fid').val(),
			'jlShizhong.fszleix': $('#jgyszl-info_fszleix').val(),
			'jlShizhong.fastus': $('#jgyszl-info_fastus :selected').val()
		},
		async : false,
		success : function(data) {
			if(data){
				alert(data);
				history.go(0);
			}
		},
		error:function(){
			alert("保存失败！");
		}
	});
}

function getFiles() {
	var filesIndex = $('#filesUl').children('li[litype="new"]').length;
	$
			.each(
					$('.files').children(),
					function(index, node) {
						var appendUrl = '<li fujianindex="'+filesIndex+'" litype="new" style="width:300px; height: 35px;">'
								+ '<div><p style="width:180px; float:left;">'
								+ $(node).data("fileName")
								+ "."
								+ $(node).data("fileType")
								+ '</p>'
								+ '<a class="btn" style="float:right;" onclick="removeFile('
								+ filesIndex
								+ ')" >删除</a>'
								+ '<a class="btn" style="float:right;" href="'
								+ $(node).data("fileUrl")
								+ '" target="_blank">下载</a></div>'
								+ '<input type="hidden" name="jlFujian['
								+ filesIndex
								+ '].fname" class="btn-link" value="'
								+ $(node).data("fileName")
								+ "."
								+ $(node).data("fileType")
								+ '">'
								+ '<input type="hidden" name="jlFujian['
								+ filesIndex
								+ '].furl" class="form-control" value="'
								+ $(node).data("fileUrl")
								+ '"><br/>'
								+ '</li>';
						$('#filesUl').append(appendUrl);
						filesIndex++;
					});
	$(".uploadModal").modal('hide');
}


</script>
  </head>

  <body>

    <div class="row-fluid">
	  <!-- start of main -->
	  <article class="m-widget multiple">
         <header class="header">
		  <h4 class="title">查询</h4> &nbsp;&nbsp;&nbsp; 代码：<%= request.getParameter("fszleix")%>
		  <div class="ctrl">
		    <a class="btn"><i id="jlShizhong-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="jlShizhong-infoSearch" class="content content-inner">
		  <form name="jlShizhong-infoForm" method="post" action="jlShizhong-info-list.do" class="form-inline">
		    <label for="jlShizhong-info_name"><spring:message code='jlShizhong-info.jlShizhong-info.list.search.name' text='名称'/>:</label>
		    <input type="text" id="jlShizhong-info_name" name="filter_LIKES_name" value="${param.filter_LIKES_name}">
			<button class="btn btn-small a-search" onclick="document.jlShizhong-infoForm.submit()">查询</button>&nbsp;
		  </form>
		</div>
	  </article>

	   <article class="m-blank  multiple" >
	    <div class="pull-left">
		  <region:region-permission permission="jlShizhong-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='jlShizhong-info-input.do?fszleix=<%= request.getParameter("fszleix")%>&style=${divStyle}'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="jlShizhong-info:delete">
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
<%@include file="../comm/comm-upload.jsp"%>
		<article class="m-widget style upload">
			<div class="content">
				<form id="upload-infoGridForm" name="jlShizhong-infoGridForm"
					method='post' action="jlShizhong-info-remove.do"
					class="m-form-blank">
					<table id="upload-infoGrid" class="m-table table-hover table-bordered">
						<thead>
							<tr>
								<th width="10" class="m-table-check"><input type="checkbox"
									name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
								<th class="sorting" id="fitem">名称</th>
								<th class="sorting" id="fuploaddate">上传时间</th>
								<th width="80">&nbsp;</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${page.result}" var="item">
								<tr>
									<td><input type="checkbox" class="selectedItem a-check"
										name="selectedItem" value="${item.fid}"></td>
									<td>${item.fitem}</td>
									<td>${item.fuploaddate}</td>
									<td><a
										href="jlShizhong-info-input.do?id=${item.fid}&fszleix=<%= request.getParameter("fszleix")%>&style=${divStyle}"
										class="a-update"><spring:message code="core.list.edit"
												text="编辑" /></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</article>
		
		<article class="m-widget style uploadWithdate">
			<div class="content">
				<form id="uploadWithdate-infoGridForm" name="jlShizhong-infoGridForm"
					method='post' action="jlShizhong-info-remove.do"
					class="m-form-blank">
					<table id="uploadWithdate-infoGrid" class="m-table table-hover table-bordered">
						<thead>
							<tr>
								<th width="10" class="m-table-check"><input type="checkbox"
									name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
								<th class="sorting" id="fitem">名称</th>
								<th class="sorting" id="fitemval">日期</th>
								<th class="sorting" id="fuploaddate">上传时间</th>
								<th width="80">&nbsp;</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${page.result}" var="item">
								<tr>
									<td><input type="checkbox" class="selectedItem a-check"
										name="selectedItem" value="${item.fid}"></td>
									<td>${item.fitem}</td>
									<td>${item.fitemval}</td>
									<td>${item.fuploaddate}</td>
									<td><a
										href="jlShizhong-info-input.do?id=${item.fid}&fszleix=<%= request.getParameter("fszleix")%>&style=${divStyle}"
										class="a-update"><spring:message code="core.list.edit"
												text="编辑" /></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</article>
		
		
	<article class="m-widget style jgysh">
			<div class="content">
				<form id="jgysh-infoGridForm" name="jlShizhong-infoGridForm"
					method='post' action="jlShizhong-info-remove.do"
					class="m-form-blank">
					<table id="upload-infoGrid" class="m-table table-hover table-bordered">
						<thead>
							<tr>
								<th width="10" class="m-table-check"><input type="checkbox"
									name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
								<th class="sorting" id="fitem">日期</th>
								<th class="sorting" id="fitemval">参加人员</th>
								<th width="80">&nbsp;</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${page.result}" var="item">
								<tr>
									<td><input type="checkbox" class="selectedItem a-check"
										name="selectedItem" value="${item.fid}"></td>
									<td>${item.fitem}</td>
									<td>${item.fitemval}</td>
									<td><a
										href="jlShizhong-info-input.do?id=${item.fid}&fszleix=<%= request.getParameter("fszleix")%>&style=${divStyle}"
										class="a-update"><spring:message code="core.list.edit"
												text="编辑" /></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</article>
		

		<article class="m-widget style singleAsync">
			<div class="content">
				<form id="jlShizhong-infoGridForm" name="jlShizhong-infoGridForm"
					method='post' 
					class="form-horizontal">
				
				<input id="jlShizhong-info_fid" type="hidden"
						name="jlShizhong.fid"
						value="${page.result[0].fid}">
				<input id="jlShizhong-info_fszleix" type="hidden"
						name="jlShizhong.fszleix"
						value="<%=request.getParameter("fszleix")%>">
					<div class="control-group">
						<label class="control-label" for="jlShizhong-info_fwarn"><spring:message
									code="jlShizhong-info.jlShizhong-info.input.fwarn" text="是否与工程部同步" /></label>
							<div class="controls">
								<select class="form-control" id="jlShizhong-info_fastus"
									name="jlShizhong.fastus"  >
									<option value="是"
										<c:if test="${page.result[0].fastus=='是'}"> selected="selected"  </c:if>>是</option>
									<option value="否"
										<c:if test="${page.result[0].fastus=='否'}"> selected="selected"  </c:if>>否</option>
								</select>
							</div>
					</div>
					
					<div class="control-group">
						<div class="controls">
								<button type="button" class="btn a-submit" onclick="fszleixSave()">
									<spring:message code='core.input.save' text='保存' />
								</button>
								&nbsp;
								<button type="button" class="btn a-cancel"
									onclick="history.back();">
									<spring:message code='core.input.back' text='返回' />
								</button>
							</div>
					</div>
				</form>
			</div>
		</article>
		
		
		<article class="m-widget style singleJgyszl">
			<div class="content">
				<form id="singleJgyszl-infoGridForm" name="jgyszl-infoGridForm"
					method='post' 
					class="form-horizontal">
				
				<input id="jgyszl-info_fid" type="hidden"
						name="jlShizhong.fid"
						value="${page.result[0].fid}">
				<input id="jgyszl-info_fszleix" type="hidden"
						name="jlShizhong.fszleix"
						value="<%=request.getParameter("fszleix")%>">
					<div class="control-group">
						<label class="control-label" for="jgyszl-info_fwarn"><spring:message
									code="jgyszl-info.jgyszl-info.input.fwarn" text="是否齐全" /></label>
							<div class="controls">
								<select class="form-control" id="jgyszl-info_fastus"
									name="jlShizhong.fastus"  >
									<option value="是"
										<c:if test="${page.result[0].fastus=='是'}"> selected="selected"  </c:if>>是</option>
									<option value="否"
										<c:if test="${page.result[0].fastus=='否'}"> selected="selected"  </c:if>>否</option>
								</select>
							</div>
					</div>
					
					<div class="control-group">
						<div class="controls">
								<button type="button" class="btn a-submit" onclick="jgyszlSave()">
									<spring:message code='core.input.save' text='保存' />
								</button>
								&nbsp;
								<button type="button" class="btn a-cancel"
									onclick="history.back();">
									<spring:message code='core.input.back' text='返回' />
								</button>
							</div>
					</div>
				</form>
			</div>
		</article>
		
		<article class="m-widget style uploadMonth">
			<div class="content">
				<form id="uploadMonth-infoGridForm" name="jlShizhong-infoGridForm"
					method='post' action="jlShizhong-info-remove.do"
					class="m-form-blank">
					<table id="uploadMonth-infoGrid" class="m-table table-hover table-bordered">
						<thead>
							<tr>
								<th width="10" class="m-table-check"><input type="checkbox"
									name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
								<th class="sorting" id="fitem">名称</th>
								<th class="sorting" id="fitemval">月份</th>
								<th class="sorting" id="fuploaddate">上传时间</th>
								<th width="80">&nbsp;</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${page.result}" var="item">
								<tr>
									<td><input type="checkbox" class="selectedItem a-check"
										name="selectedItem" value="${item.fid}"></td>
									<td>${item.fitem}</td>
									<td>${item.fitemval}</td>
									<td>${item.fuploaddate}</td>
									<td><a href="jlShizhong-info-input.do?id=${item.fid}&fszleix=<%= request.getParameter("fszleix")%>&style=${divStyle}"
										class="a-update"><spring:message code="core.list.edit"
												text="编辑" /></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</article>		
		
		<article class="m-widget style singleUpload">
			<div class="content">
				<form id="jgyszl-infoGridForm" name="jgyszl-infoGridForm"
					method='post' 
					class="form-horizontal">
				
				<input id="jgyszl-info_fid" type="hidden"
						name="jlShizhong.fid"
						value="${page.result[0].fid}">
				<input id="jgyszl-info_fszleix" type="hidden"
						name="jlShizhong.fszleix"
						value="<%=request.getParameter("fszleix")%>">
						<div class="control-group">
							<label class="control-label" for="jlShizhong-info_fwarn"><spring:message
									code="jlShizhong-info.jlShizhong-info.input.fwarn" text="附件" /></label>
							<div class="controls">
								<input type="button" class="btn a-link" value="点击上传"
									onclick="showUpload()">
							</div>
						</div>
						<div class="control-group">
							<div id="files">
								<ul id="filesUl" class="nav nav-list">
									<%-- <c:forEach items="${page.result[0].fujians}" var="item">
										<li style="width:300px; height: 35px;">
											<div>
												<p style="width:180px; float:left;">${item.fname}</p>
												<a class="btn" style="float:right;"
													href="jlShizhong-info-deleteFujian.do?fujianid=${item.fid}&id=${model.fid}">删除</a>
												<a class="btn" style="float:right;" href="${item.furl}"
													target="_blank">下载</a>
											</div> <input type="hidden" class="btn-link" value="${item.fname}">
											<input type="hidden" class="form-control"
											value="${item.furl}"><br />
										</li>
									</c:forEach> --%>
								</ul>
							</div>
						</div>
					
					<div class="control-group">
						<div class="controls">
								<button type="button" class="btn a-submit" onclick="singleUploadSave()">
									<spring:message code='core.input.save' text='保存' />
								</button>
								&nbsp;
								<button type="button" class="btn a-cancel"
									onclick="history.back();">
									<spring:message code='core.input.back' text='返回' />
								</button>
							</div>
					</div>
				</form>
			</div>
		</article>


		<article class=" style async">
        <div class="content">
<form id="async-infoGridForm" name="jlShizhong-infoGridForm" method='post' action="jlShizhong-info-remove.do" class="m-form-blank">
  <table id="async-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
       <th class="sorting" id="fitem">名称</th>
        	<th class="sorting" id="fitemval">是否与工程部同步</th>
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check"  name="selectedItem" value="${item.fid}"></td>
      	 	 <td>${item.fitem}</td>
      	 	 <td>${item.fitemval}</td>
        <td>
          <a href="jlShizhong-info-input.do?id=${item.fid}&fszleix=<%= request.getParameter("fszleix")%>&style=${divStyle}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
        </td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
</form>
        </div>
      </article>

		<article class="m-widget style yiqi">
			<div class="content">
				<form id="yiqi-infoGridForm" name="jlShizhong-infoGridForm"
					method='post' action="jlShizhong-info-remove.do"
					class="m-form-blank">
					<table id="yiqi-infoGrid" class="m-table table-hover table-bordered">
						<thead>
							<tr>
								<th width="10" class="m-table-check"><input type="checkbox"
									name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
								<th class="sorting" id="fitem">仪器名称</th>
								<th class="sorting" id="fmemo1">使用单位</th>
								<th class="sorting" id="fitemval">是否检测</th>
								<th class="sorting" id="fexpirydate">有效期</th>
								<th class="sorting" id="fmemo">备注</th>
								<th width="80">&nbsp;</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${page.result}" var="item">
								<tr>
									<td><input type="checkbox" class="selectedItem a-check"
										name="selectedItem" value="${item.fid}"></td>
									<td>${item.fitem}</td>
									<td>${item.fmemo1}</td>
									<td>${item.fitemval}</td>
									<td>${item.fexpirydate}</td>
									<td>${item.fmemo}</td>
									<td><a
										href="jlShizhong-info-input.do?id=${item.fid}&fszleix=<%= request.getParameter("fszleix")%>&style=${divStyle}"
										class="a-update"><spring:message code="core.list.edit"
												text="编辑" /></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</article>
		
		<article class="m-widget style multipleAsync">
			<div class="content">
				<form id="yiqi-infoGridForm" name="jlShizhong-infoGridForm"
					method='post' action="jlShizhong-info-remove.do"
					class="m-form-blank">
					<table id="yiqi-infoGrid" class="m-table table-hover table-bordered">
						<thead>
							<tr>
								<th width="10" class="m-table-check"><input type="checkbox"
									name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
								<th class="sorting" id="fitem">名称</th>
								<th class="sorting" id="fitemval">与工程部是否同步</th>
								<th width="80">&nbsp;</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${page.result}" var="item">
								<tr>
									<td><input type="checkbox" class="selectedItem a-check"
										name="selectedItem" value="${item.fid}"></td>
									<td>${item.fitem}</td>
									<td>${item.fitemval}</td>
									<td><a
										href="jlShizhong-info-input.do?id=${item.fid}&fszleix=<%= request.getParameter("fszleix")%>&style=${divStyle}"
										class="a-update"><spring:message code="core.list.edit"
												text="编辑" /></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</article>
		
		<article class="m-widget style nameVlaueMath">
			<div class="content">
				<form id="nameVlaueMath-infoGridForm" name="jlShizhong-infoGridForm"
					method='post' action="jlShizhong-info-remove.do"
					class="m-form-blank">
					<table id="nameVlaueMath-infoGrid" class="m-table table-hover table-bordered">
						<thead>
							<tr>
								<th width="10" class="m-table-check"><input type="checkbox"
									name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
								<th class="sorting" id="fitem">名称</th>
								<th class="sorting" id="fitemval">有无</th>
								<th class="sorting" id="fastus">审核状态</th>
								<th class="sorting" id="fmemo">备注</th>
								<th width="80">&nbsp;</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${page.result}" var="item">
								<tr>
									<td><input type="checkbox" class="selectedItem a-check"
										name="selectedItem" value="${item.fid}"></td>
									<td>${item.fitem}</td>
									<td>${item.fitemval}</td>
									<td>${item.fastus}</td>
									<td>${item.fmemo}</td>
									<td><a
										href="jlShizhong-info-input.do?id=${item.fid}&fszleix=<%= request.getParameter("fszleix")%>&style=${divStyle}"
										class="a-update"><spring:message code="core.list.edit"
												text="编辑" /></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</article>
		
		<article class="m-widget style hunningtu">
			<div class="content">
				<form id="hunningtu-infoGridForm" name="jlShizhong-infoGridForm"
					method='post' action="jlShizhong-info-remove.do"
					class="m-form-blank">
					<table id="hunningtu-infoGrid" class="m-table table-hover table-bordered">
						<thead>
							<tr>
								<th width="10" class="m-table-check"><input type="checkbox"
									name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
								<th class="sorting" id="fitem">部位</th>
								<th class="sorting" id="fitemval">有无</th>
								<th width="80">&nbsp;</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${page.result}" var="item">
								<tr>
									<td><input type="checkbox" class="selectedItem a-check"
										name="selectedItem" value="${item.fid}"></td>
									<td>${item.fitem}</td>
									<td>${item.fitemval}</td>
									<td><a
										href="jlShizhong-info-input.do?id=${item.fid}&fszleix=<%= request.getParameter("fszleix")%>&style=${divStyle}"
										class="a-update"><spring:message code="core.list.edit"
												text="编辑" /></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</article>
		
		
		<article class="m-widget style asyncMultiple">
			<div class="content">
				<form id="asyncMultiple-infoGridForm" name="jlShizhong-infoGridForm"
					method='post' action="jlShizhong-info-remove.do"
					class="m-form-blank">
					<table id="asyncMultiple-infoGrid" class="m-table table-hover table-bordered">
						<thead>
							<tr>
								<th width="10" class="m-table-check"><input type="checkbox"
									name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
								<th class="sorting" id="fitem">部位</th>
								<th class="sorting" id="fitemval">有无</th>
								<th width="80">&nbsp;</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${page.result}" var="item">
								<tr>
									<td><input type="checkbox" class="selectedItem a-check"
										name="selectedItem" value="${item.fid}"></td>
									<td>${item.fitem}</td>
									<td>${item.fitemval}</td>
									<td><a
										href="jlShizhong-info-input.do?id=${item.fid}&fszleix=<%= request.getParameter("fszleix")%>&style=${divStyle}"
										class="a-update"><spring:message code="core.list.edit"
												text="编辑" /></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</article>
		
			<article class="m-widget style nameVlaueMathWithoutStatus">
			<div class="content">
				<form id="nameVlaueMathWithoutStatus-infoGridForm" name="jlShizhong-infoGridForm"
					method='post' action="jlShizhong-info-remove.do"
					class="m-form-blank">
					<table id="nameVlaueMathWithoutStatus-infoGrid" class="m-table table-hover table-bordered">
						<thead>
							<tr>
								<th width="10" class="m-table-check"><input type="checkbox"
									name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
								<th class="sorting" id="fitem">名称</th>
								<th class="sorting" id="fitemval">有无</th>
								<th class="sorting" id="fmemo">备注</th>
								<th width="80">&nbsp;</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach items="${page.result}" var="item">
								<tr>
									<td><input type="checkbox" class="selectedItem a-check"
										name="selectedItem" value="${item.fid}"></td>
									<td>${item.fitem}</td>
									<td>${item.fitemval}</td>
									<td>${item.fmemo}</td>
									<td><a
										href="jlShizhong-info-input.do?id=${item.fid}&fszleix=<%= request.getParameter("fszleix")%>&style=${divStyle}"
										class="a-update"><spring:message code="core.list.edit"
												text="编辑" /></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</article>

	<article class="multiple">
	    <div class="m-page-info pull-left">
		  共100条记录 显示1到10条记录
		</div>
		<div class="btn-group m-pagination pull-right">
		  <button class="btn btn-small">&lt;</button>
		  <button class="btn btn-small">1</button>
		  <button class="btn btn-small">&gt;</button>
		</div>
	    <div class="m-clear"></div> 

<!--         <div id="chartdiv" style="width: 100%; height: 400px;"></div> -->
     </article>       
     <div class="m-spacer"></div>
	  <!-- end of main -->
	</div>

  </body>

</html>
