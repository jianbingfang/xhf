<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "jl-home");
%>
<%
	pageContext.setAttribute("currentMenu", "jl-xcgl");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="dev.jlTouzi-info.list.title"
		text="列表" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript">
	var config = {
		id : '${lowerName}-infoGrid',
		pageNo : ${page.pageNo},
		pageSize : ${page.pageSize},
		totalCount : ${page.totalCount},
		resultSize : ${page.resultSize},
		pageCount : ${page.pageCount},
		orderBy : '${page.orderBy == null ? "" : page.orderBy}',
		asc : ${page.asc},
		params : {
			'filter_LIKES_name' : '${param.filter_LIKES_name}'
		},
		selectedItemClass : 'selectedItem',
		gridFormId : 'jlTouzi-infoGridForm',
		exportUrl : 'jlTouzi-info-export.do'
	};

	var commid="";
	function showEdit(id, value) {
		commid=id;
		$('#jlTouzi-info_fjine').val($('#'+commid).val());
		$(".editModal").css("top", "0");
		$('.editModal').modal();
	}

	
	
	function goDetail(ftype){
		window.location.href="jlTouzi-info-list.do?ftype="+ftype;
	}
	
	function doSubmit(){
		$('#'+commid).val($('#jlTouzi-info_fjine').val());
		$.ajax({
			url : '${scopePrefix}/jl/jlTouziCount-info-save-ajax.do',
			contentType: 'application/x-www-form-urlencoded; charset=utf-8',
			type:'POST',
			data: {
				'fid': $('#jlTouzi-info_id').val(),
				'fgstze': $('#jlTouzi-info_fgstze').val(),
				'fgcjsj':$('#jlTouzi-info_fgcjsj').val() ,
			},
			async : false,
			dataType:'json',
			success : function(data) {
				if(data){
					$('#jlTouzi-info_id').val(data.fid);
					$('#jlTouzi-info_fgstze').val(data.fgstze);
					$('#jlTouzi-info_fgcjsj').val(data.fgcjsj);
					$('.editModal').modal('hide');
					alert("保存成功！");
				}
			},
			error:function(){
				alert("保存失败！");
			}
		});
		$('.editModal').modal('hide');
	}
</script>
</head>
<body>
	<%@include file="/header.jsp"%>
	<div class="row-fluid">
		<%@include file="/menu/jl-workspace.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span10">
			<%--   <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="jlTouzi-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="jlTouzi-infoSearch" class="content content-inner">

		  <form name="jlTouzi-infoForm" method="post" action="jlTouzi-info-list.do" class="form-inline">
		    <label for="jlTouzi-info_name"><spring:message code='jlTouzi-info.jlTouzi-info.list.search.name' text='名称'/>:</label>
		    <input type="text" id="jlTouzi-info_name" name="filter_LIKES_name" value="${param.filter_LIKES_name}">
			<button class="btn btn-small a-search" onclick="document.jlTouzi-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>
 --%>
			<div class="modal fade editModal" style="width: 800px;top: -100%;">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
							</button>
							<h4 class="modal-title">编辑</h4>
						</div>
						<div class="container">
							<form id="jlTouzi-infoForm" method="post"
								action="jlTouzi-info-save.do" class="form-horizontal">
								<c:if test="${jlTouziCount != null}">
									<input id="jlTouzi-info_id" type="hidden" name="fid"
										value="${jlTouziCount.fid}">
								</c:if>
								<input id="jlTouzi-info_ftype" type="hidden" name="ftype"
									value="gstze">
								<div class="row-fluid">
									<label class="control-label" for="jlTouzi-info_fjine"><spring:message
											code="jlTouzi-info.jlTouzi-info.input.fjine" text="金额" /></label>
									<div class="controls">
										<input id="jlTouzi-info_fjine" type="text" name="fjine"
											value="" size="" class="text required"
											maxlength="">
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="doSubmit()"
							id="confirmBtn">确定</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
			<!-- /.modal -->
			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="jlTouzi-info.jlTouzi-info.list.title"
							text="投资控制" />
					</h4>
				</header>
				<div class="content content-inner">
					<form id="jlTouzi-infoGridForm" name="jlTouzi-infoGridForm"
						method='post' class="m-form-blank" action="jlTouzi-info-save.do">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label class="control-label" for="jlTouzi-info_fgstze">概算投资额</label>
								</div>
								<div class="span8">
									<input id="jlTouzi-info_fgstze" type="text" name="fgstze"
										value="${jlTouziCount.fgstze}" size="" class="text" maxlength="" readonly
										onclick="showEdit('jlTouzi-info_fgstze','${jlTouziCount.fgstze}')"><i
										class="icon-pencil " onclick="showEdit('jlTouzi-info_fgstze','${jlTouziCount.fgstze}')"></i>
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<label class="control-label" for="jlTouzi-info_fgcjsj">工程结算价</label>
								</div>
								<div class="span8">
									<input id="jlTouzi-info_fgcjsj" type="text" name="fjsj"
										value="${jlTouziCount.fgcjsj}" size="" class="text" maxlength="" readonly
										onclick="showEdit('jlTouzi-info_fgcjsj','${jlTouziCount.fgcjsj}')"><i
										onclick="showEdit('jlTouzi-info_fgcjsj','${jlTouziCount.fgcjsj}')" class="icon-pencil"></i>
								</div>
							</div>
						</div>
						<div class="row-fluid" style="height:50px;"></div>
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label class="control-label" for="jlTouzi-info_fhtjk">合同价款</label>
								</div>
								<div class="span8">
									<button  type="button" id="jlTouzi-info_fhtjk"  onclick="goDetail(2)" class="btn" >
										<i class="icon-th-list"></i>查看详细
									</button>
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<label class="control-label" for="jlTouzi-info_fgckzf">工程款支付</label>
								</div>
								<div class="span8">
									<button type="button" id="jlTouzi-info_fgckzf" onclick="goDetail(3)" class="btn">
										<i class="icon-th-list"></i>查看详细
									</button>
								</div>
							</div>
						</div>
						<div class="row-fluid" style="height:50px;"></div>
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label class="control-label"  for="jlTouzi-info_fsjbg">设计变更</label>
								</div>
								<div class="span8">
									<button type="button" onclick="goDetail(4)" id="jlTouzi-info_fsjbg" class="btn">
										<i class="icon-th-list"></i>查看详细
									</button>
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<label class="control-label" for="jlTouzi-info_fxcqz">现场签证</label>
								</div>
								<div class="span8">
									<button type="button"   onclick="goDetail(5)"  id="jlTouzi-info_fxcqz" class="btn">
										<i class="icon-th-list"></i>查看详细
									</button>
								</div>
							</div>
						</div>
						<div class="row-fluid" style="height:30px;"></div>
					</form>
				</div>
			</article>
		</section>
		<!-- end of main -->
	</div>
</body>
</html>
