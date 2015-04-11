<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jl-jbxx");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jlFujian-info.jlFujian-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">
    
    
    var formid="";
    
$(function() {
    $("#jlFujian-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
    
    listXcShikuang();
    
    $("#confirmBtn").click(
   		function (){ 
   			saveFile();
   		}
    );
    
});  
 
function saveFile(){
	var fujianFiles=new Array();
	$.each($('.files').children(), function (index,node) {
		var file={
			fname:$(node).data("fileName")+"."+$(node).data("fileType"),
			furl:$(node).data("fileUrl")
		}
		fujianFiles.push(file);
	});
	
	 $.ajax({
			url: '${scopePrefix}/jl/saveXcPic.do',
			data: {
				jlFujians:JSON.stringify(fujianFiles)
			},
			//dataType:'json',
			async:false,
			success: function(data) {
				if(data='ok'){
					listXcShikuang();
				}
			}
	});
	 $(".uploadModal").modal('hide');
}

var fujianId;

function editPic(picId){
	fujianId=picId;
	$('#fmemoText').val('');
	 $('#imgEdit').modal();
}

function saveEditPic(){
	 $.ajax({
			url: '${scopePrefix}/jl/editPic.do',
			async:false,
			type:'POST',
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			data:{
				picId:fujianId,
				fmemoText:$('#fmemoText').val()
			},
			success: function(data) {
				if(data=="ok"){
					 listXcShikuang();
				}
			}
	 });
	 $('#imgEdit').modal('hide');
}


function deletePic(picId){
	 $.ajax({
			url: '${scopePrefix}/jl/deletePic.do',
			async:false,
			data:{
				picId:picId
			},
			success: function(data) {
				if(data=="ok"){
					 listXcShikuang();
				}
			}
		});
}

function listXcShikuang(){
	 $.ajax({
			url: '${scopePrefix}/jl/listXcShikuang.do',
			dataType:'json',
			async:false,
			success: function(data) {
				$('#xcpic').empty();
				for(var i=0;i<data.length;i++){
					$('#xcpic').append(
							'<li class="span3" style="margin-left:0px;margin-right:10px">'
				            +'    <a href="'+data[i].furl+'" target="_blank" class="thumbnail">'
				            +'      <img src="'+data[i].furl+'" style="width: 260px; height: 180px;">'
				            +'    </a>'
				            +'<div class="caption">'
				            +'<p>'+data[i].finfo+'</p>'
				            +'<p><a href="#" class="btn btn-primary" role="button" onclick="editPic('+data[i].fid+')">编辑</a>'
				            +' <a href="#" class="btn btn-default" role="button" onclick="deletePic('+data[i].fid+')">删除</a></p></div>'
				            +'  </li>'
				       );
				}
				}
			});
}

 
    </script>
  </head>

  <body style="padding-top:0px;">
   <%@include file="../comm/comm-upload.jsp"%> 
   
<div id="imgEdit" class="modal hide fade">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <h3>填写备注</h3>
  </div>
  <div class="modal-body">
	 	<div class="control-group">
	    <label class="control-label" for="jlShizhong-info_fwarn"><spring:message code="jlShizhong-info.jlShizhong-info.input.fwarn" text="备注"/></label>
			<div class="controls">
				<textarea id="fmemoText" rows="3" cols="60"></textarea>
	    	</div>
		</div>
  </div>
  <div class="modal-footer">
    <span id="carPickerResult"></span>
    <a id="carPickerBtnClose" href="#" class="btn" data-dismiss="modal">关闭</a>
    <a id="carPickerBtnSelect" href="#"  onclick="saveEditPic()" class="btn btn-primary">保存</a>
  </div>
</div>
		 <section>
          <div class="row-fluid">
             <div style="margin-left: 60px;margin-top: 20px;margin-bottom: 20px;">
         	 	<input type="button" class="btn" value="上传" onclick="showUpload()">
         	 </div>
             <ul id="xcpic" class="thumbnails" >
             <!--  <li class="span3" style="margin-left:0px">
                <a href="http://www.sinaimg.cn/dy/slidenews/2_img/2014_37/730_1324395_686680.jpg" target="_blank" class="thumbnail">
                  <img   src="http://www.sinaimg.cn/dy/slidenews/2_img/2014_37/730_1324395_686680.jpg" style="width: 260px; height: 180px;">
                </a>
              </li>  -->
            </ul> 
          </div>
         </section>
  </body>

</html>
