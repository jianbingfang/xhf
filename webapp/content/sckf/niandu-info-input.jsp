<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="niandu-info.niandu-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#niandu-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
    
	$("#confirmBtn").click(function() {
		getFiles();
	});
	
})

//在页面定义怎么使用 缓存数据
	function getFiles() {
		var filesIndex = $('#filesUl').children('li[litype="new"]').length;
		$.each($('.files').children(),
						function(index, node) {
							var appendUrl = '<li fujianindex="'+filesIndex+'" litype="new" style="width:300px; height: 35px;">'
									+ '<div><p style="width:180px; float:left;">'
									+ $(node).data("fileName")
									+ "."
									+ $(node).data("fileType")
									+ '</p>'
									+ '<a class="btn" style="float:right;" onclick="removeFujian('
									+ filesIndex
									+ ')" >删除</a>'
									+ '<a class="btn" style="float:right;" href="'
									+ $(node).data("fileUrl")
									+ '" target="_blank">下载</a></div>'
									+ '<input type="hidden" name="ndFiles['
									+ filesIndex
									+ '].ffilename" class="btn-link" value="'
									+ $(node).data("fileName")
									+ "."
									+ $(node).data("fileType")
									+ '">'
									+ '<input type="hidden" name="ndFiles['
									+ filesIndex
									+ '].ffileurl" class="form-control" value="'
									+ $(node).data("fileUrl")
									+ '"><br/>'
									+ '</li>';
							$('#filesUl').append(appendUrl);
							filesIndex++;
						});
		$(".uploadModal").modal('hide');
	}
	
function removeFujian(fujianId) {
	$('[fujianindex="' + fujianId + '"]').remove();
}
    </script>
  </head>

  <body>

    <div class="row-fluid">

	  <!-- start of main -->

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="niandu-info.niandu-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">
	<%@include file="../comm/comm-upload.jsp"%>
<form id="niandu-infoForm" method="post" action="niandu-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="niandu-info_id" type="hidden" name="niandu.fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="niandu-info_fyear"><spring:message code="niandu-info.niandu-info.input.fyear" text="年度"/></label>
					<div class="controls">
					  	 <input id="niandu-info_fyear" type="text" name="niandu.fyear" value="${model.fyear}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="niandu-info_fcreatedate"><spring:message code="niandu-info.niandu-info.input.fcreatedate" text="附件"/></label>
				    <div class="controls">
								<input type="button" class="btn a-link" value="点击上传"
									onclick="showUpload()">
							</div>
					<div class="controls">
						<ul id="filesUl" class="nav nav-list" >
							<c:forEach items="${fujians}" var="item">
								<li style="width:300px; height: 35px;">
									<div>
										<p style="width:180px; float:left;">${item.ffilename}</p>
										<a class="btn" style="float:right;"
											href="nianduFile-info-remove.do?id=${item.fid}&yearId=${model.fid}">删除</a>
										<a class="btn" style="float:right;" href="${item.ffileurl}"
											target="_blank">下载</a>
									</div> <input type="hidden" class="btn-link" value="${item.ffilename}">
									<input type="hidden" class="form-control"
									value="${item.ffileurl}"><br/>
								</li>
							</c:forEach>
						</ul>
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

	  <!-- end of main -->
	</div>

  </body>

</html>
