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

<form id="jlShiqian-infoForm" method="post" action="jlShiqian-zl-saveMore.do" class="form-horizontal">
			    <div class="control-group">
			    <div class="span10">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="建设工地土地使用证"/></label>

					<%--<input id="jlShiqian-zl_" type="text" name="fskdw" value="${model.fskdw}" size="" class="text " minlength=""--%>
							   <%--maxlength="">--%>
					<input type="radio" name="jlShiqian[1].fstatus" value="有" <c:if test="${model['SHIQIAN_ZILIAO_JIANSHEYONGDIXUKEZHENG'].fstatus=='有'}"> checked="checked"  </c:if> > 有
					<div class="controls">
						<input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[0].fid" value="${model['SHIQIAN_ZILIAO_TUDISHIYONGZHENG'].fid}" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[0].ftype" value="SHIQIAN_ZILIAO" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_fitem" type="hidden" name="jlShiqian[0].fitem" value="SHIQIAN_ZILIAO_TUDISHIYONGZHENG" size="" class="text required" minlength="" maxlength="">		
						  	
						  	<label class="radio-inline" style="float: left;">
								<input type="radio" name="jlShiqian[0].fstatus" value="有" <c:if test="${model['SHIQIAN_ZILIAO_TUDISHIYONGZHENG'].fstatus=='有'}"> checked="checked"  </c:if> > 有
								<input type="radio" name="jlShiqian[0].fstatus" value="无" <c:if test="${model['SHIQIAN_ZILIAO_TUDISHIYONGZHENG'].fstatus=='无'}"> checked="checked"  </c:if> > 无
								&nbsp;&nbsp;审核状态
								<select style="width: 100px;" class="form-control" id="jlXgdw-info_fdwtype" name="jlShiqian[0].fshstatus" value="${model['SHIQIAN_ZILIAO_TUDISHIYONGZHENG'].fshstatus}" class="required " >
						    	 	<option value=""  ></option>
						    	 	<option value="通过"  <c:if test="${model['SHIQIAN_ZILIAO_TUDISHIYONGZHENG'].fshstatus=='通过'}"> selected="selected"</c:if>>通过</option>
						    	 	<option value="不通过" <c:if test="${model['SHIQIAN_ZILIAO_TUDISHIYONGZHENG'].fshstatus=='不通过'}"> selected="selected"</c:if>>不通过</option>
					 			</select>
					 			&nbsp;&nbsp;备注
								<input type="text" name="jlShiqian[0].fmemo"  value="${model['SHIQIAN_ZILIAO_TUDISHIYONGZHENG'].fmemo}" >
							</label>
						  	
							<%-- <div><div style="float: left;" divFIndex="0">
									<a class="btn btn-link" href="${model['SHIQIAN_ZILIAO_TUDISHIYONGZHENG-FUJIAN'].furl}" >${model['SHIQIAN_ZILIAO_TUDISHIYONGZHENG-FUJIAN'].fname}</a>
										<input type="hidden" name="jlShiqian[0].ffilename" value="${model['SHIQIAN_ZILIAO_TUDISHIYONGZHENG-FUJIAN'].fname}">
										<input type="hidden" name="jlShiqian[0].ffileurl" value="${model['SHIQIAN_ZILIAO_TUDISHIYONGZHENG-FUJIAN'].furl}">
								</div>
								<a  class="btn btn-link" href="javaScript:void(0)" onclick="beforeUpload(0)">上传</a>
							</div> --%>
				    </div>
				  </div>
				  </div>
				  <div class="control-group">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="建设用地规划许可证"/></label>
					<div class="controls">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[1].fid" value="${model['SHIQIAN_ZILIAO_JIANSHEYONGDIXUKEZHENG'].fid}" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[1].ftype" value="SHIQIAN_ZILIAO" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_fitem" type="hidden" name="jlShiqian[1].fitem" value="SHIQIAN_ZILIAO_JIANSHEYONGDIXUKEZHENG" size="" class="text required" minlength="" maxlength="">		
						  	
						  	<label class="radio-inline" style="float: left;">
								<input type="radio" name="jlShiqian[1].fstatus" value="有" <c:if test="${model['SHIQIAN_ZILIAO_JIANSHEYONGDIXUKEZHENG'].fstatus=='有'}"> checked="checked"  </c:if> > 有
								<input type="radio" name="jlShiqian[1].fstatus" value="无" <c:if test="${model['SHIQIAN_ZILIAO_JIANSHEYONGDIXUKEZHENG'].fstatus=='无'}"> checked="checked"  </c:if> > 无
								&nbsp;&nbsp;审核状态
								<select style="width: 100px;" class="form-control" id="jlXgdw-info_fdwtype" name="jlShiqian[1].fshstatus" value="${model['SHIQIAN_ZILIAO_JIANSHEYONGDIXUKEZHENG'].fshstatus}" class="required " >
						    	 	<option value=""  ></option>
						    	 	<option value="通过"  <c:if test="${model['SHIQIAN_ZILIAO_JIANSHEYONGDIXUKEZHENG'].fshstatus=='通过'}"> selected="selected"</c:if>>通过</option>
						    	 	<option value="不通过" <c:if test="${model['SHIQIAN_ZILIAO_JIANSHEYONGDIXUKEZHENG'].fshstatus=='不通过'}"> selected="selected"</c:if>>不通过</option>
					 			</select>
					 			&nbsp;&nbsp;备注
								<input type="text" name="jlShiqian[1].fmemo"  value="${model['SHIQIAN_ZILIAO_JIANSHEYONGDIXUKEZHENG'].fmemo}" >
							</label>
						  	
						<%-- <div><div style="float: left;" divFIndex="1">
									<a class="btn btn-link" href="${model['SHIQIAN_ZILIAO_JIANSHEYONGDIXUKEZHENG-FUJIAN'].furl}" >${model['SHIQIAN_ZILIAO_JIANSHEYONGDIXUKEZHENG-FUJIAN'].fname}</a>
										<input type="hidden" name="jlShiqian[1].ffilename" value="${model['SHIQIAN_ZILIAO_JIANSHEYONGDIXUKEZHENG-FUJIAN'].fname}">
										<input type="hidden" name="jlShiqian[1].ffileurl" value="${model['SHIQIAN_ZILIAO_JIANSHEYONGDIXUKEZHENG-FUJIAN'].furl}">
									</div>
								<a  class="btn btn-link" href="javaScript:void(0)" onclick="beforeUpload(1)">上传</a>
							</div> --%>
				    </div>
				  </div>
				  
	 			    <div class="control-group">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="建设工程规划许可证"/></label>
					<div class="controls">
						<input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[2].fid" value="${model['SHIQIAN_ZILIAO_JIANSHEGONGCHENGXUKEZHENG'].fid}" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[2].ftype" value="SHIQIAN_ZILIAO" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_fitem" type="hidden" name="jlShiqian[2].fitem" value="SHIQIAN_ZILIAO_JIANSHEGONGCHENGXUKEZHENG" size="" class="text required" minlength="" maxlength="">		
						  	<label class="radio-inline" style="float: left;">
								<input type="radio" name="jlShiqian[2].fstatus" value="有" <c:if test="${model['SHIQIAN_ZILIAO_JIANSHEGONGCHENGXUKEZHENG'].fstatus=='有'}"> checked="checked"  </c:if> > 有
								<input type="radio" name="jlShiqian[2].fstatus" value="无" <c:if test="${model['SHIQIAN_ZILIAO_JIANSHEGONGCHENGXUKEZHENG'].fstatus=='无'}"> checked="checked"  </c:if> > 无
								&nbsp;&nbsp;审核状态
								<select style="width: 100px;" class="form-control" id="jlXgdw-info_fdwtype" name="jlShiqian[2].fshstatus" value="${model['SHIQIAN_ZILIAO_JIANSHEGONGCHENGXUKEZHENG'].fshstatus}" class="required " >
						    	 	<option value=""  ></option>
						    	 	<option value="通过"  <c:if test="${model['SHIQIAN_ZILIAO_JIANSHEGONGCHENGXUKEZHENG'].fshstatus=='通过'}"> selected="selected"</c:if>>通过</option>
						    	 	<option value="不通过" <c:if test="${model['SHIQIAN_ZILIAO_JIANSHEGONGCHENGXUKEZHENG'].fshstatus=='不通过'}"> selected="selected"</c:if>>不通过</option>
					 			</select>
					 			&nbsp;&nbsp;备注
								<input type="text" name="jlShiqian[2].fmemo"  value="${model['SHIQIAN_ZILIAO_JIANSHEGONGCHENGXUKEZHENG'].fmemo}" >
							</label>
							<%-- <div><div style="float: left;" divFIndex="2">
										<a class="btn btn-link" href="${model['SHIQIAN_ZILIAO_JIANSHEGONGCHENGXUKEZHENG-FUJIAN'].furl}" >${model['SHIQIAN_ZILIAO_JIANSHEGONGCHENGXUKEZHENG-FUJIAN'].fname}</a>
										<input type="hidden" name="jlShiqian[2].ffilename" value="${model['SHIQIAN_ZILIAO_JIANSHEGONGCHENGXUKEZHENG-FUJIAN'].fname}">
										<input type="hidden" name="jlShiqian[2].ffileurl" value="${model['SHIQIAN_ZILIAO_JIANSHEGONGCHENGXUKEZHENG-FUJIAN'].furl}">
									</div>
								<a  class="btn btn-link" href="javaScript:void(0)" onclick="beforeUpload(2)">上传</a>
							</div> --%>
				    </div>
				  </div>
				  
				   <div class="control-group">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="施工图纸"/></label>
					<div class="controls">
					<input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[3].fid" value="${model['SHIQIAN_ZILIAO_SHIGONGTUZHI'].fid}" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[3].ftype" value="SHIQIAN_ZILIAO" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_fitem" type="hidden" name="jlShiqian[3].fitem" value="SHIQIAN_ZILIAO_SHIGONGTUZHI" size="" class="text required" minlength="" maxlength="">		
						  	
						  	<label class="radio-inline" style="float: left;">
								<input type="radio" name="jlShiqian[3].fstatus" value="有" <c:if test="${model['SHIQIAN_ZILIAO_SHIGONGTUZHI'].fstatus=='有'}"> checked="checked"  </c:if> > 有
								<input type="radio" name="jlShiqian[3].fstatus" value="无" <c:if test="${model['SHIQIAN_ZILIAO_SHIGONGTUZHI'].fstatus=='无'}"> checked="checked"  </c:if> > 无
								&nbsp;&nbsp;审核状态
								<select style="width: 100px;" class="form-control" id="jlXgdw-info_fdwtype" name="jlShiqian[3].fshstatus" value="${model['SHIQIAN_ZILIAO_SHIGONGTUZHI'].fshstatus}" class="required " >
						    	 	<option value=""  ></option>
						    	 	<option value="通过"  <c:if test="${model['SHIQIAN_ZILIAO_SHIGONGTUZHI'].fshstatus=='通过'}"> selected="selected"</c:if>>通过</option>
						    	 	<option value="不通过" <c:if test="${model['SHIQIAN_ZILIAO_SHIGONGTUZHI'].fshstatus=='不通过'}"> selected="selected"</c:if>>不通过</option>
					 			</select>
					 			&nbsp;&nbsp;备注
								<input type="text" name="jlShiqian[3].fmemo"  value="${model['SHIQIAN_ZILIAO_SHIGONGTUZHI'].fmemo}" >
							</label>
							<%-- <div><div style="float: left;" divFIndex="3">
								
									<a class="btn btn-link" href="${model['SHIQIAN_ZILIAO_SHIGONGTUZHI-FUJIAN'].furl}" >${model['SHIQIAN_ZILIAO_SHIGONGTUZHI-FUJIAN'].fname}</a>
										<input type="hidden" name="jlShiqian[3].ffilename" value="${model['SHIQIAN_ZILIAO_SHIGONGTUZHI-FUJIAN'].fname}">
										<input type="hidden" name="jlShiqian[3].ffileurl" value="${model['SHIQIAN_ZILIAO_SHIGONGTUZHI-FUJIAN'].furl}">
										
								</div>
								<a  class="btn btn-link" href="javaScript:void(0)" onclick="beforeUpload(3)">上传</a>
							</div> --%>
				    </div>
				  </div>
				  
				  
				   <div class="control-group">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="施工图审查报告"/></label>
					<div class="controls">
					<input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[14].fid" value="${model['SHIQIAN_ZILIAO_SHIGONGTUZHISHENCHABAOGAO'].fid}" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[14].ftype" value="SHIQIAN_ZILIAO" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_fitem" type="hidden" name="jlShiqian[14].fitem" value="SHIQIAN_ZILIAO_SHIGONGTUZHISHENCHABAOGAO" size="" class="text required" minlength="" maxlength="">		
						  	
						  	<label class="radio-inline" style="float: left;">
								<input type="radio" name="jlShiqian[14].fstatus" value="有" <c:if test="${model['SHIQIAN_ZILIAO_SHIGONGTUZHISHENCHABAOGAO'].fstatus=='有'}"> checked="checked"  </c:if> > 有
								<input type="radio" name="jlShiqian[14].fstatus" value="无" <c:if test="${model['SHIQIAN_ZILIAO_SHIGONGTUZHISHENCHABAOGAO'].fstatus=='无'}"> checked="checked"  </c:if> > 无
								&nbsp;&nbsp;审核状态
								<select style="width: 100px;" class="form-control" id="jlXgdw-info_fdwtype" name="jlShiqian[14].fshstatus" value="${model['SHIQIAN_ZILIAO_SHIGONGTUZHISHENCHABAOGAO'].fshstatus}" class="required " >
						    	 	<option value=""  ></option>
						    	 	<option value="通过"  <c:if test="${model['SHIQIAN_ZILIAO_SHIGONGTUZHISHENCHABAOGAO'].fshstatus=='通过'}"> selected="selected"</c:if>>通过</option>
						    	 	<option value="不通过" <c:if test="${model['SHIQIAN_ZILIAO_SHIGONGTUZHISHENCHABAOGAO'].fshstatus=='不通过'}"> selected="selected"</c:if>>不通过</option>
					 			</select>
					 			&nbsp;&nbsp;备注
								<input type="text" name="jlShiqian[14].fmemo"  value="${model['SHIQIAN_ZILIAO_SHIGONGTUZHISHENCHABAOGAO'].fmemo}" >
							</label>
							<%-- <div><div style="float: left;" divFIndex="3">
								
									<a class="btn btn-link" href="${model['SHIQIAN_ZILIAO_SHIGONGTUZHI-FUJIAN'].furl}" >${model['SHIQIAN_ZILIAO_SHIGONGTUZHI-FUJIAN'].fname}</a>
										<input type="hidden" name="jlShiqian[3].ffilename" value="${model['SHIQIAN_ZILIAO_SHIGONGTUZHI-FUJIAN'].fname}">
										<input type="hidden" name="jlShiqian[3].ffileurl" value="${model['SHIQIAN_ZILIAO_SHIGONGTUZHI-FUJIAN'].furl}">
										
								</div>
								<a  class="btn btn-link" href="javaScript:void(0)" onclick="beforeUpload(3)">上传</a>
							</div> --%>
				    </div>
				  </div>
				  
				   <div class="control-group">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="设计交底及图纸会审"/></label>
					<div class="controls">
						<input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[4].fid" value="${model['SHIQIAN_ZILIAO_SHENCHABAOGAO'].fid}" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[4].ftype" value="SHIQIAN_ZILIAO" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_fitem" type="hidden" name="jlShiqian[4].fitem" value="SHIQIAN_ZILIAO_SHENCHABAOGAO" size="" class="text required" minlength="" maxlength="">		
						  		
						  	<label class="radio-inline" style="float: left;">
								<input type="radio" name="jlShiqian[4].fstatus" value="有" <c:if test="${model['SHIQIAN_ZILIAO_SHENCHABAOGAO'].fstatus=='有'}"> checked="checked"  </c:if> > 有
								<input type="radio" name="jlShiqian[4].fstatus" value="无" <c:if test="${model['SHIQIAN_ZILIAO_SHENCHABAOGAO'].fstatus=='无'}"> checked="checked"  </c:if> > 无
								&nbsp;&nbsp;审核状态
								<select style="width: 100px;" class="form-control" id="jlXgdw-info_fdwtype" name="jlShiqian[4].fshstatus" value="${model['SHIQIAN_ZILIAO_SHENCHABAOGAO'].fshstatus}" class="required " >
						    	 	<option value=""  ></option>
						    	 	<option value="通过"  <c:if test="${model['SHIQIAN_ZILIAO_SHENCHABAOGAO'].fshstatus=='通过'}"> selected="selected"</c:if>>通过</option>
						    	 	<option value="不通过" <c:if test="${model['SHIQIAN_ZILIAO_SHENCHABAOGAO'].fshstatus=='不通过'}"> selected="selected"</c:if>>不通过</option>
					 			</select>
					 			&nbsp;&nbsp;备注
								<input type="text" name="jlShiqian[4].fmemo"  value="${model['SHIQIAN_ZILIAO_SHENCHABAOGAO'].fmemo}" >
							</label>
							<%-- <div><div style="float: left;" divFIndex="4">
									<a class="btn btn-link" href="${model['SHIQIAN_ZILIAO_SHENCHABAOGAO-FUJIAN'].furl}" >${model['SHIQIAN_ZILIAO_SHENCHABAOGAO-FUJIAN'].fname}</a>
										<input type="hidden" name="jlShiqian[4].ffilename" value="${model['SHIQIAN_ZILIAO_SHENCHABAOGAO-FUJIAN'].fname}">
										<input type="hidden" name="jlShiqian[4].ffileurl" value="${model['SHIQIAN_ZILIAO_SHENCHABAOGAO-FUJIAN'].furl}">
							
							</div>
								<a  class="btn btn-link" href="javaScript:void(0)" onclick="beforeUpload(4)">上传</a>
							</div> --%>
				    </div>
				  </div>
				  
				  <div class="control-group">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="消防审查"/></label>
					<div class="controls">
						<input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[5].fid" value="${model['SHIQIAN_ZILIAO_XIAOFANGSHENCHA'].fid}" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[5].ftype" value="SHIQIAN_ZILIAO" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_fitem" type="hidden" name="jlShiqian[5].fitem" value="SHIQIAN_ZILIAO_XIAOFANGSHENCHA" size="" class="text required" minlength="" maxlength="">		
						  	
						  	<label class="radio-inline" style="float: left;">
								<input type="radio" name="jlShiqian[5].fstatus" value="有" <c:if test="${model['SHIQIAN_ZILIAO_XIAOFANGSHENCHA'].fstatus=='有'}"> checked="checked"  </c:if> > 有
								<input type="radio" name="jlShiqian[5].fstatus" value="无" <c:if test="${model['SHIQIAN_ZILIAO_XIAOFANGSHENCHA'].fstatus=='无'}"> checked="checked"  </c:if> > 无
								&nbsp;&nbsp;审核状态
								<select style="width: 100px;" class="form-control" id="jlXgdw-info_fdwtype" name="jlShiqian[5].fshstatus" value="${model['SHIQIAN_ZILIAO_XIAOFANGSHENCHA'].fshstatus}" class="required " >
						    	 	<option value=""  ></option>
						    	 	<option value="通过"  <c:if test="${model['SHIQIAN_ZILIAO_XIAOFANGSHENCHA'].fshstatus=='通过'}"> selected="selected"</c:if>>通过</option>
						    	 	<option value="不通过" <c:if test="${model['SHIQIAN_ZILIAO_XIAOFANGSHENCHA'].fshstatus=='不通过'}"> selected="selected"</c:if>>不通过</option>
					 			</select>
					 			&nbsp;&nbsp;备注
								<input type="text" name="jlShiqian[5].fmemo"  value="${model['SHIQIAN_ZILIAO_XIAOFANGSHENCHA'].fmemo}" >
							</label>
							<%-- <div><div style="float: left;" divFIndex="5">
							
								<a class="btn btn-link" href="${model['SHIQIAN_ZILIAO_XIAOFANGSHENCHA-FUJIAN'].furl}" >${model['SHIQIAN_ZILIAO_XIAOFANGSHENCHA-FUJIAN'].fname}</a>
										<input type="hidden" name="jlShiqian[5].ffilename" value="${model['SHIQIAN_ZILIAO_XIAOFANGSHENCHA-FUJIAN'].fname}">
										<input type="hidden" name="jlShiqian[5].ffileurl" value="${model['SHIQIAN_ZILIAO_XIAOFANGSHENCHA-FUJIAN'].furl}">
										
										</div>
								<a  class="btn btn-link" href="javaScript:void(0)" onclick="beforeUpload(5)">上传</a>
							</div> --%>
				    </div>
				  </div>
				
					  <div class="control-group">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="节能审查"/></label>
					<div class="controls">
						<input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[6].fid" value="${model['SHIQIAN_ZILIAO_JIENENGSHENCHA'].fid}" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[6].ftype" value="SHIQIAN_ZILIAO" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_fitem" type="hidden" name="jlShiqian[6].fitem" value="SHIQIAN_ZILIAO_JIENENGSHENCHA" size="" class="text required" minlength="" maxlength="">		
						  	
						  	<label class="radio-inline" style="float: left;">
								<input type="radio" name="jlShiqian[6].fstatus" value="有" <c:if test="${model['SHIQIAN_ZILIAO_JIENENGSHENCHA'].fstatus=='有'}"> checked="checked"  </c:if> > 有
								<input type="radio" name="jlShiqian[6].fstatus" value="无" <c:if test="${model['SHIQIAN_ZILIAO_JIENENGSHENCHA'].fstatus=='无'}"> checked="checked"  </c:if> > 无
								&nbsp;&nbsp;审核状态
								<select style="width: 100px;" class="form-control" id="jlXgdw-info_fdwtype" name="jlShiqian[6].fshstatus" value="${model['SHIQIAN_ZILIAO_JIENENGSHENCHA'].fshstatus}" class="required " >
						    	 	<option value=""  ></option>
						    	 	<option value="通过"  <c:if test="${model['SHIQIAN_ZILIAO_JIENENGSHENCHA'].fshstatus=='通过'}"> selected="selected"</c:if>>通过</option>
						    	 	<option value="不通过" <c:if test="${model['SHIQIAN_ZILIAO_JIENENGSHENCHA'].fshstatus=='不通过'}"> selected="selected"</c:if>>不通过</option>
					 			</select>
					 			&nbsp;&nbsp;备注
								<input type="text" name="jlShiqian[6].fmemo"  value="${model['SHIQIAN_ZILIAO_JIENENGSHENCHA'].fmemo}" >
							</label>
							<%-- <div><div style="float: left;" divFIndex="6">
							
								<a class="btn btn-link" href="${model['SHIQIAN_ZILIAO_XIAOFANGSHENCHA-FUJIAN'].furl}" >${model['SHIQIAN_ZILIAO_XIAOFANGSHENCHA-FUJIAN'].fname}</a>
										<input type="hidden" name="jlShiqian[6].ffilename" value="${model['SHIQIAN_ZILIAO_XIAOFANGSHENCHA-FUJIAN'].fname}">
										<input type="hidden" name="jlShiqian[6].ffileurl" value="${model['SHIQIAN_ZILIAO_XIAOFANGSHENCHA-FUJIAN'].furl}">
										
										</div>
								<a  class="btn btn-link" href="javaScript:void(0)" onclick="beforeUpload(6)">上传</a>
							</div> --%>
				    </div>
				  </div>
				  
				
				 <div class="control-group">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="岩土工程勘察报告和钎探报告"/></label>
					<div class="controls">
						<input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[7].fid" value="${model['SHIQIAN_ZILIAO_YANGTUKANTANBAOGAO'].fid}" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[7].ftype" value="SHIQIAN_ZILIAO" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_fitem" type="hidden" name="jlShiqian[7].fitem" value="SHIQIAN_ZILIAO_YANGTUKANTANBAOGAO" size="" class="text required" minlength="" maxlength="">		
						  	
						  	<label class="radio-inline" style="float: left;">
								<input type="radio" name="jlShiqian[7].fstatus" value="有" <c:if test="${model['SHIQIAN_ZILIAO_YANGTUKANTANBAOGAO'].fstatus=='有'}"> checked="checked"  </c:if> > 有
								<input type="radio" name="jlShiqian[7].fstatus" value="无" <c:if test="${model['SHIQIAN_ZILIAO_YANGTUKANTANBAOGAO'].fstatus=='无'}"> checked="checked"  </c:if> > 无
								&nbsp;&nbsp;审核状态
								<select style="width: 100px;" class="form-control" id="jlXgdw-info_fdwtype" name="jlShiqian[7].fshstatus" value="${model['SHIQIAN_ZILIAO_YANGTUKANTANBAOGAO'].fshstatus}" class="required " >
						    	 	<option value=""  ></option>
						    	 	<option value="通过"  <c:if test="${model['SHIQIAN_ZILIAO_YANGTUKANTANBAOGAO'].fshstatus=='通过'}"> selected="selected"</c:if>>通过</option>
						    	 	<option value="不通过" <c:if test="${model['SHIQIAN_ZILIAO_YANGTUKANTANBAOGAO'].fshstatus=='不通过'}"> selected="selected"</c:if>>不通过</option>
					 			</select>
					 			&nbsp;&nbsp;备注
								<input type="text" name="jlShiqian[7].fmemo"  value="${model['SHIQIAN_ZILIAO_YANGTUKANTANBAOGAO'].fmemo}" >
							</label>
							
						<%-- 	<div><div style="float: left;" divFIndex="6">
								<a class="btn btn-link" href="${model['SHIQIAN_ZILIAO_YANGTUKANTANBAOGAO-FUJIAN'].furl}" >${model['SHIQIAN_ZILIAO_YANGTUKANTANBAOGAO-FUJIAN'].fname}</a>
										<input type="hidden" name="jlShiqian[6].ffilename" value="${model['SHIQIAN_ZILIAO_YANGTUKANTANBAOGAO-FUJIAN'].fname}">
										<input type="hidden" name="jlShiqian[6].ffileurl" value="${model['SHIQIAN_ZILIAO_YANGTUKANTANBAOGAO-FUJIAN'].furl}">
							</div>
								<a  class="btn btn-link" href="javaScript:void(0)" onclick="beforeUpload(6)">上传</a>
							</div> --%>
				    </div>
				  </div>
				  
				  
				   <div class="control-group">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="文物勘探结果报告"/></label>
					<div class="controls">
						<input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[8].fid" value="${model['SHIQIAN_ZILIAO_WENWUKANTANBAOGAO'].fid}" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[8].ftype" value="SHIQIAN_ZILIAO" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_fitem" type="hidden" name="jlShiqian[8].fitem" value="SHIQIAN_ZILIAO_WENWUKANTANBAOGAO" size="" class="text required" minlength="" maxlength="">		
						  	
						  	<label class="radio-inline" style="float: left;">
								<input type="radio" name="jlShiqian[8].fstatus" value="有" <c:if test="${model['SHIQIAN_ZILIAO_WENWUKANTANBAOGAO'].fstatus=='有'}"> checked="checked"  </c:if> > 有
								<input type="radio" name="jlShiqian[8].fstatus" value="无" <c:if test="${model['SHIQIAN_ZILIAO_WENWUKANTANBAOGAO'].fstatus=='无'}"> checked="checked"  </c:if> > 无
								&nbsp;&nbsp;审核状态
								<select style="width: 100px;" class="form-control" id="jlXgdw-info_fdwtype" name="jlShiqian[8].fshstatus" value="${model['SHIQIAN_ZILIAO_WENWUKANTANBAOGAO'].fshstatus}" class="required " >
						    	 	<option value=""  ></option>
						    	 	<option value="通过"  <c:if test="${model['SHIQIAN_ZILIAO_WENWUKANTANBAOGAO'].fshstatus=='通过'}"> selected="selected"</c:if>>通过</option>
						    	 	<option value="不通过" <c:if test="${model['SHIQIAN_ZILIAO_WENWUKANTANBAOGAO'].fshstatus=='不通过'}"> selected="selected"</c:if>>不通过</option>
					 			</select>
					 			&nbsp;&nbsp;备注
								<input type="text" name="jlShiqian[8].fmemo"  value="${model['SHIQIAN_ZILIAO_WENWUKANTANBAOGAO'].fmemo}" >
							</label>
							<%-- <div><div style="float: left;" divFIndex="6">
								<a class="btn btn-link" href="${model['SHIQIAN_ZILIAO_WENWUKANTANBAOGAO-FUJIAN'].furl}" >${model['SHIQIAN_ZILIAO_WENWUKANTANBAOGAO-FUJIAN'].fname}</a>
										<input type="hidden" name="jlShiqian[6].ffilename" value="${model['SHIQIAN_ZILIAO_WENWUKANTANBAOGAO-FUJIAN'].fname}">
										<input type="hidden" name="jlShiqian[6].ffileurl" value="${model['SHIQIAN_ZILIAO_WENWUKANTANBAOGAO-FUJIAN'].furl}">
							</div>
								<a  class="btn btn-link" href="javaScript:void(0)" onclick="beforeUpload(6)">上传</a>
							</div> --%>
				    </div>
				  </div>
				  
				  
				   <div class="control-group">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="中标通知书"/></label>
					<div class="controls">
						<input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[9].fid" value="${model['SHIQIAN_ZILIAO_ZHONGBIAOTONGZHISHU'].fid}" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[9].ftype" value="SHIQIAN_ZILIAO" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_fitem" type="hidden" name="jlShiqian[9].fitem" value="SHIQIAN_ZILIAO_ZHONGBIAOTONGZHISHU" size="" class="text required" minlength="" maxlength="">		
						  	
						  	<label class="radio-inline" style="float: left;">
								<input type="radio" name="jlShiqian[9].fstatus" value="有" <c:if test="${model['SHIQIAN_ZILIAO_ZHONGBIAOTONGZHISHU'].fstatus=='有'}"> checked="checked"  </c:if> > 有
								<input type="radio" name="jlShiqian[9].fstatus" value="无" <c:if test="${model['SHIQIAN_ZILIAO_ZHONGBIAOTONGZHISHU'].fstatus=='无'}"> checked="checked"  </c:if> > 无
								&nbsp;&nbsp;审核状态
								<select style="width: 90px;" class="form-control" id="jlXgdw-info_fdwtype" name="jlShiqian[9].fshstatus" value="${model['SHIQIAN_ZILIAO_ZHONGBIAOTONGZHISHU'].fshstatus}" class="required " >
						    	 	<option value=""  ></option>
						    	 	<option value="通过"  <c:if test="${model['SHIQIAN_ZILIAO_ZHONGBIAOTONGZHISHU'].fshstatus=='通过'}"> selected="selected"</c:if>>通过</option>
						    	 	<option value="不通过" <c:if test="${model['SHIQIAN_ZILIAO_ZHONGBIAOTONGZHISHU'].fshstatus=='不通过'}"> selected="selected"</c:if>>不通过</option>
					 			</select>
					 			&nbsp;&nbsp;备注
								<input type="text" name="jlShiqian[9].fmemo"  value="${model['SHIQIAN_ZILIAO_ZHONGBIAOTONGZHISHU'].fmemo}" >
							</label>
						  	
							<%-- <div><div style="float: left;" divFIndex="8">
								<a class="btn btn-link" href="${model['SHIQIAN_ZILIAO_ZHONGBIAOTONGZHISHU-FUJIAN'].furl}" >${model['SHIQIAN_ZILIAO_ZHONGBIAOTONGZHISHU-FUJIAN'].fname}</a>
										<input type="hidden" name="jlShiqian[8].ffilename" value="${model['SHIQIAN_ZILIAO_ZHONGBIAOTONGZHISHU-FUJIAN'].fname}">
										<input type="hidden" name="jlShiqian[8].ffileurl" value="${model['SHIQIAN_ZILIAO_ZHONGBIAOTONGZHISHU-FUJIAN'].furl}">
							</div>
								<a  class="btn btn-link" href="javaScript:void(0)" onclick="beforeUpload(8)">上传</a>
							</div> --%>
				    </div>
				  </div>
				  
				  
				   <div class="control-group">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="施工合同"/></label>
					<div class="controls">
						<input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[10].fid" value="${model['SHIQIAN_ZILIAO_SHIGONGHETONG'].fid}" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[10].ftype" value="SHIQIAN_ZILIAO" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_fitem" type="hidden" name="jlShiqian[10].fitem" value="SHIQIAN_ZILIAO_SHIGONGHETONG" size="" class="text required" minlength="" maxlength="">		
						  	
						  	<label class="radio-inline" style="float: left;">
								<input type="radio" name="jlShiqian[10].fstatus" value="有" <c:if test="${model['SHIQIAN_ZILIAO_SHIGONGHETONG'].fstatus=='有'}"> checked="checked"  </c:if> > 有
								<input type="radio" name="jlShiqian[10].fstatus" value="无" <c:if test="${model['SHIQIAN_ZILIAO_SHIGONGHETONG'].fstatus=='无'}"> checked="checked"  </c:if> > 无
								&nbsp;&nbsp;审核状态
								<select style="width: 100px;" class="form-control" id="jlXgdw-info_fdwtype" name="jlShiqian[10].fshstatus" value="${model['SHIQIAN_ZILIAO_SHIGONGHETONG'].fshstatus}" class="required " >
						    	 	<option value=""  ></option>
						    	 	<option value="通过"  <c:if test="${model['SHIQIAN_ZILIAO_SHIGONGHETONG'].fshstatus=='通过'}"> selected="selected"</c:if>>通过</option>
						    	 	<option value="不通过" <c:if test="${model['SHIQIAN_ZILIAO_SHIGONGHETONG'].fshstatus=='不通过'}"> selected="selected"</c:if>>不通过</option>
					 			</select>
					 			&nbsp;&nbsp;备注
								<input type="text" name="jlShiqian[10].fmemo"  value="${model['SHIQIAN_ZILIAO_SHIGONGHETONG'].fmemo}" >
							</label>
						  	
						<%-- 	<div><div style="float: left;" divFIndex="9">
								<a class="btn btn-link" href="${model['SHIQIAN_ZILIAO_SHIGONGHETONG-FUJIAN'].furl}" >${model['SHIQIAN_ZILIAO_SHIGONGHETONG-FUJIAN'].fname}</a>
										<input type="hidden" name="jlShiqian[9].ffilename" value="${model['SHIQIAN_ZILIAO_SHIGONGHETONG-FUJIAN'].fname}">
										<input type="hidden" name="jlShiqian[9].ffileurl" value="${model['SHIQIAN_ZILIAO_SHIGONGHETONG-FUJIAN'].furl}">
							</div>
								<a  class="btn btn-link" href="javaScript:void(0)" onclick="beforeUpload(9)">上传</a>
							</div> --%>
				    </div>
				  </div>
				  
				  
				   <div class="control-group">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="施工许可证"/></label>
					<div class="controls">
						<input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[11].fid" value="${model['SHIQIAN_ZILIAO_SHIGONGXUKEZHENG'].fid}" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[11].ftype" value="SHIQIAN_ZILIAO" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_fitem" type="hidden" name="jlShiqian[11].fitem" value="SHIQIAN_ZILIAO_SHIGONGXUKEZHENG" size="" class="text required" minlength="" maxlength="">		
						  	
						  	<label class="radio-inline" style="float: left;">
								<input type="radio" name="jlShiqian[11].fstatus" value="有" <c:if test="${model['SHIQIAN_ZILIAO_SHIGONGXUKEZHENG'].fstatus=='有'}"> checked="checked"  </c:if> > 有
								<input type="radio" name="jlShiqian[11].fstatus" value="无" <c:if test="${model['SHIQIAN_ZILIAO_SHIGONGXUKEZHENG'].fstatus=='无'}"> checked="checked"  </c:if> > 无
								&nbsp;&nbsp;审核状态
								<select style="width: 100px;" class="form-control" id="jlXgdw-info_fdwtype" name="jlShiqian[11].fshstatus" value="${model['SHIQIAN_ZILIAO_SHIGONGXUKEZHENG'].fshstatus}" class="required " >
						    	 	<option value=""  ></option>
						    	 	<option value="通过"  <c:if test="${model['SHIQIAN_ZILIAO_SHIGONGXUKEZHENG'].fshstatus=='通过'}"> selected="selected"</c:if>>通过</option>
						    	 	<option value="不通过" <c:if test="${model['SHIQIAN_ZILIAO_SHIGONGXUKEZHENG'].fshstatus=='不通过'}"> selected="selected"</c:if>>不通过</option>
					 			</select>
					 			&nbsp;&nbsp;备注
								<input type="text" name="jlShiqian[11].fmemo"  value="${model['SHIQIAN_ZILIAO_SHIGONGXUKEZHENG'].fmemo}" >
							</label>
						  	
						<%-- 	<div><div style="float: left;" divFIndex="10">
								<a class="btn btn-link" href="${model['SHIQIAN_ZILIAO_SHIGONGXUKEZHENG-FUJIAN'].furl}" >${model['SHIQIAN_ZILIAO_SHIGONGXUKEZHENG-FUJIAN'].fname}</a>
										<input type="hidden" name="jlShiqian[10].ffilename" value="${model['SHIQIAN_ZILIAO_SHIGONGXUKEZHENG-FUJIAN'].fname}">
										<input type="hidden" name="jlShiqian[10].ffileurl" value="${model['SHIQIAN_ZILIAO_SHIGONGXUKEZHENG-FUJIAN'].furl}">
							</div>
								<a  class="btn btn-link" href="javaScript:void(0)" onclick="beforeUpload(10)">上传</a>
							</div> --%>
				    </div>
				  </div>
				  
				   <div class="control-group">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="质量监备案表"/></label>
					<div class="controls">
						<input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[12].fid" value="${model['SHIQIAN_ZILIAO_JIANDUDENGJIBIAO'].fid}" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[12].ftype" value="SHIQIAN_ZILIAO" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_fitem" type="hidden" name="jlShiqian[12].fitem" value="SHIQIAN_ZILIAO_JIANDUDENGJIBIAO" size="" class="text required" minlength="" maxlength="">		
						  	
						  	
						  	<label class="radio-inline" style="float: left;">
								<input type="radio" name="jlShiqian[12].fstatus" value="有" <c:if test="${model['SHIQIAN_ZILIAO_JIANDUDENGJIBIAO'].fstatus=='有'}"> checked="checked"  </c:if> > 有
								<input type="radio" name="jlShiqian[12].fstatus" value="无" <c:if test="${model['SHIQIAN_ZILIAO_JIANDUDENGJIBIAO'].fstatus=='无'}"> checked="checked"  </c:if> > 无
								&nbsp;&nbsp;审核状态
								<select style="width: 100px;" class="form-control" id="jlXgdw-info_fdwtype" name="jlShiqian[12].fshstatus" value="${model['SHIQIAN_ZILIAO_JIANDUDENGJIBIAO'].fshstatus}" class="required " >
						    	 	<option value=""  ></option>
						    	 	<option value="通过"  <c:if test="${model['SHIQIAN_ZILIAO_JIANDUDENGJIBIAO'].fshstatus=='通过'}"> selected="selected"</c:if>>通过</option>
						    	 	<option value="不通过" <c:if test="${model['SHIQIAN_ZILIAO_JIANDUDENGJIBIAO'].fshstatus=='不通过'}"> selected="selected"</c:if>>不通过</option>
					 			</select>
					 			&nbsp;&nbsp;备注
								<input type="text" name="jlShiqian[12].fmemo"  value="${model['SHIQIAN_ZILIAO_JIANDUDENGJIBIAO'].fmemo}" >
							</label>
						  	
							<%-- <div><div style="float: left;" divFIndex="11">
								<a class="btn btn-link" href="${model['SHIQIAN_ZILIAO_JIANDUDENGJIBIAO-FUJIAN'].furl}" >${model['SHIQIAN_ZILIAO_JIANDUDENGJIBIAO-FUJIAN'].fname}</a>
										<input type="hidden" name="jlShiqian[11].ffilename" value="${model['SHIQIAN_ZILIAO_JIANDUDENGJIBIAO-FUJIAN'].fname}">
										<input type="hidden" name="jlShiqian[11].ffileurl" value="${model['SHIQIAN_ZILIAO_JIANDUDENGJIBIAO-FUJIAN'].furl}">
							
							</div>
								<a  class="btn btn-link" href="javaScript:void(0)" onclick="beforeUpload(11)">上传</a>
							</div> --%>
				    </div>
				  </div>
				  
				   <div class="control-group">
				    <label class="control-label" for="jlShiqian-info_ftype"><spring:message code="jlShiqian-info.jlShiqian-info.input.ftype" text="安全监督备案表"/></label>
					<div class="controls">
						<input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[13].fid" value="${model['SHIQIAN_ZILIAO_ANQUANJIANDUSHU'].fid}" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_ftype" type="hidden" name="jlShiqian[13].ftype" value="SHIQIAN_ZILIAO" size="" class="text required" minlength="" maxlength="">
						 <input id="jlShiqian-info_fitem" type="hidden" name="jlShiqian[13].fitem" value="SHIQIAN_ZILIAO_ANQUANJIANDUSHU" size="" class="text required" minlength="" maxlength="">		
						  	<label class="radio-inline" style="float: left;">
								<input type="radio" name="jlShiqian[13].fstatus" value="有" <c:if test="${model['SHIQIAN_ZILIAO_ANQUANJIANDUSHU'].fstatus=='有'}"> checked="checked"  </c:if> > 有
								<input type="radio" name="jlShiqian[13].fstatus" value="无" <c:if test="${model['SHIQIAN_ZILIAO_ANQUANJIANDUSHU'].fstatus=='无'}"> checked="checked"  </c:if> > 无
								&nbsp;&nbsp;审核状态
								<select style="width: 100px;" class="form-control" id="jlXgdw-info_fdwtype" name="jlShiqian[13].fshstatus" value="${model['SHIQIAN_ZILIAO_ANQUANJIANDUSHU'].fshstatus}" class="required " >
						    	 	<option value=""  ></option>
						    	 	<option value="通过"  <c:if test="${model['SHIQIAN_ZILIAO_ANQUANJIANDUSHU'].fshstatus=='通过'}"> selected="selected"</c:if>>通过</option>
						    	 	<option value="不通过" <c:if test="${model['SHIQIAN_ZILIAO_ANQUANJIANDUSHU'].fshstatus=='不通过'}"> selected="selected"</c:if>>不通过</option>
					 			</select>
					 			&nbsp;&nbsp;备注
								<input type="text" name="jlShiqian[13].fmemo"  value="${model['SHIQIAN_ZILIAO_ANQUANJIANDUSHU'].fmemo}" >
							</label>
							<%-- <div><div style="float: left;" divFIndex="12">
								<a class="btn btn-link" href="${model['SHIQIAN_ZILIAO_ANQUANJIANDUSHU-FUJIAN'].furl}" >${model['SHIQIAN_ZILIAO_ANQUANJIANDUSHU-FUJIAN'].fname}</a>
										<input type="hidden" name="jlShiqian[12].ffilename" value="${model['SHIQIAN_ZILIAO_ANQUANJIANDUSHU-FUJIAN'].fname}">
										<input type="hidden" name="jlShiqian[12].ffileurl" value="${model['SHIQIAN_ZILIAO_ANQUANJIANDUSHU-FUJIAN'].furl}">
							</div>
								<a  class="btn btn-link" href="javaScript:void(0)" onclick="beforeUpload(12)">上传</a>
							</div> --%>
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
