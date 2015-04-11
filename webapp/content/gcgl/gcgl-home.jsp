<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "gcgl-home");
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
<script type="text/javascript"
	src="http://app.mapabc.com/apis?t=flashmap&v=2.4.1&key=b0a7db0b3a30f944a21c3682064dc70ef5b738b062f6479a5eca39725798b1ee300bd8d5de3a4ae3|29e8ed1f7f6a97d8e99fc568cea6a7dc0ccd920856e07c0718b9885faf7551a18141699c81f526d7"></script>
<script type="text/javascript">
	var chart;

	var chartData = [ {
		"projectName" : "郑东新区电力综合楼项目",
		"rate" : 80,
		"income" : 65
	}, {
		"projectName" : "高新技术产业开发区水厂",
		"rate" : 52,
		"income" : 30
	}, {
		"projectName" : "新郑飞机场",
		"rate" : 30.1,
		"income" : 23.9
	}, {
		"projectName" : "华南城",
		"rate" : 29.5,
		"income" : 25.1
	}, {
		"projectName" : "项目4",
		"rate" : 24.6,
		"income" : 25
	}, {
		"projectName" : "华南城",
		"rate" : 29.5,
		"income" : 25.1
	}, {
		"projectName" : "华南城",
		"rate" : 29.5,
		"income" : 25.1
	}, {
		"projectName" : "华南城",
		"rate" : 29.5,
		"income" : 25.1
	}, {
		"projectName" : "华南城",
		"rate" : 29.5,
		"income" : 25.1
	}, {
		"projectName" : "华南城",
		"rate" : 29.5,
		"income" : 25.1
	}, {
		"projectName" : "华南城",
		"rate" : 29.5,
		"income" : 25.1
	}, {
		"projectName" : "华南城",
		"rate" : 29.5,
		"income" : 25.1
	}, {
		"projectName" : "华南城",
		"rate" : 29.5,
		"income" : 25.1
	}, {
		"projectName" : "华南城",
		"rate" : 29.5,
		"income" : 25.1
	}, {
		"projectName" : "华南城",
		"rate" : 29.5,
		"income" : 25.1
	}, {
		"projectName" : "华南城",
		"rate" : 29.5,
		"income" : 25.1
	} ];
	var chart3;
	var chartData3 = [ {
		type : "房建、市政",
		litres : 55
	}, {
		type : "工业",
		litres : 19
	}, {
		type : "电力",
		litres : 11
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
		graph1.title = "项目进度";
		graph1.valueField = "rate";
		graph1.balloonText = "[[title]]:[[value]]%";
		graph1.lineAlpha = 0;
		graph1.fillColors = "#ADD981";
		graph1.fillAlphas = 1;
		chart.addGraph(graph1);

		// second graph
		var graph2 = new AmCharts.AmGraph();
		graph2.type = "column";
		graph2.title = "监理费回收率";
		graph2.valueField = "income";
		graph2.balloonText = "[[title]]:[[value]]";
		graph2.lineAlpha = 0;
		graph2.fillColors = "#81acd9";
		graph2.fillAlphas = 1;
		chart.addGraph(graph2);

		// LEGEND
		var legend = new AmCharts.AmLegend();
		legend.position = "top";
		chart.addLegend(legend);

		chart.creditsPosition = "top-right";

		// WRITE
		chart.write("chartdiv");

		//3
		// PIE CHART
		chart3 = new AmCharts.AmPieChart();
		chart3.dataProvider = chartData3;
		chart3.titleField = "type";
		chart3.valueField = "litres";
		chart3.outlineColor = "#FFFFFF";
		chart3.outlineAlpha = 0.8;
		chart3.outlineThickness = 2;
		chart3.balloonText = "[[type]]:[[value]]";
		chart3.labelsEnabled = false;
		// LEGEND                  
		var legend3 = new AmCharts.AmLegend();
		legend3.borderAlpha = 0.2;
		legend3.horizontalGap = 10;
		chart3.addLegend(legend3);

		// WRITE
		chart3.write("chartdiv3");

	});
	var mapObj = null;
	function mapInit() {
		var mapoption = new MMapOptions();
		mapoption.toolbar = MConstants.ROUND; //设置地图初始化工具条，ROUND:新版圆工具条  
		mapoption.toolbarPos = new MPoint(20, 20); //设置工具条在地图上的显示位置  
		mapoption.overviewMap = MConstants.MINIMIZE; //设置鹰眼地图的状态，SHOW:显示，HIDE:隐藏（默认）  
		mapoption.scale = MConstants.HIDE; //设置地图初始化比例尺状态，SHOW:显示（默认），HIDE:隐藏。  
		mapoption.zoom = 4;//要加载的地图的缩放级别  
		mapoption.center = new MLngLat(108.597656, 35.310194);//要加载的地图的中心点经纬度坐标  
		mapoption.language = MConstants.MAP_CN;//设置地图类型，MAP_CN:中文地图（默认），MAP_EN:英文地图  
		mapoption.fullScreenButton = MConstants.HIDE;//设置是否显示全屏按钮，SHOW:显示（默认），HIDE:隐藏  
		mapoption.centerCross = MConstants.HIDE;//设置是否在地图上显示中心十字,SHOW:显示（默认），HIDE:隐藏  
		mapoption.requestNum = 100;//设置地图切片请求并发数。默认100。  
		mapoption.isQuickInit = true;//设置是否快速显示地图，true显示，false不显示。  
		mapObj = new MMap("map", mapoption); //地图初始化  
		mapObj.setCtrlPanelState(MConstants.TOOLBAR_CTRL, MConstants.HIDE);
		addMarker("113.726984", "34.77221");
		addMarker("113.726984", "34.77221");
		addMarker("113.726906", "34.774");
		addMarker("113.726984", "34.77221");
		addMarker("113.726984", "34.77221");
		addMarker("113.726984", "34.77221");
		addMarker("113.726984", "34.77221");
		addMarker("113.726984", "34.77221");
		addMarker("113.726984", "34.77221");
		addMarker("113.726984", "34.77221");
		addMarker("113.726984", "34.77221");
		addMarker("113.726984", "34.77221");
		addMarker("113.726984", "34.77221");
		addMarker("113.726984", "34.77221");
		addMarker("113.726984", "34.77221");
		addMarker("113.726984", "34.77221");
		addMarker("113.726984", "34.77221");
		addMarker("113.726984", "34.77221");
		addMarker("113.726984", "34.77221");
		addMarker("113.726984", "34.77221");
	}
	function addMarker(lng, lat) {
		var tipOption = new MTipOptions();//添加信息窗口  
		tipOption.title = "郑州会展中心";//信息窗口标题  
		tipOption.content = "建筑面积5万平方米";//信息窗口内容  

		var labelOption = new MLabelOptions();//添加标注  
		labelOption.content = "郑州会展中心";//标注的内容  
		//  labelOption.hasBorder=true;//设置标注背景是否有边框，默认为false，即没有边框  
		// labelOption.hasBackground=true;//设置标注是否有背景，默认为false，即没有背景  
		//标注左上角相对于图片中下部的锚点。Label左上角与图片中下部重合时，记为像素坐标原点(0,0)。  
		labelOption.labelPosition = new MPoint(10, 10);

		//构建一个名为markerOption的点选项对象。  
		var markerOption = new MMarkerOptions();
		//标注图片或SWF的url，默认为蓝色气球图片  
		markerOption.imageUrl = "http://code.mapabc.com/images/lan_1.png";
		//是否使用图片代理形式  
		//如果imageUrl属性的图片资源所在域名下没有crossdomain.xml，则需要用代理形式添加该图片资源  
		markerOption.picAgent = false;
		//设置图片相对于加点经纬度坐标的位置。九宫格位置。默认BOTTOM_CENTER代表正下方  
		markerOption.imageAlign = MConstants.BOTTOM_CENTER;
		//设置点的标注参数选项  
		markerOption.labelOption = labelOption;
		//拖动结束后是否有弹跳效果,ture，有弹跳效果；false，没有弹跳效果（默认）  
		//当有弹跳效果的时候，marker的imageAlign属性必须为BOTTOM_CENTER，否则弹跳效果显示不正确  
		markerOption.isBounce = false;
		//设置点是否为可编辑状态,rue，可以编辑； false，不可编辑（默认）  
		markerOption.isEditable = false;
		//设置点的信息窗口参数选项  
		markerOption.tipOption = tipOption;
		//是否在地图中显示信息窗口，true，可以显示（默认）；false，不显示  
		markerOption.canShowTip = true;
		//设置图标旋转的角度  
		markerOption.rotation = "0";
		//是否显示阴影，默认为true，即有阴影  
		markerOption.hasShadow = true;
		//设置点是否高亮显示  
		//设置高亮显示与设置可编辑有冲突，只能设置一个，不能同时设置。  
		markerOption.isDimorphic = true;
		//设置第二种状态的颜色，默认为0xFF0000，即红色  
		markerOption.dimorphicColor = "0x00A0FF";
		//通过经纬度坐标及参数选项确定标注信息  
		Mmarker = new MMarker(new MLngLat(lng, lat), markerOption);
		//对象编号，也是对象的唯一标识  
		Mmarker.id = "mark101";
		//向地图添加覆盖物  
		mapObj.addOverlay(Mmarker, true);
	}
</script>
<body onload="mapInit();">
	<%@include file="/header/bpm-workspace.jsp"%>
	<div class="row-fluid">
		<%@include file="/menu/gcgl-workspace.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span10" style="float:right">
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="content content-inner">
						<form name="hr-plain-infoForm" method="post"
							action="hr-plain-info-list.do" class="form-inline">
							<label class="hrHomeTitle" style="font-size: 28px;">目前进行中的项目总数：</label>
							<label class="hrHomeValue" style="font-size: 35px;color: blue;">260</label>&nbsp&nbsp&nbsp
							<label class="hrHomeTitle" style="font-size: 28px;">本月新开工项目数：</label>
							<label class="hrHomeValue" style="font-size: 35px;color: blue;">2</label>
							&nbsp&nbsp&nbsp <label class="hrHomeTitle"
								style="font-size: 28px;">本月竣工项目数：</label> <label
								class="hrHomeValue" style="font-size: 35px;color: blue;">4</label>&nbsp&nbsp&nbsp
						</form>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span4">
						<article class="m-widget">
							<header class="header">
								<h4 class="title">项目类别分析图</h4>
							</header>
							<div id="chartdiv3" style="width: 100%; height: 500px;"></div>
						</article>
					</div>
					<div class="span8">
						<article class="m-widget">
							<header class="header">
								<h4 class="title">项目分布图</h4>
							</header>
							<div id="map" style="width:100%;height:500px"></div>
						</article>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12">
						<article class="m-widget">
							<header class="header">
								<h4 class="title">重大项目一览表</h4>
							</header>
							<div id="chartdiv" style="width: 100%; height: 1000px;"></div>
						</article>
					</div>
				</div>
			</div>
		</section>
		<!-- end of main -->
	</div>
</body>
</html>
