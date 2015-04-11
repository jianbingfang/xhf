<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jl-xmjd");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jlFujian-info.jlFujian-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
       <script type="text/javascript" src="${scopePrefix}/s/xthena/js/ajaxfileupload.js"></script>
    <link type="text/css" rel="stylesheet" href="${scopePrefix}/s/xthena/uploadpicker/uploadpicker.css">
     <script type="text/javascript" src="${ctx}/s/ckeditor/ckeditor.js"></script>
    
    <script type="text/javascript">
    
    var formid="";
    var editor;
$(function() {
	
    $("#jlFujian-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
    loadEditor();
	loadTzTemp();
	
    $('#myTab a').click(function (e) {
    	  e.preventDefault();
    	  $(this).tab('show');
    	  loadTz($(this).attr('tabid'));
    });
    activeFirst();
});

function loadEditor(){
		editor = CKEDITOR.replace('contentEditor');
		editor.config.filebrowserImageUploadUrl = "${scopePrefix}/comm/editor-article-uploadImage.do";
		editor.config.height = 800;
}

function loadTzTemp(){
	$.ajax({
		url : '${scopePrefix}/jl/jlPxjcjlItem-info-list-ajax.do',
		contentType: 'application/x-www-form-urlencoded; charset=utf-8',
		type:'POST',
		async : false,
		dataType:'json',
		success : function(data) {
			if(data){
				for(var i=0;i<data.length;i++){
					$('#myTab').append('<li role="presentation"><a tabid="'+data[i].fid+'" href="#tab'+data[i].fid+'">'+data[i].fname+'</a></li>'	);
				}
			}
		},
		error:function(){
			alert("保存失败！");
		}
	});
}


function loadTz(tempId){
	$.ajax({
		url : '${scopePrefix}/jl/jlPxjcjl-info-input-ajax.do',
		contentType: 'application/x-www-form-urlencoded; charset=utf-8',
		type:'POST',
		dataType:'json',
		data:{
			tempId:tempId
		},
		async : false,
		success : function(data) {
			if(data){
				$('#contentEditor').val(data.fcontent);
				editor.setData(data.fcontent);
			}
		},
		error:function(){
			alert("保存失败！");
		}
	});
}

function saveTz(){
	var tempId=$('li.active a').attr('tabid');
	$.ajax({
		url : '${scopePrefix}/jl/jlPxjcjl-info-save-ajax.do',
		contentType: 'application/x-www-form-urlencoded; charset=utf-8',
		type:'POST',
		data:{
			tempId:tempId,
			tzData:editor.getData()
		},
		async : false,
		success : function(data) {
			if(data){
				alert(data);
			}
		},
		error:function(){
			alert("保存失败！");
		}
	});
}


function activeFirst(){
	loadTz($('#myTab li:first-child a').attr("tabid"));;
	$('#myTab li:first-child').addClass("active");
	$('.tab-content div:first-child').addClass("active");
}

    </script>
  </head>

  <body>

    <div class="row-fluid">
	  <!-- start of main -->
	  <div id="m-main" class="container-fluid span10" style="float: left;">
			<div class="content content-inner">
	<div class="control-group">
		<div class="controls">
			<button type="button" onclick="saveTz()" class="btn a-submit">
				<spring:message code='core.input.save' text='保存' />
			</button>
			&nbsp;
			<button type="button" class="btn a-cancel"
				onclick="history.back();">
				<spring:message code='core.input.back' text='返回' />
			</button>
		</div>
	</div>
	  <div calss="span2" style="float: left;">
      	<ul id="myTab" class="nav nav-pills nav-stacked" role="tablist">
     	</ul>
     	</div>
      <div calss="span6" class="tab-content" >
			<div class="tab-pane" id="contentDiv">
			  	<textarea id="contentEditor" ></textarea>
			</div>
      </div>
      </div>
      </div>
	</div>

  </body>

</html>
