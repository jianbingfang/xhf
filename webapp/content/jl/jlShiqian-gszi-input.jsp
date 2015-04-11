<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jl-sqzb");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jlShiqian-info.jlShiqian-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#jlShiqian-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
    
    $("#confirmBtn").click(
       		function (){ 
       			changeUploadFile();
       		}
        );
})
var uploadIndex;
function beforeUpload(index){
	uploadIndex=index;
	showUpload();
}
 
function changeUploadFile(){
	$.each($('.files').children(), function (index,node) {
		$('[divFIndex="'+uploadIndex+'"]').html('<a class="btn btn-link" href="'+$(node).data("fileUrl")+'" >'+$(node).data("fileName")+"."+$(node).data("fileType")+'</a>'
				 +'<input type="hidden" name="jlShiqian['+uploadIndex+'].ffilename" value="'+$(node).data("fileName")+"."+$(node).data("fileType")+'">'
				 +'<input type="hidden" name="jlShiqian['+uploadIndex+'].ffileurl" value="'+$(node).data("fileUrl")+'">'
				 );
	});
	 $(".uploadModal").modal('hide');
}
</script>
  </head>

  <body>
    <div class="row-fluid">
	  <!-- start of main -->
      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="jlShiqian-info.jlShiqian-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="jlShiqian-infoForm" method="post" action="jlShiqian-gszi-saveMore.do" class="form-horizontal">
			    <div class="control-group">
			    <div class="span5">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="施工单位资质及人员证件"/></label>
					<div class="controls">
						<input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[0].fid" value="${model['SHIQIAN_ZIZHIZHENGJIAN_SHIGONG'].fid}" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[0].ftype" value="SHIQIAN_ZIZHIZHENGJIAN" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_fitem" type="hidden" name="jlShiqian[0].fitem" value="SHIQIAN_ZIZHIZHENGJIAN_SHIGONG" size="" class="text required" minlength="" maxlength="">		
						 	
						 	<label class="radio-inline" style="float: left;">
								<input type="radio" name="jlShiqian[0].fstatus" value="有" <c:if test="${model['SHIQIAN_ZIZHIZHENGJIAN_SHIGONG'].fstatus=='有'}"> checked="checked"  </c:if> > 有
								<input type="radio" name="jlShiqian[0].fstatus" value="无" <c:if test="${model['SHIQIAN_ZIZHIZHENGJIAN_SHIGONG'].fstatus=='无'}"> checked="checked"  </c:if> > 无
							</label>
						 
				    </div>
				  </div>
				   <div class="span5">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="备注"/></label>
					<div class="controls">
						  <textarea name="jlShiqian[0].fmemo" rows="" cols="">${model['SHIQIAN_ZIZHIZHENGJIAN_SHIGONG'].fmemo}</textarea>
				    </div>
				  </div>
				  </div>
				  <div class="control-group">
				   <div class="span5">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="项目部组成人员证件"/></label>
					<div class="controls">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[1].fid" value="${model['SHIQIAN_ZIZHIZHENGJIAN_XIANGMUBU'].fid}" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[1].ftype" value="SHIQIAN_ZIZHIZHENGJIAN" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_fitem" type="hidden" name="jlShiqian[1].fitem" value="SHIQIAN_ZIZHIZHENGJIAN_XIANGMUBU" size="" class="text required" minlength="" maxlength="">		
						  	
						  	<label class="radio-inline" style="float: left;">
								<input type="radio" name="jlShiqian[1].fstatus" value="有" <c:if test="${model['SHIQIAN_ZIZHIZHENGJIAN_XIANGMUBU'].fstatus=='有'}"> checked="checked"  </c:if> > 有
								<input type="radio" name="jlShiqian[1].fstatus" value="无" <c:if test="${model['SHIQIAN_ZIZHIZHENGJIAN_XIANGMUBU'].fstatus=='无'}"> checked="checked"  </c:if> > 无
							</label>
							
				    </div>
				  </div>
				   <div class="span5">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="备注"/></label>
					<div class="controls">
						  <textarea name="jlShiqian[1].fmemo" rows="" cols="">${model['SHIQIAN_ZIZHIZHENGJIAN_XIANGMUBU'].fmemo}</textarea>
				    </div>
				  </div>
				  </div>
				  
	 			    <div class="control-group">
	 			       <div class="span5">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="大型机械设备安拆单位及人员证件"/></label>
					<div class="controls">
						<input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[2].fid" value="${model['SHIQIAN_ZIZHIZHENGJIAN_JIXIEANCHAI'].fid}" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[2].ftype" value="SHIQIAN_ZIZHIZHENGJIAN" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_fitem" type="hidden" name="jlShiqian[2].fitem" value="SHIQIAN_ZIZHIZHENGJIAN_JIXIEANCHAI" size="" class="text required" minlength="" maxlength="">		
						  	<label class="radio-inline" style="float: left;">
								<input type="radio" name="jlShiqian[2].fstatus" value="有" <c:if test="${model['SHIQIAN_ZIZHIZHENGJIAN_JIXIEANCHAI'].fstatus=='有'}"> checked="checked"  </c:if> > 有
								<input type="radio" name="jlShiqian[2].fstatus" value="无" <c:if test="${model['SHIQIAN_ZIZHIZHENGJIAN_JIXIEANCHAI'].fstatus=='无'}"> checked="checked"  </c:if> > 无
							</label>
				    </div>
				  </div>
				  	   <div class="span5">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="备注"/></label>
					<div class="controls">
						<textarea name="jlShiqian[2].fmemo" rows="" cols="">${model['SHIQIAN_ZIZHIZHENGJIAN_JIXIEANCHAI'].fmemo}</textarea>
				    </div>
				  </div>
				  </div>
				  
					    <div class="controls">
					      <button type="submit" class="btn a-submit"><spring:message code='core.input.save' text='保存'/></button>
						  &nbsp;
					      <button type="button" class="btn a-cancel" onclick="history.back();"><spring:message code='core.input.back' text='返回'/></button>
					    </div>
					  </div>
		</form>
        </div>
      </article>
	  <!-- end of main -->
	</div>

  </body>

</html>
