<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "cw-home");
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
	var chart;

	var chartData = [ {
		"month" : "2013-08",
		"ysje" : 1385,
		"yishouje" : 854,
		"rate" : Math.floor(854 / 1385 * 100)
	}, {
		"month" : "2013-09",
		"ysje" : 1452,
		"yishouje" : 1081,
		"rate" : Math.floor(1081 / 1452 * 100)
	}, {
		"month" : "2013-10",
		"ysje" : 2106,
		"yishouje" : 2061,
		"rate" : Math.floor(2061 / 2106 * 100)
	}, {
		"month" : "2013-11",
		"ysje" : 1514,
		"yishouje" : 1365,
		"rate" : Math.floor(1365 / 1514 * 100)
	}, {
		"month" : "2013-12",
		"ysje" : 2816,
		"yishouje" : 2204,
		"rate" : Math.floor(2204 / 2816 * 100)
	}, {
		"month" : "2014-01",
		"ysje" : 1850,
		"yishouje" : 1762,
		"rate" : Math.floor(1762 / 1850 * 100)
	}, {
		"month" : "2014-02",
		"ysje" : 1602,
		"yishouje" : 1548,
		"rate" : Math.floor(1548 / 1602 * 100)
	}, {
		"month" : "2012-03",
		"ysje" : 1305,
		"yishouje" : 850,
		"rate" : Math.floor(850 / 1305 * 100)
	}, {
		"month" : "2014-04",
		"ysje" : 1219,
		"yishouje" : 1092,
		"rate" : Math.floor(1092 / 1219 * 100)
	}, {
		"month" : "2014-05",
		"ysje" : 1708,
		"yishouje" : 1452,
		"rate" : Math.floor(1452 / 1708 * 100)
	}, {
		"month" : "2014-06",
		"ysje" : 2106,
		"yishouje" : 1505,
		"rate" : Math.floor(1505 / 2106 * 100)
	}, {
		"month" : "2014-07",
		"ysje" : 1617,
		"yishouje" : 1547,
		"rate" : Math.floor(1547 / 1617 * 100)
	} ];

	
	var chart2;
	var legend2;

	var chartData2 = [ {
		type : "可回收",
		litres : 60
	}, {
		type : "其他",
		litres : 269
	} ];
	
	var chart3;
	var legend3;

	var chartData3 = [ {
		type : "可回收",
		litres : 85
	}, {
		type : "其他",
		litres : 1253
	} ];

	AmCharts
			.ready(function() {
				// SERIAL CHART
				chart = new AmCharts.AmSerialChart();
				chart.dataProvider = chartData;
				chart.categoryField = "month";
				chart.startDuration = 1;

				// AXES
				// category
				var categoryAxis = chart.categoryAxis;
				categoryAxis.labelRotation = 45; // this line makes category values to be rotated
				categoryAxis.gridAlpha = 0;
				categoryAxis.fillAlpha = 1;
				categoryAxis.fillColor = "#FAFAFA";
				categoryAxis.gridPosition = "start";

				// value
				var valueAxis = new AmCharts.ValueAxis();
				valueAxis.dashLength = 5;
				valueAxis.title = "金额（万元）";
				valueAxis.axisAlpha = 0;
				chart.addValueAxis(valueAxis);

				// Distance value axis
				var rateAxis = new AmCharts.ValueAxis();
				rateAxis.title = "回收率";
				rateAxis.gridAlpha = 0;
				rateAxis.position = "right";
				rateAxis.inside = true;
				rateAxis.unit = "%";
				rateAxis.axisAlpha = 0;
				chart.addValueAxis(rateAxis);

				// GRAPH
				var graph = new AmCharts.AmGraph();
				graph.valueField = "ysje";
				graph.title = "应收金额";
				graph.colorField = "color";
				graph.balloonText = "<b>[[category]]应收金额: [[value]]</b>";
				graph.type = "column";
				graph.lineAlpha = 0;
				graph.fillAlphas = 1;
				chart.addGraph(graph);

				// second graph
				var graph1 = new AmCharts.AmGraph();
				graph1.type = "column";
				graph1.title = "已收金额";
				graph1.valueField = "yishouje";
				graph1.balloonText = "<b>[[category]]已收金额:[[value]]</b>";
				graph1.lineAlpha = 0;
				graph1.fillColors = "#81acd9";
				graph1.fillAlphas = 1;
				chart.addGraph(graph1);

				// line
				var graph2 = new AmCharts.AmGraph();
				graph2.type = "line";
				graph2.title = "回收率";
				graph2.lineColor = "#fcd202";
				graph2.valueField = "rate";
				graph2.lineThickness = 3;
				graph2.bullet = "round";
				graph2.bulletBorderThickness = 3;
				graph2.valueAxis = rateAxis;
				graph2.bulletBorderColor = "#fcd202";
				graph2.bulletBorderAlpha = 1;
				graph2.bulletColor = "#ffffff";
				graph2.balloonText = "<span style='font-size:13px;'> [[category]][[title]] :<b>[[value]]%</b></span>";
				chart.addGraph(graph2);

				// CURSOR
				var chartCursor = new AmCharts.ChartCursor();
				chartCursor.cursorAlpha = 0;
				chartCursor.zoomable = false;
				chartCursor.categoryBalloonEnabled = false;
				chart.addChartCursor(chartCursor);

				// LEGEND                  
				var legend = new AmCharts.AmLegend();
				legend.borderAlpha = 0.2;
				legend.verticalGap = 10;
				//  legend.align="right";
				legend.position = "right";
				chart.addLegend(legend);

				chart.creditsPosition = "top-right";

				// WRITE
				chart.write("chartdiv");

				//2
				// PIE CHART
				chart2 = new AmCharts.AmPieChart();
				chart2.dataProvider = chartData2;
				chart2.titleField = "type";
				chart2.valueField = "litres";
				chart2.outlineColor = "#FFFFFF";
				chart2.outlineAlpha = 0.8;
				chart2.outlineThickness = 2;

			    // LEGEND                  
			    var legend2 = new AmCharts.AmLegend();
			    legend2.borderAlpha = 0.2;
			    legend2.horizontalGap = 10;
			    chart2.addLegend(legend2);
			    
				// WRITE
				chart2.write("chartdiv2");
				
				
				//3
				// PIE CHART
				chart3 = new AmCharts.AmPieChart();
				chart3.dataProvider = chartData3;
				chart3.titleField = "type";
				chart3.valueField = "litres";
				chart3.outlineColor = "#FFFFFF";
				chart3.outlineAlpha = 0.8;
				chart3.outlineThickness = 2;

			    // LEGEND                  
			    var legend3 = new AmCharts.AmLegend();
			    legend3.borderAlpha = 0.2;
			    legend3.horizontalGap = 10;
			    chart3.addLegend(legend3);
			    
				// WRITE
				chart3.write("chartdiv3");
			});
</script>
<body>
    <%@include file="/header.jsp"%>

	<div class="row-fluid">
		<%@include file="/menu/cw-workspace.jsp"%>

		<!-- start of main -->
		<section id="m-main" class="span10" style="float:right">
			<!-- <div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="cw-home.do">财务管理</a></li>
						</ul>
					</div>
				</div>
			</div> -->
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="content content-inner">
						<form name="hr-plain-infoForm" method="post"
							action="hr-plain-info-list.do" class="form-inline">
							<label class="hrHomeTitle" style="font-size: 28px;">应收账款：</label>
							<label class="hrHomeValue" style="font-size: 35px;color: blue;">2412.35
								万元</label>&nbsp&nbsp&nbsp <label class="hrHomeTitle"
								style="font-size: 28px;">已收账款：</label> <label
								class="hrHomeValue" style="font-size: 35px;color: blue;">1826.35
								万元</label> &nbsp&nbsp&nbsp <label class="hrHomeTitle"
								style="font-size: 28px;">未收账款：</label> <label
								class="hrHomeValue" style="font-size: 35px;color: blue;">586
								万元</label>&nbsp&nbsp&nbsp
						</form>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12">
						<article class="m-widget">
							<header class="header">
								<h4 class="title">监理费回收动态图</h4>
							</header>
							<div id="chartdiv" style="width: 100%; height: 300px;"></div>
						</article>
					</div>
				</div>
			
				<div class="row-fluid">
					<div class="span6">
						<article class="m-widget">
							<header class="header">
								<h4 class="title">投标保证金回收情况图</h4>
							</header>
							 <div id="chartdiv2"  style="width: 100%; height: 400px;"></div>
						</article>
					</div>
					<div class="span6">
						<article class="m-widget">
							<header class="header">
								<h4 class="title">履约保证金回收情况图</h4>
							</header>
							<div id="chartdiv3" style="width: 100%; height: 400px;"></div>
						</article>
					</div>
				</div>
			</div>
		</section>
		<!-- end of main -->
	</div>

</body>

</html>
