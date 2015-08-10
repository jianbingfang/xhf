<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<!doctype html>
<html lang="zh">

<head>
<title><spring:message
		code="jlShizhong-info.jlShizhong-info.input.title" text="编辑" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript" src="${ctx}/s/ckeditor/ckeditor.js"></script>
<script type="text/javascript">

	var editor ;
	$(function() {
		$("#jlShizhong-infoForm")
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

	
		//editor.config.toolbar='full';
		$("#confirmBtn").click(function() {
			getFiles();
		});
		
		
		$('label.control-label').css("width","80px");
		$('div.controls').css("margin-left", "100px");
		
		loadEditor();
		
		loadStyle();
	});
	
	
	function loadStyle(){
		$("[tabs*=style]").hide();
		$("[tabs*=style] input").attr('disabled',true);
		$("[tabs*=style] textarea").attr('disabled',true);
		$("[tabs*=style] select").attr('disabled',true);
		
		var style=$("[tabs*=',<%= request.getParameter("style")%>,']");
		$(style).show();
				
		$("[tabs*=',<%= request.getParameter("style")%>,'] input").attr('disabled',false);
		$("[tabs*=',<%= request.getParameter("style")%>,'] textarea").attr('disabled',false);
		$("[tabs*=',<%= request.getParameter("style")%>,'] select").attr('disabled',false);
	}

	
	function loadEditor(){
		editor = CKEDITOR.replace('jlShizhong-info_fcontent');
		editor.config.filebrowserImageUploadUrl = "${scopePrefix}/comm/editor-article-uploadImage.do";
		editor.config.width = 700;
		editor.config.height = 800; 
	}

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
									+ '<input type="hidden" name="jlFujian['
									+ filesIndex
									+ '].fname" class="btn-link" value="'
									+ $(node).data("fileName")
									+ "."
									+ $(node).data("fileType")
									+ '">'
									+ '<input type="hidden" name="jlFujian['
									+ filesIndex
									+ '].furl" class="form-control" value="'
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
	
	function print(selector){
	//	alert(editor.htmlParser);
		alert($('[contenteditable="true"]').html());
	}
</script>
</head>

<body>

	<div class="row-fluid">
		<div id="m-main" class="container-fluid span10" style="float: left;">
			<div class="content content-inner">
				<%@include file="../comm/comm-upload.jsp"%>
				<form id="jlShizhong-infoForm" method="post"
					action="jlShizhong-info-save.do?fszleix=<%= request.getParameter("fszleix")%>&style=<%= request.getParameter("style")%>" class="form-horizontal">
					<c:if test="${model != null}">
						<input id="jlShizhong-info_id" type="hidden" name="jlShizhong.fid"
							value="${model.fid}">
					</c:if>
					<input id="jlShizhong-info_fszleix" type="hidden"
						name="jlShizhong.fszleix"
						value="<%=request.getParameter("fszleix")%>">
					<div class="span5" >
					<!-- style="float:left;margin-top: 10px;" -->
						<div class="control-group" tabs="style,upload,yiqi,async,nameVlaueMath,nameVlaueMathWithoutStatus,multipleAsync,uploadMonth,uploadWithdate,">
							<label class="control-label" for="jlShizhong-info_fitem"><spring:message
									code="jlShizhong-info.jlShizhong-info.input.fitem" text="名称" /></label>
							<div class="controls">
								<input type="text" name="jlShizhong.fitem"  class="text" value="${model.fitem}">
							</div>
						</div>
						    <div class="control-group" tabs="style,yiqi,">
							<label class="control-label" for="jlShizhong-info_fmemo1"><spring:message
									code="jlShizhong-info.jlShizhong-info.input.fmemo1" text="使用单位" /></label>
							<div class="controls">
								<textarea id="jlShizhong-info_fmemo1" type="text"
									name="jlShizhong.fmemo1" rows="2" style="width: 220px" size=""
									class="text " minlength="" maxlength="">${model.fmemo1}</textarea>
							</div>
						</div>
						<div class="control-group" tabs="style,hunningtu,">
							<label class="control-label" for="jlShizhong-info_fitem"><spring:message
									code="jlShizhong-info.jlShizhong-info.input.fitem" text="部位" /></label>
							<div class="controls">
								<input type="text" name="jlShizhong.fitem" class="text" value="${model.fitem}">
							</div>
						</div>
						
						<div class="control-group" tabs="style,jgysh,">
							<label class="control-label" for="jlShizhong-info_fitem"><spring:message
									code="jlShizhong-info.jlShizhong-info.input.fitem" text="日期" /></label>
							<div class="controls">
								<div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="jlShizhong-info_fitem" type="text" name="jlShizhong.fitem" value="${model.fitem}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
							</div>
						</div>
						
							<div class="control-group" tabs="style,uploadWithdate,">
							<label class="control-label" for="jlShizhong-info_fitemval"><spring:message
									code="jlShizhong-info.jlShizhong-info.input.fitemval" text="日期" /></label>
							<div class="controls">
								<div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="jlShizhong-info_fitemval" type="text" name="jlShizhong.fitemval" value="${model.fitemval}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
							</div>
						</div>
						
						
						<div class="control-group" tabs="style,jgysh,">
							<label class="control-label" for="jlShizhong-info_fitemval"><spring:message
									code="jlShizhong-info.jlShizhong-info.input.fitemval" text="参加人员" /></label>
							<div class="controls">
								<textarea id="jlShizhong-info_fitemval" type="text"
									name="jlShizhong.fitemval" rows="6" style="width: 220px" size=""
									class="text " minlength="" maxlength="">${model.fitemval}</textarea>
							</div>
						</div>
						
						<div class="control-group" tabs="style,uploadMonth,">
							<label class="control-label" for="jlShizhong-info_fitemval"><spring:message
									code="jlShizhong-info.jlShizhong-info.input.fitemval" text="月份" /></label>
							<div class="controls">
								<input type="text" name="jlShizhong.fitemval" class="text" value="${model.fitemval}">
							</div>
						</div>
						
						<div class="control-group" tabs="style,async,multipleAsync,">
							<label class="control-label" for="jlShizhong-info_fitemval "><spring:message
									code="jlShizhong-info.jlShizhong-info.input.fitemval" text="是否与工程部同步" /></label>
							<div class="controls">
								<select class="form-control" id="jlShizhong-info_fitemval"
									name="jlShizhong.fitemval" value="${model.fitemval}" class=" ">
									<option value="是"
										<c:if test="${model.fitemval=='是'}"> selected="selected"  </c:if>>是</option>
									<option value="否"
										<c:if test="${model.fitemval=='否'}"> selected="selected"  </c:if>>否</option>
								</select>
							</div>
						</div>
						
						<div class="control-group" tabs="style,yiqi,">
							<label class="control-label" for="jlShizhong-info_fitemval"><spring:message
									code="jlShizhong-info.jlShizhong-info.input.fitemval" text="是否检测" /></label>
							<div class="controls">
								<select class="form-control" id="jlShizhong-info_fitemval"
									name="jlShizhong.fitemval" value="${model.fitemval}" class=" ">
									<option value="是"
										<c:if test="${model.fitemval=='是'}"> selected="selected"  </c:if>>是</option>
									<option value="否"
										<c:if test="${model.fitemval=='否'}"> selected="selected"  </c:if>>否</option>
								</select>
							</div>
						</div>
						
						<div class="control-group" tabs="style,nameVlaueMath,nameVlaueMathWithoutStatus,hunningtu,">
							<label class="control-label" for="jlShizhong-info_fitemval"><spring:message
									code="jlShizhong-info.jlShizhong-info.input.fitemval" text="有无" /></label>
							<div class="controls">
								<select class="form-control" id="jlShizhong-info_fitemval"
									name="jlShizhong.fitemval" value="${model.fitemval}" class=" ">
									<option value="有"
										<c:if test="${model.fitemval=='有'}"> selected="selected"  </c:if>>有</option>
									<option value="无"
										<c:if test="${model.fitemval=='无'}"> selected="selected"  </c:if>>无</option>
								</select>
							</div>
						</div>
						
						<div class="control-group" tabs="style,nameVlaueMath,">
							<label class="control-label" for="jlShizhong-info_fastus"><spring:message
									code="jlShizhong-info.jlShizhong-info.input.fastus" text="审核状态" /></label>
							<div class="controls">
								<select class="form-control" id="jlShizhong-info_fastus"
									name="jlShizhong.fastus" value="${model.fastus}" class=" ">
									<option value="通过"
										<c:if test="${model.fastus=='通过'}"> selected="selected"  </c:if>>通过</option>
									<option value="不通过"
										<c:if test="${model.fastus=='不通过'}"> selected="selected"  </c:if>>不通过</option>
								</select>
							</div>
						</div>
						
						<div class="control-group" tabs="style,yiqi,">
							<label class="control-label" for="jlShizhong-info_fexpirydate"><spring:message
									code="jlShizhong-info.jlShizhong-info.input.fexpirydate" text="有效期" /></label>
							<div class="controls">
								 <div class="input-append datepicker date" style="padding-left: 0px;">
							    	<input id="jlShizhong-info_fexpirydate" type="text" name="jlShizhong.fexpirydate" value="${model.fexpirydate}" size="40" class="text "   style="background-color:white;cursor:default; width: 175px;">
							 		 <span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i class="icon-calendar"></i></span>
							 	 </div>
							</div>
						</div>
						
						<div class="control-group" tabs="style,upload,uploadMonth,uploadWithdate,">
							<label class="control-label" for="jlShizhong-info_fwarn"><spring:message
									code="jlShizhong-info.jlShizhong-info.input.fwarn" text="附件" /></label>
							<div class="controls">
								<input type="button" class="btn a-link" value="点击上传"
									onclick="showUpload()">
							</div>
						</div>
						
						<div class="control-group" tabs="style,upload,uploadMonth,uploadWithdate,">
							<div id="files">
								<ul id="filesUl" class="nav nav-list" style="float:right;">
									<c:forEach items="${fujians}" var="item">
										<li style="width:300px; height: 35px;">
											<div>
												<p style="width:180px; float:left;">${item.fname}</p>
												<a class="btn" style="float:right;"
													href="jlShizhong-info-deleteFujian.do?fujianid=${item.fid}&id=${model.fid}">删除</a>
											<div  style="float:right;">
												<a class="btn" href="${item.furl}"
													target="_blank">下载</a>
												<a class="btn" style="float:right;" href="../common/preview.do?fileUrl=${item.furl}"
													target="_blank">预览</a>
											</div>
											</div> <input type="hidden" class="btn-link" value="${item.fname}">
											<input type="hidden" class="form-control"
											value="${item.furl}"><br/>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
						
						<%--<div class="control-group">
							<label class="control-label" for="jlShizhong-info_fwarn"><spring:message
									code="jlShizhong-info.jlShizhong-info.input.fwarn" text="提醒" /></label>
							<div class="controls">
								<select class="form-control" id="jlShizhong-info_fwarn"
									name="jlShizhong.fwarn" value="${model.fwarn}" class=" ">
									<option value="正常"
										<c:if test="${model.fwarn}=='正常'}"> selected="selected"  </c:if>>正常</option>
									<option value="重要"
										<c:if test="${model.fwarn}=='重要'}"> selected="selected"  </c:if>>重要</option>
								</select>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="jlShizhong-info_fwarninfo"><spring:message
									code="jlShizhong-info.jlShizhong-info.input.fwarninfo"
									text="提醒内容" /></label>
							<div class="controls">
								<textarea id="jlShizhong-info_fwarninfo"
									name="jlShizhong.fwarninfo" class="form-control" rows="6"
									style="width: 220px" class="text  " minlength=""
									maxlength="500">${model.fwarninfo}</textarea>
							</div>
						</div> --%>
                        
						<div class="control-group" tabs="style,yiqi,nameVlaueMath,nameVlaueMathWithoutStatus,">
							<label class="control-label" for="jlShizhong-info_fmemo"><spring:message
									code="jlShizhong-info.jlShizhong-info.input.fmemo" text="备注" /></label>
							<div class="controls">
								<textarea id="jlShizhong-info_fmemo" type="text"
									name="jlShizhong.fmemo" rows="6" style="width: 220px" size=""
									class="text " minlength="" maxlength="">${model.fmemo}</textarea>
							</div>
						</div>


						<div class="control-group">
							<div class="controls">
								<button type="submit" class="btn a-submit">
									<spring:message code='core.input.save' text='保存' />
								</button>
								&nbsp;
								<button type="button" class="btn a-cancel"
									onclick="history.back();">
									<spring:message code='core.input.back' text='返回' />
								</button>
							</div>
						</div>
					</div>
					<div class="span6"  style="margin-top:10px;" tabs="style,upload,uploadMonth,uploadWithdate,">
						<textarea id="jlShizhong-info_fcontent" type="text"
							name="jlShizhong.fcontent" size="" class="text required"
							minlength="" maxlength=""> 
							   <c:if test="${model.fcontent != null}">
								${model.fcontent}
							  </c:if>
							  <c:if test="${model.fcontent == null}">
								${docTemp}
							  </c:if></textarea>
					</div>
				</form>
			</div>

			<!-- end of main -->
		</div>
</body>

</html>
