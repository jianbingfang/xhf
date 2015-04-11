<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jl-xcgl");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="jlFujian-info.jlFujian-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
       <script type="text/javascript" src="${scopePrefix}/s/xthena/js/ajaxfileupload.js"></script>
    <link type="text/css" rel="stylesheet" href="${scopePrefix}/s/xthena/uploadpicker/uploadpicker.css">
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
    
    $(document.body).append(
      		'<div id="uploadPicker" class="modal hide fade">'
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
      		+'        <button id="uploadPickerBtnSelect" onclick="uploadFile()" type="button" class="btn btn-primary">上传</button>'
      		+'      </div>'
      		+'    </div>'
      		+'  </div>'
      		+'</div>'
      	);
    
    $('#myTab a').click(function (e) {
    	  e.preventDefault();
    	  $(this).tab('show');
    });
})

 function openUpload(aaa){
    	formid=aaa;	
    	$('#uploadPicker').modal();
    }
    
    function uploadFile(){
    	$.ajaxFileUpload({
			secureuri:false,
			url: '/xhf/default/comm/comm-uploadFile.do',
			type:'POST',
			data:{filePath:''},
			fileElementId:'uploadFile',
			dataType:'json',
			async:false,
			success:function(data) {
				$('#'+formid+' #uploadPicker_fileUrlSave').val(data.fileUrl);
				$('#'+formid+' #uploadPicker_fileName').val(data.fileName);
				$('#'+formid+' #uploadPicker_fuploadry').val(data.uploaduser);
				$('#'+formid+' #uploadPicker_ffiletype').val(data.fileType);
				$('#'+formid+' a[uploadt="download"]').show();
				$('#'+formid+' a[uploadt="download"]').text(data.fileName);
				$('#'+formid+' a[uploadt="download"]').attr('href',data.fileUrl);
			}, 
			error: function(){
				alert("上传失败！");
			}
		});
		$('#uploadPicker').modal('hide');
    }
    function dyniframesize(down) { 
    	var pTar = null; 
    	if (document.getElementById){ 
    		pTar = document.getElementById(down); 
    	} 
    	else{ 
    		eval('pTar = ' + down + ';'); 
    	} 
    	if (pTar && !window.opera){ 
    		//begin resizing iframe 
    		pTar.style.display="block"; 
    	if (pTar.contentDocument && pTar.contentDocument.body.offsetHeight){ 
	    	//ns6 syntax 
	    	pTar.height = pTar.contentDocument.body.offsetHeight +20; 
	    	pTar.width = pTar.contentDocument.body.scrollWidth+20; 
    	} 
    	else if (pTar.Document && pTar.Document.body.scrollHeight){ 
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
      <section id="m-main" class="span10">
			<ul id="myTab" class="nav nav-tabs" role="tablist">
			  <li role="presentation" class="active"><a href="#AQJCJL">施工现场安全检查记录</a></li>
			  <li role="presentation"><a href="#AQZXSGFA">安全专项施工方案</a></li>
			  <li role="presentation"><a href="#ZZLZ">专家论证</a></li>
			</ul>
			
			<div class="tab-content">
			  	<div class="tab-pane active" id="AQJCJL">
			  	 		<p><strong>安表D6</strong></p>

					<p><strong>检查施工现场安全管理记录表</strong></p>
					
					<p>&nbsp;</p>
					
					<table align="left" border="1" cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<td colspan="2" style="width:106px">
								<p>工 程 名 称</p>
								</td>
								<td colspan="2" style="width:209px">
								<p>&nbsp;</p>
								</td>
								<td style="width:85px">
								<p>开工日期</p>
								</td>
								<td colspan="3" style="width:156px">
								<p>&nbsp;</p>
								</td>
							</tr>
							<tr>
								<td colspan="2" style="width:106px">
								<p>施工承包单位</p>
								</td>
								<td colspan="2" style="width:209px">
								<p>&nbsp;</p>
								</td>
								<td style="width:85px">
								<p>施工许可证</p>
								</td>
								<td colspan="3" style="width:156px">
								<p>&nbsp;</p>
								</td>
							</tr>
							<tr>
								<td colspan="2" style="width:106px">
								<p>项 目 经 理</p>
								</td>
								<td colspan="2" style="width:209px">
								<p>&nbsp;</p>
								</td>
								<td style="width:85px">
								<p>证件及编号</p>
								</td>
								<td colspan="3" style="width:156px">
								<p>&nbsp;</p>
								</td>
							</tr>
							<tr>
								<td colspan="2" style="width:106px">
								<p>安全负责人</p>
								</td>
								<td colspan="2" style="width:209px">
								<p>&nbsp;</p>
								</td>
								<td style="width:85px">
								<p>证件及编号</p>
								</td>
								<td colspan="3" style="width:156px">
								<p>&nbsp;</p>
								</td>
							</tr>
							<tr>
								<td style="width:43px">
								<p>序号</p>
								</td>
								<td colspan="2" style="width:189px">
								<p>检查项目</p>
								</td>
								<td colspan="3" style="width:201px">
								<p>检查内容</p>
								</td>
								<td style="width:64px">
								<p>检查结果</p>
								</td>
								<td style="width:59px">
								<p>检查人</p>
								</td>
							</tr>
							<tr>
								<td style="width:43px">
								<p>1</p>
								</td>
								<td colspan="2" style="width:189px">
								<p>承包单位资质</p>
								</td>
								<td colspan="3" style="width:201px">
								<p>是否超范围经营</p>
								</td>
								<td style="width:64px">
								<p>&nbsp;</p>
								</td>
								<td style="width:59px">
								<p>&nbsp;</p>
								</td>
							</tr>
							<tr>
								<td style="width:43px">
								<p>2</p>
								</td>
								<td colspan="2" style="width:189px">
								<p>承包单位的安全生产许可证</p>
								</td>
								<td colspan="3" style="width:201px">
								<p>有无，是否超范围，过期、转让和冒用</p>
								</td>
								<td style="width:64px">
								<p>&nbsp;</p>
								</td>
								<td style="width:59px">
								<p>&nbsp;</p>
								</td>
							</tr>
							<tr>
								<td style="width:43px">
								<p>3</p>
								</td>
								<td colspan="2" style="width:189px">
								<p>承包单位安全生产保证体系及认证</p>
								</td>
								<td colspan="3" style="width:201px">
								<p>有无，是否认证</p>
								</td>
								<td style="width:64px">
								<p>&nbsp;</p>
								</td>
								<td style="width:59px">
								<p>&nbsp;</p>
								</td>
							</tr>
							<tr>
								<td style="width:43px">
								<p>4</p>
								</td>
								<td colspan="2" style="width:189px">
								<p>现场安全生产管理机构</p>
								</td>
								<td colspan="3" style="width:201px">
								<p>是否建立，并覆盖全部施工项目</p>
								</td>
								<td style="width:64px">
								<p>&nbsp;</p>
								</td>
								<td style="width:59px">
								<p>&nbsp;</p>
								</td>
							</tr>
							<tr>
								<td style="width:43px">
								<p>5</p>
								</td>
								<td colspan="2" style="width:189px">
								<p>项目经理和专职安全管理人员证件</p>
								</td>
								<td colspan="3" style="width:201px">
								<p>有无，资格，数量，是否到岗</p>
								</td>
								<td style="width:64px">
								<p>&nbsp;</p>
								</td>
								<td style="width:59px">
								<p>&nbsp;</p>
								</td>
							</tr>
							<tr>
								<td style="width:43px">
								<p>6</p>
								</td>
								<td colspan="2" style="width:189px">
								<p>安全生产责任制和管理制度</p>
								</td>
								<td colspan="3" style="width:201px">
								<p>有无，是否齐全</p>
								</td>
								<td style="width:64px">
								<p>&nbsp;</p>
								</td>
								<td style="width:59px">
								<p>&nbsp;</p>
								</td>
							</tr>
							<tr>
								<td style="width:43px">
								<p>7</p>
								</td>
								<td colspan="2" style="width:189px">
								<p>施工安全责任书和协议</p>
								</td>
								<td colspan="3" style="width:201px">
								<p>是否签订</p>
								</td>
								<td style="width:64px">
								<p>&nbsp;</p>
								</td>
								<td style="width:59px">
								<p>&nbsp;</p>
								</td>
							</tr>
							<tr>
								<td style="width:43px">
								<p>8</p>
								</td>
								<td colspan="2" style="width:189px">
								<p>特种作业人员资格证</p>
								</td>
								<td colspan="3" style="width:201px">
								<p>有无上岗证，是否过期</p>
								</td>
								<td style="width:64px">
								<p>&nbsp;</p>
								</td>
								<td style="width:59px">
								<p>&nbsp;</p>
								</td>
							</tr>
							<tr>
								<td style="width:43px">
								<p>9</p>
								</td>
								<td colspan="2" style="width:189px">
								<p>施工人员安全教育培训</p>
								</td>
								<td colspan="3" style="width:201px">
								<p>是否进行，有无记录</p>
								</td>
								<td style="width:64px">
								<p>&nbsp;</p>
								</td>
								<td style="width:59px">
								<p>&nbsp;</p>
								</td>
							</tr>
							<tr>
								<td style="width:43px">
								<p>10</p>
								</td>
								<td colspan="2" style="width:189px">
								<p>施工组织设计中安全技术措施或专项施工方案</p>
								</td>
								<td colspan="3" style="width:201px">
								<p>有无，是否报审</p>
								</td>
								<td style="width:64px">
								<p>&nbsp;</p>
								</td>
								<td style="width:59px">
								<p>&nbsp;</p>
								</td>
							</tr>
							<tr>
								<td style="width:43px">
								<p>11</p>
								</td>
								<td colspan="2" style="width:189px">
								<p>施工机械、安全设施验收管理</p>
								</td>
								<td colspan="3" style="width:201px">
								<p>验收手续是否齐全，落实到人</p>
								</td>
								<td style="width:64px">
								<p>&nbsp;</p>
								</td>
								<td style="width:59px">
								<p>&nbsp;</p>
								</td>
							</tr>
							<tr>
								<td style="width:43px">
								<p>12</p>
								</td>
								<td colspan="2" style="width:189px">
								<p>安全文明施工措施费, 使用计划</p>
								</td>
								<td colspan="3" style="width:201px">
								<p>有无，是否切合实际</p>
								</td>
								<td style="width:64px">
								<p>&nbsp;</p>
								</td>
								<td style="width:59px">
								<p>&nbsp;</p>
								</td>
							</tr>
							<tr>
								<td style="width:43px">
								<p>13</p>
								</td>
								<td colspan="2" style="width:189px">
								<p>应急救援预案和体系</p>
								</td>
								<td colspan="3" style="width:201px">
								<p>有无，是否落实</p>
								</td>
								<td style="width:64px">
								<p>&nbsp;</p>
								</td>
								<td style="width:59px">
								<p>&nbsp;</p>
								</td>
							</tr>
							<tr>
								<td style="width:43px">
								<p>14</p>
								</td>
								<td colspan="2" style="width:189px">
								<p>危险作业人员意外伤害保险</p>
								</td>
								<td colspan="3" style="width:201px">
								<p>是否保险</p>
								</td>
								<td style="width:64px">
								<p>&nbsp;</p>
								</td>
								<td style="width:59px">
								<p>&nbsp;</p>
								</td>
							</tr>
							<tr>
								<td colspan="8" style="width:556px">
								<p>检查结论：</p>
					
								<p>&nbsp;</p>
					
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 总监理工程师：</p>
					
								<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 期：</p>
								</td>
							</tr>
							<tr>
								<td style="width:43px">
								<p>&nbsp;</p>
								</td>
								<td style="width:63px">
								<p>&nbsp;</p>
								</td>
								<td style="width:126px">
								<p>&nbsp;</p>
								</td>
								<td style="width:83px">
								<p>&nbsp;</p>
								</td>
								<td style="width:85px">
								<p>&nbsp;</p>
								</td>
								<td style="width:33px">
								<p>&nbsp;</p>
								</td>
								<td style="width:64px">
								<p>&nbsp;</p>
								</td>
								<td style="width:59px">
								<p>&nbsp;</p>
								</td>
							</tr>
						</tbody>
					</table>
					
					<p>&nbsp;</p>
				</div>
			  	<div class="tab-pane" id="AQZXSGFA">
			  		<iframe  src="jlAqAqfa-info-list.do" height="600px" width="100%"  style="border: 0px;"></iframe>
			  	</div>  
			  	<div class="tab-pane" id="ZZLZ">
			  		<iframe  src="jlAqAqzj-info-list.do" height="600px" width="100%"  style="border: 0px;"></iframe>
			  	</div> 
			</div>
      </section>
	</div>

  </body>

</html>
