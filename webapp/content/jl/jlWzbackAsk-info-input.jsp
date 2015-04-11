<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jl-cd");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jlWzbackAsk-info.jlWzbackAsk-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
       <link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
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
   		gridFormId: 'jlWzbackaskList-infoGridForm',
   		exportUrl: 'jlWzbackaskList-info-export.do'
   	};

   	var table;
   	
$(function() {
	
	table = new Table(config);
    table.configPagination('.m-pagination');
    table.configPageInfo('.m-page-info');
    table.configPageSize('.m-page-size');
    
    $("#jlWzbackAsk-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
	createryPicker({
		modalId : 'ryPicker',
		url : '${scopePrefix}/hr/commRy-simple-list.do'
	});
})
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
		  <h4 class="title"><spring:message code="jlWzbackAsk-info.jlWzbackAsk-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="jlWzbackAsk-infoForm" method="post" action="jlWzbackAsk-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="jlWzbackAsk-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
			    	<div class="span5">
				    <label class="control-label" for="jlWzbackAsk-info_faskuser"><spring:message code="jlWzbackAsk-info.jlWzbackAsk-info.input.faskuser" text="申请人"/></label>
					<div class="controls">
				   			<div class="input-append ryPicker">
							<input id="ryBxRecord-info_fryid" type="hidden" name="faskuser"
								value="${model.faskuser}"> <input
								id="ryBxRecord-info_userName" type="text" value="${shenqingName}"
								disabled class=" required" style="width: 175px;" value="">
							<span class="add-on"
								style="padding-top: 2px; padding-bottom: 2px;"><i
								class="icon-user"></i></span>
						</div>
				    </div>
				  </div>
				 
			    	<div class="span5">
				    <label class="control-label" for="jlWzbackAsk-info_faskdate"><spring:message code="jlWzbackAsk-info.jlWzbackAsk-info.input.faskdate" text="申请时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="jlWzbackAsk-info_faskdate" type="text" name="faskdate" value="${model.faskdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
				   </div>
			    	<div class="control-group">
			    		<div class="span5">
				    <label class="control-label" for="jlWzbackAsk-info_freceiveuser"><spring:message code="jlWzbackAsk-info.jlWzbackAsk-info.input.freceiveuser" text="接收人"/></label>
					<div class="controls">
					  	<input id="jlWzbackAsk-info_freceiveuser" type="text"  value="${receiveName}" size="" readonly="readonly" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
				  		<div class="span5">
				    <label class="control-label" for="jlWzbackAsk-info_freceivedate"><spring:message code="jlWzbackAsk-info.jlWzbackAsk-info.input.freceivedate" text="接收时间"/></label>
					<div class="controls">
					  	<input id="jlWzbackAsk-info_freceivedate" type="text" name="freceivedate" value="${model.freceivedate}" size="" readonly="readonly" class="   " minlength="" maxlength="">
				    </div>
				  </div>
				  </div>
			    <%-- 	<div class="control-group">
				    <label class="control-label" for="jlWzbackAsk-info_ffileid"><spring:message code="jlWzbackAsk-info.jlWzbackAsk-info.input.ffileid" text="附件id"/></label>
					<div class="controls">
					  	<input id="jlWzbackAsk-info_ffileid" type="text" name="ffileid" value="${model.ffileid}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div> --%>
			    	<div class="control-group">
				    <label class="control-label" for="jlWzbackAsk-info_fbwztype"><spring:message code="jlWzbackAsk-info.jlWzbackAsk-info.input.fbwztype" text="物品类别"/></label>
					<div class="controls">
				      	 <select class="form-control" id="jlWzbackAsk-info_fbwztype" name="fbwztype" value="${model.fbwztype}" class=" " >
					    	 	<option value="仪器"  <c:if test="${model.fbwztype}=='仪器'}"> selected="selected"  </c:if>>仪器</option>
					    	 	<option value="其他固定资产"  <c:if test="${model.fbwztype}=='其他固定资产'}"> selected="selected"  </c:if>>其他固定资产</option>
					 	</select>
				    </div>
				  </div>
					 	<div class="control-group">
					    <div class="controls">
					      <button type="submit" class="btn a-submit"><spring:message code='core.input.save' text='保存'/></button>
						  &nbsp;
					      <button type="button" class="btn a-cancel" onclick="history.back();"><spring:message code='core.input.back' text='返回'/></button>
					    </div>
					  </div>
		</form>
        </div>
      </article>

      </section>
      
        <section id="m-main" class="span10">


	  <article class="m-blank">
	    <div class="pull-left">
		  <region:region-permission permission="jlWzbackaskList-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='jlWzbackaskList-info-input.do?mainid=${model.fid}'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="jlWzbackaskList-info:delete">
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
		  <h4 class="title"><spring:message code="jlWzbackaskList-info.jlWzbackaskList-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="jlWzbackaskList-infoGridForm" name="jlWzbackaskList-infoGridForm" method='post' action="jlWzbackaskList-info-remove.do" class="m-form-blank">
  <table id="jlWzbackaskList-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="fwcode">物品编号</th>
        	<th class="sorting" name="fwzName">物品名称</th>
        	<th class="sorting" name="fnum">数量</th>
        	<th class="sorting" name="fmemo">备注</th>
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	 	 <td>${wzMap[item.fwzid].fcode}</td>
      	 	 <td>${wzMap[item.fwzid].fname}</td>
      	 	 <td>${item.fnum}</td>
      	 	 <td>${item.fmemo}</td>
        <td>
          <a href="jlWzbackaskList-info-input.do?id=${item.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
