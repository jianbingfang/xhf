<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "jl-home");
%>
<%
	pageContext.setAttribute("currentMenu", "jljindugenzong");
%>
<%
	pageContext.setAttribute("fgzid", request.getParameter("fgzid"));
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message
		code="jljindugenzong-info.jljindugenzong-info.input.title" text="编辑" /></title>
<%@include file="/common/s.jsp"%>
<script src="${ctx}/s/xthena/amcharts/amcharts.js"
	type="text/javascript"></script>
<script src="${ctx}/s/xthena/amcharts/serial.js" type="text/javascript"></script>
<script type="text/javascript">
	var chart;
	var chartData;
	var startYear;
	var startMonth;
	var table;

	var config = {
		id : 'jljindugenzongDetail-infoGrid',
		selectedItemClass : 'selectedItem',
		gridFormId : 'jljindugenzongDetail-infoGridForm',
		exportUrl : 'jljindugenzongDetail-info-export.do'
	};

	$(function() {
		$("#jljindugenzong-infoForm")
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

		$('#jljindugenzong-info_fgzid').val('${fgzid}');
		loadDetailList();
		AmCharts.ready(loadChar());

		table = new Table(config);
		table.configPagination('.m-pagination');
		table.configPageInfo('.m-page-info');
		table.configPageSize('.m-page-size');

		$('#myTab a').click(function(e) {
			e.preventDefault();
			$(this).tab('show');
		});

	});

	function showEdit(id) {
		$("#jljindugenzong-infoForm")[0].reset();
		if (id) {
			loadDetail(id);
		}
		$(".editModal").css("top", "0");
		$('.editModal').modal();
	}

	function doSubmit() {
		$("#jljindugenzong-infoForm").submit();
	}

	function loadDetail(id) {
		$.ajax({
					url : '${scopePrefix}/jl/jljindugenzongDetail-load-ajax.do',
					data : {
						fid : id
					},
					dataType : 'json',
					async : false,
					success : function(data) {
						$('#jljindugenzong-info_id').val(data.fid);
						$('#jljindugenzong-info_fgzid').val(data.fgzid);
						$('#jljindugenzong-info_fname').val(data.fname);
						$('#jljindugenzong-info_fstartdate').val(
								data.fstartdate);
						$('#jljindugenzong-info_fenddate').val(data.fenddate);
						$('#jljindugenzong-info_frealstart').val(
								data.frealstart);
						$('#jljindugenzong-info_frealend').val(data.frealend);
						$(
								'#jljindugenzong-info_fstatus [value="'
										+ data.fstatus + '"]').attr("selected",
								"selected");
					}
				});
	}

	function loadDetailList() {
		$.ajax({
			url : '${scopePrefix}/jl/jljindugenzongDetail-list-ajax.do',
			data : {
				fgzid : '${fgzid}'
			},
			dataType : 'json',
			async : false,
			success : function(data) {
				chartData = data.taskList;
				startYear = data.startYear;
				startMonth = data.startMonth;
			}
		});
	}

	function loadChar() {
		// SERIAL CHART
		chart = new AmCharts.AmSerialChart();
		chart.dataProvider = chartData;
		chart.categoryField = "fname";
		chart.rotate = true;
		chart.columnWidth = 0.9;
		chart.startDuration = 1;

		// AXES
		// Category
		var categoryAxis = chart.categoryAxis;
		categoryAxis.gridAlpha = 0.1;
		categoryAxis.axisAlpha = 1;
		categoryAxis.gridPosition = "start";

		// Value
		var valueAxis = new AmCharts.ValueAxis();
		valueAxis.c = 0.1;
		valueAxis.axisAlpha = 0;
		valueAxis.labelFunction = function(value, valueText, valueAxis) {
			var nowDate = getDateBySub(value);
			var month = nowDate.getMonth();
			var day = nowDate.getDate();
			var year = nowDate.getFullYear() % 100;
			var monthStr = month + "";
			var dayStr = day + "";
			var yearStr = year + "";
			if (month == 0) {
				monthStr = "12";
			}
			else if (month < 10) {
				monthStr = "0" + monthStr;
			}
			if (day < 10) {
				dayStr = "0" + dayStr;
			}

			if (yearStr < 10) {
				yearStr = "0" + yearStr;
			}
			return yearStr + "-" + monthStr + "-" + dayStr;
		};

		chart.addValueAxis(valueAxis);

		// GRAPH
		var graph = new AmCharts.AmGraph();
		graph.valueField = "fend";
		graph.openField = "fstart";
		graph.type = "column";
		graph.lineAlpha = 0;
		/* graph.color = "#FF0F00"; */
		graph.lineColor = "#000000";
		graph.fillAlphas = 0.8;
		graph.columnWidth = 0.3;
		graph.balloonFunction = function(data) {
			return "<b>" + data.category + "</b><br>开始时间:"
					+ getDateBySubAsStr(data.values.open) + "<br>结束时间:"
					+ getDateBySubAsStr(data.values.value);
		};
		chart.addGraph(graph);

		var graph1 = new AmCharts.AmGraph();
		graph1.valueField = "frealend";
		graph1.openField = "frealstart";
		graph1.type = "column";
		graph1.lineAlpha = 0;
		/* graph1.color = "#F8FF01"; */
		graph1.lineColor = "red";
		graph1.fillAlphas = 0.8;
		graph1.columnWidth = 0.3;
		graph1.balloonFunction = function(data) {
			return "<b>" + data.category + "</b><br> 实际开始时间:"
					+ getDateBySubAsStr(data.values.open) + "<br>实际结束时间:"
					+ getDateBySubAsStr(data.values.value);
		};
		chart.addGraph(graph1);
		chart.creditsPosition = "top-right";

		// WRITE
		chart.write("chartdiv");
	};

	function getDateBySubAsStr(subDay) {
		var nowDate = getDateBySub(subDay);
		return nowDate.getFullYear() + "年" + nowDate.getMonth() + "月"
				+ nowDate.getDate() + "日";
	}

	function getDateBySub(subDay) {
		var nowDate = new Date();

		nowDate.setFullYear(startYear);
		nowDate.setMonth(startMonth);
		nowDate.setFullYear(startYear);
		nowDate.setHours(0);
		nowDate.setMinutes(0);
		nowDate.setSeconds(0);
		nowDate.setDate(subDay);
		return nowDate;
	}

	function getMonthBySubAsStr(subMonth) {
		var nowDate = getMonthBySub(subMonth);
		return nowDate.getFullYear() + "年" + nowDate.getMonth() + "月";
	}

	function getMonthBySub(subMonth) {
		var nowDate = new Date();
		nowDate.setDate(0);
		nowDate.setFullYear(startYear);
		nowDate.setMonth(startMonth + subMonth - 1);

		nowDate.setHours(0);
		nowDate.setMinutes(0);
		nowDate.setSeconds(0);
		return nowDate;
	}

	function goToAnalyze() {
		window.location.href = "jljindugenzong-info-input.do?id=${fgzid}";
	}

	function tabShow() {
		$('.nav.nav-tabs').show();
	}

	function tabHide() {
		$('.nav.nav-tabs').hide();
	}
</script>
</head>
<body>
	<div class="row-fluid">
		<!-- start of main -->
		<div class="content content-inner">
			<div class="modal fade editModal" style="width: 800px;top: -100%;">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
							</button>
							<h4 class="modal-title">编辑进度</h4>
						</div>
						<div class="container">
							<form id="jljindugenzong-infoForm" method="post"
								action="jljindugenzongDetail-info-save.do?type=${ftype}"
								class="form-horizontal">
								<input id="jljindugenzong-info_id" type="hidden" name="fid"
									value="${model.fid}"> <input
									id="jljindugenzong-info_fgzid" type="hidden" name="fgzid"
									value="">
								<div class="control-group">
									<label class="control-label" for="jljindugenzong-info_fname"><spring:message
											code="jljindugenzong-info.jljindugenzong-info.input.fname"
											text="名称" /></label>
									<div class="controls">
										<input id="jljindugenzong-info_fname" type="text" name="fname"
											value="${model.fname}" size="" class="text " maxlength="">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label"
										for="jljindugenzong-info_fstartdate"><spring:message
											code="jljindugenzong-info.jljindugenzong-info.input.fstartdate"
											text="计划开始时间" /></label>
									<div class="controls">
										<div class="input-append datepicker date"
											style="padding-left: 0px;">
											<input id="jljindugenzong-info_fstartdate" type="text"
												name="fstartdate" value="${model.fstartdate}" size="40"
												class="text "
												style="background-color:white;cursor:default; width: 175px;">
											<span class="add-on"
												style="padding-top: 2px; padding-bottom: 2px;"><i
												class="icon-calendar"></i></span>
										</div>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="jljindugenzong-info_fenddate"><spring:message
											code="jljindugenzong-info.jljindugenzong-info.input.fenddate"
											text="计划结束时间" /></label>
									<div class="controls">
										<div class="input-append datepicker date"
											style="padding-left: 0px;">
											<input id="jljindugenzong-info_fenddate" type="text"
												name="fenddate" value="${model.fenddate}" size="40"
												class="text "
												style="background-color:white;cursor:default; width: 175px;">
											<span class="add-on"
												style="padding-top: 2px; padding-bottom: 2px;"><i
												class="icon-calendar"></i></span>
										</div>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label"
										for="jljindugenzong-info_frealstart"><spring:message
											code="jljindugenzong-info.jljindugenzong-info.input.frealstart"
											text="实际开始时间" /></label>
									<div class="controls">
										<div class="input-append datepicker date"
											style="padding-left: 0px;">
											<input id="jljindugenzong-info_frealstart" type="text"
												name="frealstart" value="${model.frealstart}" size="40"
												class="text "
												style="background-color:white;cursor:default; width: 175px;">
											<span class="add-on"
												style="padding-top: 2px; padding-bottom: 2px;"><i
												class="icon-calendar"></i></span>
										</div>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="jljindugenzong-info_frealend"><spring:message
											code="jljindugenzong-info.jljindugenzong-info.input.frealend"
											text="实际结束时间" /></label>
									<div class="controls">
										<div class="input-append datepicker date"
											style="padding-left: 0px;">
											<input id="jljindugenzong-info_frealend" type="text"
												name="frealend" value="${model.frealend}" size="40"
												class="text "
												style="background-color:white;cursor:default; width: 175px;">
											<span class="add-on"
												style="padding-top: 2px; padding-bottom: 2px;"><i
												class="icon-calendar"></i></span>
										</div>
									</div>
								</div>
								<%-- 		<div class="control-group">
					    <label class="control-label" for="jljindugenzong-info_fanalyze"><spring:message code="jljindugenzong-info.jljindugenzong-info.input.fanalyze" text="进度分析"/></label>
						<div class="controls">
						      	<textarea id="jljindugenzong-info_fanalyze"  name="fanalyze"  class="form-control" rows="8"  style="width: 260px" class="text  "  minlength="" maxlength="5,000">${model.fanalyze}</textarea>
					    </div>
					    </div> --%>
							<%-- 	<div class="control-group">
									<label class="control-label" for="jljindugenzong-info_fstatus"><spring:message
											code="jljindugenzong-info.jljindugenzong-info.input.fstatus"
											text="进度状态" /></label>
									<div class="controls">
										<select class="form-control" id="jljindugenzong-info_fstatus"
											name="fstatus" value="${model.fstatus}" class=" ">
											<option value="未开始"
												<c:if test="${model.fstatus}=='未开始'}"> selected="selected"  </c:if>>未开始</option>
											<option value="延期完成"
												<c:if test="${model.fstatus}=='延期完成'}"> selected="selected"  </c:if>>延期完成</option>
											<option value="提前完成"
												<c:if test="${model.fstatus}=='提前完成'}"> selected="selected"  </c:if>>提前完成</option>
											<option value="正常完成"
												<c:if test="${model.fstatus}=='正常完成'}"> selected="selected"  </c:if>>正常完成</option>
											<option value="未完成"
												<c:if test="${model.fstatus}=='未完成'}"> selected="selected"  </c:if>>未完成</option>
											<option value="已放弃"
												<c:if test="${model.fstatus}=='已放弃'}"> selected="selected"  </c:if>>已放弃</option>
										</select>
									</div>
								</div> --%>
								<%-- 	<div class="control-group">
					    <label class="control-label" for="jljindugenzong-info_fpercent"><spring:message code="jljindugenzong-info.jljindugenzong-info.input.fpercent" text="占总进度的百分比"/></label>
						<div class="controls">
							  	<input id="jljindugenzong-info_fpercent" type="text" name="fpercent" value="${model.fpercent}" size="" class="number   " minlength="" maxlength="">
					    </div>
					    </div>
	  
						<div class="control-group">
						    <label class="control-label" for="jljindugenzong-info_frealpercent"><spring:message code="jljindugenzong-info.jljindugenzong-info.input.frealpercent" text="实际进度的百分比"/></label>
							<div class="controls">
								  	<input id="jljindugenzong-info_frealpercent" type="text" name="frealpercent" value="${model.frealpercent}" size="" class="number   " minlength="" maxlength="">
						    </div>
					  </div>
		 --%>
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
		</div>
		<!-- /.modal -->
		<!-- 	<div class="btn-group">
			<a href="#tab111"><button type="button" class="btn btn-default">
					<span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
						class="icon-align-left" title="图表"></i></span>
				</button></a> <a href="#tab222"><button type="button" class="btn btn-default">
					<span class="add-on" style="padding-top: 2px; padding-bottom: 2px;"><i
						class="icon-list" title="列表"></i></span>
				</button></a>
		</div> -->
		<div class="span11">
			<div class="span6">
				<article class="m-blank" >
					<div class="pull-left">
						<region:region-permission
							permission="jljindugenzongDetail-info:create">
							<button class="btn btn-small a-insert btn-primary"
								onclick="showEdit()">新建</button>
							<button class="btn btn-small a-insert btn-primary"
									onclick="location.href='jljindugenzong-info-list.do?type=${ftype}'">返回上一层</button>
						</region:region-permission>
					</div>
					<div class="m-clear"></div>
				</article>
			</div>
			<div class="span6">
				<ul class="nav nav-pills " role="tablist" id="myTab" style="float: right;">
					<li role="presentation"><a href="#tab111"><i
							class="icon-list" title="列表"></i></a></li>
					<li class="active" role="presentation"><a href="#tab222"><i
							class="icon-align-left" title="图表"></i></a></li>
				</ul>
			</div>
		</div>
		<div class="span11">
			<div class="tab-content">
				<div class="tab-pane " id="tab111">
					<div class="well">
						<article class="m-blank">
							<div class="pull-left">
								<region:region-permission
									permission="jljindugenzongDetail-info:delete">
									<button class="btn btn-small a-remove"
										onclick="table.removeAll()">删除</button>
								</region:region-permission>
								<button class="btn btn-small a-export" onclick="goToAnalyze()">填写分析报告</button>
							</div>
							<div class="m-clear"></div>
						</article>
						<article class="m-widget">
							<header class="header">
								<h4 class="title">
									<spring:message
										code="jljindugenzongDetail-info.jljindugenzongDetail-info.list.title"
										text="列表" />
								</h4>
							</header>
							<div class="content">
								<form id="jljindugenzongDetail-infoGridForm"
									name="jljindugenzongDetail-infoGridForm" method='post'
									action="jljindugenzongDetail-info-remove.do?type=${ftype}"
									class="m-form-blank">

									<table id="jljindugenzongDetail-infoGrid"
										class="m-table table-hover table-bordered">
										<thead>
											<tr>
												<th width="10" class="m-table-check"><input
													type="checkbox" name="checkAll"
													onchange="toggleSelectedItems(this.checked)"></th>
												<th class="sorting" id="fname">名称</th>
												<th class="sorting" id="feditdate">创建时间</th>
												<%--<th class="sorting" id="fstatus">进度状态</th>--%>
												<th width="80">&nbsp;</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${list}" var="item">
												<tr>
													<td><input type="checkbox"
														class="selectedItem a-check" name="selectedItem"
														value="${item.fid}"></td>
													<td>${item.fname}</td>
													<td>${item.feditdate}</td>
													<%--<td>${item.fstatus}</td>--%>
													<td><a href="javascript:void(0)"
														onclick="showEdit(${item.fid})" class="a-update"><spring:message
																code="core.list.edit" text="编辑" /></a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</form>
							</div>
						</article>
					</div>
				</div>
				<div class="tab-pane well active" id="tab222">
					<div id="chartdiv" style="width: 100%;height: 500px; "></div>
				</div>
				<!-- end of main -->
			</div>
		</div>
	</div>
</body>
</html>
