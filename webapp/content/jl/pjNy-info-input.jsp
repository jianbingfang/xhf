<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jl-cd");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jl-pjNy-info.jl-pjNy-info.input.title" text="编辑"/></title>
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
    		gridFormId: 'jl-pjNyList-infoGridForm',
    		exportUrl: 'jl-pjNyList-info-export.do'
    	};

    	var table;
    	
$(function() {

	table = new Table(config);
    table.configPagination('.m-pagination');
    table.configPageInfo('.m-page-info');
    table.configPageSize('.m-page-size');
    
    $("#jl-pjNy-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
    
    createwzPicker({
		modalId : 'wzPicker',
		url : '${scopePrefix}/xz/wz-simple-list.do'
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
		  <h4 class="title"><spring:message code="jl-pjNy-info.jl-pjNy-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="jl-pjNy-infoForm" method="post" action="jl-pjNy-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="jl-pjNy-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    <div class="control-group">
			    	<div class="span5"> 
					    <label class="control-label" for="jl-pjNy-info_fyijiaorenid"><spring:message code="jl-pjNy-info.jl-pjNy-info.input.fyijiaorenid" text="移交人"/></label>
						<div class="controls">
							<div class="input-append ryPicker">
							<input id="ryBxRecord-info_fyijiaorenid" type="hidden" name="fyijiaorenid"
								value="${model.fyijiaorenid}"> <input
								id="ryBxRecord-info_fyijioaren" type="text" value="${model.fyijioaren}"
								disabled class=" required" style="width: 175px;" value="">
							<span class="add-on"
								style="padding-top: 2px; padding-bottom: 2px;"><i
								class="icon-user"></i></span>
						</div>
					    </div>
				  	</div>
			    		<div class="span5"> 
				    <label class="control-label" for="jl-pjNy-info_fyijiaodate"><spring:message code="jl-pjNy-info.jl-pjNy-info.input.fyijiaodate" text="移交时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="jl-pjNy-info_fyijiaodate" type="text" name="fyijiaodate" value="${model.fyijiaodate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				    </div>
				  </div>
			    <div class="control-group">
			    	<div class="span5"> 
				    <label class="control-label" for="jl-pjNy-info_fjieshourenid"><spring:message code="jl-pjNy-info.jl-pjNy-info.input.fjieshourenid" text="接收人"/></label>
					<div class="controls">
					  	<input id="jl-pjNy-info_fjieshourenid" type="text"   readonly="readonly"  value="${model.fjieshouren}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
				  <div class="span5"> 
				    <label class="control-label" for="jl-pjNy-info_fjieshoudate"><spring:message code="jl-pjNy-info.jl-pjNy-info.input.fjieshourenid" text="接收时间"/></label>
					<div class="controls">
					  	<input id="jl-pjNy-info_fjieshoudate" type="text"  readonly="readonly" value="${model.fjieshoudate}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div>
				  </div>
					<%-- 	<div class="control-group">
				    <label class="control-label" for="jl-pjNy-info_fyjdname"><spring:message code="jl-pjNy-info.jl-pjNy-info.input.fyjdname" text="移交单名称"/></label>
					<div class="controls">
					  	 <input id="jl-pjNy-info_fyjdname" type="text" name="fyjdname" value="${model.fyjdname}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="jl-pjNy-info_fyjdurl"><spring:message code="jl-pjNy-info.jl-pjNy-info.input.fyjdurl" text="移交单URL"/></label>
					<div class="controls">
					  	 <input id="jl-pjNy-info_fyjdurl" type="text" name="fyjdurl" value="${model.fyjdurl}" size="" class="text " minlength="" maxlength="">	
				    </div>
				  </div> --%>
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
		  <region:region-permission permission="jl-pjNyList-info:create">
		  <button class="btn btn-small a-insert" onclick="location.href='jl-pjNyList-info-input.do?mainid=${model.fid}'">新建</button>
		  </region:region-permission>
		  <region:region-permission permission="jl-pjNyList-info:delete">
		  <button class="btn btn-small a-remove" onclick="table.removeAll()">删除</button>
		  </region:region-permission>
		  <!-- <button class="btn btn-small a-export" onclick="table.exportExcel()">导出</button> -->
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
		  <h4 class="title"><spring:message code="jl-pjNyList-info.jl-pjNyList-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="jl-pjNyList-infoGridForm" name="jl-pjNyList-infoGridForm" method='post' action="jl-pjNyList-info-remove.do?mainid=${model.fid}" class="m-form-blank">
  <table id="jl-pjNyList-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        	<th class="sorting" name="fnyno">序号</th>
        	<th class="sorting" name="fnyname">资料名称</th>
        	<th class="sorting" name="fnynum">份数</th>
        	<th class="sorting" name="fnymemo">备注</th>
        <th width="80">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
      	 	 <td>${item.fnyno}</td>
      	 	 <td>${item.fnyname}</td>
      	 	 <td>${item.fnynum}</td>
      	 	 <td>${item.fnymemo}</td>
        <td>
          <a href="jl-pjNyList-info-input.do?id=${item.fid}&mainid=${model.fid}" class="a-update"><spring:message code="core.list.edit" text="编辑"/></a>
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
