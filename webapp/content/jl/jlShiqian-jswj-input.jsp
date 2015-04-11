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

	  <!-- start of main -->
      <section id="m-main" class="span10">
   	<%@include file="../comm/comm-upload.jsp"%> 
      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="jlShiqian-info.jlShiqian-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="jlShiqian-infoForm" method="post" action="jlShiqian-jswj-saveMore.do" class="form-horizontal">
			    <div class="control-group">
			    <div class="span10">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="设计交底及图纸会审"/></label>
					<div class="controls" style="margin-left:20px;">
						<input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[0].fid" value="${model['SHIQIAN_JISHUWENJIAN_TUZHIHUISHEN'].fid}" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[0].ftype" value="SHIQIAN_JISHUWENJIAN" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_fitem" type="hidden" name="jlShiqian[0].fitem" value="SHIQIAN_JISHUWENJIAN_TUZHIHUISHEN" size="" class="text required" minlength="" maxlength="">		
						  	
						  	<label class="radio-inline" style="float: left;">
								<input type="radio" name="jlShiqian[0].fstatus" value="有" <c:if test="${model['SHIQIAN_JISHUWENJIAN_TUZHIHUISHEN'].fstatus=='有'}"> checked="checked"  </c:if> > 有
								<input type="radio" name="jlShiqian[0].fstatus" value="无" <c:if test="${model['SHIQIAN_JISHUWENJIAN_TUZHIHUISHEN'].fstatus=='无'}"> checked="checked"  </c:if> > 无
								&nbsp;&nbsp;审核状态
								<select style="width: 100px;" class="form-control" id="jlXgdw-info_fdwtype" name="jlShiqian[0].fshstatus" value="${model['SHIQIAN_JISHUWENJIAN_TUZHIHUISHEN'].fshstatus}" class="required " >
						    	 	<option value=""  ></option>
						    	 	<option value="通过"  <c:if test="${model['SHIQIAN_JISHUWENJIAN_TUZHIHUISHEN'].fshstatus=='通过'}"> selected="selected"</c:if>>通过</option>
						    	 	<option value="不通过" <c:if test="${model['SHIQIAN_JISHUWENJIAN_TUZHIHUISHEN'].fshstatus=='不通过'}"> selected="selected"</c:if>>不通过</option>
					 			</select>
					 			&nbsp;&nbsp;备注
								<input type="text" name="jlShiqian[0].fmemo"  value="${model['SHIQIAN_JISHUWENJIAN_TUZHIHUISHEN'].fmemo}" >
							</label>
						  
						<%-- 	<div><div style="float: left;" divFIndex="0">
							
								<a class="btn btn-link" href="${model['SHIQIAN_JISHUWENJIAN_TUZHIHUISHEN-FUJIAN'].furl}" >${model['SHIQIAN_JISHUWENJIAN_TUZHIHUISHEN-FUJIAN'].fname}</a>
										<input type="hidden" name="jlShiqian[0].ffilename" value="${model['SHIQIAN_JISHUWENJIAN_TUZHIHUISHEN-FUJIAN'].fname}">
										<input type="hidden" name="jlShiqian[0].ffileurl" value="${model['SHIQIAN_JISHUWENJIAN_TUZHIHUISHEN-FUJIAN'].furl}">
										</div>
								<a  class="btn btn-link" href="javaScript:void(0)" onclick="beforeUpload(0)">上传</a>
							</div> --%>
				    </div>
				  </div>
				  </div>
				  <div class="control-group">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="工程设计变更"/></label>
					<div class="controls" style="margin-left:20px;">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[1].fid" value="${model['SHIQIAN_JISHUWENJIAN_SHEJIBIANGENG'].fid}" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[1].ftype" value="SHIQIAN_JISHUWENJIAN" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_fitem" type="hidden" name="jlShiqian[1].fitem" value="SHIQIAN_JISHUWENJIAN_SHEJIBIANGENG" size="" class="text required" minlength="" maxlength="">		
						  	
						  	<label class="radio-inline" style="float: left;">
								<input type="radio" name="jlShiqian[1].fstatus" value="有" <c:if test="${model['SHIQIAN_JISHUWENJIAN_SHEJIBIANGENG'].fstatus=='有'}"> checked="checked"  </c:if> > 有
								<input type="radio" name="jlShiqian[1].fstatus" value="无" <c:if test="${model['SHIQIAN_JISHUWENJIAN_SHEJIBIANGENG'].fstatus=='无'}"> checked="checked"  </c:if> > 无
								&nbsp;&nbsp;审核状态
								<select style="width: 100px;" class="form-control" id="jlXgdw-info_fdwtype" name="jlShiqian[1].fshstatus" value="${model['SHIQIAN_JISHUWENJIAN_SHEJIBIANGENG'].fshstatus}" class="required " >
						    	 	<option value=""  ></option>
						    	 	<option value="通过"  <c:if test="${model['SHIQIAN_JISHUWENJIAN_SHEJIBIANGENG'].fshstatus=='通过'}"> selected="selected"</c:if>>通过</option>
						    	 	<option value="不通过" <c:if test="${model['SHIQIAN_JISHUWENJIAN_SHEJIBIANGENG'].fshstatus=='不通过'}"> selected="selected"</c:if>>不通过</option>
					 			</select>
					 			&nbsp;&nbsp;备注
								<input type="text" name="jlShiqian[1].fmemo"  value="${model['SHIQIAN_JISHUWENJIAN_SHEJIBIANGENG'].fmemo}" >
							</label>
							
							<%-- <div><div style="float: left;" divFIndex="1">
								<a class="btn btn-link" href="${model['SHIQIAN_JISHUWENJIAN_SHEJIBIANGENG-FUJIAN'].furl}" >${model['SHIQIAN_JISHUWENJIAN_SHEJIBIANGENG-FUJIAN'].fname}</a>
										<input type="hidden" name="jlShiqian[1].ffilename" value="${model['SHIQIAN_JISHUWENJIAN_SHEJIBIANGENG-FUJIAN'].fname}">
										<input type="hidden" name="jlShiqian[1].ffileurl" value="${model['SHIQIAN_JISHUWENJIAN_SHEJIBIANGENG-FUJIAN'].furl}">
							</div>
							
							
								<a  class="btn btn-link" href="javaScript:void(0)" onclick="beforeUpload(1)">上传</a>
							</div> --%>
				    </div>
				 </div> 
	 			    <div class="control-group">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="施工组织设计"/></label>
					<div class="controls" style="margin-left:20px;">
						<input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[2].fid" value="${model['SHIQIAN_JISHUWENJIAN_SHIGONGZUZHISHEJI'].fid}" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[2].ftype" value="SHIQIAN_JISHUWENJIAN" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_fitem" type="hidden" name="jlShiqian[2].fitem" value="SHIQIAN_JISHUWENJIAN_SHIGONGZUZHISHEJI" size="" class="text required" minlength="" maxlength="">		
						  		  	
						  	<label class="radio-inline" style="float: left;">
								<input type="radio" name="jlShiqian[2].fstatus" value="有" <c:if test="${model['SHIQIAN_JISHUWENJIAN_SHIGONGZUZHISHEJI'].fstatus=='有'}"> checked="checked"  </c:if> > 有
								<input type="radio" name="jlShiqian[2].fstatus" value="无" <c:if test="${model['SHIQIAN_JISHUWENJIAN_SHIGONGZUZHISHEJI'].fstatus=='无'}"> checked="checked"  </c:if> > 无
								&nbsp;&nbsp;审核状态
								<select style="width: 100px;" class="form-control" id="jlXgdw-info_fdwtype" name="jlShiqian[2].fshstatus" value="${model['SHIQIAN_JISHUWENJIAN_SHIGONGZUZHISHEJI'].fshstatus}" class="required " >
						    	 	<option value=""  ></option>
						    	 	<option value="通过"  <c:if test="${model['SHIQIAN_JISHUWENJIAN_SHIGONGZUZHISHEJI'].fshstatus=='通过'}"> selected="selected"</c:if>>通过</option>
						    	 	<option value="不通过" <c:if test="${model['SHIQIAN_JISHUWENJIAN_SHIGONGZUZHISHEJI'].fshstatus=='不通过'}"> selected="selected"</c:if>>不通过</option>
					 			</select>
					 			&nbsp;&nbsp;备注
								<input type="text" name="jlShiqian[2].fmemo"  value="${model['SHIQIAN_JISHUWENJIAN_SHIGONGZUZHISHEJI'].fmemo}" >
							</label>
							
						<%-- 	<div><div style="float: left;" divFIndex="2">
								<a class="btn btn-link" href="${model['SHIQIAN_JISHUWENJIAN_SHIGONGZUZHISHEJI-FUJIAN'].furl}" >${model['SHIQIAN_JISHUWENJIAN_SHIGONGZUZHISHEJI-FUJIAN'].fname}</a>
										<input type="hidden" name="jlShiqian[2].ffilename" value="${model['SHIQIAN_JISHUWENJIAN_SHIGONGZUZHISHEJI-FUJIAN'].fname}">
										<input type="hidden" name="jlShiqian[2].ffileurl" value="${model['SHIQIAN_JISHUWENJIAN_SHIGONGZUZHISHEJI-FUJIAN'].furl}">
							</div>
								<a  class="btn btn-link" href="javaScript:void(0)" onclick="beforeUpload(2)">上传</a>
							</div> --%>
				    </div>
				  </div>
				   <div class="control-group">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="专项施工方案"/></label>
					<div class="controls" style="margin-left:20px;">
					<input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[3].fid" value="${model['SHIQIAN_JISHUWENJIAN_SHIGONGFANGAN'].fid}" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[3].ftype" value="SHIQIAN_JISHUWENJIAN" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_fitem" type="hidden" name="jlShiqian[3].fitem" value="SHIQIAN_JISHUWENJIAN_SHIGONGFANGAN" size="" class="text required" minlength="" maxlength="">		
						  	
						  	<label class="radio-inline" style="float: left;">
								<input type="radio" name="jlShiqian[3].fstatus" value="有" <c:if test="${model['SHIQIAN_JISHUWENJIAN_SHIGONGFANGAN'].fstatus=='有'}"> checked="checked"  </c:if> > 有
								<input type="radio" name="jlShiqian[3].fstatus" value="无" <c:if test="${model['SHIQIAN_JISHUWENJIAN_SHIGONGFANGAN'].fstatus=='无'}"> checked="checked"  </c:if> > 无
								&nbsp;&nbsp;审核状态
								<select style="width: 100px;" class="form-control" id="jlXgdw-info_fdwtype" name="jlShiqian[3].fshstatus" value="${model['SHIQIAN_JISHUWENJIAN_SHIGONGFANGAN'].fshstatus}" class="required " >
						    	 	<option value=""  ></option>
						    	 	<option value="通过"  <c:if test="${model['SHIQIAN_JISHUWENJIAN_SHIGONGFANGAN'].fshstatus=='通过'}"> selected="selected"</c:if>>通过</option>
						    	 	<option value="不通过" <c:if test="${model['SHIQIAN_JISHUWENJIAN_SHIGONGFANGAN'].fshstatus=='不通过'}"> selected="selected"</c:if>>不通过</option>
					 			</select>
					 			&nbsp;&nbsp;备注
								<input type="text" name="jlShiqian[3].fmemo"  value="${model['SHIQIAN_JISHUWENJIAN_SHIGONGFANGAN'].fmemo}" >
							</label>
							
							<%-- <div><div style="float: left;" divFIndex="3">
								<a class="btn btn-link" href="${model['SHIQIAN_JISHUWENJIAN_SHIGONGFANGAN-FUJIAN'].furl}" >${model['SHIQIAN_JISHUWENJIAN_SHIGONGFANGAN-FUJIAN'].fname}</a>
										<input type="hidden" name="jlShiqian[3].ffilename" value="${model['SHIQIAN_JISHUWENJIAN_SHIGONGFANGAN-FUJIAN'].fname}">
										<input type="hidden" name="jlShiqian[3].ffileurl" value="${model['SHIQIAN_JISHUWENJIAN_SHIGONGFANGAN-FUJIAN'].furl}">
							</div>
								<a  class="btn btn-link" href="javaScript:void(0)" onclick="beforeUpload(3)">上传</a>
							</div> --%>
				    </div>
				  </div>
				  
				   <div class="control-group">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="质量保证体系"/></label>
					<div class="controls" style="margin-left:20px;">
						<input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[4].fid" value="${model['SHIQIAN_JISHUWENJIAN_ZHILIANGBAOZHENGTIXI'].fid}" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[4].ftype" value="SHIQIAN_JISHUWENJIAN" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_fitem" type="hidden" name="jlShiqian[4].fitem" value="SHIQIAN_JISHUWENJIAN_ZHILIANGBAOZHENGTIXI" size="" class="text required" minlength="" maxlength="">		
						  	
						  	<label class="radio-inline" style="float: left;">
								<input type="radio" name="jlShiqian[4].fstatus" value="有" <c:if test="${model['SHIQIAN_JISHUWENJIAN_ZHILIANGBAOZHENGTIXI'].fstatus=='有'}"> checked="checked"  </c:if> > 有
								<input type="radio" name="jlShiqian[4].fstatus" value="无" <c:if test="${model['SHIQIAN_JISHUWENJIAN_ZHILIANGBAOZHENGTIXI'].fstatus=='无'}"> checked="checked"  </c:if> > 无
								&nbsp;&nbsp;审核状态
								<select style="width: 100px;" class="form-control" id="jlXgdw-info_fdwtype" name="jlShiqian[4].fshstatus" value="${model['SHIQIAN_JISHUWENJIAN_ZHILIANGBAOZHENGTIXI'].fshstatus}" class="required " >
						    	 	<option value=""  ></option>
						    	 	<option value="通过"  <c:if test="${model['SHIQIAN_JISHUWENJIAN_ZHILIANGBAOZHENGTIXI'].fshstatus=='通过'}"> selected="selected"</c:if>>通过</option>
						    	 	<option value="不通过" <c:if test="${model['SHIQIAN_JISHUWENJIAN_ZHILIANGBAOZHENGTIXI'].fshstatus=='不通过'}"> selected="selected"</c:if>>不通过</option>
					 			</select>
					 			&nbsp;&nbsp;备注
								<input type="text" name="jlShiqian[4].fmemo"  value="${model['SHIQIAN_JISHUWENJIAN_ZHILIANGBAOZHENGTIXI'].fmemo}" >
							</label>
						  	
					<%-- 		<div><div style="float: left;" divFIndex="4">
								<a class="btn btn-link" href="${model['SHIQIAN_JISHUWENJIAN_ZHILIANGBAOZHENGTIXI-FUJIAN'].furl}" >${model['SHIQIAN_JISHUWENJIAN_ZHILIANGBAOZHENGTIXI-FUJIAN'].fname}</a>
										<input type="hidden" name="jlShiqian[4].ffilename" value="${model['SHIQIAN_JISHUWENJIAN_ZHILIANGBAOZHENGTIXI-FUJIAN'].fname}">
										<input type="hidden" name="jlShiqian[4].ffileurl" value="${model['SHIQIAN_JISHUWENJIAN_ZHILIANGBAOZHENGTIXI-FUJIAN'].furl}">
							</div>
								<a  class="btn btn-link" href="javaScript:void(0)" onclick="beforeUpload(4)">上传</a>
							</div>
 --%>				  </div>
				  </div>
				  
				     <div class="control-group">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="安全保证体系"/></label>
					<div class="controls" style="margin-left:20px;">
						<input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[5].fid" value="${model['SHIQIAN_JISHUWENJIAN_ANQUANBAOHENGTIXI'].fid}" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[5].ftype" value="SHIQIAN_JISHUWENJIAN" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_fitem" type="hidden" name="jlShiqian[5].fitem" value="SHIQIAN_JISHUWENJIAN_ANQUANBAOHENGTIXI" size="" class="text required" minlength="" maxlength="">		
						  	
						  	<label class="radio-inline" style="float: left;">
								<input type="radio" name="jlShiqian[5].fstatus" value="有" <c:if test="${model['SHIQIAN_JISHUWENJIAN_ANQUANBAOHENGTIXI'].fstatus=='有'}"> checked="checked"  </c:if> > 有
								<input type="radio" name="jlShiqian[5].fstatus" value="无" <c:if test="${model['SHIQIAN_JISHUWENJIAN_ANQUANBAOHENGTIXI'].fstatus=='无'}"> checked="checked"  </c:if> > 无
								&nbsp;&nbsp;审核状态
								<select style="width: 100px;" class="form-control" id="jlXgdw-info_fdwtype" name="jlShiqian[5].fshstatus" value="${model['SHIQIAN_JISHUWENJIAN_ANQUANBAOHENGTIXI'].fshstatus}" class="required " >
						    	 	<option value=""  ></option>
						    	 	<option value="通过"  <c:if test="${model['SHIQIAN_JISHUWENJIAN_ANQUANBAOHENGTIXI'].fshstatus=='通过'}"> selected="selected"</c:if>>通过</option>
						    	 	<option value="不通过" <c:if test="${model['SHIQIAN_JISHUWENJIAN_ANQUANBAOHENGTIXI'].fshstatus=='不通过'}"> selected="selected"</c:if>>不通过</option>
					 			</select>
					 			&nbsp;&nbsp;备注
								<input type="text" name="jlShiqian[5].fmemo"  value="${model['SHIQIAN_JISHUWENJIAN_ANQUANBAOHENGTIXI'].fmemo}" >
							</label>
						  	
					<%-- 		<div><div style="float: left;" divFIndex="4">
								<a class="btn btn-link" href="${model['SHIQIAN_JISHUWENJIAN_ZHILIANGBAOZHENGTIXI-FUJIAN'].furl}" >${model['SHIQIAN_JISHUWENJIAN_ZHILIANGBAOZHENGTIXI-FUJIAN'].fname}</a>
										<input type="hidden" name="jlShiqian[4].ffilename" value="${model['SHIQIAN_JISHUWENJIAN_ZHILIANGBAOZHENGTIXI-FUJIAN'].fname}">
										<input type="hidden" name="jlShiqian[4].ffileurl" value="${model['SHIQIAN_JISHUWENJIAN_ZHILIANGBAOZHENGTIXI-FUJIAN'].furl}">
							</div>
								<a  class="btn btn-link" href="javaScript:void(0)" onclick="beforeUpload(4)">上传</a>
							</div>
 --%>				  </div>
				  </div>
				  
				  
				     <div class="control-group">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="施工管理措施"/></label>
					<div class="controls" style="margin-left:20px;">
						<input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[6].fid" value="${model['SHIQIAN_JISHUWENJIANSHIGONGGUANLICUOSHI'].fid}" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[6].ftype" value="SHIQIAN_JISHUWENJIAN" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_fitem" type="hidden" name="jlShiqian[6].fitem" value="SHIQIAN_JISHUWENJIANSHIGONGGUANLICUOSHI" size="" class="text required" minlength="" maxlength="">		
						  	
						  	<label class="radio-inline" style="float: left;">
								<input type="radio" name="jlShiqian[6].fstatus" value="有" <c:if test="${model['SHIQIAN_JISHUWENJIANSHIGONGGUANLICUOSHI'].fstatus=='有'}"> checked="checked"  </c:if> > 有
								<input type="radio" name="jlShiqian[6].fstatus" value="无" <c:if test="${model['SHIQIAN_JISHUWENJIANSHIGONGGUANLICUOSHI'].fstatus=='无'}"> checked="checked"  </c:if> > 无
								&nbsp;&nbsp;审核状态
								<select style="width: 100px;" class="form-control" id="jlXgdw-info_fdwtype" name="jlShiqian[6].fshstatus" value="${model['SHIQIAN_JISHUWENJIANSHIGONGGUANLICUOSHI'].fshstatus}" class="required " >
						    	 	<option value=""  ></option>
						    	 	<option value="通过"  <c:if test="${model['SHIQIAN_JISHUWENJIANSHIGONGGUANLICUOSHI'].fshstatus=='通过'}"> selected="selected"</c:if>>通过</option>
						    	 	<option value="不通过" <c:if test="${model['SHIQIAN_JISHUWENJIANSHIGONGGUANLICUOSHI'].fshstatus=='不通过'}"> selected="selected"</c:if>>不通过</option>
					 			</select>
					 			&nbsp;&nbsp;备注
								<input type="text" name="jlShiqian[6].fmemo"  value="${model['SHIQIAN_JISHUWENJIANSHIGONGGUANLICUOSHI'].fmemo}" >
							</label>
						  	
					<%-- 		<div><div style="float: left;" divFIndex="4">
								<a class="btn btn-link" href="${model['SHIQIAN_JISHUWENJIAN_ZHILIANGBAOZHENGTIXI-FUJIAN'].furl}" >${model['SHIQIAN_JISHUWENJIAN_ZHILIANGBAOZHENGTIXI-FUJIAN'].fname}</a>
										<input type="hidden" name="jlShiqian[4].ffilename" value="${model['SHIQIAN_JISHUWENJIAN_ZHILIANGBAOZHENGTIXI-FUJIAN'].fname}">
										<input type="hidden" name="jlShiqian[4].ffileurl" value="${model['SHIQIAN_JISHUWENJIAN_ZHILIANGBAOZHENGTIXI-FUJIAN'].furl}">
							</div>
								<a  class="btn btn-link" href="javaScript:void(0)" onclick="beforeUpload(4)">上传</a>
							</div>
 --%>				  </div>
				  </div>
				     <div class="control-group">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="单位资质及人员证件"/></label>
					<div class="controls" style="margin-left:20px;">
						<a href="zzryzj-info.do">编辑</a>
				  </div>
				  </div>
				     <div class="control-group">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="特殊工种证件"/></label>
					<div class="controls" style="margin-left:20px;">
					<a href="jlzz-info-input.do">编辑</a>
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

      </section>
	  <!-- end of main -->
	</div>

  </body>

</html>
