<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "cw-home");%>
<%pageContext.setAttribute("currentMenu", "cwfujian");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="cwfujian-info.cwfujian-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
$(function() {
    $("#cwfujian-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
    
	//editor.config.toolbar='full';
	$("#confirmBtn").click(function() {
		getFiles();
	});
});

	//在页面定义怎么使用 缓存数据
	function getFiles() {
		var filesIndex = $('#filesUl').children('li[litype="new"]').length;
		$.each($('.files').children(),
						function(index, node) {
							save($(node).data("fileName")+ "."+ $(node).data("fileType"),$(node).data("fileUrl"));
							filesIndex++;
						});
		$(".uploadModal").modal('hide');
	}

	function removeFujian(fujianId) {
		$('[fujianindex="' + fujianId + '"]').remove();
	}
	
	function save(fileName,fileUrl){
		$.ajax({
			url : '${scopePrefix}/cw/cwfujian-info-save-ajax.do',
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			type : 'POST',
			data : {
				ffilename :fileName,
				ffileurl:fileUrl
			},
			async : false,
			dataType:'json',
			success : function(data) {
				var appendUrl = '<li fujianindex="'+data.fid+'" litype="new" style="width:300px; height: 35px;">'
					+ '<div><p style="width:180px; float:left;">'
					+ fileName
					+ '</p>'
					+ '<a class="btn" style="float:right;" onclick="removeFujian('
					+ data.fid
					+ ')" >删除</a>'
					+ '<a class="btn" style="float:right;" href="'
					+ fileUrl
					+ '" target="_blank">下载</a></div>'
					+ '<br/>'
					+ '</li>';
				$('#filesUl').append(appendUrl);
			}
		});
	}
	
	
	function removeFujian(fujianId) {
		window.location.href="cwfujian-info-remove.do?id="+fujianId;
	}
	
    </script>
  </head>

  <body>
    <%@include file="/header.jsp"%>

    <div class="row-fluid">
	  <%@include file="/menu/cw-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="cwfujian-info.cwfujian-info.input.title" text="经审计的财务报表" /></h4>
		</header>

		<div class="content content-inner">

<%@include file="../comm/comm-upload.jsp"%>
	
<form id="cwfujian-infoForm" method="post" action="cwfujian-info-save.do" class="form-horizontal">
		
	
		
		<div class="control-group" >
			<div id="files">
				<ul id="filesUl" class="nav nav-list" >
					<c:forEach items="${model}" var="item">
						<li style="width:500px; height: 35px;">
							<div>
								<h4 style="width:300px; float:left;">${item.ffilename}</h4>
								<a class="text" style="float:right;"
									href="cwfujian-info-remove.do?id=${item.fid}">删除</a>
									<a style="float:right;">&nbsp;&nbsp;&nbsp;</a>
								<a class="text" style="float:right;" href="${item.ffileurl}"
									target="_blank">下载</a>
							</div> <input type="hidden" class="btn-link" value="${item.ffilename}">
							<input type="hidden" class="form-control"
							value="${item.ffileurl}"><br/>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
			<div class="control-group " >
			<label class="control-label" for="jlShizhong-info_fwarn"><spring:message
					code="jlShizhong-info.jlShizhong-info.input.fwarn" text="" /></label>
			<div class="controls">
				<input type="button" class="btn a-link" value="上传财务报表"
					onclick="showUpload()">
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
