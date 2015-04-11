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
    
    $(".control-label").css("text-align","left");
    $(".control-label").css("width","120px");
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
    <%@include file="/header.jsp"%>

    <div class="row-fluid">
	  <%@include file="/menu/jl-workspace.jsp"%>
   	<%@include file="../comm/comm-upload.jsp"%> 
	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="jlShiqian-info.jlShiqian-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="jlShiqian-infoForm" method="post" action="jlShiqian-wenjian-saveMore.do" class="form-horizontal">
			    <div class="control-group">
			    <div class="span10">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="监理规划"/></label>
					<div class="controls" style="margin-left:20px;">
						<input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[0].fid" value="${model['SHIQIAN_JIANLIWENJIAN_JIANLIGUIHUA'].fid}" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[0].ftype" value="SHIQIAN_JIANLIWENJIAN" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_fitem" type="hidden" name="jlShiqian[0].fitem" value="SHIQIAN_JIANLIWENJIAN_JIANLIGUIHUA" size="" class="text required" minlength="" maxlength="">		
							<label class="radio-inline" style="float: left;">
								<input type="radio" name="jlShiqian[0].fstatus" value="有" <c:if test="${model['SHIQIAN_JIANLIWENJIAN_JIANLIGUIHUA'].fstatus=='有'}"> checked="checked"  </c:if> > 有
								<input type="radio" name="jlShiqian[0].fstatus" value="无" <c:if test="${model['SHIQIAN_JIANLIWENJIAN_JIANLIGUIHUA'].fstatus=='无'}"> checked="checked"  </c:if> > 无
								&nbsp;&nbsp;审核阶段
								<select style="width: 100px;" class="form-control" id="jlXgdw-info_fdwtype" name="jlShiqian[0].fshstatus" value="${model['SHIQIAN_JIANLIWENJIAN_JIANLIGUIHUA'].fshstatus}" class="required " >
						    	 	<option value="编制"  <c:if test="${model['SHIQIAN_JIANLIWENJIAN_JIANLIGUIHUA'].fshstatus=='编制'}"> selected="selected"</c:if>>编制</option>
						    	   <option value="审核" <c:if test="${model['SHIQIAN_JIANLIWENJIAN_JIANLIGUIHUA'].fshstatus=='审核'}"> selected="selected"</c:if>>审核</option>
						    	 	<option value="通过"  <c:if test="${model['SHIQIAN_JIANLIWENJIAN_JIANLIGUIHUA'].fshstatus=='通过'}"> selected="selected"</c:if>>通过</option>
						    	 
					 			</select>
					 			&nbsp;&nbsp;备注
								<input type="text" name="jlShiqian[0].fmemo"  value="${model['SHIQIAN_JIANLIWENJIAN_JIANLIGUIHUA'].fmemo}" >
							</label>
					<%-- 		<div><div style="float: left;" divFIndex="0">
								<a class="btn btn-link" href="${model['SHIQIAN_JIANLIWENJIAN_JIANLIGUIHUA-FUJIAN'].furl}" >${model['SHIQIAN_JIANLIWENJIAN_JIANLIGUIHUA-FUJIAN'].fname}</a>
										<input type="hidden" name="jlShiqian[0].ffilename" value="${model['SHIQIAN_JIANLIWENJIAN_JIANLIGUIHUA-FUJIAN'].fname}">
										<input type="hidden" name="jlShiqian[0].ffileurl" value="${model['SHIQIAN_JIANLIWENJIAN_JIANLIGUIHUA-FUJIAN'].furl}">
							</div>
								<a  class="btn btn-link" href="javaScript:void(0)" onclick="beforeUpload(0)">上传</a>
							</div> --%>
						
				    </div>
				  </div>
				  </div>
				  <div class="control-group">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="安全监理方案(规划)"/></label>
					<div class="controls" style="margin-left:20px;">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[1].fid" value="${model['SHIQIAN_JIANLIWENJIAN_ANQUANJIANLIFANGAN'].fid}" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[1].ftype" value="SHIQIAN_JIANLIWENJIAN" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_fitem" type="hidden" name="jlShiqian[1].fitem" value="SHIQIAN_JIANLIWENJIAN_ANQUANJIANLIFANGAN" size="" class="text required" minlength="" maxlength="">		
						  	
						  	<label class="radio-inline" style="float: left;">
								<input type="radio" name="jlShiqian[1].fstatus" value="有" <c:if test="${model['SHIQIAN_JIANLIWENJIAN_ANQUANJIANLIFANGAN'].fstatus=='有'}"> checked="checked"  </c:if> > 有
								<input type="radio" name="jlShiqian[1].fstatus" value="无" <c:if test="${model['SHIQIAN_JIANLIWENJIAN_ANQUANJIANLIFANGAN'].fstatus=='无'}"> checked="checked"  </c:if> > 无
								&nbsp;&nbsp;审核阶段
								<select style="width: 100px;" class="form-control" id="jlXgdw-info_fdwtype" name="jlShiqian[1].fshstatus" value="${model['SHIQIAN_JIANLIWENJIAN_ANQUANJIANLIFANGAN'].fshstatus}" class="required " >
						    	 	<option value=""  ></option>
						    	 	<option value="编制"  <c:if test="${model['SHIQIAN_JIANLIWENJIAN_ANQUANJIANLIFANGAN'].fshstatus=='编制'}"> selected="selected"</c:if>>编制</option>
						    	    <option value="审核" <c:if test="${model['SHIQIAN_JIANLIWENJIAN_ANQUANJIANLIFANGAN'].fshstatus=='审核'}"> selected="selected"</c:if>>审核</option>
						    	 	<option value="通过"  <c:if test="${model['SHIQIAN_JIANLIWENJIAN_ANQUANJIANLIFANGAN'].fshstatus=='通过'}"> selected="selected"</c:if>>通过</option>
					 			</select>
					 			&nbsp;&nbsp;备注
								<input type="text" name="jlShiqian[1].fmemo"  value="${model['SHIQIAN_JIANLIWENJIAN_ANQUANJIANLIFANGAN'].fmemo}" >
							</label>
						<%--<div><div style="float: left;" divFIndex="1">
							<a class="btn btn-link" href="${model['SHIQIAN_JIANLIWENJIAN_ANQUANJIANLIFANGAN-FUJIAN'].furl}" >${model['SHIQIAN_JIANLIWENJIAN_ANQUANJIANLIFANGAN-FUJIAN'].fname}</a>
										<input type="hidden" name="jlShiqian[1].ffilename" value="${model['SHIQIAN_JIANLIWENJIAN_ANQUANJIANLIFANGAN-FUJIAN'].fname}">
										<input type="hidden" name="jlShiqian[1].ffileurl" value="${model['SHIQIAN_JIANLIWENJIAN_ANQUANJIANLIFANGAN-FUJIAN'].furl}">
						</div>
								<a  class="btn btn-link" href="javaScript:void(0)" onclick="beforeUpload(1)">上传</a>
						</div>
						 --%>
				    </div>
				  </div>
				  
				  	  
				   <div class="control-group">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="监理实施细则"/></label>
					<div class="controls" style="margin-left:20px;">
						<input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[4].fid" value="${model['SHIQIAN_JIANLIWENJIAN_JISHISHIXIZE'].fid}" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[4].ftype" value="SHIQIAN_JIANLIWENJIAN" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_fitem" type="hidden" name="jlShiqian[4].fitem" value="SHIQIAN_JIANLIWENJIAN_JISHISHIXIZE" size="" class="text required" minlength="" maxlength="">		
						  	
						  	<label class="radio-inline" style="float: left;">
								<input type="radio" name="jlShiqian[4].fstatus" value="有" <c:if test="${model['SHIQIAN_JIANLIWENJIAN_JISHISHIXIZE'].fstatus=='有'}"> checked="checked"  </c:if> > 有
								<input type="radio" name="jlShiqian[4].fstatus" value="无" <c:if test="${model['SHIQIAN_JIANLIWENJIAN_JISHISHIXIZE'].fstatus=='无'}"> checked="checked"  </c:if> > 无
								&nbsp;&nbsp;审核阶段
								<select style="width: 100px;" class="form-control" id="jlXgdw-info_fdwtype" name="jlShiqian[4].fshstatus" value="${model['SHIQIAN_JIANLIWENJIAN_JISHISHIXIZE'].fshstatus}" class="required " >
						    	 	<option value=""  ></option>
						    	 <option value="编制"  <c:if test="${model['SHIQIAN_JIANLIWENJIAN_JISHISHIXIZE'].fshstatus=='编制'}"> selected="selected"</c:if>>编制</option>
						    	 <option value="审核" <c:if test="${model['SHIQIAN_JIANLIWENJIAN_JISHISHIXIZE'].fshstatus=='审核'}"> selected="selected"</c:if>>审核</option>
						    	 <option value="通过"  <c:if test="${model['SHIQIAN_JIANLIWENJIAN_JISHISHIXIZE'].fshstatus=='通过'}"> selected="selected"</c:if>>通过</option>
					 			</select>
					 			&nbsp;&nbsp;备注
								<input type="text" name="jlShiqian[4].fmemo"  value="${model['SHIQIAN_JIANLIWENJIAN_JISHISHIXIZE'].fmemo}" >
							</label>
						  <%-- 	
							<div><div style="float: left;" divFIndex="4">	<a class="btn btn-link" href="${model['SHIQIAN_JIANLIWENJIAN_JISHISHIXIZE-FUJIAN'].furl}" >${model['SHIQIAN_JIANLIWENJIAN_JISHISHIXIZE-FUJIAN'].fname}</a>
										<input type="hidden" name="jlShiqian[4].ffilename" value="${model['SHIQIAN_JIANLIWENJIAN_JISHISHIXIZE-FUJIAN'].fname}">
										<input type="hidden" name="jlShiqian[4].ffileurl" value="${model['SHIQIAN_JIANLIWENJIAN_JISHISHIXIZE-FUJIAN'].furl}">
							</div>
								<a  class="btn btn-link" href="javaScript:void(0)" onclick="beforeUpload(4)">上传</a>
							</div> --%>
				    </div>
				  </div>
				  
				    <div class="control-group">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="安全监理细则"/></label>
					<div class="controls" style="margin-left:20px;">
					<input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[3].fid" value="${model['SHIQIAN_JIANLIWENJIAN_ANQUANJLXIZE'].fid}" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[3].ftype" value="SHIQIAN_JIANLIWENJIAN" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_fitem" type="hidden" name="jlShiqian[3].fitem" value="SHIQIAN_JIANLIWENJIAN_ANQUANJLXIZE" size="" class="text required" minlength="" maxlength="">		
						  	<label class="radio-inline" style="float: left;">
								<input type="radio" name="jlShiqian[3].fstatus" value="有" <c:if test="${model['SHIQIAN_JIANLIWENJIAN_ANQUANJLXIZE'].fstatus=='有'}"> checked="checked"  </c:if> > 有
								<input type="radio" name="jlShiqian[3].fstatus" value="无" <c:if test="${model['SHIQIAN_JIANLIWENJIAN_ANQUANJLXIZE'].fstatus=='无'}"> checked="checked"  </c:if> > 无
								&nbsp;&nbsp;审核阶段
								<select style="width: 100px;" class="form-control" id="jlXgdw-info_fdwtype" name="jlShiqian[3].fshstatus" value="${model['SHIQIAN_JIANLIWENJIAN_ANQUANJLXIZE'].fshstatus}" class="required " >
						    	 	<option value=""  ></option>
						    	 	 <option value="编制"  <c:if test="${model['SHIQIAN_JIANLIWENJIAN_JISHISHIXIZE'].fshstatus=='编制'}"> selected="selected"</c:if>>编制</option>
						    	 	<option value="审核" <c:if test="${model['SHIQIAN_JIANLIWENJIAN_JISHISHIXIZE'].fshstatus=='审核'}"> selected="selected"</c:if>>审核</option>
						    	 	<option value="通过"  <c:if test="${model['SHIQIAN_JIANLIWENJIAN_ANQUANJLXIZE'].fshstatus=='通过'}"> selected="selected"</c:if>>通过</option>
					 			</select>
					 			&nbsp;&nbsp;备注
								<input type="text" name="jlShiqian[3].fmemo"  value="${model['SHIQIAN_JIANLIWENJIAN_ANQUANJLXIZE'].fmemo}" >
							</label>
						<%-- 	<div><div style="float: left;" divFIndex="3">
								<a class="btn btn-link" href="${model['SHIQIAN_JIANLIWENJIAN_ANQUANJLXIZE-FUJIAN'].furl}" >${model['SHIQIAN_JIANLIWENJIAN_ANQUANJLXIZE-FUJIAN'].fname}</a>
										<input type="hidden" name="jlShiqian[3].ffilename" value="${model['SHIQIAN_JIANLIWENJIAN_ANQUANJLXIZE-FUJIAN'].fname}">
										<input type="hidden" name="jlShiqian[3].ffileurl" value="${model['SHIQIAN_JIANLIWENJIAN_ANQUANJLXIZE-FUJIAN'].furl}">
							</div>
								<a  class="btn btn-link" href="javaScript:void(0)" onclick="beforeUpload(3)">上传</a>
							</div> --%>
				    </div>
				  </div>
				  
	 			    <div class="control-group">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="旁站方案"/></label>
					<div class="controls" style="margin-left:20px;">
						<input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[2].fid" value="${model['SHIQIAN_JIANLIWENJIAN_PANGZHANFANGAN'].fid}" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[2].ftype" value="SHIQIAN_JIANLIWENJIAN" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_fitem" type="hidden" name="jlShiqian[2].fitem" value="SHIQIAN_JIANLIWENJIAN_PANGZHANFANGAN" size="" class="text required" minlength="" maxlength="">		
						  	<label class="radio-inline" style="float: left;">
								<input type="radio" name="jlShiqian[2].fstatus" value="有" <c:if test="${model['SHIQIAN_JIANLIWENJIAN_PANGZHANFANGAN'].fstatus=='有'}"> checked="checked"  </c:if> > 有
								<input type="radio" name="jlShiqian[2].fstatus" value="无" <c:if test="${model['SHIQIAN_JIANLIWENJIAN_PANGZHANFANGAN'].fstatus=='无'}"> checked="checked"  </c:if> > 无
								&nbsp;&nbsp;审核阶段
								<select style="width: 100px;" class="form-control" id="jlXgdw-info_fdwtype" name="jlShiqian[2].fshstatus" value="${model['SHIQIAN_JIANLIWENJIAN_PANGZHANFANGAN'].fshstatus}" class="required " >
						    	 	<option value=""  ></option>
						    	 		 <option value="编制"  <c:if test="${model['SHIQIAN_JIANLIWENJIAN_PANGZHANFANGAN'].fshstatus=='编制'}"> selected="selected"</c:if>>编制</option>
						    	 	<option value="审核" <c:if test="${model['SHIQIAN_JIANLIWENJIAN_PANGZHANFANGAN'].fshstatus=='审核'}"> selected="selected"</c:if>>审核</option>
						    	 	<option value="通过"  <c:if test="${model['SHIQIAN_JIANLIWENJIAN_PANGZHANFANGAN'].fshstatus=='通过'}"> selected="selected"</c:if>>通过</option>
					 			</select>
					 			&nbsp;&nbsp;备注
								<input type="text" name="jlShiqian[2].fmemo"  value="${model['SHIQIAN_JIANLIWENJIAN_PANGZHANFANGAN'].fmemo}" >
							</label>
							<%-- <div><div style="float: left;" divFIndex="2">
								<a class="btn btn-link" href="${model['SHIQIAN_JIANLIWENJIAN_PANGZHANFANGAN-FUJIAN'].furl}" >${model['SHIQIAN_JIANLIWENJIAN_PANGZHANFANGAN-FUJIAN'].fname}</a>
										<input type="hidden" name="jlShiqian[2].ffilename" value="${model['SHIQIAN_JIANLIWENJIAN_PANGZHANFANGAN-FUJIAN'].fname}">
										<input type="hidden" name="jlShiqian[2].ffileurl" value="${model['SHIQIAN_JIANLIWENJIAN_PANGZHANFANGAN-FUJIAN'].furl}">
							</div>
								<a  class="btn btn-link" href="javaScript:void(0)" onclick="beforeUpload(2)">上传</a>
							</div> --%>
				    </div>
				  </div>
				  
				  
				  <div class="control-group">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="监理工作制度"/></label>
					<div class="controls" style="margin-left:20px;">
						<input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[5].fid" value="${model['SHIQIAN_JIANLIWENJIAN_GONGZUOZHIDU'].fid}" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[5].ftype" value="SHIQIAN_JIANLIWENJIAN" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_fitem" type="hidden" name="jlShiqian[5].fitem" value="SHIQIAN_JIANLIWENJIAN_GONGZUOZHIDU" size="" class="text required" minlength="" maxlength="">		
						  
						  	<label class="radio-inline" style="float: left;">
								<input type="radio" name="jlShiqian[5].fstatus" value="有" <c:if test="${model['SHIQIAN_JIANLIWENJIAN_GONGZUOZHIDU'].fstatus=='有'}"> checked="checked"  </c:if> > 有
								<input type="radio" name="jlShiqian[5].fstatus" value="无" <c:if test="${model['SHIQIAN_JIANLIWENJIAN_GONGZUOZHIDU'].fstatus=='无'}"> checked="checked"  </c:if> > 无
								&nbsp;&nbsp;审核阶段
								<select style="width: 100px;" class="form-control" id="jlXgdw-info_fdwtype" name="jlShiqian[5].fshstatus" value="${model['SHIQIAN_JIANLIWENJIAN_GONGZUOZHIDU'].fshstatus}" class="required " >
						    	 	<option value=""  ></option>
						    	    <option value="编制"  <c:if test="${model['SHIQIAN_JIANLIWENJIAN_GONGZUOZHIDU'].fshstatus=='编制'}"> selected="selected"</c:if>>编制</option>
						    	 	<option value="审核" <c:if test="${model['SHIQIAN_JIANLIWENJIAN_GONGZUOZHIDU'].fshstatus=='审核'}"> selected="selected"</c:if>>审核</option>
						    	 	<option value="通过"  <c:if test="${model['SHIQIAN_JIANLIWENJIAN_GONGZUOZHIDU'].fshstatus=='通过'}"> selected="selected"</c:if>>通过</option>
					 			</select>
					 			&nbsp;&nbsp;备注
								<input type="text" name="jlShiqian[5].fmemo"  value="${model['SHIQIAN_JIANLIWENJIAN_GONGZUOZHIDU'].fmemo}" >
							</label>
							<%-- <div><div style="float: left;" divFIndex="5">
								<a class="btn btn-link" href="${model['SHIQIAN_JIANLIWENJIAN_GONGZUOZHIDU-FUJIAN'].furl}" >${model['SHIQIAN_JIANLIWENJIAN_GONGZUOZHIDU-FUJIAN'].fname}</a>
										<input type="hidden" name="jlShiqian[5].ffilename" value="${model['SHIQIAN_JIANLIWENJIAN_GONGZUOZHIDU-FUJIAN'].fname}">
										<input type="hidden" name="jlShiqian[5].ffileurl" value="${model['SHIQIAN_ZILIAO_GONGZUOZHIDU-FUJIAN'].furl}">
							</div>
								<a  class="btn btn-link" href="javaScript:void(0)" onclick="beforeUpload(5)">上传</a>
							</div> --%>
				    </div>
				  </div>
				
					    <div class="controls" >
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
