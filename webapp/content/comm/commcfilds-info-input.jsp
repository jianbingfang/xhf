<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "comm-home");%>
<%pageContext.setAttribute("currentMenu", "user-defined");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="commcfilds-info.commcfilds-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript" src="${ctx}/s/ckeditor/ckeditor.js"></script>
    <script type="text/javascript">

$(function() {
    $("#commcfilds-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
})

function changeInputType(){
	var ftype=$('#commcfilds-info_ftype option:selected').val();
	if(ftype==3||ftype==4){
		$('#valuesSelect').show();
		if(editor){
			$('#cke_commcfilds-info_fdvalue').remove();
			$('#commcfilds-info_fdvalue').show();
			$('#commcfilds-info_fdvalue').css("visibility","");
			
		}
	}else if(ftype==7){
		$('#valuesSelect').hide();
		loadEditor();
	}else{
		$('#valuesSelect').hide();
		if(editor){
			$('#cke_commcfilds-info_fdvalue').remove();
			$('#commcfilds-info_fdvalue').show();
			$('#commcfilds-info_fdvalue').css("visibility","");
		}
	}

}

var editor;
function loadEditor(){
	editor = CKEDITOR.replace('commcfilds-info_fdvalue');
	editor.config.filebrowserImageUploadUrl = "${scopePrefix}/comm/editor-article-uploadImage.do";
	editor.config.width = 500;
	editor.config.height = 400; 
}


    </script>
  </head>

  <body>
    <%@include file="/header.jsp"%>

    <div class="row-fluid">
	  <%@include file="/menu/scope.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="commcfilds-info.commcfilds-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="commcfilds-infoForm" method="post" action="commcfilds-info-save.do" class="form-horizontal">
			
			  <c:if test="${model != null}">
				  <input id="commcfilds-info_id" type="hidden" name="fid" value="${model.fid}">
			  </c:if>
			  
					<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="commcfilds-info_fcode"><spring:message code="commcfilds-info.commcfilds-info.input.fcode" text="分类代码"/></label>
						<div class="controls">
							  	 <input id="commcfilds-info_fcode" type="text" disabled="disabled" name="fcode" value="${model.fcode}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="commcfilds-info_fname"><spring:message code="commcfilds-info.commcfilds-info.input.fname" text="字段名称"/></label>
						<div class="controls">
							  	 <input id="commcfilds-info_fname" type="text" name="fname" value="${model.fname}" size="" class="text required" minlength="" maxlength="">	
					    </div>
					    </div>
				    </div>
						<div class="control-group">
							<div class="span5">
						    <label class="control-label" for="commcfilds-info_ftype"><spring:message code="commcfilds-info.commcfilds-info.input.ftype" text="字段类型"/></label>
							<div class="controls">
						   		 <select id="commcfilds-info_ftype" type="text" name="ftype" onchange="changeInputType()">
						   				<option value="1"  <c:if test="${model.ftype==1}"> selected="selected"  </c:if>>文本</option>
						   				<option value="2"  <c:if test="${model.ftype==2}"> selected="selected"  </c:if>>数字</option>
						   				<option value="3"  <c:if test="${model.ftype==3}"> selected="selected"  </c:if>>选择</option>
						   				<option value="4"  <c:if test="${model.ftype==4}"> selected="selected"  </c:if>>单选</option>
						   				<option value="5"  <c:if test="${model.ftype==5}"> selected="selected"  </c:if>>日期</option>
						   				<option value="6"  <c:if test="${model.ftype==6}"> selected="selected"  </c:if>>时间</option>
						   				<option value="7"  <c:if test="${model.ftype==7}"> selected="selected"  </c:if>>编辑框</option>
						   				<option value="8"  <c:if test="${model.ftype==8}"> selected="selected"  </c:if>>文件域</option>
						   		</select>
						    </div>
						  </div>
	  					
							<div id="valuesSelect" class="span5"  <c:if test="${model.ftype!=3&&model.ftype!=4}"> style="display: none;" </c:if> >
						    <label class="control-label" for="commcfilds-info_fvalues"><spring:message code="commcfilds-info.commcfilds-info.input.fvalues" text="备选值(多值逗号隔开)"/></label>
							<div class="controls">
							     <textarea id="commcfilds-info_fvalues"  name="fvalues"  class="form-control" rows="6"  style="width:200px" class="text  "  minlength="" maxlength="1024">${model.fvalues}</textarea> 
						    </div>
						    </div>
					    </div>
	 				 
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="commcfilds-info_fdvalue"><spring:message code="commcfilds-info.commcfilds-info.input.fdvalue" text="默认值"/></label>
						<div class="controls">
							  	 <textarea id="commcfilds-info_fdvalue"  name="fdvalue"  size="" class="text " minlength="" maxlength="">	${model.fdvalue}</textarea>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="commcfilds-info_fisshow"><spring:message code="commcfilds-info.commcfilds-info.input.fisshow" text="是否显示"/></label>
						<div class="controls">
					 		 <select id="commcfilds-info_fisshow" type="text" name="fisshow" >
					   				<option value="0"  <c:if test="${model.fisshow==0}"> selected="selected"  </c:if>>否</option>
					   				<option value="1"  <c:if test="${model.fisshow==1}"> selected="selected"  </c:if>>是</option>
					   		</select>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="commcfilds-info_forderstr"><spring:message code="commcfilds-info.commcfilds-info.input.forderstr" text="显示顺序"/></label>
						<div class="controls">
							  	 <input id="commcfilds-info_forderstr" type="text" name="forderstr" value="${model.forderstr}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
					
						<div class="span5">
					    <label class="control-label" for="commcfilds-info_fisgridshow"><spring:message code="commcfilds-info.commcfilds-info.input.fisgridshow" text="列表是否显示"/></label>
						<div class="controls">
					 		 <select id="commcfilds-info_fisgridshow" type="text" name="fisgridshow"   >
					   				<option value="0"  <c:if test="${model.fisgridshow==0}"> selected="selected"  </c:if>>否</option>
					   				<option value="1"  <c:if test="${model.fisgridshow==1}"> selected="selected"  </c:if>>是</option>
					   		</select>
					    </div>
					    </div>
					    
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="commcfilds-info_fcname"><spring:message code="commcfilds-info.commcfilds-info.input.fcname" text="数据库字段名称"/></label>
						<div class="controls">
							  	 <input id="commcfilds-info_fcname" type="text" disabled="disabled" value="${model.fcname}" size="" class="text " minlength="" maxlength="">	
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="commcfilds-info_freqired"><spring:message code="commcfilds-info.commcfilds-info.input.freqired" text="是否必填"/></label>
						<div class="controls">
					   		 <select id="commcfilds-info_freqired" type="text" name="freqired"  >
					   				<option value="0"  <c:if test="${model.freqired==0}"> selected="selected"  </c:if>>否</option>
					   				<option value="1"  <c:if test="${model.freqired==1}"> selected="selected"  </c:if>>是</option>
					   		</select>
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="commcfilds-info_fissys"><spring:message code="commcfilds-info.commcfilds-info.input.fissys" text="是否是系统字段"/></label>
						<div class="controls">
							  <select id="commcfilds-info_fissys" type="text" name="fissys" value="" disabled="disabled" >
					   				<option value="0"  <c:if test="${model.fissys==0}"> selected="selected"  </c:if>>否</option>
					   				<option value="1"  <c:if test="${model.fissys==1}"> selected="selected"  </c:if>>是</option>
					   		</select>
					    </div>
					  </div>
	  
						<div class="span5">
					    <label class="control-label" for="commcfilds-info_fcolwidth"><spring:message code="commcfilds-info.commcfilds-info.input.fcolwidth" text="字段宽度"/></label>
						<div class="controls">
							  	<input id="commcfilds-info_fcolwidth" type="text" name="fcolwidth" value="${model.fcolwidth}" size="" class="number   " minlength="" maxlength="">
					    </div>
					    </div>
					    </div>
	  
						<div class="control-group">
						<div class="span5">
					    <label class="control-label" for="commcfilds-info_fheight"><spring:message code="commcfilds-info.commcfilds-info.input.fheight" text="高度"/></label>
						<div class="controls">
							  	<input id="commcfilds-info_fheight" type="text" name="fheight" value="${model.fheight}" size="" class="number   " minlength="" maxlength="">
					    </div>
					  </div>
					  
					  	<div class="span5">
					    <label class="control-label" for="commcfilds-info_flength"><spring:message code="commcfilds-info.commcfilds-info.input.flength" text="字段长度"/></label>
						<div class="controls">
							  	<input id="commcfilds-info_flength" type="text" name="flength" value="${model.flength}" size="" class="number   " minlength="" maxlength="">
					    </div>
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
	  <!-- end of main -->
	</div>

  </body>

</html>
