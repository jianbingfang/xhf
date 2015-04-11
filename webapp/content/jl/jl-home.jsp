<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "jl-home");
%>
<%
	pageContext.setAttribute("currentMenu", "bpm-process");
%>
<!doctype html>
<html lang="en">
<head>
<%@include file="/common/meta.jsp"%>
<title>流程列表</title>
<%@include file="/common/s.jsp"%>
</head>
<link rel="stylesheet" href="style.css" type="text/css">
<script src="${ctx}/s/xthena/amcharts/amcharts.js"
	type="text/javascript"></script>
<script src="${ctx}/s/xthena/amcharts/pie.js" type="text/javascript"></script>
<script src="${ctx}/s/xthena/amcharts/serial.js" type="text/javascript"></script>
<script type="text/javascript">


	$(function () {
		$('.carousel-inner div:first-child').addClass("active");
	});

	var chartData = [ {
		"projectName" : "项目形象进度",
		"rate" : 80,
		"color" : "#FF6600"
	}, {
		"projectName" : "项目资料搜集进度",
		"rate" : 90,
		"color" : "#04D215"
	}, {
		"projectName" : "监理费回收进度",
		"rate" : 50,
		"color" : "#0D52D1"
	} ];
	AmCharts.ready(function() {
		// SERIAL CHART
		chart = new AmCharts.AmSerialChart();
		chart.dataProvider = chartData;
		chart.categoryField = "projectName";
		chart.startDuration = 1;
		chart.plotAreaBorderColor = "#DADADA";
		chart.plotAreaBorderAlpha = 1;
		// this single line makes the chart a bar chart
		chart.rotate = true;

		// AXES
		// Category
		var categoryAxis = chart.categoryAxis;
		categoryAxis.gridPosition = "start";
		categoryAxis.gridAlpha = 0.1;
		categoryAxis.axisAlpha = 0;

		// Value
		var valueAxis = new AmCharts.ValueAxis();
		valueAxis.axisAlpha = 0;
		valueAxis.gridAlpha = 0.1;
		valueAxis.position = "top";
		chart.addValueAxis(valueAxis);

		// GRAPHS
		// first graph
		var graph1 = new AmCharts.AmGraph();
		graph1.type = "column";
		graph1.title = "进度";
		graph1.labelText = "[[value]]%";
		graph1.valueField = "rate";
		graph1.balloonText = "[[title]]:[[value]]%";
		graph1.lineAlpha = 0.5;
		graph1.topRadius = 1;
		graph1.fillAlphas = 0.9;
		graph1.colorField = "color";
		chart.addGraph(graph1);

		chart.creditsPosition = "top-right";

		// WRITE
		chart.write("chartdiv");
	});
	
	$(function() {
		$("#confirmBtn").click(function() {
			getFiles();
		});
	});
	
	function getFiles(){
		$.each($('.files').children(),
				function(index, node) {
					$('#pjXmImg-info_fname').val($(node).data("fileName")+ "."+ $(node).data("fileType"));
					$('#pjXmImg-info_fimgurl').val($(node).data("fileUrl"));
				});
		$(".uploadModal").modal('hide');
		 $(".editModal").css("top","0");
		$(".editModal").modal();
	}
	
	function doSubmit(){
		 $("#pjXmImg-infoForm").submit();
	}
</script>
<body>
	<%@include file="/header/bpm-workspace.jsp"%>
	<div class="row-fluid">
		<%@include file="/menu/jl-workspace.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span10" style="float:right">
			<%@include file="../comm/comm-upload.jsp"%>
			<!-- <div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li style="width: 100%">
								<div style="float: left;">
									<a href="jl-home.do">郑东新区商务会展中心项目监理部</a>
								</div>
								<div style="float: right;font-size: 13;color: blue;">
									<a class="bnt" href="#">监理月报下载</a>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div> -->

			<div class="modal fade editModal" style="width: 800px;top: -100%;">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
							</button>
							<h4 class="modal-title">添加图片描述</h4>
						</div>
						<div class="container">
							<form id="pjXmImg-infoForm" method="post"
								action="pjXmImg-info-save.do" class="form-horizontal">
								<input id="pjXmImg-info_fname" type="hidden" name="fname">
								<input id="pjXmImg-info_fimgurl" type="hidden" name="fimgurl">
								<div class="control-group">
									<label class="control-label" for="pjXmImg-info_fdescribe"><spring:message
											code="pjXmImg-info.pjXmImg-info.input.fdescribe" text="图片描述" /></label>
									<div class="controls">
										<textarea id="pjXmImg-info_fdescribe" name="fdescribe"
											class="form-control" rows="6" style="width: 560px"
											class="text" minlength="" maxlength="500">${model.fdescribe}</textarea>
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

	<div class="row-fluid">
					<article class="m-widget">
						<header class="header" style="height:30px;">
							<h4 class="title">项目近况图</h4>
							<input type="button" class="btn btn-primary" value="上传" onclick="showUpload()" style="float: right;">
						</header>
						<div class="carousel slide" id="carousel-169351">
							<ol class="carousel-indicators">
								<li data-target="#carousel-169351" data-slide-to="0"></li>
								<li data-target="#carousel-169351" data-slide-to="1"></li>
								<li class="active" data-target="#carousel-169351"
									data-slide-to="2"></li>
							</ol>
							<div class="carousel-inner" style="width: 100%;height: 500px;">
							     <c:forEach items="${xmImgs}" var="item">
							     	<div class="item" style="width: 100%;height: 500px;">
										<img alt="" src="${item.fimgurl}" />
										<div class="carousel-caption">
											<p>${item.fdescribe}</p>
										</div>
									</div>
							      </c:forEach>
							</div>
							<a class="left carousel-control" href="#carousel-169351"
								data-slide="prev"><h5><</h5></a> <a
								class="right carousel-control" href="#carousel-169351"
								data-slide="next"><h5>></h5></a>
						</div>
					</article>
			<!-- 	<div class="span6">
					<article class="m-widget">
						<header class="header"  style="height:30px;">
							<h4 class="title">项目进度分析图</h4>
						</header>
						<div id="chartdiv" style="width: 100%; height: 400px;"></div>
					</article>
				</div> -->
			</div>
	</div>
	</section>
	<!-- end of main -->
	</div>
</body>
</html>
