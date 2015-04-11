<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%
	pageContext.setAttribute("currentHeader", "xz-home");
%>
<%
	pageContext.setAttribute("currentMenu", "xz-cl");
%>
<!doctype html>
<html lang="zh">
<head>
<%@include file="/common/meta.jsp"%>
<title><spring:message code="dev.xzCar-info.list.title"
		text="车辆成本核算 - 车辆管理 - 行政管理" /></title>
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
		gridFormId : 'xzCar-infoGridForm',
		exportUrl : 'xzCar-info-export.do'
	};

	var table;

	$(function() {
		table = new Table(config);
		table.configPagination('.m-pagination');
		table.configPageInfo('.m-page-info');
		table.configPageSize('.m-page-size');
	});
</script>
</head>
<body>
	<%@include file="/header.jsp"%>
	<div class="row-fluid">
		<%@include file="/menu/xz-workspace.jsp"%>
		<!-- start of main -->
		<section id="m-main" class="span10">
	<div class=WordSection1 style='layout-grid:15.6pt'>

<p class=MsoNormal align=center style='text-align:center;background:white'><b><span
style='font-size:15.0pt;font-family:"微软雅黑","sans-serif"'>公司车辆使用管理办法</span></b></p>

<p class=MsoNormal align=left style='text-align:left;line-height:26.0pt;
layout-grid-mode:char;background:white'><span style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>一<span lang=EN-US>.&nbsp;&nbsp;</span>总则</span></p>

<p class=MsoNormal align=left style='margin-left:29.9pt;text-align:left;
line-height:26.0pt;layout-grid-mode:char;background:white'><span
style='font-size:12.0pt;font-family:"微软雅黑","sans-serif"'>为加强公司机动车辆管理，确保行车安全，提高办事效率，减少经费开支，特制定本办法。</span></p>

<p class=MsoNormal align=left style='text-align:left;line-height:26.0pt;
layout-grid-mode:char;background:white'><span style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>二<span lang=EN-US>. &nbsp;</span>车辆使用范围</span></p>

<ol style='margin-top:0cm' start=1 type=1>
 <li class=MsoNormal style='color:black;text-align:left;line-height:26.0pt;
     layout-grid-mode:char'><span style='font-size:12.0pt;font-family:"微软雅黑","sans-serif"'>公司员工在本地或短途外出开会、联系业务、联差迎送；</span></li>
 <li class=MsoNormal style='color:black;text-align:left;line-height:26.0pt;
     layout-grid-mode:char'><span style='font-size:12.0pt;font-family:"微软雅黑","sans-serif"'>接送公司宾客；</span></li>
 <li class=MsoNormal style='color:black;text-align:left;line-height:26.0pt;
     layout-grid-mode:char'><span style='font-size:12.0pt;font-family:"微软雅黑","sans-serif"'>中高层人员健康用车；</span></li>
 <li class=MsoNormal style='color:black;text-align:left;line-height:26.0pt;
     layout-grid-mode:char'><span style='font-size:12.0pt;font-family:"微软雅黑","sans-serif"'>其他紧急和特殊用车。</span></li>
</ol>

<p class=MsoNormal align=left style='text-align:left;line-height:26.0pt;
layout-grid-mode:char;background:white'><span style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>三<span lang=EN-US>.&nbsp;&nbsp;</span>权责</span></p>

<p class=MsoNormal align=left style='margin-left:23.95pt;text-align:left;
line-height:26.0pt;layout-grid-mode:char;background:white'><span
style='font-size:12.0pt;font-family:"微软雅黑","sans-serif"'>考核委员会负责对列入公司管制车辆的统一管理和调度；财务负责对相关发生费用审核控制。</span></p>

<p class=MsoNormal align=left style='text-align:left;line-height:26.0pt;
layout-grid-mode:char;background:white'><span style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>四<span lang=EN-US>.&nbsp;</span>车辆使用程序</span></p>

<p class=MsoNormal align=left style='margin-left:29.95pt;text-align:left;
text-indent:-12.0pt;line-height:26.0pt;background:white'><span lang=EN-US
style='font-size:12.0pt;font-family:"微软雅黑","sans-serif"'>1.</span><span
style='font-size:12.0pt;font-family:"微软雅黑","sans-serif"'>车辆使用实行派车制度。用车人须提前半天申报用车计划，并填写《车辆使用登记表》。</span></p>

<p class=MsoNormal align=left style='text-align:left;text-indent:18.0pt;
line-height:26.0pt;background:white'><span lang=EN-US style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>2.</span><span style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>驾驶员按《车辆使用登记表》中填写的行车路线和目的地行车。</span></p>

<p class=MsoNormal align=left style='text-align:left;text-indent:18.0pt;
line-height:26.0pt;background:white'><span lang=EN-US style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>3.</span><span style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>用车毕，驾驶员应如实汇报车辆状况。</span></p>

<p class=MsoNormal align=left style='text-align:left;text-indent:18.0pt;
line-height:26.0pt;background:white'><span lang=EN-US style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>4.</span><span style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>员工因私用车须经总经理审批。</span></p>

<p class=MsoNormal align=left style='text-align:left;text-indent:18.0pt;
line-height:26.0pt;background:white'><span lang=EN-US style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>5. </span><span style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>对近似方向、时间的派车要求尽量合用，减少派车次数和成本。</span></p>

<p class=MsoNormal align=left style='text-align:left;line-height:26.0pt;
background:white'><span style='font-size:12.0pt;font-family:"微软雅黑","sans-serif"'>五<span
lang=EN-US>. &nbsp;</span>车辆管理</span></p>

<p class=MsoNormal align=left style='text-align:left;text-indent:18.0pt;
line-height:26.0pt;background:white'><span lang=EN-US style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>1.</span><span style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>公司所有车辆均由考核委员会统一管理。</span></p>

<p class=MsoNormal align=left style='text-align:left;text-indent:18.0pt;
line-height:26.0pt;background:white'><span lang=EN-US style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>2.</span><span style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>公司所有车辆均建立车辆档案。驾驶员按《车辆使用登记表》中填写的耗</span></p>

<p class=MsoNormal align=left style='text-align:left;text-indent:30.0pt;
line-height:26.0pt;background:white'><span style='font-size:12.0pt;font-family:
"微软雅黑","sans-serif"'>油量及行车路线，经考委会和财务部门联审后方可报销。</span></p>

<p class=MsoNormal align=left style='text-align:left;text-indent:18.0pt;
line-height:26.0pt;background:white'><span lang=EN-US style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>3.</span><span style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>公司所有车辆的年审、车辆保险实行专人负责制。按时购买车辆保险和</span></p>

<p class=MsoNormal align=left style='text-align:left;text-indent:30.0pt;
line-height:26.0pt;background:white'><span style='font-size:12.0pt;font-family:
"微软雅黑","sans-serif"'>车辆年审。</span></p>

<p class=MsoNormal align=left style='text-align:left;text-indent:18.0pt;
line-height:26.0pt;background:white'><span lang=EN-US style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>4.</span><span style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>公司所有车辆实行专人保养责任制。驾驶员发现无力排除之故障，应及时</span></p>

<p class=MsoNormal align=left style='text-align:left;text-indent:30.0pt;
line-height:26.0pt;background:white'><span style='font-size:12.0pt;font-family:
"微软雅黑","sans-serif"'>报告其主管，不得带病出车。</span></p>

<p class=MsoNormal align=left style='text-align:left;text-indent:18.0pt;
line-height:26.0pt;background:white'><span lang=EN-US style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>5.</span><span style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>公司车辆若有多个部门使用时，各部门应顾全大局，愉快听从指挥、调度。</span></p>

<p class=MsoNormal align=left style='text-align:left;text-indent:18.0pt;
line-height:26.0pt;background:white'><span lang=EN-US style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>6.</span><span style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>公司车辆一般不允许在外过夜。因保管不善造成车辆被盗、损坏，驾驶员</span></p>

<p class=MsoNormal align=left style='text-align:left;text-indent:30.0pt;
line-height:26.0pt;background:white'><span style='font-size:12.0pt;font-family:
"微软雅黑","sans-serif"'>应承担保险以外的所有赔偿责任。</span></p>

<p class=MsoNormal align=left style='margin-left:35.95pt;text-align:left;
text-indent:-18.0pt;line-height:26.0pt;background:white'><span lang=EN-US
style='font-size:12.0pt;font-family:"微软雅黑","sans-serif"'>7.<span
style='background:white'> </span></span><span style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif";background:white'>项目部车辆在使用过程中所产生的与所监项目相关的</span><span
style='font-size:12.0pt;font-family:"微软雅黑","sans-serif"'>所有费用，将进入项目监理部的成本核算。</span></p>

<p class=MsoNormal align=left style='text-align:left;line-height:26.0pt;
background:white'><span style='font-size:12.0pt;font-family:"微软雅黑","sans-serif"'>六<span
lang=EN-US>.&nbsp; </span>车辆保养</span></p>

<p class=MsoNormal align=left style='text-align:left;text-indent:18.0pt;
line-height:26.0pt;background:white'><span lang=EN-US style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>1.</span><span style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>考核委员会应及时安排车辆保养、维护好车辆，并确保车辆处于良好的技</span></p>

<p class=MsoNormal align=left style='margin-left:29.9pt;text-align:left;
line-height:26.0pt;background:white'><span style='font-size:12.0pt;font-family:
"微软雅黑","sans-serif"'>术状态，随时保证使用车辆的正常运行，确保行车安全。如遇特殊情况，车辆不能正常运作时，要及时报告上级，妥善解决，以备用车之需。</span></p>

<p class=MsoNormal align=left style='text-align:left;text-indent:18.0pt;
line-height:26.0pt;background:white'><span lang=EN-US style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>2.</span><span style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>公司车辆使用人员，在车辆返回登记时必须告知考核委员会车辆停放地点，</span></p>

<p class=MsoNormal align=left style='text-align:left;text-indent:30.0pt;
line-height:26.0pt;background:white'><span style='font-size:12.0pt;font-family:
"微软雅黑","sans-serif"'>以方便下次用车。</span></p>

<p class=MsoNormal align=left style='text-align:left;text-indent:18.0pt;
line-height:26.0pt;background:white'><span lang=EN-US style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>3.</span><span style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>每次出车前，驾驶员须检查车辆外观各部位的完好状况。如发现意</span></p>

<p class=MsoNormal align=left style='text-align:left;text-indent:30.0pt;
line-height:26.0pt;background:white'><span style='font-size:12.0pt;font-family:
"微软雅黑","sans-serif"'>外损坏，应查明原因。否则按驾驶员意外损坏处理。</span></p>

<p class=MsoNormal align=left style='text-align:left;line-height:26.0pt;
background:white'><span style='font-size:12.0pt;font-family:"微软雅黑","sans-serif"'>七<span
lang=EN-US>. &nbsp;</span>车辆相关费用报销及违章</span></p>

<p class=MsoNormal align=left style='text-align:left;text-indent:18.0pt;
line-height:26.0pt;background:white'><span lang=EN-US style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>1.</span><span style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>车辆保养费、过路费、燃油费及因公使用的费用，驾驶员凭发票、车辆使</span></p>

<p class=MsoNormal align=left style='text-align:left;text-indent:30.0pt;
line-height:26.0pt;background:white'><span style='font-size:12.0pt;font-family:
"微软雅黑","sans-serif"'>用登记表等单据按照《因公出差及差旅费报销作业办法》规定进行报销。</span></p>

<p class=MsoNormal align=left style='margin-left:18.0pt;text-align:left;
line-height:26.0pt'><span lang=EN-US style='font-size:12.0pt;font-family:"微软雅黑","sans-serif"'>2.</span><span
style='font-size:12.0pt;font-family:"微软雅黑","sans-serif"'>车辆需要修理或添置各类用品时，先填写“请购单”经考核委员会审核后，</span></p>

<p class=MsoNormal align=left style='margin-left:29.9pt;text-align:left;
line-height:26.0pt'><span style='font-size:12.0pt;font-family:"微软雅黑","sans-serif"'>经总经理批准方可购置。事后凭发票附请购单报销。如在行车途中，发生非人为故障（如爆胎等现象），司机必须立即打电话报告主管后，再进行维修。返回后必须迅速补上相关手续。</span></p>

<p class=MsoNormal align=left style='margin-left:18.0pt;text-align:left;
line-height:26.0pt'><span lang=EN-US style='font-size:12.0pt;font-family:"微软雅黑","sans-serif";
color:black'>3.</span><span style='font-size:12.0pt;font-family:"微软雅黑","sans-serif";
color:black'>驾驶员行车补助费按车辆使用登记表和工作时间计算。</span></p>

<p class=MsoNormal align=left style='text-align:left;text-indent:18.0pt;
line-height:26.0pt;background:white'><span lang=EN-US style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>4.</span><span style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>驾驶员在行驶过程中发生摔、碰、撞等意外小事故，驾驶员须自行负责车</span></p>

<p class=MsoNormal align=left style='text-align:left;text-indent:30.0pt;
line-height:26.0pt;background:white'><span style='font-size:12.0pt;font-family:
"微软雅黑","sans-serif"'>辆维修，并承担维修费用。</span></p>

<p class=MsoNormal align=left style='text-align:left;text-indent:6.0pt;
line-height:26.0pt'><span style='font-size:12.0pt;font-family:"微软雅黑","sans-serif"'>八<span
lang=EN-US style='color:black'>.&nbsp; </span><span style='color:black'>驾驶员管理</span></span></p>

<p class=MsoNormal align=left style='margin-left:17.95pt;text-align:left;
text-indent:6.0pt;line-height:26.0pt'><span lang=EN-US style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif";color:black'>1.</span><span style='font-size:
12.0pt;font-family:"微软雅黑","sans-serif";color:black'>除公司允许的特殊员工以外，禁止非专职驾驶员驾驶公司车辆。</span></p>

<p class=MsoNormal align=left style='margin-left:35.95pt;text-align:left;
text-indent:-12.0pt;line-height:26.0pt'><span lang=EN-US style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif";color:black'>2.</span><span style='font-size:
12.0pt;font-family:"微软雅黑","sans-serif";color:black'>发生交通事故，驾驶员、乘车人员必须保护好事故现场，及时向交警、保险、主管和公司有关领导报告，做好善后工作。</span></p>

<p class=MsoNormal align=left style='margin-left:17.95pt;text-align:left;
text-indent:6.0pt;line-height:26.0pt'><span lang=EN-US style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif";color:black'>3.</span><span style='font-size:
12.0pt;font-family:"微软雅黑","sans-serif";color:black'>交通事故、违章责任在我方之罚款和修理费用，原则上由驾驶员自行承担；</span></p>

<p class=MsoNormal align=left style='margin-left:17.95pt;text-align:left;
text-indent:18.0pt;line-height:26.0pt'><span style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif";color:black'>如遇特殊情况，经总经理特批，方可报销。</span></p>

<p class=MsoNormal align=left style='margin-left:17.95pt;text-align:left;
text-indent:6.0pt;line-height:26.0pt'><span lang=EN-US style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>4.</span><span style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>驾驶员如有违反交通规章（如闯红灯，违章停车等），造成罚款的，公司</span></p>

<p class=MsoNormal align=left style='margin-left:17.95pt;text-align:left;
text-indent:18.0pt;line-height:26.0pt'><span style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>不予报销（特殊情况除外），由违规驾驶员个人承担，并准时交纳罚款。</span></p>

<p class=MsoNormal align=left style='margin-left:17.95pt;text-align:left;
text-indent:6.0pt;line-height:26.0pt'><span lang=EN-US style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>5.</span><span style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>已取得驾驶证的公司人员未经批准自行驾车，含随公司驾驶员出车途中要</span></p>

<p class=MsoNormal align=left style='margin-left:35.9pt;text-align:left;
line-height:26.0pt'><span style='font-size:12.0pt;font-family:"微软雅黑","sans-serif"'>求公司驾驶员让其自行驾车后，如发生违章及交通事故的，由自行驾车人员承担一切责任，经驾驶员同意的，驾驶员承担连带责任。</span></p>

<p class=MsoNormal align=left style='margin-left:17.95pt;text-align:left;
text-indent:18.0pt;line-height:14.0pt'><span style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>本办法自<span lang=EN-US>2014</span>年<span
lang=EN-US>3</span>月<span lang=EN-US>15</span>日开始执行。</span></p>

<p class=MsoNormal align=left style='margin-left:17.95pt;text-align:left;
text-indent:6.0pt;line-height:14.0pt'><span lang=EN-US style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>&nbsp;</span></p>

<p class=MsoNormal align=left style='margin-left:17.95pt;text-align:left;
text-indent:6.0pt;line-height:14.0pt'><span lang=EN-US style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>&nbsp;</span></p>

<p class=MsoNormal align=left style='margin-left:17.95pt;text-align:left;
text-indent:6.0pt;line-height:14.0pt'><span lang=EN-US style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif"'>&nbsp;</span></p>

<p class=MsoNormal align=left style='text-align:left;background:white'><span
lang=EN-US style='font-size:12.0pt;font-family:"微软雅黑","sans-serif"'>&nbsp;</span></p>

<p class=MsoNormal align=left style='margin-left:17.95pt;text-align:left;
text-indent:180.0pt;line-height:14.0pt'><span style='font-size:12.0pt;
font-family:"微软雅黑","sans-serif";background:white'>河南新恒丰建设监理有限公司</span></p>

<p class=MsoNormal align=left style='margin-left:17.95pt;text-align:left;
text-indent:234.0pt;line-height:14.0pt'><span
 lang=EN-US style='font-size:12.0pt;font-family:"微软雅黑","sans-serif";background:
 white'>2014</span><span style='font-size:12.0pt;font-family:"微软雅黑","sans-serif";
 background:white'>年<span lang=EN-US>3</span>月<span lang=EN-US>12</span>日</span></p>

<p class=MsoNormal align=left style='text-align:left;line-height:14.0pt'><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;background:white'>&nbsp;</span></p>

<p class=MsoNormal align=left style='text-align:left;line-height:14.0pt'><span
lang=EN-US style='font-size:12.0pt;font-family:宋体;background:white'>&nbsp;</span></p>

</div>

		</section>
		<!-- end of main -->
	</div>
</body>
</html>
