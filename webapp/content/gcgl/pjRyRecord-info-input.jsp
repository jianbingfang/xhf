<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "gcgl-home");%>
<%pageContext.setAttribute("currentMenu", "gcgl-xmry");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="pjRyRecord-info.pjRyRecord-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
          <link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/xmpicker/xmpicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/xmpicker/xmpicker.js"></script>
	
		
    <script type="text/javascript">
$(function() {
    $("#pjRyRecord-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
    
    createxmPicker({
		modalId : 'xmPicker',
		url : '${scopePrefix}/gcgl/pjXm-simple-list.do'
	});
});

function loadPjRy(){
	$.ajax({
		url: '${scopePrefix}/gcgl/pjXmRy-simple-list-ajax.do',
		type:'POST',
		data: {
			fxmid:$('#xzChufa-info_fdcxm').val(),
		},
		dataType:'json',
		success: function(data) {
			var html = '';
			for (var i = 0; i < data.length;i++) {
				var item = data[i];
				html +=
				  '<tr>'
					+'<td><input id="selectedItem' + i + '" type="radio" class="selectedItem" name="selectedItem" value="'
					+ item.fid + '" title="' + item.fname + '"></td>'
					+'<td><label for="selectedItem' + i + '">' + item.fcardno + '</label></td>'
					+'<td><label for="selectedItem' + i + '">' + item.fname + '</label></td>'
					+'<td><label for="selectedItem' + i + '">' + item.fsex + '</label></td>'
				  +'</tr>';
			}
			$('#ryPickerBody').html(html);
		}
	});
}

function showPjrypicker(){
	$('#pjrydiv').modal();
	$('#ryPickerBody').html("");
	loadPjRy();
}

function selectry() {
	$('#pjrydiv').modal('hide');
	var ryPickerElement = $('.ryPicker');
	var selectBoy=$('#ryPickerBody');
	var checkedEl=selectBoy.find('.selectedItem:checked');
	ryPickerElement.children('input[type=hidden]').val(checkedEl.val());
	ryPickerElement.children('input[type=text]').val(checkedEl.attr('title'));
}

    </script>
  </head>

  <body>
    <%@include file="/header.jsp"%>

<div id="pjrydiv" class="modal hide fade">
   <div class="modal-header">
     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
     <h3>选择用户</h3>
   </div>
   <div class="modal-body">
<!--  	  <article class="m-blank">
 	    <div class="pull-left">
 		  <form name="ryForm" method="post" action="javascript:void(0);return false;" class="form-inline m-form-bottom">
     	    <label for="ry_ryname">姓名:</label>
 			<input type="text" style="width:100px;" id="filter_LIKES_fname" name="filter_LIKES_fname" value="">'
     	    <label for="ry_ryname">工号:</label>
 			<input type="text" style="width:100px;" id="filter_LIKES_fcardno" name="filter_LIKES_fcardno" value="">'
 			<button id="search" class="btn btn-small">查询</button>
 		  </form>
 		</div>
 	    <div class="m-clear"></div>
 	  </article> -->
       <article class="m-widget">
         <header class="header">
 		  <h4 class="title">人员列表</h4>
 		</header>
 		<div class="content">
<form id="ryPickerForm" name="ryPickerForm" method="post" action="#" class="m-form-blank">
   <table id="ryPickerGrid" class="m-table table-hover table-bordered">
     <thead>
       <tr>
         <th width="10" class="m-table-check">&nbsp;</th>
         <th>工号</th>
         <th>姓名</th>
         <th>性别</th>
       </tr>
     </thead>
     <tbody id="ryPickerBody">
     </tbody>
   </table>
</form>
         </div>
       </article>
   </div>
   <div class="modal-footer">
     <span id="ryPickerResult"></span>
     <a id="ryPickerBtnClose" href="#" class="btn" data-dismiss="modal">关闭</a>
     <a id="ryPickerBtnSelect" href="#"  onclick="selectry()" class="btn btn-primary">选择</a>
   </div>
</div> 


    <div class="row-fluid">
	  <%@include file="/menu/gcgl-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">
      <div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="gcgl-home.do">工程管理</a> <span class="divider">/</span>
							</li>
							<li>项目人员管理<span class="divider">/</span>
							</li>
							<li class="active">人员调配记录</li>
						</ul>
					</div>
				</div>

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="pjRyRecord-info.pjRyRecord-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="pjRyRecord-infoForm" method="post" action="pjRyRecord-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="pjRyRecord-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="pjRyRecord-info_fdbdate"><spring:message code="pjRyRecord-info.pjRyRecord-info.input.fdbdate" text="日期"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="pjRyRecord-info_fdbdate" type="text" name="fdbdate" value="${model.fdbdate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
				  
				  	<div class="control-group">
				    <label class="control-label" for="pjRyRecord-info_fryid"><spring:message code="pjRyRecord-info.pjRyRecord-info.input.fryid" text="姓名"/></label>
					<div class="controls">
						<div class="input-append ryPicker">
							<input id="ryBxRecord-info_fzhuchiren" type="hidden" name="fryid"
								value="${model.fryid}"> <input
								id="ryBxRecord-info_userName" type="text" value="${ryMap[model.fryid].fname}"
								disabled class=" required" style="width: 175px;" value="">
							<span class="add-on" onclick="showPjrypicker()"
								style="padding-top: 2px; padding-bottom: 2px;"><i
								class="icon-user"></i></span>
						</div>
				    </div>
				  </div>
				  
				  	  	<div class="control-group">
				    <label class="control-label" for="pjRy-info_fdrgw"><spring:message code="pjRy-info.pjRy-info.input.fdrgw" text="岗位"/></label>
					<div class="controls">
							<select class="form-control" id="pjXm-info_fdrgw"
										name="fdrgw" value="${model.fdrgw}" class=" ">
									<option value="总监"
										<c:if test="${model.fdrgw=='总监'}"> selected="selected"  </c:if>>总监</option>
									<option value="总监代表"
										<c:if test="${model.fdrgw=='总监代表'}"> selected="selected"  </c:if>>总监代表</option>
									<option value="专监"
										<c:if test="${model.fdrgw=='专监'}"> selected="selected"  </c:if>>专监</option>
									<option value="监理员"
										<c:if test="${model.fdrgw=='监理员'}"> selected="selected"  </c:if>>监理员</option>
								</select>
				    </div>
					</div>
					
					
				<div class="control-group">
				    <label class="control-label" for="pjRy-info_fzhicheng"><spring:message code="pjRy-info.pjRy-info.input.fzhicheng" text="职称"/></label>
					<div class="controls">
					    	<input id="pjRy-info_fzhicheng" type="text" name="fzhicheng" value="${model.fzhicheng}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
				    </div>
				  </div>
				  
			    	<div class="control-group">
				    <label class="control-label" for="pjRyRecord-info_fdcxm"><spring:message code="pjRyRecord-info.pjRyRecord-info.input.fdcxm" text="调出项目"/></label>
					<div class="controls">
							<div class="input-append xmPicker">
								<input id="xzChufa-info_fdcxm" type="hidden" name="fdcxm"
									value="${model.fdcxm}"> <input
									id="xmBxRecord-info_fdcxm" type="text" value="${xmMap[model.fdcxm].fxmname}" disabled
									class=" required" style="width: 175px;" value=""> <span
									class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
									class="icon-th-list"></i></span>
							</div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjRyRecord-info_fdrxm"><spring:message code="pjRyRecord-info.pjRyRecord-info.input.fdrxm" text="调入项目"/></label>
					<div class="controls">
							<div class="input-append xmPicker">
								<input id="xzChufa-info_fdrxm" type="hidden" name="fdrxm"
									value="${model.fdrxm}"> <input
									id="xmBxRecord-info_fdrxm" type="text" value="${xmMap[model.fdrxm].fxmname}" disabled
									class=" required" style="width: 175px;" value=""> <span
									class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
									class="icon-th-list"></i></span>
							</div>
				    </div>
				  </div>
				  
			
			    	<%-- <div class="control-group">
				    <label class="control-label" for="pjRyRecord-info_fjingbanrenid"><spring:message code="pjRyRecord-info.pjRyRecord-info.input.fjingbanrenid" text="经办人id"/></label>
					<div class="controls">
					  	<input id="pjRyRecord-info_fjingbanrenid" type="text" name="fjingbanrenid" value="${model.fjingbanrenid}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div> --%>
			    
			    <%-- 	<div class="control-group">
				    <label class="control-label" for="pjRyRecord-info_fjingbanren"><spring:message cod="pjRyRecord-info.pjRyRecord-info.input.fjingbanren" text="经办人"/></label>
					<div class="controls">
					  	 <input id="pjRyRecord-info_fjingbanren" type="text" name="fjingbanren" value="${model.fjingbanren}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="pjRyRecord-info_fry"><spring:message code="pjRyRecord-info.pjRyRecord-info.input.fry" text="人员"/></label>
					<div class="controls">
					  	 <input id="pjRyRecord-info_fry" type="text" name="fry" value="${model.fry}" size="" class="text required" minlength="" maxlength="">	
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
	  <!-- end of main -->
	</div>

  </body>

</html>
