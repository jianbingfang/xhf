<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "cw-home");%>
<%pageContext.setAttribute("currentMenu", "cw-zbb");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="cwreport-info.cwreport-info.input.title" text="编辑"/></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript" src="${ctx}/s/ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
$(function() {
    $("#cwreport-infoForm").validate({
        submitHandler: function(form) {
			bootbox.animate(false);
			var box = bootbox.dialog('<div class="progress progress-striped active" style="margin:0px;"><div class="bar" style="width: 100%;"></div></div>');
            form.submit();
        },
        errorClass: 'validate-error'
    });
    
	editor = CKEDITOR.replace('cwreport-info_fcontent');
	editor.config.height = 400;
	editor.config.filebrowserImageUploadUrl = "${scopePrefix}/comm/editor-article-uploadImage.do";
})
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
		  <h4 class="title"><spring:message code="cwreport-info.cwreport-info.input.title" text="编辑" /></h4>
		</header>

		<div class="content content-inner">

<form id="cwreport-infoForm" method="post" action="cwreport-info-save.do" class="form-horizontal">
  <c:if test="${model != null}">
	  <input id="cwreport-info_id" type="hidden" name="fid" value="${model.fid}">
  </c:if>
			    	<div class="control-group">
				    <label class="control-label" for="cwreport-info_fname"><spring:message code="cwreport-info.cwreport-info.input.fname" text="报表名称"/></label>
					<div class="controls">
					  	 <input id="cwreport-info_fname" type="text" name="fname" value="${model.fname}" size="" class="text required" minlength="" maxlength="">	
				    </div>
				  </div>
			    	<%-- <div class="control-group">
				    <label class="control-label" for="cwreport-info_fupdatedate"><spring:message code="cwreport-info.cwreport-info.input.fupdatedate" text="修改时间"/></label>
					<div class="controls">
				      	 <div class="input-append datepicker date" style="padding-left: 0px;">
					    	<input id="cwreport-info_fupdatedate" type="text" name="fupdatedate" value="${model.fupdatedate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
					 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
					 	 </div>
				    </div>
				  </div>
			    	<div class="control-group">
				    <label class="control-label" for="cwreport-info_fupdatery"><spring:message code="cwreport-info.cwreport-info.input.fupdatery" text="修改人"/></label>
					<div class="controls">
					  	<input id="cwreport-info_fupdatery" type="text" name="fupdatery" value="${model.fupdatery}" size="" class="number   " minlength="" maxlength="">
				    </div>
				  </div> --%>
			    	<div class="control-group">
				    <label class="control-label" for="cwreport-info_fcontent"><spring:message code="cwreport-info.cwreport-info.input.fcontent" text="内容"/></label>
					<div class="controls">
				      	<textarea id="cwreport-info_fcontent"  name="fcontent"  class="form-control"  style="width:560px;" class="text  "  maxlength="2000">
				      	 <c:if test="${model != null}">
							   	${model.fcontent}
						  </c:if>
						  <c:if test="${model == null}">
						<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0
 style='border-collapse:collapse;border:none'>
 <tr>
  <td width=255 colspan=2 valign=top style='width:191.0pt;border:solid windowtext 1.0pt;
  background:#9CC2E5;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='text-align:center'><span
  style='font-family:宋体'>流动资产（万元）</span></p>
  </td>
  <td width=283 colspan=2 valign=top style='width:212.6pt;border:solid windowtext 1.0pt;
  border-left:none;background:#9CC2E5;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal align=center style='text-align:center'><span
  style='font-family:宋体'>流动负债（万元）</span></p>
  </td>
 </tr>
 <tr>
  <td width=122 valign=top style='width:91.75pt;border:solid windowtext 1.0pt;
  border-top:none;background:#DEEAF6;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal><span style='font-family:宋体'>资金余额：</span></p>
  </td>
  <td width=132 valign=top style='width:99.25pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>
  </td>
  <td width=123 valign=top style='width:92.1pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  background:#DEEAF6;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal><span style='font-family:宋体'>质量保证金：</span></p>
  </td>
  <td width=161 valign=top style='width:120.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>
  </td>
 </tr>
 <tr>
  <td width=122 valign=top style='width:91.75pt;border:solid windowtext 1.0pt;
  border-top:none;background:#DEEAF6;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal><span style='font-family:宋体'>本年度合同金额：</span></p>
  </td>
  <td width=132 valign=top style='width:99.25pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>
  </td>
  <td width=123 valign=top style='width:92.1pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  background:#DEEAF6;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal><span style='font-family:宋体'>履约保证金：</span></p>
  </td>
  <td width=161 valign=top style='width:120.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>
  </td>
 </tr>
 <tr>
  <td width=122 valign=top style='width:91.75pt;border:solid windowtext 1.0pt;
  border-top:none;background:#DEEAF6;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal><span style='font-family:宋体'>应收账款：</span></p>
  </td>
  <td width=132 valign=top style='width:99.25pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>
  </td>
  <td width=123 valign=top style='width:92.1pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  background:#DEEAF6;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal><span style='font-family:宋体'>投标保证金：</span></p>
  </td>
  <td width=161 valign=top style='width:120.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>
  </td>
 </tr>
 <tr>
  <td width=122 valign=top style='width:91.75pt;border:solid windowtext 1.0pt;
  border-top:none;background:#DEEAF6;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal><span style='font-family:宋体'>投标保证金：</span></p>
  </td>
  <td width=132 valign=top style='width:99.25pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>
  </td>
  <td width=123 valign=top style='width:92.1pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  background:#DEEAF6;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal><span style='font-family:宋体'>借款：</span></p>
  </td>
  <td width=161 valign=top style='width:120.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>
  </td>
 </tr>
 <tr>
  <td width=122 valign=top style='width:91.75pt;border:solid windowtext 1.0pt;
  border-top:none;background:#DEEAF6;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal><span style='font-family:宋体'>履约保证金：</span></p>
  </td>
  <td width=132 valign=top style='width:99.25pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>
  </td>
  <td width=123 valign=top style='width:92.1pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  background:#DEEAF6;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>
  </td>
  <td width=161 valign=top style='width:120.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>
  </td>
 </tr>
 <tr>
  <td width=122 valign=top style='width:91.75pt;border:solid windowtext 1.0pt;
  border-top:none;background:#DEEAF6;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal><span style='font-family:宋体'>借款：</span></p>
  </td>
  <td width=132 valign=top style='width:99.25pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>
  </td>
  <td width=123 valign=top style='width:92.1pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  background:#DEEAF6;padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>
  </td>
  <td width=161 valign=top style='width:120.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0cm 5.4pt 0cm 5.4pt'>
  <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>
  </td>
 </tr>
</table>
						  </c:if>
				     
				      	</textarea>
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

      </section>
	  <!-- end of main -->
	</div>

  </body>

</html>
