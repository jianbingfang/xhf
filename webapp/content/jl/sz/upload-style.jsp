<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<!doctype html>
<html lang="zh">
   <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                <button type="button" class="btn btn-primary start" >
                    <i class="glyphicon glyphicon-upload"></i>
                    <span>开始上传</span>
                </button>
                 <button type="reset" class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>取消上传</span>
                </button>
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
	 	<button type="button" class="btn btn-primary" id="confirmBtn">确定</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
	 </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


</html>
