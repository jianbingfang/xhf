<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "xz-home");
%>
<%
	pageContext.setAttribute("currentMenu", "xz-da");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message
		code="xzZjOrder-info.xzZjOrder-info.input.title" text="编辑" /></title>
<%@include file="/common/s.jsp"%>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/rypicker/rypicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/rypicker/rypicker.js"></script>
<link type="text/css" rel="stylesheet"
	href="${scopePrefix}/s/xthena/xmpicker/xmpicker.css">
<script type="text/javascript"
	src="${scopePrefix}/s/xthena/xmpicker/xmpicker.js"></script>
<script type="text/javascript">
	$(function() {
		$("#xzZjOrder-infoForm")
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

		createryPicker({
			modalId : 'ryPicker',
			url : '${scopePrefix}/hr/commRy-simple-list.do'
		});

		createxmPicker({
			modalId : 'xmPicker',
			url : '${scopePrefix}/gcgl/jyXm-simple-list.do'
		});
	});

	function showChooseDiv() {
		$(".chooseDiv").css("top", "0");
		$(".searchDiv").hide();
		$("#zjTypeSelect [value='1']").attr('selected','selected');
		$("#xzZjOrderList-infoSearch1").show();
		$('#searChResult').html("");
		$('.chooseDiv').modal();
		pageNo=1;
	}

	function showLessChooseDiv() {
		$(".lessChooseDiv").css("top", "0");
		var startTime = $('#xzZjOrder-info_fstarttime').val();
		var endTime = $('#xzZjOrder-info_fendtime').val();
		if(startTime==""||endTime==""){
			alert("起止时间不能为空");
			return;
		}
		$("#zjlesschoose").attr("src","xzZjDxlist-info-lesslist.do?startTime="+startTime+"&endTime="+endTime);
/* 		$(".searchDiv").hide();
		$("#xzZjOrderList-infoSearch1").show();
		$('#searChResult').html(""); */
		$('.lessChooseDiv').modal();
	}
	
	function changeSearch() {
		$(".searchDiv").hide();
		$("#xzZjOrderList-infoSearch"
						+ $('#zjTypeSelect option:selected').val()).show();
		$('#searChResult').html("");
		pageNo=1;
	}

	function next(){
		pageNo++;
		search();
	}
	function prev(){
		if(pageNo>1){
			pageNo--;
		}
		search();
	}
	var pageNo=1;
	function search() {
		var type=$('#zjTypeSelect option:selected').val();
		var startTime=$('#xzZjOrder-info_fstarttime').val();
		var endTime=$('#xzZjOrder-info_fendtime').val();
		var typeName=$('#zjTypeSelect option:selected').html();
		//pageNo=2&pageSize=10
		var pageSize=$('#selectPage').val();
		$('#searChResult').html("");
		$.ajax({
			url : '${scopePrefix}/xz/xzZjOrder-info-search-ajax.do?type='+type,
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			type:'POST',
			data: $("#xzZjOrderList-infoSearch"+$('#zjTypeSelect option:selected').val()+" form").serialize()+"&startTime="+startTime+"&endTime="+endTime+"&pageSize="+pageSize+"&pageNo="+pageNo,
			async : false,
			dataType:'json',
			success : function(data) {
				for (var i=0;i<data.length;i++){
					 $('#searChResult').data(type+"-searR"+data[i].fid,data[i]);
				     var trHtml='<tr> <td><input type="checkbox" class="selectedItem1 a-check" name="selectedItem" value="'
				     	+data[i].fid+'"></td><td style="width:100px;">'+typeName+'</td> <td style="width:500px;">'+data[i].fzjinfo+'</td> <td style="width:100px;">';
				     	if(data[i].fstatus==1){
				     		//+data[i].fstatus
				     		trHtml+="<font color='grenn'>在库</font>";	
				     	}else{
				     		trHtml+="<font color='red'>未在库</font>";	
				     	}
				     	trHtml+='</td> <td style="width:100px;">';
				     	if(data[i].forderStutas==0){
				     		trHtml+="<font color='grenn'>无订单</font>";
				     	}else{
				     		trHtml+="<font color='red'>有订单</font>";
				     	}
				    	trHtml+='</td> </tr>';
				     $('#searChResult').append(trHtml);
				}
				
				$('#pageNo').html(pageNo);
			},
			error:function(){
				alert("检索失败！");
			}
		});
	}

	function selectItem() {
		var selected=$(".selectedItem1:checked");
		for(var i=0;i<selected.length;i++){
		
			var selectObj=$('#searChResult').data($('#zjTypeSelect option:selected').val()+"-searR"+$(selected[i]).val());
			if(selectObj.forderStutas==1){
				alert("证件："+selectObj.fzjinfo+"  已有订单。无法选择。");
				return;
			}
			var typeName="";
			if(selectObj.ftype==1){
				typeName='公司证件';
			}else if(selectObj.ftype==2){
				typeName='人员证件';
			}else if(selectObj.ftype==3){
				typeName='获奖证书';
			}else if(selectObj.ftype==4){
				typeName='合同';
			}else if(selectObj.ftype==5){
				typeName='中标通知书';
			}else if(selectObj.ftype==6){
				typeName='竣工验收报告';
			}else if(selectObj.ftype==7){
				typeName='红头文件';
			}else if(selectObj.ftype==8){
				typeName='外部评先';
			}
			 var trHtml='<tr> <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value=""></td>'+
				'<td filed="zjid" hidden="hidden">'+selectObj.fid+'</td>'+
	   	    	'<td filed="zjtype" hidden="hidden">'+selectObj.ftype+'</td>'+
	   	    	'<td filed="updatetime" hidden="hidden">'+selectObj.lastupdate+'</td>'+
			 	'<td>'+typeName+'</td> <td>'+selectObj.fzjinfo+'</td> <td>';
				if(selectObj.fstatus==1){
		     		//+data[i].fstatus
		     		trHtml+="<font color='grenn'>在库</font>";	
		     	}else{
		     		trHtml+="<font color='red'>未在库</font>";	
		     	}
				
				trHtml+='</td> </tr>';
		    /*  	trHtml+='</td>';
		     	if(selectObj.forderStutas==0){
		     		trHtml+="<font color='grenn'>无订单</font>";
		     	}else{
		     		trHtml+="<font color='red'>有订单</font>";
		     	} */
		     	
		     	
			 	
			 $('#selectResult').append(trHtml);
			 $('#selectResult').data("selected"+selectObj.fid,selectObj);
		}
		$('.chooseDiv').modal('hide');
		$('#searChResult').removeData();
	}

	function deleteZj() {
		var selected=$(".selectedItem:checked");
		for(var i=0;i<selected.length;i++){
			var rowId=$(selected[i]).val();
			if(rowId==""){
				$(selected[i]).parent().parent().remove();
			}else{
				$.ajax({
					url : '${scopePrefix}/sckf/xzZjOrder-info-delete-ajax.do',
					contentType: 'application/x-www-form-urlencoded; charset=utf-8',
					type:'POST',
					data: {fid:rowId},
					async : false,
					success : function(data) {
						if(data=="ok")
							window.location.href="xzZjOrder-info-input.do?id="+$('#xzZjOrder-info_id').val();
					},
					error:function(){
						alert("检索失败！");
					}
				});
			}
			
		}
	}

	function saveSelected() {
		var zjArr=new Array();
		$.each( $('#selectResult tr'), function(index, tr){
			var select={fid:$(tr).find('[name="selectedItem"]').val(),zjid:$(tr).find('[filed="zjid"]').html(),ftype:$(tr).find('[filed="zjtype"]').html(),fupdatetime:$(tr).find('[filed="updatetime"]').html()};
			zjArr.push(select);
		});
		
		$.ajax({
			url : '${scopePrefix}/xz/xzZjOrder-info-save-ajax.do',
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			type:'POST',
			data: {
				'xzZjOrder.fid':$('#xzZjOrder-info_id').val(),
				'xzZjOrder.ffzrid':$('#xzZjOrder-info_ffzrid').val(),
				'xzZjOrder.fxmid':$('#xzZjOrder-info_fxmid').val(),
				'xzZjOrder.fstarttime':$('#xzZjOrder-info_fstarttime').val(),
				'xzZjOrder.fendtime':$('#xzZjOrder-info_fendtime').val(),
				'xzZjOrder.fmemo':$('#xzZjOrder-info_fmemo').val(),
				'xzZjOrder.fstatus':$('#xzZjOrder-info_fstatus').val(),
				'xzZjOrder.fbackdate':$('#xzZjOrder-info_fbackdate').val(),
				fzjlist:zjArr
			},
			async : false,
			dataType:'json',
			success : function(data) {
				if(data.fid){
					alert("保存成功");
					window.location.href="xzZjOrder-info-input.do?id="+data.fid;
				}
			},
			error:function(){
				alert("保存失败！");
			}
		});
	}
</script>
</head>
<body>
	<%@include file="/header.jsp"%>
	<div class="row-fluid">
		<%@include file="/menu/xz-workspace.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span10">
			<div class="modal fade lessChooseDiv" style="width:50%;top: 0px;height:90%;"
				hidden="">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
							</button>
							<h4 class="modal-title">精简选择</h4>
						</div>
						<div class="container "style="width: 100%;height:100%;overflow: auto;">
							<iframe id="zjlesschoose" style="width: 100%;height:800px;"></iframe>
						</div>
					</div>
				</div>
			</div>
	<div class="modal fade chooseDiv" style="width:900px;top: -40%;" hidden="">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
					<h4 class="modal-title">证件选择</h4>
				</div>
			<div class="container" style="width:900px;">
				<div style="margin-bottom:5px;">
				    证件类型: 
				    <select id="zjTypeSelect" onchange="changeSearch()" style="margin-bottom:0px;">
				    	<option value="1">公司证件</option>
				    	<option value="2">人员证件</option>
				    	<option value="3">获奖证书</option>
				    	<option value="4">合同</option>
				    	<option value="5">中标通知书</option>
				    	<option value="6">竣工验收报告</option>
				    	<option value="7">红头文件</option>
				    	<option value="8">外部评先</option>
				    </select>  
		    
		    <input type="button" value="查询" class="btn btn-small "  onclick="search()">&nbsp;
	 		<button type="button" class="btn  btn-small btn-primary" id="confirmBtn" onclick="selectItem()">确定</button>&nbsp;
        	<button type="button" class="btn btn-small  btn-default" data-dismiss="modal">关闭</button>
        	<div class="pull-right" style="widows: 400px;">
	        	<div class=" m-pagination pull-left ">
				  <button class="btn btn-small" onclick="prev()">上一页</button>
				  <button class="btn btn-small" onclick="next()">下一页</button>
				</div>
	       		<div class=" pull-right">
					  每页显示<input id="selectPage" value="20" style="width: 40px;" > 条&nbsp;当前第<span id="pageNo">1</span>页
				     <!-- &nbsp; 共<span id="totalCount">0</span>条 当前第<span id="pageCount">0</span> 页 -->
				</div> 
			</div>
        	

			
		 </div>
		
		<div id="xzZjOrderList-infoSearch1" class="content content-inner searchDiv" style="">
			<form  class="form-inline">
					<label class="control-label" for="commRy-info_fname"><spring:message
								code="commRy-info.commRy-info.input.fname" text="证件名称" /></label> 
								<input  type="text" name="fname" style="width: 120px;"  />
				</form>
		</div>
		
		 <div id="xzZjOrderList-infoSearch2" class="content content-inner searchDiv" style="">
		 			<form name="hrZj-infoForm" method="post"
							action="hrZj-info-list.do" class="form-inline">
								<label class="control-label" for="commRy-info_fname">姓名:</label> <input
									id="commRy-info_fname" type="text" name="fname"
									style="width: 120px;" /> <select
									class=" form-control" id="hrRyZj-info_name"
									name="filter_LIKES_fname" style="width: 150px">
									<option value="">证件名称</option>
									<option value="身份证">身份证</option>
									<option value="毕业证">毕业证</option>
									<option value="监理工程师注册证">监理工程师注册证</option>
									<option value="监理工程师资格证">监理工程师资格证</option>
									<option value="一级建造师注册证">一级建造师注册证</option>
									<option value="一级建造师资格证">一级建造师资格证</option>
									<option value="二级建造师注册证">二级建造师注册证</option>
									<option value="二级建造师资格证">二级建造师资格证</option>
									<option value="造价师注册证">造价师注册证</option>
									<option value="造价师资格证">造价师资格证</option>
									<option value="造价师继续教育证">造价师继续教育证</option>
									<option value="交通部监理工程师资格证">交通部监理工程师资格证</option>
									<option value="交通部监理工程师注册证">交通部监理工程师注册证</option>
									<option value="专业监理工程师证">专业监理工程师证</option>
									<option value="高级工程师职称证">高级工程师职称证</option>
									<option value="中级工程师职称证">中级工程师职称证</option>
									<option value="初级工程师职称证">初级工程师职称证</option>
									<option value="监理员证">监理员证</option>
									<option value="资料员证">资料员证</option>
									<option value="见证员证">见证员证</option>
									<option value="安全员证">安全员证</option>
									<option value="造价员证">造价员证</option>
									<option value="试验员证">试验员证</option>
									<option value="建筑节能培训证">建筑节能培训证</option>
								</select> <select class="form-control" id="hrRyZj-info_fzhuanye"
									name="filter_EQS_fzhuanye"  style="width: 150px">
									<option value="">证件专业</option>
									<option value="土建">土建</option>
									<option value="安装">安装</option>
									<option value="桥梁">桥梁</option>
									<option value="水利水电">水利水电</option>
									<option value="市政道路">市政道路</option>
								</select>
								<label class="control-label" for="commRy-info_fname"><spring:message
										code="commRy-info.commRy-info.input.fname" text="年龄" /></label> <input
								  	type="text" name="fagestart"
									style="width: 40px;" 
									 />至
									 <input
									 type="text" name="fageend"
									style="width: 40px;" 
									 />
									  <label
									class="control-label" for="commRy-info_fbydate">毕业时间:</label>
								<div class="input-append datepicker date"
									style="padding-left: 0px;">
									<input type="text" name="fbydatestart"
										size="40" class="text "
										style="background-color:white;cursor:default; width: 80px;"
										 /> <span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;" /><i
										class="icon-calendar"></i></span></div>
										至
								<div class="input-append datepicker date" style="padding-left: 0px;">
										<input  type="text" name="fbydateend"
										size="40" class="text "
										style="background-color:white;cursor:default; width: 80px;"
										 /> <span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;" /><i
										class="icon-calendar"></i></span>
								</div>
								<label class="control-label" for="commRy-info_fname"><spring:message
										code="commRy-info.commRy-info.input.fname" text="毕业专业" /></label> <input
									id="commRy-info_fzhuanye" type="text" name="commRy-info_fzhuanye"
									style="width: 120px;" " 
									class="text " /> <select
									class="form-control"
									name="filter_EQS_flevel" 
									 style="width: 120px">
									<option value="">职称级别</option>
									<option value="高级"
										<c:if test="${param.filter_EQS_fzhuanye=='高级'}"> selected="selected"  </c:if> value="高级">高级</option>
									<option value="中级"
										<c:if test="${param.filter_EQS_fzhuanye=='中级'}"> selected="selected"  </c:if> value="中级">中级</option>
									<option value="初级"
										<c:if test="${param.filter_EQS_fzhuanye=='初级'}"> selected="selected"  </c:if> value="初级">初级</option>
								</select> <label class="control-label" for="commRy-info_fname"><spring:message
										code="commRy-info.commRy-info.input.fname" text="职称专业" /></label> <input
									id="commRy-zicheng_zhuanye" type="text" name="commRy-zicheng_zhuanye"
									style="width: 120px;" 
									class="text " />
						</form>
		</div>
		
		<div id="xzZjOrderList-infoSearch3" class="content content-inner searchDiv" style="">
			<form  class="form-inline">
					<label class="control-label" for="commRy-info_fname">证书名称:</label> <input
							 type="text" name="fname"
							style="width: 120px;" />
					<label class="control-label" for="commRy-info_ftype">类别:</label> <input
							 type="text" name="ftype"
							style="width: 120px;" />
					<label class="control-label" for="commRy-info_fxm">项目:</label> <input
							 type="text" name="fxm"
							style="width: 120px;" />
					<label class="control-label" for="commRy-info_fzj">总监:</label> <input
							 type="text" name="fzj"
							style="width: 120px;" />
					<label class="control-label" for="commRy-info_fyearstart">年度:</label> <input
							 type="text" name="fyear"
							style="width: 120px;" />
							
			</form>
		</div>
		
		 <div id="xzZjOrderList-infoSearch4" class="content content-inner searchDiv" style="">
			<form  class="form-inline">
							<label class="control-label" >合同名称:</label> <input
									 type="text" name="fname" 
									style="width: 120px;"  />
									<label class="control-label" ">工程总投资:</label> <input
									type="number" name="ftouzistart"
									style="width: 90px;"  />~ <input
									 type="number" name="ftouziend"
									style="width: 90px;" 
									class="number "  />
									<label class="control-label" >监理费:</label> <input
									type="number" name="fjianlifeistart"
									style="width: 90px;"  />~ <input
									 type="number" name="fjianlifeiend"
									style="width: 90px;" 
									class="number " />
									<label class="control-label" >总监:</label> <input
									type="text" name="fzjName"
									style="width: 120px;" />
									
								<label class="control-label" ">开工时间:</label> 
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="xzZjOrder-info_fkaigongstart" type="text"
											name="fkaigongstart"  size="40"
											class="text "
											style="background-color:white;cursor:default; width: 175px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>
									~
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="xzZjOrder-info_fkaigongend" type="text"
											name="fkaigongend"  size="40"
											class="text "
											style="background-color:white;cursor:default; width: 175px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>
									
									
									<label class="control-label" ">竣工时间:</label> 	
									
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="xzZjOrder-info_fjungongstart" type="text"
											name="fjungongstart"  size="40"
											class="text "
											style="background-color:white;cursor:default; width: 175px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>~
										<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="xzZjOrder-info_fjungongend" type="text"
											name="fjungongend"  size="40"
											class="text "
											style="background-color:white;cursor:default; width: 175px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>
									
									<label class="control-label" ">项目类别:</label> 	
									<select class="form-control" id="pjXm-info_fprojecttype"
										name="fprojecttype"class=" ">
										<option value="">全部</option>
										<option value="房屋建筑工程">房屋建筑工程</option>
										<option value="市政公用工程">市政公用工程</option>
										<option value="电力工程">电力工程</option>
										<option value="冶炼工程">冶炼工程</option>
										<option value="公路工程">公路工程</option>
										<option value="矿山工程">矿山工程</option>
										<option value="化工石油工程">化工石油工程</option>
										<option value="水利水电工程">水利水电工程</option>
										<option value="农林工程">农林工程</option>
										<option value="铁路工程">铁路工程</option>
										<option value="港口与航道工程">港口与航道工程</option>
										<option value="航天航空工程">航天航空工程</option>
										<option value="通信工程">通信工程</option>
										<option value="机电安装工程">机电安装工程</option>
									</select>
									
						</form>
		</div>

		<div id="xzZjOrderList-infoSearch5" class="content content-inner searchDiv" style="">
			<form name="hrZj-infoForm" method="post"
					action="hrZj-info-list.do" class="form-inline">
					<label class="control-label" for="commRy-info_fname">项目名称:</label> <input
							 type="text" name="fname"
							style="width: 120px;" />
							
						<label class="control-label" for="commRy-info_fzj">总监:</label> <input
							 type="text" name="fzj"
							style="width: 120px;" />
					 <input type="button" value="查询"  class="btn btn-small " onclick="search()">&nbsp;
				</form>
		</div>
		
		<div id="xzZjOrderList-infoSearch6" class="content content-inner searchDiv" style="">
			<form class="form-inline">
					<label class="control-label" for="commRy-info_fname">项目名称:</label> <input
							type="text" name="fname"
							style="width: 120px;" />
					<label class="control-label" for="commRy-info_fzj">总监:</label> <input
							 type="text" name="fzj"
							style="width: 120px;" />
		   </form>
		</div>
		
			
		<div id="xzZjOrderList-infoSearch7" class="content content-inner searchDiv" style="">
			<form class="form-inline">
					<label class="control-label" for="commRy-info_fname">名称:</label> <input
							type="text" name="fname"
							style="width: 120px;" />
		   </form>
		</div>
		
		<div id="xzZjOrderList-infoSearch8" class="content content-inner searchDiv" style="">
			<form class="form-inline">
					<label class="control-label" for="commRy-info_fname">名称:</label> <input
							type="text" name="fname"
							style="width: 120px;" />
		   </form>
		</div>
		
	
						
 <article class="m-widget" >
        <header class="header">
		  <h4 class="title"><spring:message code="xzZjOrderList-info.xzZjOrderList-info.list.title" text="列表"/></h4>
		</header>
        <div class="content" style="width:899px;height:700px; overflow:auto;">
				<form id="xzZjOrderList-searchGridForm" name="xzZjOrderList-searchGridForm" method='post' class="m-form-blank">
				  <table id="xzZjOrderList-searchGrid" class="m-table table-hover table-bordered"  >
				    <thead>
				      <tr>
				        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked,1)"></th>
				        	<th class="sorting" name="ftype" style="width:100px;">证件类型</th>
				        	<th class="sorting" name="fzjid" style="width:500px;">证件信息</th>
				        	<th class="sorting" name="fstatus" style="width:100px;" >在库状态</th>
				        	<th class="sorting" name="forderstatus" style="width:100px;">订单状态</th>
				      </tr>
				    </thead>
				
				    <tbody id="searChResult" >
				    </tbody>
				  </table>
				</form>
        </div>
      </article>
      </div>
	 </div>
  </div>
</div>
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="xzZjOrder-info.xzZjOrder-info.input.title"
							text="编辑" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="xzZjOrder-infoForm" method="post"
						action="xzZjOrder-info-save.do" class="form-horizontal">
						<c:if test="${model != null}">
							<input id="xzZjOrder-info_id" type="hidden" name="fid"
								value="${model.fid}">
						</c:if>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="xzZjOrder-info_ffzrid"><spring:message
										code="xzZjOrder-info.xzZjOrder-info.input.ffzrid" text="负责人" /></label>
								<div class="controls">
									<div class="input-append ryPicker">
										<input id="xzZjOrder-info_ffzrid" type="hidden" name="ffzrid"
											value="${model.ffzrid}"> <input
											id="ryBxRecord-info_ffzrid" type="text"
											value="${ryMap[model.ffzrid].fname}" disabled class=" "
											value=""> <span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-user"></i></span>
									</div>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="xzZjOrder-info_fxmid"><spring:message
										code="xzZjOrder-info.xzZjOrder-info.input.fxmid" text="使用项目" /></label>
								<div class="controls">
									<div class="input-append xmPicker">
										<input id="xzZjOrder-info_fxmid" type="hidden" name="fxmid"
											value="${model.fxmid}"> <input
											id="xmBxRecord-info_xmmc" type="text"
											value="${xmMap[model.fxmid].fname}" disabled
											class=" required" style="width: 175px;" value=""> <span
											class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-th-list"></i></span>
									</div>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="xzZjOrder-info_fstarttime"><spring:message
										code="xzZjOrder-info.xzZjOrder-info.input.fstarttime"
										text="开始使用时间" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="xzZjOrder-info_fstarttime" type="text"
											name="fstarttime" value="${model.fstarttime}" size="40"
											class="text "
											style="background-color:white;cursor:default; width: 175px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="xzZjOrder-info_fendtime"><spring:message
										code="xzZjOrder-info.xzZjOrder-info.input.fendtime"
										text="使用截止时间" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="xzZjOrder-info_fendtime" type="text"
											name="fendtime" value="${model.fendtime}" size="40"
											class="text "
											style="background-color:white;cursor:default; width: 175px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>
								</div>
							</div>
						</div>
						<div class="control-group">
							<div class="span5">
								<label class="control-label" for="xzZjOrder-info_fstatus"><spring:message
										code="xzZjOrder-info.xzZjOrder-info.input.fstatus" text="状态" /></label>
								<div class="controls">
									<select id="xzZjOrder-info_fstatus" type="text" name="fstatus">
										<option value="已申请"
											<c:if test="${model.fstatus=='已申请'}"> selected="selected"  </c:if>>已申请</option>
										<option value="已领取"
											<c:if test="${model.fstatus=='已领取'}"> selected="selected"  </c:if>>已领取</option>
										<option value="已取消"
											<c:if test="${model.fstatus=='已取消'}"> selected="selected"  </c:if>>已取消</option>
										<option value="已超时"
											<c:if test="${model.fstatus=='已超时'}"> selected="selected"  </c:if>>已超时</option>
										<option value="已归还"
											<c:if test="${model.fstatus=='已归还'}"> selected="selected"  </c:if>>已归还</option>
									</select>
								</div>
							</div>
							<div class="span5">
								<label class="control-label" for="xzZjOrder-info_fbackdate"><spring:message
										code="xzZjOrder-info.xzZjOrder-info.input.fbackdate"
										text="归还时间" /></label>
								<div class="controls">
									<div class="input-append datepicker date"
										style="padding-left: 0px;">
										<input id="xzZjOrder-info_fbackdate" type="text"
											name="fbackdate" value="${model.fbackdate}" size="40"
											class="text "
											style="background-color:white;cursor:default; width: 175px;">
										<span class="add-on"
											style="padding-top: 2px; padding-bottom: 2px;"><i
											class="icon-calendar"></i></span>
									</div>
								</div>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="xzZjOrder-info_fmemo"><spring:message
									code="xzZjOrder-info.xzZjOrder-info.input.fmemo" text="备注" /></label>
							<div class="controls">
								<textarea id="xzZjOrder-info_fmemo" name="fmemo"
									class="form-control" rows="3" style="width: 560px"
									class="text  " minlength="" maxlength="500">${model.fmemo}</textarea>
							</div>
						</div>
						<div class="control-group">
							<div class="controls">
								<button type="button" class="btn" onclick="saveSelected()">
									<spring:message code='core.input.save' text='保存' />
								</button>
								&nbsp;
								<button type="button" class="btn a-cancel"
									onclick="history.back();">
									<spring:message code='core.input.back' text='返回' />
								</button>
							</div>
						</div>
					</form>
				</div>
			</article>
			<article class="m-blank">
				<div class="pull-left">
						<button class="btn btn-small a-insert" onclick="showLessChooseDiv()">精简查询</button>
					<region:region-permission permission="xzZjOrderList-info:create">
						<button class="btn btn-small a-insert" onclick="showChooseDiv()">详细查询</button>
					</region:region-permission>
					<region:region-permission permission="xzZjOrderList-info:delete">
						<button class="btn btn-small a-remove" onclick="deleteZj()">删除</button>
					</region:region-permission>
				</div>
				<div class="m-clear"></div>
			</article>
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message
							code="xzZjOrderList-info.xzZjOrderList-info.list.title" text="列表" />
					</h4>
				</header>
				<div class="content">
			<form id="xzZjOrderList-infoGridForm" name="xzZjOrderList-infoGridForm" method='post' action="xzZjOrderList-info-remove.do" class="m-form-blank">
				  <table id="xzZjOrderList-infoGrid" class="m-table table-hover table-bordered">
				    <thead>
				      <tr>
				        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
				        	<th hidden="hidden" >证件id</th>
				        	<th hidden="hidden">证件类型</th>
				        	<th class="sorting" name="ftype">证件类型</th>
				        	<th class="sorting" name="fzjid">证件信息</th>
				        	<th class="sorting" name="fzjid">在库状态</th>
				        	<!-- <th class="sorting" name="fzjid">订单状态</th> -->
				        	<th hidden="hidden">最后更改时间</th>
				        <th width="80">&nbsp;</th>
				      </tr>
				    </thead>
				
				    <tbody id="selectResult">
				       <c:forEach items="${responseMapList}" var="item">
				      <tr>
				        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.fid}"></td>
				        	<td filed="zjid" hidden="hidden">${item.fzjid}</td>
				      	    <td filed="zjtype" hidden="hidden">${item.ftype}</td>
				      	 	<td>
					      	 	 <c:if test="${item.ftype == 1}">公司证件</c:if>
					      	 	 <c:if test="${item.ftype == 2}">人员证件</c:if>
					      	 	 <c:if test="${item.ftype == 3}">获奖证书</c:if>
					      	 	 <c:if test="${item.ftype == 4}">合同</c:if>
					      	 	 <c:if test="${item.ftype == 5}">中标通知书</c:if>
					      	 	 <c:if test="${item.ftype == 6}">竣工验收报告</c:if>
					      	 	   <c:if test="${item.ftype == 7}">红头文件</c:if>
					      	 	   <c:if test="${item.ftype == 8}">外部评先</c:if>
				      	 	 </td>
				      	    <td>${item.fzjinfo}</td>
				      	    <td>
				      	  		  <c:if test="${item.fstatus=='1'}"><font color="green">在库</font></c:if>
				      	  		  <c:if test="${item.fstatus=='2'}"><font color="red">未在库</font></c:if>
				      	    </td>
				      	    <td filed="updatetime" hidden="hidden">${item.lastupdate}</td>
				      </tr>
				      </c:forEach> 
				    </tbody>
				  </table>
				</form>
				</div>
			</article>
		</section>
		<!-- end of main -->
	</div>
</body>
</html>
