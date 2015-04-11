<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "comm-home");%>
<%pageContext.setAttribute("currentMenu", "jlShiZhongNew");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jlShiZhongNew-info.jlShiZhongNew-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript" src="${ctx}/s/ckeditor/ckeditor.js"></script>
    <script type="text/javascript">

$(function() {
    $("#jlShiZhongNew-infoForm").validate({
        submitHandler: function(form) {
        	bulidUpload();
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
    
    loadEditor();
    
    $("#confirmBtn").click(function() {
    	getFiles();
    });
});

function bulidUpload(){
	var files= $('ul[filesUl]');
	$.each(files, function(i, n){
		var fileStr="";
		var lis=$(n).children('li');
		$.each(lis, function(j, m){
			var fileDetail=$(m).children('div');
			var fileName=$(fileDetail).children('[filename]').html();
			var fileUrl=$(fileDetail).children('[fileurl]').attr('href');
			fileStr+=fileName+","+fileUrl+";";
		});
		
		$('[name='+$(n).attr('filesUl')+']').val(fileStr);
	});
}

function deleteFujian(el){
	$(el).parent().parent().remove();
}

function loadEditor(){
	var editors=$('textarea[ckeditor]');
	$.each( editors, function(i, n){
		editor = CKEDITOR.replace($(n).attr("id"));
		editor.config.filebrowserImageUploadUrl = "${scopePrefix}/comm/editor-article-uploadImage.do";
		editor.config.width = $(n).attr("w");
		editor.config.height =$(n).attr("h"); 
	});
}

var fileUl;
function upLoad(uploadName){
	fileUl=uploadName;
	showUpload();
}

function getFiles() {
	var filesIndex = $('[filesUl='+fileUl+']').children('li[litype="new"]').length;
	$.each($('.files').children(),
			function(index, node) {
				var appendUrl = '<li fujianindex="'+filesIndex+'" litype="new" style="width:500px; height: 35px;">'
						+ '<div><label  fileName class="control-label" style="float: left; text-align: left;" >'
						+ $(node).data("fileName")
						+ "."
						+ $(node).data("fileType")
						+ '</label>'
						+ '<a class="btn" onclick="deleteFujian()" >删除</a>'
						+ '<a class="btn" fileUrl href="'
						+ $(node).data("fileUrl")
						+ '" target="_blank">下载</a>'
						+'<a class="btn"  href="../common/preview.do?fileUrl='+$(node).data("fileUrl")+'" target="_blank">预览</a></div>'
						+ '</li>';
				$('[filesUl='+fileUl+']').append(appendUrl);
				filesIndex++;
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
		  <h4 class="title"><spring:message code="jlShiZhongNew-info.jlShiZhongNew-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">
	<%@include file="../comm/comm-upload.jsp"%>
	<form id="jlShiZhongNew-infoForm" method="post" action="jlShiZhongNew-info-saveUserDefined.do" class="form-horizontal">
			  <c:if test="${model != null}">
				  <input id="jlShiZhongNew-info_id" type="hidden" name="fid" value="${model.fid}">
			  </c:if>
			 	 <input id="jlShiZhongNew-info_fcode" type="hidden" name="fcode" value="${defineCode}">
					 <c:forEach items="${userDefineds}" var="item">
		        	 	<c:if test="${item.fisshow==1}">
					    <div class="control-group">
							<div class="span5">
						    <label class="control-label" for="jlShiZhongNew-info_${item.fcname}"><spring:message code="jlShiZhongNew-info.jlShiZhongNew-info.input.${item.fcname}" text="${item.fname}"/></label>
							<div class="controls">
									 <c:if test="${item.ftype==1}">
								  		 <input id="jlShiZhongNew-info_${item.fcname}" type="text" name="${item.fcname}" value="${model[item.fcname]==null?item.fdvalue:model[item.fcname]}" <c:if test="${item.freqired==1}">reqired</c:if> size="" class="text" minlength="" maxlength="${item.flength}">
								  	 </c:if>
								  	 <c:if test="${item.ftype==2}">
								  		 <input id="jlShiZhongNew-info_${item.fcname}" type="text" name="${item.fcname}" value="${model[item.fcname]==null?item.fdvalue:model[item.fcname]}" <c:if test="${item.freqired==1}">reqired</c:if> size="" class="number" minlength="" maxlength="${item.flength}">
								  	 </c:if>
								  	 <c:if test="${item.ftype==3}">
								  	 	<select id="jlShiZhongNew-info_${item.fcname}"  name="${item.fcname}">
								  	 		<option ></option>
								  	 		<c:forEach items="${fn:split(item.fvalues,',')}" var="val" >
								  	 			<option <c:if test="${(model[item.fcname]==null?item.fdvalue:model[item.fcname])==val}"> selected="selected"</c:if>>${val}</option>
											 </c:forEach>
								  	 	</select>
								  	 </c:if>
								  	 <c:if test="${item.ftype==4}">
							  	 		 <c:forEach items="${fn:split(item.fvalues,',')}" var="val" >
							  	 			<input type="radio" name="${item.fcname}" value="${val}" <c:if test="${(model[item.fcname]==null?item.fdvalue:model[item.fcname])==val}">  checked="checked" </c:if>/>${val} 
										 </c:forEach>
								  	 </c:if>
								  	 <c:if test="${item.ftype==5}">
								  	 	 	<div class="input-append datepicker date"
												style="padding-left: 0px;">
												<input id="jlShiZhongNew-info_${item.fcname}" type="text"
													name="${item.fcname}" value="${(model[item.fcname]==null?item.fdvalue:model[item.fcname])}" size="40"
													class="text "
													style="background-color:white;cursor:default; width: 175px;">
												<span class="add-on"
													style="padding-top: 2px; padding-bottom: 2px;"><i
													class="icon-calendar"></i></span>
										</div>
								  	 </c:if>
								  	 <c:if test="${item.ftype==6}">
								  		 	<div class="input-append datetimepicker date"
												style="padding-left: 0px;">
												<input id="jlShiZhongNew-info_${item.fcname}" type="text"
													name="${item.fcname}" value="${(model[item.fcname]==null?item.fdvalue:model[item.fcname])}" size="40"
													class="text"
													style="background-color:white;cursor:default; width: 175px;">
												<span class="add-on"
													style="padding-top: 2px; padding-bottom: 2px;"><i
													class="icon-calendar"></i></span>
											</div>
								  	 </c:if>
								  	 <c:if test="${item.ftype==7}">
								  		 <textarea ckeditor w="${item.fcolwidth}" h="${item.fheight}" id="jlShiZhongNew-info_${item.fcname}"   maxlength="${item.flength} type="text" name="${item.fcname}" >${model[item.fcname]==null?item.fdvalue:model[item.fcname]}</textarea>
								  	 </c:if>
								  	 <c:if test="${item.ftype==8}">
									  	 <input type="button" class="btn a-link" value="点击上传"
											onclick="upLoad('${item.fcname}')">
									  	 	<div id="files">
												<ul filesUl="${item.fcname}" class="nav nav-list" >
													<c:forEach items="${fn:split(model[item.fcname],';')}" var="item2">
														<c:set var="item1" value="${fn:split(item2,',')}" ></c:set>
															<li style="width:500px; height: 35px;">
																<div>
																	<label class="control-label" fileName style="float: left; text-align: left;" ><spring:message  text="${item1[0]}"/></label>
																		<a class="btn" 
																			href="javascript:void(0)" onclick="deleteFujian(this)">删除</a>
																		<a class="btn" fileUrl href="${item1[1]}"
																			target="_blank">下载</a>
																		<a class="btn"  href="../common/preview.do?fileUrl=${item1[1]}"
																			target="_blank">预览</a>
																</div> 
															</li> 
													</c:forEach>
												</ul>
											</div>
											<input id="jlShiZhongNew-info_${item.fcname}" type="hidden" name="${item.fcname}" value="${model[item.fcname]}" />
								  	 </c:if>
						    </div>
						  </div>
					    </div>
					    </c:if>
		     		 </c:forEach>
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
