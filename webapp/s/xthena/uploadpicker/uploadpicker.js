var createuploadPicker = function(conf) {
	if (!conf) {
		conf = {
			modalId: 'uploadPicker',
			multiple: false,
			filePath:'',
			url: '/xthena-web-upload/default/rs/upload/search',
			uploadSuccess:function(data){
				alert('上传成功！');
			}
		};
	}
	if ($('#' + conf.modalId).length == 0) {
		$(document.body).append(

'<div id="' + conf.modalId + '" class="modal hide fade">'
+'  <div class="modal-dialog">'
+'    <div class="modal-content">'
+'      <div class="modal-header">'
+'        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>'
+'        <h4 class="modal-title">选择文件</h4>'
+'      </div>'
+'      <div class="modal-body">'
+'        		<input type="file" id="uploadFile" name="uploadFile" />'
+'      </div>'
+'      <div class="modal-footer">'
+'        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>'
+'        <button id="'+conf.modalId+'BtnSelect" type="button" class="btn btn-primary">上传</button>'
+'      </div>'
+'    </div>'
+'  </div>'
+'</div>'
);
}

	$(document).delegate('.uploadPicker', 'dblclick', function(e) {
		$('#' + conf.modalId).data('uploadPicker', $(this).parent());
		$('#' + conf.modalId).modal();
	});
	
	$(document).delegate('a[uploadt="upbutton"]', 'click', function(e) {
		$('#' + conf.modalId).data('uploadPicker', $(this).parent());
		$('#' + conf.modalId).modal();
	});

	$(document).delegate('#' + conf.modalId + 'BtnSelect', 'click', function(e) {
		$.ajaxFileUpload({
			secureuri:false,
			url: conf.url,
			type:'POST',
			data:{filePath:conf.filePath},
			fileElementId:'uploadFile',
			dataType:'json',
			async:false,
			success:conf.uploadSuccess, 
			error: function(){
				alert("上传失败！");
			}
		});
		$('#' + conf.modalId).modal('hide');
	});
}
