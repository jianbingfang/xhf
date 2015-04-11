<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "hr-home");
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
<style type="text/css">
.m-widget{ box-shadow:#ddd 1px 1px 0px,#ddd -1px 1px 0px;}
.m-widget .header{ margin:0 -1px;}
</style>
</head>
<link rel="stylesheet" href="style.css" type="text/css">
<script src="${ctx}/s/xthena/amcharts/amcharts.js"
	type="text/javascript"></script>
<script src="${ctx}/s/xthena/amcharts/pie.js" type="text/javascript"></script>
<script src="${ctx}/s/xthena/amcharts/serial.js" type="text/javascript"></script>

<script type="text/javascript">
	var chart;
	var legend;

	var chartData = [ {
		country : "正式员工",
		litres : 125
	}, {
		country : "试用期",
		litres : 68
	}, {
		country : "实习期",
		litres : 15
	} ];

	var chart2;
	var legend2;

	var chartData2 = [ {
		type : "0-1年",
		litres : 85
	}, {
		type : "1-3年",
		litres : 68
	}, {
		type : "3-5年",
		litres : 45
	}, {
		type : "5年以上",
		litres : 32
	} ];

	var chart3;

	var chartData3 = [ {
		"year" : "2014-01",
		"zhengshi" : 243,
		"shiyong" : 10,
		"shixi" : 5
	}, {
		"year" : "2014-02",
		"zhengshi" : 265,
		"shiyong" : 15,
		"shixi" : 3
	}, {
		"year" : "2014-03",
		"zhengshi" : 270,
		"shiyong" : 15,
		"shixi" : 8
	}, {
		"year" : "2014-04",
		"zhengshi" : 256,
		"shiyong" : 15,
		"shixi" : 15
	}, {
		"year" : "2014-05",
		"zhengshi" : 262,
		"shiyong" : 15,
		"shixi" : 10
	}, {
		"year" : "2014-06",
		"zhengshi" : 251,
		"shiyong" : 11,
		"shixi" : 11
	}, {
		"year" : "2014-07",
		"zhengshi" : 262,
		"shiyong" : 15,
		"shixi" : 10
	}, {
		"year" : "2014-08",
		"zhengshi" : 260,
		"shiyong" : 23,
		"shixi" : 9
	}, {
		"year" : "2014-09",
		"zhengshi" : 267,
		"shiyong" : 15,
		"shixi" : 8
	}, {
		"year" : "2014-10",
		"zhengshi" : 272,
		"shiyong" : 15,
		"shixi" : 11
	} , {
		"year" : "2014-11",
		"zhengshi" : 288,
		"shiyong" : 15,
		"shixi" : 8
	} , {
		"year" : "2014-12",
		"zhengshi" :283,
		"shiyong" : 15,
		"shixi" : 5
	}   ];

	AmCharts
			.ready(function() {
				//1
				// PIE CHART
				chart = new AmCharts.AmPieChart();
				chart.dataProvider = chartData;
				chart.titleField = "country";
				chart.valueField = "litres";
				/* chart.outlineColor = "#FFFFFF"; */
				chart.outlineAlpha = 0.8;
				chart.outlineThickness = 2;

				// WRITE
				chart.write("chartdiv");

				//2
				// PIE CHART
				chart2 = new AmCharts.AmPieChart();
				chart2.dataProvider = chartData2;
				chart2.titleField = "type";
				chart2.valueField = "litres";
				/* chart2.outlineColor = "#FFFFFF"; */
				chart2.outlineAlpha = 0.8;
				chart2.outlineThickness = 2;

				// WRITE
				chart2.write("chartdiv2");

				//3
				// SERIAL CHART
				chart3 = new AmCharts.AmSerialChart();
				chart3.dataProvider = chartData3;
				chart3.categoryField = "year";
				chart3.plotAreaBorderAlpha = 0.2;

				// AXES
				// category
				var categoryAxis = chart3.categoryAxis;
				categoryAxis.gridAlpha = 0.1;
				categoryAxis.axisAlpha = 0;
				categoryAxis.gridPosition = "start";

				// value
				var valueAxis = new AmCharts.ValueAxis();
				valueAxis.stackType = "regular";
				valueAxis.gridAlpha = 0.1;
				valueAxis.axisAlpha = 0;
				chart3.addValueAxis(valueAxis);

				// GRAPHS
				// first graph    
				var graph = new AmCharts.AmGraph();
				graph.title = "正式员工";
				graph.labelText = "[[value]]";
				graph.valueField = "zhengshi";
				graph.type = "column";
				graph.lineAlpha = 0;
				graph.fillAlphas = 1;
				/* graph.lineColor = "#C72C95"; */
				graph.balloonText = "<span style='color:#555555;'>[[category]]</span><br><span style='font-size:14px'>[[title]]:<b>[[value]]</b></span>";
				chart3.addGraph(graph);

				// second graph              
				graph = new AmCharts.AmGraph();
				graph.title = "试用期";
				graph.labelText = "[[value]]";
				graph.valueField = "shiyong";
				graph.type = "column";
				graph.lineAlpha = 0;
				graph.fillAlphas = 1;
			/* 	graph.lineColor = "#D8E0BD"; */
				graph.balloonText = "<span style='color:#555555;'>[[category]]</span><br><span style='font-size:14px'>[[title]]:<b>[[value]]</b></span>";
				chart3.addGraph(graph);

				// third graph                              
				graph = new AmCharts.AmGraph();
				graph.title = "实习期";
				graph.labelText = "[[value]]";
				graph.valueField = "shixi";
				graph.type = "column";
				graph.lineAlpha = 0;
				graph.fillAlphas = 1;
				/* graph.lineColor = "#B3DBD4"; */
				graph.balloonText = "<span style='color:#555555;'>[[category]]</span><br><span style='font-size:14px'>[[title]]:<b>[[value]]</b></span>";
				chart3.addGraph(graph);

				// LEGEND                  
				var legend = new AmCharts.AmLegend();
				legend.borderAlpha = 0.2;
				legend.horizontalGap = 10;
				chart3.addLegend(legend);

				// WRITE
				chart3.write("chartdiv3");
			});

	// this method sets chart 2D/3D
	function setDepth() {
		if (document.getElementById("rb1").checked) {
			chart3.depth3D = 0;
			chart3.angle = 0;
		} else {
			chart3.depth3D = 25;
			chart3.angle = 30;
		}
		chart3.validateNow();
	}
</script>
<body>
	<%@include file="/header/bpm-workspace.jsp"%>

	<div class="row-fluid">
		<%@include file="/menu/hr-workspace.jsp"%>

		<!-- start of main -->
		<section id="m-main" class="span10" style="float:right">
			<!-- <div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="hr-home.do">人力资源</a> <span class="divider">/</span>
							</li>
						</ul>
					</div>
				</div>
			</div> -->
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="content content-inner" style="padding:0 0 0px 20px">
						<form name="hr-plain-infoForm" method="post"
							action="hr-plain-info-list.do" class="form-inline">
							<label class="hrHomeTitle" style="font-size: 22px;" >在职员工总数：</label> <label
								class="hrHomeValue"  style="font-size: 26px;color: blue;">120</label>&nbsp&nbsp&nbsp 
								<label class="hrHomeTitle"  style="font-size: 22px;">本月新入职员工数：</label>
							<label class="hrHomeValue"  style="font-size: 26px;color: blue;">10</label> &nbsp&nbsp&nbsp
							<label class="hrHomeTitle"  style="font-size: 22px;">本月离职员工数：</label>
							<label class="hrHomeValue"  style="font-size: 26px;color: blue;">1</label>&nbsp&nbsp&nbsp
						</form>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span6">
					<article class="m-widget">
					<header class="header">
					<h4 class="title">员工雇佣性质分布图</h4>
				</header>
						<div id="chartdiv" style="width: 100%; height: 400px;"></div>
						</article>
					</div>
					<div class="span6">
					  <article class="m-widget">
						<header class="header">
						   <h4 class="title">员工工作年限分布图</h4>
					    </header>
						<div id="chartdiv2" style="width: 100%; height: 400px;"></div>
					  </article>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12">
					<article class="m-widget">
						<header class="header">
						   <h4 class="title">员工数量发展进度图</h4>
					    </header>
						<div id="chartdiv3" style="width: 100%; height: 400px;"></div>
						<div style="margin-left:30px;">
							<input type="radio" checked="true" name="group" id="rb1"
								onclick="setDepth()">2D <input type="radio" name="group"
								id="rb2" onclick="setDepth()">3D
						</div>
					  </article>
					</div>
				</div>
			</div>
			<!--<c:forEach items="${bpmCategories}" var="bpmCategory">
      <div class="row-fluid">
      <div class="page-header">
        <h3>${bpmCategory.name}</h3>
      </div>

      <c:forEach items="${bpmCategory.bpmProcesses}" var="bpmProcess">
        <div class="well span2">
          <h4>${bpmProcess.name}&nbsp;</h4>
          <p>${bpmProcess.descn}&nbsp;</p>
          <div class="btn-group">
            <a class="btn btn-small" href="${scopePrefix}/form/form-viewStartForm.do?bpmProcessId=${bpmProcess.id}"><li class="icon-play"></li>发起</a>
            <a class="btn btn-small" href="workspace-graphProcessDefinition.do?bpmProcessId=${bpmProcess.id}" target="_blank"><li class="icon-picture"></li>图形</a>
          </div>
        </div>
      </c:forEach>
	  </div>

</c:forEach>-->

		</section>
		<!-- end of main -->
	</div>

</body>

</html>
