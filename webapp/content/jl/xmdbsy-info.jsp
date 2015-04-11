<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "jl-home");
%>
<%
	pageContext.setAttribute("currentMenu", "jl-xmjd");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message
		code="jlFujian-info.jlFujian-info.input.title" text="编辑" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/js/ajaxfileupload.js"></script>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/uploadpicker/uploadpicker.css">
<script type="text/javascript">
	var formid = "";

	$(function() {

		$("#jlFujian-infoForm")
				.validate(
						{
							submitHandler : function(form) {
								bootbox.animate(false);
								var box = bootbox
										.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
								form.submit();
							},
							errorClass : 'validate-error'
						});

		$(document.body)
				.append(
						'<div id="uploadPicker" class="modal hide fade">'
								+ '  <div class="modal-dialog">'
								+ '    <div class="modal-content">'
								+ '      <div class="modal-header">'
								+ '        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>'
								+ '        <h4 class="modal-title">选择文件</h4>'
								+ '      </div>'
								+ '      <div class="modal-body">'
								+ '        		<input type="file" id="uploadFile" name="uploadFile" />'
								+ '      </div>'
								+ '      <div class="modal-footer">'
								+ '        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>'
								+ '        <button id="uploadPickerBtnSelect" onclick="uploadFile()" type="button" class="btn btn-primary">上传</button>'
								+ '      </div>' + '    </div>' + '  </div>'
								+ '</div>');

		$('#myTab a').click(function(e) {
			e.preventDefault();
			$(this).tab('show');
		});
	})

	function openUpload(aaa) {
		formid = aaa;
		$('#uploadPicker').modal();
	}

	function uploadFile() {
		$
				.ajaxFileUpload({
					secureuri : false,
					url : '/xhf/default/comm/comm-uploadFile.do',
					type : 'POST',
					data : {
						filePath : ''
					},
					fileElementId : 'uploadFile',
					dataType : 'json',
					async : false,
					success : function(data) {
						$('#' + formid + ' #uploadPicker_fileUrlSave').val(
								data.fileUrl);
						$('#' + formid + ' #uploadPicker_fileName').val(
								data.fileName);
						$('#' + formid + ' #uploadPicker_fuploadry').val(
								data.uploaduser);
						$('#' + formid + ' #uploadPicker_ffiletype').val(
								data.fileType);
						$('#' + formid + ' a[uploadt="download"]').show();
						$('#' + formid + ' a[uploadt="download"]').text(
								data.fileName);
						$('#' + formid + ' a[uploadt="download"]').attr('href',
								data.fileUrl);
					},
					error : function() {
						alert("上传失败！");
					}
				});
		$('#uploadPicker').modal('hide');
	}
	function dyniframesize(down) {
		var pTar = null;
		if (document.getElementById) {
			pTar = document.getElementById(down);
		} else {
			eval('pTar = ' + down + ';');
		}
		if (pTar && !window.opera) {
			//begin resizing iframe 
			pTar.style.display = "block";
			if (pTar.contentDocument && pTar.contentDocument.body.offsetHeight) {
				//ns6 syntax 
				pTar.height = pTar.contentDocument.body.offsetHeight + 20;
				pTar.width = pTar.contentDocument.body.scrollWidth + 20;
			} else if (pTar.Document && pTar.Document.body.scrollHeight) {
				//ie5+ syntax 
				pTar.height = pTar.Document.body.scrollHeight;
				pTar.width = pTar.Document.body.scrollWidth;
			}
		}
	}
</script>
</head>
<body>
	<%@include file="/header.jsp"%>
	<div class="row-fluid">
		<%@include file="/menu/jl-workspace.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span10" >
			<div style="left: 200px;top: 100px;">
				<h3><span class="badge badge-info" style="font-size: 14px;">1 . </span>  领取固定资产和各项物品</h3>
				<h3><span class="badge badge-info" style="font-size: 14px;">2 . </span>  与业主见面</h3>
				<h3><span class="badge badge-info" style="font-size: 14px;">3 . </span>  建立项目通讯录</h3>
				<h3><a href="../content/jl/bangongshibuzhi.jsp" ><span class="badge badge-info" style="font-size: 14px;">4 . </span>  办公室布置</a></h3>
				<h3><a href="../content/jl/xianchangxuanchuanbiaoyu.jsp" ><span class="badge badge-info" style="font-size: 14px;">5 . </span>  现场宣传标语</a></h3>
				<h3><span class="badge badge-info" style="font-size: 14px;">6 . </span>  现场食宿安置</h3>
			</div>
		</section>
	</div>
</body>
</html>
