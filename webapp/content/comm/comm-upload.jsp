<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<!doctype html>
<html lang="zh">
   <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <head>
		<!-- Bootstrap styles -->
		<!-- Generic page styles -->
		<%--  	<link rel="stylesheet" href="${ctx}/s/jQuery-File-Upload/css/style.css"> --%>		<!-- blueimp Gallery styles -->
		<link rel="stylesheet" href="${ctx}/s/jQuery-File-Upload/css/blueimp-gallery.min.css">
		<!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
		<link rel="stylesheet" href="${ctx}/s/jQuery-File-Upload/css/jquery.fileupload.css">
		<link rel="stylesheet" href="${ctx}/s/jQuery-File-Upload/css/jquery.fileupload-ui.css">
		<!-- CSS adjustments for browsers with JavaScript disabled -->
		<noscript><link rel="stylesheet" href="${ctx}/s/jQuery-File-Upload/css/jquery.fileupload-noscript.css"></noscript>
		<noscript><link rel="stylesheet" href="${ctx}/s/jQuery-File-Upload/css/jquery.fileupload-ui-noscript.css"></noscript> 
		
 		<!--  The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
		
		<!-- The Templates plugin is included to render the upload/download listings -->
		<script src="${ctx}/s/jQuery-File-Upload/js/tmpl.min.js"></script>
		<!-- The Load Image plugin is included for the preview images and image resizing functionality -->
		<script src="${ctx}/s/jQuery-File-Upload/js/load-image.min.js"></script>
		<!-- The Canvas to Blob plugin is included for image resizing functionality -->
		<script src="${ctx}/s/jQuery-File-Upload/js/canvas-to-blob.min.js"></script>
		<!-- Bootstrap JS is not required, but included for the responsive demo navigation -->
		<!-- blueimp Gallery script -->
		<script src="${ctx}/s/jQuery-File-Upload/js/jquery.blueimp-gallery.min.js"></script>
		<!-- The Iframe Transport is required for browsers without support for XHR file uploads --> 
		<script src="${ctx}/s/jQuery-File-Upload/js/vendor/jquery.ui.widget.js"></script>
		<script src="${ctx}/s/jQuery-File-Upload/js/jquery.iframe-transport.js"></script>
		<!-- The basic File Upload plugin -->
		<script src="${ctx}/s/jQuery-File-Upload/js/jquery.fileupload.js"></script>
		<!-- The File Upload processing plugin -->
		 <script src="${ctx}/s/jQuery-File-Upload/js/jquery.fileupload-process.js"></script>
		<!-- The File Upload image preview & resize plugin -->
		<script src="${ctx}/s/jQuery-File-Upload/js/jquery.fileupload-image.js"></script>
		<!-- The File Upload audio preview plugin -->
		<script src="${ctx}/s/jQuery-File-Upload/js/jquery.fileupload-audio.js"></script>
		<!-- The File Upload video preview plugin -->
		<script src="${ctx}/s/jQuery-File-Upload/js/jquery.fileupload-video.js"></script>
		<!-- The File Upload validation plugin -->
		<script src="${ctx}/s/jQuery-File-Upload/js/jquery.fileupload-validate.js"></script>
		<!-- The File Upload user interface plugin -->
		 <script src="${ctx}/s/jQuery-File-Upload/js/jquery.fileupload-ui.js"></script>
		<!-- The main application script -->
		 <%-- <script src="${ctx}/s/jQuery-File-Upload/js/main.js"></script>  --%>
  </head>
  
  <script type="text/javascript">
  
  
  $(function () {
	    $('#fileupload').fileupload({
	        dataType: 'json'
	    });
	});
  
  
  function showUpload(){
	  $(":reset").click();
	  $(".uploadModal").css("top","0");
	  $(".uploadModal").modal();
	
  }
  

  
  </script>

 <div class="modal fade uploadModal" style="width: 800px;top: -40%;" >
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
			<h4 class="modal-title">上传</h4>
		</div>
	 <div class="container">
	<div class="row fileupload-buttonbar">
	 <form id="fileupload" action="${scopePrefix}/comm/comm-uploadFile.do" data-url="${scopePrefix}/comm/comm-uploadFile.do" method="POST" enctype="multipart/form-data">
        <!-- Redirect browsers with JavaScript disabled to the origin page -->
       <!--  <noscript><input type="hidden" name="redirect" value="http://blueimp.github.io/jQuery-File-Upload/"></noscript> -->
        <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
        <div class="row fileupload-buttonbar" style="margin-left: 50px;">
            <div class="col-lg-7">
                <!-- The fileinput-button span is used to style the file input field as button -->
                <span class="btn btn-success fileinput-button" style="color: black;">
                    <i class="glyphicon glyphicon-plus"></i>
                    <span>添加文件...</span>
                    <input type="file" name="files[]" multiple>
                    <!-- <input type="hidden" name="filePath" vlaue=""> -->
                </span>
                <%--<button type="button" class="btn btn-primary start" >--%>
                    <%--<i class="glyphicon glyphicon-upload"></i>--%>
                    <%--<span>开始上传</span>--%>
                <%--</button>--%>
                 <%--<button type="reset" class="btn btn-warning cancel">--%>
                    <%--<i class="glyphicon glyphicon-ban-circle"></i>--%>
                    <%--<span>取消上传</span>--%>
                <%--</button>--%>
                <span class="fileupload-process"></span>
            </div>
            <!-- The global progress state -->
            <div class="col-lg-5 fileupload-progress fade"  style="width:640px;">
                <!-- The global progress bar -->
                <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="">
                    <div class="progress-bar progress-bar-success" style="background:green; width:0%; height: 20px;"></div>
                </div>
                <!-- The extended global progress state -->
                <div class="progress-extended">&nbsp;</div>
            </div>
        </div>
        <!-- The table listing the files available for upload/download -->
        <table role="presentation" class="table table-striped" style="margin-left: 50px;width: 640px;"><tbody class="files"></tbody></table>
    </form>
	</div>
	</div>
	 <div class="modal-footer">
	 	<button type="button" class="btn btn-primary" id="confirmBtn">下一步</button>
        <%--<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>--%>
      </div>
	 </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- <div id="progress">
    <div class="bar" style="width: 0%; height: 18px;background: green;"></div>
</div> -->

<!-- <div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls" data-filter=":even">
    <div class="slides"></div>
    <h3 class="title"></h3>
    <a class="prev">‹</a>
    <a class="next">›</a>
    <a class="close">×</a>
    <a class="play-pause"></a>
    <ol class="indicator"></ol>
</div> -->
<!-- The template to display files available for upload -->
<script id="template-upload" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-upload fade" >
        <td>
            <span class="preview"></span>
        </td>
        <td>
            <p class="name">{%=file.name%}</p>
            <strong class="error text-danger"></strong>
        </td>
        <td>
            <p class="size">Processing...</p>
            <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100"  >
				<div class="progress-bar progress-bar-success" style="background:green;width:0%;height: 20px;">
			</div>
			</div>
        </td>
        <td>
            {% if (!i && !o.options.autoUpload) { %}
                <button class="btn btn-primary start" disabled>
                    <i class="glyphicon glyphicon-upload"></i>
                    <span>上传</span>
                </button>
            {% } %}
            {% if (!i) { %}
                <button class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>取消</span>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
</script>
<!-- The template to display files available for download -->
<script id="template-download" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-download fade">
        <td>
            <span class="preview">
                {% if (file.thumbnailUrl) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" data-gallery><img src="{%=file.thumbnailUrl%}"></a>
                {% } %}
            </span>
        </td>
        <td>
            <p class="name">
                {% if (file.url) { %}
                    <a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>
                {% } else { %}
                    <span>{%=file.name%}</span>
                {% } %}
            </p>
            {% if (file.error) { %}
                <div><span class="label label-danger">出错了</span> {%=file.error%}</div>
            {% } %}
        </td>
        <td>
            <span class="size">{%=o.formatFileSize(file.size)%}</span>
        </td>
        <td>
            {% if (file.deleteUrl) { %}
                <button class="btn btn-danger delete" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>
                    <i class="glyphicon glyphicon-trash"></i>
                    <span>删除</span>
                </button>
                <input type="checkbox" name="delete" value="1" class="toggle">
            {% } else { %}
                <button class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>取消</span>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
</script>
  </body>

</html>
