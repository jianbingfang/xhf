<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "xz-home");
%>
<%
	pageContext.setAttribute("currentMenu", "bpm-process");
%>
<!doctype html>
<html lang="en">
        <script src="${ctx}/s/xthena/amcharts/amcharts.js" type="text/javascript"></script>
        <script src="${ctx}/s/xthena/amcharts/serial.js" type="text/javascript"></script>
<script src="${ctx}/s/xthena/amcharts/pie.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/s/xthena/amcharts/none.js"></script>
<head>
<%@include file="/common/meta.jsp"%>
<title>流程列表</title>
<%@include file="/common/s.jsp"%>
</head>
<script type="text/javascript">
var chart;
var legend;
var chartData = [ {
	month : "家具",
	litres : 58
}, {
	month : "家电",
	litres : 23
}, {
	month : "电子产品",
	litres : 396
}, {
	month : "仪器设备",
	litres : 15
}, {
	month : "交通工具",
	litres : 53
}, {
	month : "厨具",
	litres : 215
} ];

var chart2;
var legend2;

var chartData2 = [ {
	type : "办公用品",
	litres : 85
}, {
	type : "生活用品",
	litres : 68
}];

var chart3 = AmCharts.makeChart("chartdiv3", {
    "theme": "light",
    "type": "serial",
    "dataProvider": [{
        "month": "2014-04",
        "baiwang": 88,
        "putong": 51
    }, {
        "month": "2014-05",
        "baiwang": 72,
        "putong": 60
    }, {
        "month": "2014-06",
        "baiwang": 83,
        "putong": 80
    }, {
        "month": "2014-07",
        "baiwang": 74,
        "putong": 91
    }, {
        "month": "2014-08",
        "baiwang": 68,
        "putong": 82
    }, {
        "month": "2014-09",
        "baiwang": 88,
        "putong": 66
    }],
    "valueAxes": [{
        "position": "left"
    }],
    "legend":[{
    	"position":"right"
    }],
    "startDuration": 1,
    "graphs": [{
        "fillAlphas": 0.9,
        "lineAlpha": 0.2,
        "title": "普通A4纸",
        "type": "column",
        "valueField": "baiwang",
        "balloonText": "[[title]] [[category]] 消耗量: <b>[[value]]</b>",
        "labelText":"[[title]] : [[value]]"
    }, {
        "fillAlphas": 0.9,
        "lineAlpha": 0.2,
        "title": "百旺A4纸",
        "type": "column",
        "clustered":false,
        "columnWidth":0.5,
        "valueField": "putong",
        "balloonText": "[[title]] [[category]] 消耗量: <b>[[value]]</b>",
        "labelText":"[[title]] : [[value]]"
    }],
    "plotAreaFillAlphas": 0.1,
    "categoryField": "month",
    "categoryAxis": {
        "gridPosition": "start"
    }
});
AmCharts
.ready(function() {
	//1
	// PIE CHART
	chart = new AmCharts.AmPieChart();
	chart.dataProvider = chartData;
	chart.titleField = "month";
	chart.valueField = "litres";
	chart.outlineColor = "#FFFFFF";
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
	chart2.outlineColor = "#FFFFFF";
	chart2.outlineAlpha = 0.8;
	chart2.outlineThickness = 2;

	// WRITE
	chart2.write("chartdiv2");
});
</script>
<body>
	<%@include file="/header/bpm-workspace.jsp"%>

	<div class="row-fluid">
		<%@include file="/menu/xz-workspace.jsp"%>

		<!-- start of main -->
		<section id="m-main" class="span10" style="float:right">
		<!-- 	<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="xz-workspace.do">行政管理</a> <span class="divider">/</span>
							</li>
						</ul>
					</div>
				</div>
			</div> -->
			<%-- <c:forEach items="${bpmCategories}" var="bpmCategory">
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

</c:forEach> --%>

			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12 form-inline">
						<label class="hrHomeTitle" style="font-size: 28px;">固定资产总数：</label>
						<label class="hrHomeValue" style="font-size: 35px;color: blue;">682</label>&nbsp&nbsp&nbsp
						<label class="hrHomeTitle" style="font-size: 28px;">车辆总数：</label>
						<label class="hrHomeValue" style="font-size: 35px;color: blue;">7</label>&nbsp&nbsp&nbsp
						<label class="hrHomeTitle" style="font-size: 28px;">电脑总数：</label> <label
							class="hrHomeValue" style="font-size: 35px;color: blue;">400</label>&nbsp&nbsp&nbsp
						<label class="hrHomeTitle" style="font-size: 28px;">印章总数：</label> <label
							class="hrHomeValue" style="font-size: 35px;color: blue;">652</label>&nbsp&nbsp&nbsp
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12">
						<div class="row-fluid">
							<div class="span6">
								<article class="m-widget">
									<header class="header">
										<h4 class="title">固定资产数量情况图</h4>
									</header>
									<div id="chartdiv" style="width: 100%; height: 400px;"></div>
								</article>
							</div>
							<div class="span6">
								<article class="m-widget">
									<header class="header">
										<h4 class="title">低值易耗品消耗情况图</h4>
									</header>
									<div id="chartdiv2" style="width: 100%; height: 400px;"></div>
								</article>
							</div>
						</div>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12">
						<article class="m-widget">
							<header class="header">
								<h4 class="title">纸张消耗情况对比图</h4>
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
