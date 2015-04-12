<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="/taglibs.jsp" %>
<%
    pageContext.setAttribute("currentHeader", "gcgl-home");
%>
<%
    pageContext.setAttribute("currentMenu", "bpm-process");
%>
<!doctype html>
<html lang="en">
<head>
    <%@include file="/common/meta.jsp" %>
    <title>流程列表</title>
    <%@include file="/common/s.jsp" %>
</head>
<link rel="stylesheet" href="style.css" type="text/css">
<%--<script src="${ctx}/s/xthena/amcharts/pie.js" type="text/javascript"></script>--%>
<%--<script src="${ctx}/s/xthena/amcharts/serial.js" type="text/javascript"></script>--%>
<%--<script type="text/javascript"--%>
<%--src="http://app.mapabc.com/apis?t=flashmap&v=2.4.1&key=b0a7db0b3a30f944a21c3682064dc70ef5b738b062f6479a5eca39725798b1ee300bd8d5de3a4ae3|29e8ed1f7f6a97d8e99fc568cea6a7dc0ccd920856e07c0718b9885faf7551a18141699c81f526d7"></script>--%>
<script src="${ctx}/s/highcharts/highcharts.js" type="text/javascript"></script>
<script src="${ctx}/s/highcharts/no-data-to-display.js" type="text/javascript"></script>

<body>
<%@include file="/header/bpm-workspace.jsp" %>
<div class="row-fluid">
    <%@include file="/menu/gcgl-workspace.jsp" %>
    <script src="${ctx}/s/gcgl/project-type.js" type="text/javascript"></script>
    <script src="${ctx}/s/gcgl/project-onbuilding.js" type="text/javascript"></script>
    <script src="${ctx}/s/gcgl/jxkh.js" type="text/javascript"></script>
    <script>
        var drawAllChart = function (year) {
            drawChartProjectType(year);
            drawChartProjectOnbuilding(year);
            drawChartJxkh(year);
        };
    </script>
    <!-- start of main -->
    <section id="m-main" class="span10" style="float:right">
        <span style="font-size: medium"><b>选择年份：</b></span>
        <select id="select-year" onchange="drawAllChart(this.value)">
            <c:forEach items="${yearList}" var="year">
                <option value="${year}">${year}年</option>
            </c:forEach>
        </select>

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
                <div class="span6">
                    <article class="m-widget">
                        <header class="header">
                            <h4 class="title">项目情况</h4>
                            <img id="loading-project-type" src="${ctx}/common/loading-circle.gif" alt="加载中..."
                                 style="margin: -3px 0px 0px 10px;"/>
                        </header>
                        <div id="chart-project-type" style="height: 300px;">
                        </div>
                    </article>
                </div>
                <div class="span6">
                    <article class="m-widget">
                        <header class="header">
                            <h4 class="title">在建项目类别</h4>
                            <img id="loading-project-onbuilding" src="${ctx}/common/loading-circle.gif" alt="加载中..."
                                 style="margin: -3px 0px 0px 10px;"/>
                        </header>
                        <div id="chart-project-onbuilding" style="height:300px"></div>
                    </article>
                </div>
            </div>
            <div class="row-fluid">
                <div class="span12">
                    <article class="m-widget">
                        <header class="header">
                            <h4 class="title">绩效考核</h4>
                            <img id="loading-jxkh" src="${ctx}/common/loading-circle.gif" alt="加载中..."
                                 style="margin: -3px 0px 0px 10px;"/>
                        </header>
                        <div id="chart-jxkh" style="height: auto;"></div>
                    </article>
                </div>
            </div>
        </div>
        <script>
            drawAllChart(${yearList[0]});
        </script>
    </section>
    <!-- end of main -->
</div>
</body>
</html>
