<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "sckf-home");
%>
<%
	pageContext.setAttribute("currentMenu", "sckf-xmtb");
%>
<!doctype html>
<html lang="zh">

<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="jyTb-info.jyTb-info.input.title"
		text="编辑" /></title>
<%@include file="/common/s.jsp"%>
<script type="text/javascript">
	function rycjSelect() {
		$("#ryzjDIV").modal();
	}
	function gszjSelect() {
		$("#gszjDIV").modal();
	}
	function hjzsSelect() {
		$("#hjzsDIV").modal();
	}
	function htSelect() {
		$("#htDIV").modal();
	}
	function zbtzsSelect() {
		$("#zbtzsDIV").modal();
	}
	function jgysbgSelect() {
		$("#jgysbgDIV").modal();
	}

	$(function() {
		$("#jyTb-infoForm")
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
	});
</script>
</head>

<body>
	<%@include file="/header.jsp"%>

	<div class="row-fluid">
		<%@include file="/menu/sckf-workspace.jsp"%>

		<!-- start of main -->
		<section id="m-main" class="span10">

			<article class="m-widget">
				<header class="header">
					<h4 class="title">
						<spring:message code="jyTb-info.jyTb-info.input.title"
							text="证件预定单" />
					</h4>
				</header>
				<form id="jyxm-jyBm-infoForm" method="post"
					action="jyxm-jyBm-info-save.do" class="form-horizontal">
					<div class="row-fluid">
						<div class="span5 ">
							<label class="control-label" for="hrRyZj-info_fyxjs"><spring:message
									code="hrRyZj-info.hrRyZj-info.input.fyxjs" text="申请人" /></label>
							<div class="controls">
								<input id="hrRyZj-info_fyxjs" type="text" name="fzhengjianno"
									value="${model.fzhengjianno}" size="40" class="text required"
									style="background-color:white;cursor:default; width: 175px;" />
							</div>
						</div>
						<div class="span7">
							<label class="control-label" for="hrRyZj-info_fyxjs"><spring:message
									code="hrRyZj-info.hrRyZj-info.input.fsysjStart" text="使用时间" /></label>
							<div class="controls">
								<div class="input-append datepicker date"
									style="padding-left: 0px;">
									<input id="hrRyZj-info_fsysjStart" type="text required"
										name="fsysjStart" value="${model.fsysjStart}" size="40"
										class="text required"
										style="background-color:white;cursor:default; width: 150px;" />
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-calendar"></i></span>
								</div>
								到
								<div class="input-append datepicker date"
									style="padding-left: 0px;">
									<input id="hrRyZj-info_fsysjEnd" type="text required"
										name="fsysjEnd" value="${model.fsysjEnd}" size="40"
										class="text required"
										style="background-color:white;cursor:default; width: 150px;" />
									<span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;"><i
										class="icon-calendar"></i></span>
								</div>
							</div>
						</div>
					</div>
				</form>
				<div class="span11">
					<article class="m-widget">
						<header>
							<h4 class="title">
								<spring:message code="jyTb-info.jyTb-info.input.title"
									text="已选证件列表" />
							</h4>
						</header>
						<article class="m-widget">
							<header class="header">
								<h4 class="title">公司证件</h4>
								<div class="ctrl" style="float: right;">
									<a class="btn"><i id="hrZj-infoGridDIVIcon"
										class="icon-chevron-up"></i></a>
								</div>
								<div class="btn btn-mini " type="button" style="float: right">删除</div>
								<div class="btn btn-mini btn-primary" type="button"
									onclick="gszjSelect()" style="float: right">添加</div>

							</header>
							<div id="gszj-infoGridDIV" class="content content-inner">
								<table id="gszj-infoGrid" class="m-table table-hover table-bordered">
									<thead>
										<tr>
											<th width="10" class="m-table-check"><input
												type="checkbox" name="checkAll"
												onchange="toggleSelectedItems(this.checked)"></th>
											<th class="sorting" name="fid" hidden>fid</th>
											<th class="sorting" name="fname">证件名称</th>
											<th class="sorting" name="ftype">份数</th>
											<th class="sorting" name="fstate">证件状态</th>
											<th width="80">操作</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${page.result}" var="item">
											<tr>
												<td><input type="checkbox" class="selectedItem a-check"
													name="selectedItem" value="${item.fid}"></td>
												<td hidden>${item.fid}</td>
												<td>${item.fname}</td>
												<td>${item.fzy}</td>
												<td>${item.ftype}</td>
												<td>${item.fstate}</td>
												<td><a href="hrZj-info-input.do?id=${item.fid}"
													class="a-update"><spring:message code="core.list.edit"
															text="查看" /></a><a href="hrZj-info-input.do?id=${item.fid}"
													class="a-update"><spring:message code="core.list.edit"
															text="删除" /></a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</article>
						<article class="m-widget">
							<header class="header">
								<h4 class="title">人员证件</h4>
								<div class="ctrl" style="float: right;">
									<a class="btn"><i id="ryzj-infoGrid-ryDIVIcon"
										class="icon-chevron-up"></i></a>
								</div>
								<div class="btn btn-mini " type="button" style="float: right">删除</div>
								<div class="btn btn-mini btn-primary" type="button"
									onclick="rycjSelect()" style="float: right">添加</div>
							</header>
							<div id="ryzj-infoGridDIV" class="content content-inner">
								<table id="ryzj-infoGrid" class="m-table table-hover table-bordered">
									<thead>
										<tr>
											<th width="10" class="m-table-check"><input
												type="checkbox" name="checkAll"
												onchange="toggleSelectedItems(this.checked)"></th>
											<th class="sorting" name="fid" hidden>fid</th>
											<th class="sorting" name="fryname">姓名</th>
											<th class="sorting" name="fage">年龄</th>
											<th class="sorting" name="fbydate">毕业时间</th>
											<th class="sorting" name="fbyzy">毕业专业</th>
											<th class="sorting" name="fzjname">证件名称</th>
											<th class="sorting" name="fzy">证件专业</th>
											<th class="sorting" name="fzcname">职称名称</th>
											<th class="sorting" name="fzczy">职称专业</th>
											<th class="sorting" name="fstate">证件状态</th>
											<th width="80">操作</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${page.result}" var="item">
											<tr>
												<td><input type="checkbox" class="selectedItem a-check"
													name="selectedItem" value="${item.fid}"></td>
												<td hidden>${item.fid}</td>
												<td>${item.fryname}</td>
												<td>${item.fage}</td>
												<td>${item.fbydate}</td>
												<td>${item.fzjname}</td>
												<td>${item.fzy}</td>
												<td>${item.fzjname}</td>
												<td>${item.fzy}</td>
												<td>${item.fzcname}</td>
												<td>${item.fzczy}</td>
												<td>${item.fstate}</td>
												<td><a href="hrZj-info-input.do?id=${item.fid}"
													class="a-update"><spring:message code="core.list.edit"
															text="查看" /></a><a href="hrZj-info-input.do?id=${item.fid}"
													class="a-update"><spring:message code="core.list.edit"
															text="删除" /></a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
						</article>
						<article class="m-widget">
							<header class="header">
								<h4 class="title">获奖证书</h4>
								<div class="ctrl" style="float: right;">
									<a class="btn"><i id="hrZj-infoGrid-ryDIVIcon"
										class="icon-chevron-up"></i></a>
								</div>
								<div class="btn btn-mini " type="button" style="float: right">删除</div>
								<div class="btn btn-mini btn-primary" type="button"
									onclick="hjzsSelect()" style="float: right">添加</div>
							</header>
							<div class="content content-inner">
								<table id="hjzs-infoGrid" class="m-table table-hover table-bordered">
									<thead>
										<tr>
											<th width="10" class="m-table-check"><input
												type="checkbox" name="checkAll"
												onchange="toggleSelectedItems(this.checked)"></th>
											<th class="sorting" name="fid" hidden>fid</th>
											<th class="sorting" name="fname">证件名称</th>
											<th class="sorting" name="fxmname">项目名称</th>
											<th class="sorting" name="fhjnd">获奖年度</th>
											<th class="sorting" name="fwjmc">文件名称</th>
											<th class="sorting" name="fstate">证件状态</th>
											<th width="80">操作</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${page.result}" var="item">
											<tr>
												<td><input type="checkbox" class="selectedItem a-check"
													name="selectedItem" value="${item.fid}"></td>
												<td hidden>${item.fid}</td>
												<td>${item.fname}</td>
												<td>${item.fzy}</td>
												<td>${item.ftype}</td>
												<td>${item.fstate}</td>
												<td><a href="hrZj-info-input.do?id=${item.fid}"
													class="a-update"><spring:message code="core.list.edit"
															text="查看" /></a><a href="hrZj-info-input.do?id=${item.fid}"
													class="a-update"><spring:message code="core.list.edit"
															text="删除" /></a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</article>
						<article class="m-widget">
							<header class="header">
								<h4 class="title">合同</h4>
								<div class="ctrl" style="float: right;">
									<a class="btn"><i id="hrZj-infoGrid-ryDIVIcon"
										class="icon-chevron-up"></i></a>
								</div>
								<div class="btn btn-mini " type="button" style="float: right">删除</div>
								<div class="btn btn-mini btn-primary" type="button"
									onclick="htSelect()" style="float: right">添加</div>
							</header>
							<div class="content content-inner">
								<table id="ht-infoGrid" class="m-table table-hover table-bordered"
									style="height: 100px;">
									<thead>
										<tr>
											<th width="10" class="m-table-check"><input
												type="checkbox" name="checkAll"
												onchange="toggleSelectedItems(this.checked)"></th>
											<th class="sorting" name="fid" hidden>fid</th>
											<th class="sorting" name="fname">工程名称</th>
											<th class="sorting" name="fzy">监理费</th>
											<th class="sorting" name="ftype">工程总投资</th>
											<th class="sorting" name="ftype">所在城市</th>
											<th class="sorting" name="ftype">总监</th>
											<th class="sorting" name="fstate">证件状态</th>
											<th width="80">操作</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${page.result}" var="item">
											<tr>
												<td><input type="checkbox" class="selectedItem a-check"
													name="selectedItem" value="${item.fid}"></td>
												<td hidden>${item.fid}</td>
												<td>${item.fname}</td>
												<td>${item.fzy}</td>
												<td>${item.ftype}</td>
												<td>${item.ftype}</td>
												<td>${item.fstate}</td>
												<td><a href="hrZj-info-input.do?id=${item.fid}"
													class="a-update"><spring:message code="core.list.edit"
															text="删除" /></a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</article>
						<article class="m-widget">
							<header class="header">
								<h4 class="title">中标通知书</h4>
								<div class="ctrl" style="float: right;">
									<a class="btn"><i id="hrZj-infoGrid-ryDIVIcon"
										class="icon-chevron-up"></i></a>
								</div>
								<div class="btn btn-mini " type="button" style="float: right">删除</div>
								<div class="btn btn-mini btn-primary" type="button"
									onclick="zbtzsSelect()" style="float: right">添加</div>
							</header>
							<div class="content content-inner">
								<table id="zbtzs-infoGrid" class="m-table table-hover table-bordered"
									style="height: 100px;">
									<thead>
										<tr>
											<th width="10" class="m-table-check"><input
												type="checkbox" name="checkAll"
												onchange="toggleSelectedItems(this.checked)"></th>
											<th class="sorting" name="fid" hidden>fid</th>
											<th class="sorting" name="fname">项目名称</th>
											<th class="sorting" name="fzy">中标金额</th>
											<th class="sorting" name="ftype">发证日期</th>
											<th class="sorting" name="fstate">证件状态</th>
											<th width="80">操作</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${page.result}" var="item">
											<tr>
												<td><input type="checkbox" class="selectedItem a-check"
													name="selectedItem" value="${item.fid}"></td>
												<td hidden>${item.fid}</td>
												<td>${item.fname}</td>
												<td>${item.fzy}</td>
												<td>${item.ftype}</td>
												<td>${item.fstate}</td>
												<td><a href="hrZj-info-input.do?id=${item.fid}"
													class="a-update"><spring:message code="core.list.edit"
															text="查看" /></a><a href="hrZj-info-input.do?id=${item.fid}"
													class="a-update"><spring:message code="core.list.edit"
															text="删除" /></a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</article>
						<article class="m-widget">
							<header class="header">
								<h4 class="title">竣工验收报告</h4>
								<div class="ctrl" style="float: right;">
									<a class="btn"><i id="hrZj-infoGrid-ryDIVIcon"
										class="icon-chevron-up"></i></a>
								</div>
								<div class="btn btn-mini " type="button" style="float: right">删除</div>
								<div class="btn btn-mini btn-primary" type="button"
									onclick="jgysbgSelect()" style="float: right">添加</div>
							</header>
							<div class="content content-inner">
								<table id="jgysbg-infoGrid" class="m-table table-hover table-bordered">
									<thead>
										<tr>
											<th width="10" class="m-table-check"><input
												type="checkbox" name="checkAll"
												onchange="toggleSelectedItems(this.checked)"></th>
											<th class="sorting" name="fid" hidden>fid</th>
											<th class="sorting" name="fname">项目名称</th>
											<th class="sorting" name="fzy">竣工时间</th>
											<th class="sorting" name="ftype">发证日期</th>
											<th width="80">操作</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${page.result}" var="item">
											<tr>
												<td><input type="checkbox" class="selectedItem a-check"
													name="selectedItem" value="${item.fid}"></td>
												<td hidden>${item.fid}</td>
												<td>${item.fname}</td>
												<td>${item.fzy}</td>
												<td>${item.ftype}</td>
												<td>${item.fstate}</td>
												<td><a href="hrZj-info-input.do?id=${item.fid}"
													class="a-update"><spring:message code="core.list.edit"
															text="查看" /></a><a href="hrZj-info-input.do?id=${item.fid}"
													class="a-update"><spring:message code="core.list.edit"
															text="删除" /></a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</article>
				</div>
				<div id="gszjDIV" class="modal hide fade">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="title">公司证件选择</h4>
					</div>
					<div class="modal-body">
						<table id="gszj-select-infoGrid" class="m-table table-hover table-bordered">
							<thead>
								<tr>
									<th width="10" class="m-table-check"><input
										type="checkbox" name="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th>
									<th class="sorting" name="fid" hidden>fid</th>
									<th class="sorting" name="fname">证件名称</th>
									<th class="sorting" name="fzy">份数</th>
									<th class="sorting" name="fstate">证件状态</th>
									<th width="80">操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.result}" var="item">
									<tr>
										<td><input type="checkbox" class="selectedItem a-check"
											name="selectedItem" value="${item.fid}"></td>
										<td hidden>${item.fid}</td>
										<td>${item.fname}</td>
										<td>${item.fzy}</td>
										<td>${item.fstate}</td>
										<td><a href="hrZj-info-input.do?id=${item.fid}"
											class="a-update"><spring:message code="core.list.edit"
													text="查看" /></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<button class="btn  btn-primary"
							onclick="document.hrZj-infoForm.submit()">选择</button>
					</div>
				</div>
				<div id="ryzjDIV" class="modal hide fade">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="title">人员证件选择</h4>
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
								gridFormId : 'hrZj-infoGridForm',
								exportUrl : 'hrZj-info-export.do'
							};
						</script>
					</div>
					<div class="modal-body">
						<form name="hrZj-infoForm" method="post"
							action="hrZj-info-list.do" class="form-inline">
							<div class="row-fluid">
								<label class="control-label" for="commRy-info_fname"><spring:message
										code="commRy-info.commRy-info.input.fname" text="姓名" /></label> <input
									id="commRy-info_fname" type="text" name="fname"
									style="width: 120px;" value="${model.fname}" size=""
									class="text " minlength="" maxlength="" /> <select
									class=" form-control" id="hrRyZj-info_name"
									name="filter_LIKES_fname" value="${param.filter_LIKES_fname}"
									class=" " style="width: 150px">
									<option>证件名称</option>
									<option value="身份证"
										<c:if test="${param.filter_LIKES_fname=='身份证'}"> selected="selected"  </c:if>="">身份证</option>
									<option value="毕业证"
										<c:if test="${param.filter_LIKES_fname=='毕业证'}"> selected="selected"  </c:if>="">毕业证</option>
									<option value="监理工程师注册证"
										<c:if test="${param.filter_LIKES_fname=='监理工程师注册证'}"> selected="selected"  </c:if>="">监理工程师注册证</option>
									<option value="监理工程师资格证"
										<c:if test="${param.filter_LIKES_fname=='监理工程师资格证'}"> selected="selected" </c:if>="">监理工程师资格证</option>
									<option value="一级建造师注册证"
										<c:if test="${param.filter_LIKES_fname=='一级建造师注册证'}"> selected="selected"  </c:if>="">一级建造师注册证</option>
									<option value="一级建造师资格证"
										<c:if test="${param.filter_LIKES_fname=='一级建造师资格证'}"> selected="selected"  </c:if>="">一级建造师资格证</option>
									<option value="二级建造师注册证"
										<c:if test="${param.filter_LIKES_fname=='二级建造师注册证'}"> selected="selected"  </c:if>="">二级建造师注册证</option>
									<option value="二级建造师资格证"
										<c:if test="${param.filter_LIKES_fname=='二级建造师资格证'}"> selected="selected"  </c:if>="">二级建造师资格证</option>
									<option value="造价师注册证"
										<c:if test="${param.filter_LIKES_fname=='造价师注册证'}"> selected="selected" </c:if>="">造价师注册证</option>
									<option value="造价师资格证"
										<c:if test="${param.filter_LIKES_fname=='造价师资格证'}"> selected="selected"  </c:if>="">造价师资格证</option>
									<option value="造价师继续教育证"
										<c:if test="${param.filter_LIKES_fname=='造价师继续教育证'}"> selected="selected"  </c:if>="">造价师继续教育证</option>
									<option value="交通部监理工程师资格证"
										<c:if test="${param.filter_LIKES_fname=='交通部监理工程师资格证'}"> selected="selected"  </c:if>="">交通部监理工程师资格证</option>
									<option value="专业监理工程师证"
										<c:if test="${param.filter_LIKES_fname=='专业监理工程师证'}"> selected="selected" </c:if>="">专业监理工程师证</option>
									<option value="高级工程师职称证"
										<c:if test="${param.filter_LIKES_fname=='高级工程师职称证'}"> selected="selected"  </c:if>="">高级工程师职称证</option>
									<option value="中级工程师职称证"
										<c:if test="${param.filter_LIKES_fname=='中级工程师职称证'}"> selected="selected"  </c:if>="">中级工程师职称证</option>
									<option value="初级工程师职称证"
										<c:if test="${param.filter_LIKES_fname=='初级工程师职称证'}"> selected="selected"  </c:if>="">初级工程师职称证</option>
									<option value="监理员证"
										<c:if test="${param.filter_LIKES_fname=='监理员证'}"> selected="selected"  </c:if>="">监理员证</option>
									<option value="资料员证"
										<c:if test="${param.filter_LIKES_fname=='资料员证'}"> selected="selected" </c:if>="">资料员证</option>
									<option value="见证员证"
										<c:if test="${param.filter_LIKES_fname=='见证员证'}"> selected="selected"  </c:if>="">见证员证</option>
									<option value="安全员证"
										<c:if test="${param.filter_LIKES_fname=='安全员证'}"> selected="selected"  </c:if>="">安全员证</option>
									<option value="造价员证"
										<c:if test="${param.filter_LIKES_fname=='造价员证'}"> selected="selected"  </c:if>="">造价员证</option>
									<option value="试验员证"
										<c:if test="${param.filter_LIKES_fname=='试验员证'}"> selected="selected"  </c:if>="">试验员证</option>
									<option value="建筑节能培训证"
										<c:if test="${param.filter_LIKES_fname=='建筑节能培训证'}"> selected="selected" </c:if>="">建筑节能培训证</option>
								</select> <select class="form-control" id="hrRyZj-info_fzhuanye"
									name="filter_EQS_fzhuanye" value="${param.filter_EQS_fzhuanye}"
									class=" " style="width: 150px">
									<option>证件专业</option>
									<option value="土建"
										<c:if test="${param.filter_EQS_fzhuanye=='土建'}"> selected="selected"  </c:if>="">土建</option>
									<option value="安装"
										<c:if test="${param.filter_EQS_fzhuanye=='安装'}"> selected="selected"  </c:if>="">安装</option>
									<option value="桥梁"
										<c:if test="${param.filter_EQS_fzhuanye=='桥梁'}"> selected="selected"  </c:if>="">桥梁</option>
									<option value="水利水电"
										<c:if test="${param.filter_EQS_fzhuanye=='水利水电'}"> selected="selected" </c:if>="">水利水电</option>
									<option value="市政道路"
										<c:if test="${param.filter_EQS_fzhuanye=='2'}"> selected="selected"  </c:if>="">市政道路</option>
								</select>
							</div>
							<div class="row-fluid">
								<label class="control-label" for="commRy-info_fname"><spring:message
										code="commRy-info.commRy-info.input.fname" text="年龄" /></label> <input
									id="commRy-info_fname" type="text" name="fname"
									style="width: 120px;" value="${model.fname}" size=""
									class="text " minlength="" maxlength="" /> <label
									class="control-label" for="commRy-info_fbydate"><spring:message
										code="commRy-info.commRy-info.input.fbydate" text="毕业时间" /></label>
								<div class="input-append datepicker date"
									style="padding-left: 0px;">
									<input id="commRy-info_fbydate" type="text" name="fbydate"
										value="${model.fbydate}" size="40" class="text "
										style="background-color:white;cursor:default; width: 120px;"
										onchange="sj()" /> <span class="add-on"
										style="padding-top: 2px; padding-bottom: 2px;" /><i
										class="icon-calendar"></i></span>
								</div>
							</div>
							<div class="row-fluid">
								<label class="control-label" for="commRy-info_fname"><spring:message
										code="commRy-info.commRy-info.input.fname" text="毕业专业" /></label> <input
									id="commRy-info_fname" type="text" name="fname"
									style="width: 120px;" value="${model.fname}" size=""
									class="text " minlength="" maxlength="" /> <select
									class="form-control" id="hrRyZj-info_fzhuanye"
									name="filter_EQS_fzhuanye" value="${param.filter_EQS_fzhuanye}"
									class=" " style="width: 120px">
									<option>职称级别</option>
									<option value="高级"
										<c:if test="${param.filter_EQS_fzhuanye=='高级'}"> selected="selected"  </c:if>="">高级</option>
									<option value="中级"
										<c:if test="${param.filter_EQS_fzhuanye=='中级'}"> selected="selected"  </c:if>="">中级</option>
									<option value="初级"
										<c:if test="${param.filter_EQS_fzhuanye=='初级'}"> selected="selected"  </c:if>="">初级</option>
								</select> <label class="control-label" for="commRy-info_fname"><spring:message
										code="commRy-info.commRy-info.input.fname" text="职称专业" /></label> <input
									id="commRy-info_fname" type="text" name="fname"
									style="width: 120px;" value="${model.fname}" size=""
									class="text " minlength="" maxlength="" />
							</div>
							<button class="btn btn-mini btn-primary" style="float: right;"
								onclick="document.hrZj-infoForm.submit()">查询</button>
						</form>

						<table id="hrZj-infoGrid" class="m-table table-hover table-bordered">
							<thead>
								<tr>
									<th width="10" class="m-table-check"><input
										type="checkbox" name="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th>
									<th class="sorting" name="fid" hidden="">fid</th>
									<th class="sorting" name="fname">证件名称</th>
									<th class="sorting" name="fzy">专业</th>
									<th class="sorting" name="ftype">证件类型</th>
									<th class="sorting" name="ftype">证件状态</th>
									<th width="80">操作</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach items="${page.result}" var="item">
									<tr>
										<td><input type="checkbox" class="selectedItem a-check"
											name="selectedItem" value="${item.fid}"></td>
										<td hidden="">${item.fid}</td>
										<td>${item.fname}</td>
										<td>${item.fzy}</td>
										<td>${item.ftype}</td>
										<td>${item.fstate}</td>
										<td><a href="hrZj-info-input.do?id=${item.fid}"
											class="a-update"><spring:message code="core.list.edit"
													text="查看" /></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<article>
							<div class="m-page-info pull-left">共100条记录 显示1到10条记录</div>
							<div class="btn-group m-pagination pull-right">
								<button class="btn btn-small">&lt;</button>
								<button class="btn btn-small">1</button>
								<button class="btn btn-small">&gt;</button>
							</div>
							<div class="m-clear"></div>
						</article>
					</div>
				<button class="btn  btn-primary btn-block"
							onclick="document.hrZj-infoForm.submit()">选择</button>
				</div>
				<div id="hjzsDIV" class="modal hide fade">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="title">获奖证书选择</h4>
					</div>
					<div class="modal-body">
						<form name="hrZj-infoForm" method="post"
							action="hrZj-info-list.do" class="form-inline">

							<button class="btn btn-mini btn-primary" style="float: right;"
								onclick="document.hrZj-infoForm.submit()">查询</button>
						</form>
						<table id="hrZj-infoGrid" class="m-table table-hover table-bordered">
							<thead>
								<tr>
									<th width="10" class="m-table-check"><input
										type="checkbox" name="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th>
									<th class="sorting" name="fid" hidden="">fid</th>
									<th class="sorting" name="fname">证件类型</th>
									<th class="sorting" name="fzy">项目名称</th>
									<th class="sorting" name="ftype">获奖年度</th>
									<th class="sorting" name="ftype">文件名称</th>
									<th class="sorting" name="ftype">证件状态</th>
									<th width="80">操作</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach items="${page.result}" var="item">
									<tr>
										<td><input type="checkbox" class="selectedItem a-check"
											name="selectedItem" value="${item.fid}"></td>
										<td hidden="">${item.fid}</td>
										<td>${item.fname}</td>
										<td>${item.fzy}</td>
										<td>${item.ftype}</td>
										<td>${item.fstate}</td>
										<td>${item.fstate}</td>
										<td><a href="hrZj-info-input.do?id=${item.fid}"
											class="a-update"><spring:message code="core.list.edit"
													text="查看" /></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				<button class="btn  btn-primary btn-block"
							onclick="document.hrZj-infoForm.submit()">选择</button>
				</div>
				<div id="htDIV" class="modal hide fade">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="title">合同选择</h4>
						 	<button class="btn btn-mini btn-danger" style="float: right;"
							onclick="document.hrZj-infoForm.submit()">查询</button> 
					</div>
					<div class="modal-body">
						<form name="hrZj-infoForm" method="post"
							action="hrZj-info-list.do" class="form-inline">
							<label class="control-label" for="commRy-info_fname"><spring:message
										code="commRy-info.commRy-info.input.fname" text="工程名称" /></label> <input
									id="commRy-info_fname" type="text" name="fname"
									style="width: 120px;" value="${model.fname}" size=""
									class="text " minlength="" maxlength="" />
									<label class="control-label" for="commRy-info_fname"><spring:message
										code="commRy-info.commRy-info.input.fname" text="工程总投资" /></label> <input
									id="commRy-info_fname" type="number" name="fname"
									style="width: 90px;" value="${model.fname}" size=""
									class="number " minlength="" maxlength="" />~ <input
									id="commRy-info_fname" type="number" name="fname"
									style="width: 90px;" value="${model.fname}" size=""
									class="number " minlength="" maxlength="" />
									<label class="control-label" for="commRy-info_fname"><spring:message
										code="commRy-info.commRy-info.input.fname" text="所在城市" /></label> <input
									id="commRy-info_fname" type="text" name="fname"
									style="width: 120px;" value="${model.fname}" size=""
									class="text " minlength="" maxlength="" />
									<label class="control-label" for="commRy-info_fname"><spring:message
										code="commRy-info.commRy-info.input.fname" text="总监姓名" /></label> <input
									id="commRy-info_fname" type="text" name="fname"
									style="width: 120px;" value="${model.fname}" size=""
									class="text " minlength="" maxlength="" />
							<button class="btn btn-mini btn-primary" style="float: right;"
								onclick="document.hrZj-infoForm.submit()">查询</button>
						</form>
						<table id="hrZj-infoGrid" class="m-table table-hover table-bordered">
							<thead>
								<tr>
									<th width="10" class="m-table-check"><input
										type="checkbox" name="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th>
									<th class="sorting" name="fid" hidden="">fid</th>
									<th class="sorting" name="fname">项目名称</th>
									<th class="sorting" name="fzy">监理费</th>
									<th class="sorting" name="ftype">工程总投资</th>
									<th class="sorting" name="ftype">所在城市</th>
									<th class="sorting" name="ftype">总监</th>
									<th class="sorting" name="ftype">证件状态</th>
									<th width="80">操作</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach items="${page.result}" var="item">
									<tr>
										<td><input type="checkbox" class="selectedItem a-check"
											name="selectedItem" value="${item.fid}"></td>
										<td hidden="">${item.fid}</td>
										<td>${item.fname}</td>
										<td>${item.fzy}</td>
										<td>${item.ftype}</td>
										<td>${item.fstate}</td>
										<td>${item.fstate}</td>
										<td><a href="hrZj-info-input.do?id=${item.fid}"
											class="a-update"><spring:message code="core.list.edit"
													text="查看" /></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				<button class="btn  btn-primary btn-block"
							onclick="document.hrZj-infoForm.submit()">选择</button>
				</div>
				<div id="zbtzsDIV" class="modal hide fade">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="title">中标通知书选择</h4>
						<!-- 	<button class="btn btn-mini btn-danger" style="float: right;"
							onclick="document.hrZj-infoForm.submit()">查询</button> -->
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
								gridFormId : 'hrZj-infoGridForm',
								exportUrl : 'hrZj-info-export.do'
							};
						</script>
					</div>
					<div class="modal-body">

						<form name="hrZj-infoForm" method="post"
							action="hrZj-info-list.do" class="form-inline">
							<label class="control-label" for="commRy-info_fname"><spring:message
										code="commRy-info.commRy-info.input.fname" text="项目名称" /></label> <input
									id="commRy-info_fname" type="text" name="fname"
									style="width: 120px;" value="${model.fname}" size=""
									class="text " minlength="" maxlength="" />
							<button class="btn btn-mini btn-primary" style="float: right;"
								onclick="document.hrZj-infoForm.submit()">查询</button>
						</form>
						<table id="hrZj-infoGrid" class="m-table table-hover table-bordered">
							<thead>
								<tr>
									<th width="10" class="m-table-check"><input
										type="checkbox" name="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th>
									<th class="sorting" name="fid" hidden="">fid</th>
									<th class="sorting" name="fname">项目名称</th>
									<th class="sorting" name="fzy">中标金额</th>
									<th class="sorting" name="ftype">发证日期</th>
									<th class="sorting" name="ftype">证件状态</th>
									<th width="80">操作</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach items="${page.result}" var="item">
									<tr>
										<td><input type="checkbox" class="selectedItem a-check"
											name="selectedItem" value="${item.fid}"></td>
										<td hidden="">${item.fid}</td>
										<td>${item.fname}</td>
										<td>${item.fzy}</td>
										<td>${item.ftype}</td>
										<td>${item.fstate}</td>
										<td><a href="hrZj-info-input.do?id=${item.fid}"
											class="a-update"><spring:message code="core.list.edit"
													text="查看" /></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<button class="btn  btn-primary btn-block"
							onclick="document.hrZj-infoForm.submit()">选择</button>
				</div>
				<div id="jgysbgDIV" class="modal hide fade">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="title">竣工验收报告选择</h4>
								<label class="control-label" for="commRy-info_fname"><spring:message
										code="commRy-info.commRy-info.input.fname" text="项目名称" /></label> <input
									id="commRy-info_fname" type="text" name="fname"
									style="width: 120px;" value="${model.fname}" size=""
									class="text " minlength="" maxlength="" />
						 	<button class="btn btn-mini btn-danger" style="float: right;"
							onclick="document.hrZj-infoForm.submit()">查询</button> 
					</div>
					<div class="modal-body">
						<!-- 	<form name="hrZj-infoForm" method="post"
							action="hrZj-info-list.do" class="form-inline">
							<button class="btn btn-mini btn-primary" style="float: right;"
								onclick="document.hrZj-infoForm.submit()">查询</button>
						</form> -->
						<table id="hrZj-infoGrid" class="m-table table-hover table-bordered"
							style="height: 100px;">
							<thead>
								<tr>
									<th width="10" class="m-table-check"><input
										type="checkbox" name="checkAll"
										onchange="toggleSelectedItems(this.checked)"></th>
									<th class="sorting" name="fid" hidden="">fid</th>
									<th class="sorting" name="fname">项目名称</th>
									<th class="sorting" name="fzy">竣工时间</th>
									<th class="sorting" name="ftype">发证日期</th>
									<th class="sorting" name="fstate">证件状态</th>
									<th width="80">操作</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach items="${page.result}" var="item">
									<tr>
										<td><input type="checkbox" class="selectedItem a-check"
											name="selectedItem" value="${item.fid}"></td>
										<td hidden="">${item.fid}</td>
										<td>${item.fname}</td>
										<td>${item.fzy}</td>
										<td>${item.ftype}</td>
										<td>${item.fstate}</td>
										<td><a href="hrZj-info-input.do?id=${item.fid}"
											class="a-update"><spring:message code="core.list.edit"
													text="查看" /></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<article>
							<div class="m-page-info pull-left">共100条记录 显示1到10条记录</div>

							<div class="btn-group m-pagination pull-right">
								<button class="btn btn-small">&lt;</button>
								<button class="btn btn-small">1</button>
								<button class="btn btn-small">&gt;</button>
							</div>

							<div class="m-clear"></div>
						</article>
					</div>
						<button class="btn  btn-primary btn-block"
							onclick="document.hrZj-infoForm.submit()">选择</button>
				</div>
			</article>
	</div>

	<!-- end of main -->

</body>

</html>
