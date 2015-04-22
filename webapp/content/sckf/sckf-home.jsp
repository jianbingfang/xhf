<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="/taglibs.jsp" %>
<%
    pageContext.setAttribute("currentHeader", "sckf-home");
%>
<%
    pageContext.setAttribute("currentMenu", "bpm-process");
%>
<!doctype html>
<html lang="en">

<head>
    <%@include file="/common/meta.jsp" %>
    <title>市场开发</title>
    <%@include file="/common/s.jsp" %>
</head>
<link rel="stylesheet" href="${ctx}/s/sckf/sckf.css" type="text/css">
<script src="${ctx}/s/highcharts/highcharts.js" type="text/javascript"></script>
<script src="${ctx}/s/highcharts/no-data-to-display.js" type="text/javascript"></script>

<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="/header/bpm-workspace.jsp" %>

<div class="row-fluid">
    <%@include file="/menu/sckf-workspace.jsp" %>
    <script src="${ctx}/s/sckf/tbqk.js" type="text/javascript"></script>
    <script src="${ctx}/s/sckf/htgl.js" type="text/javascript"></script>
    <script src="${ctx}/s/sckf/fbqk.js" type="text/javascript"></script>
    <script>
        var drawAllChart = function (year) {
            drawChartTbqk(year);
            drawChartHtgl(year);
            drawChartFbqk(year);
        };
    </script>
    <!-- start of main -->
    <section id="m-main" class="span10" style="float: right">

        <div style="margin-bottom: 10px;">
            <button class="btn btn-info" type="button" data-toggle="collapse" data-target="#chart-area"
                    aria-expanded="false" aria-controls="collapseExample">
                显示/隐藏图表
            </button>
        </div>
        <div class="collapse" id="chart-area">
            <span style="font-size: medium"><b>选择年份：</b></span>
            <input id="year-container" type="text" type="text" class="form-control">
            <script type="text/javascript">
                $('#year-container').val(moment().format('YYYY'));
                $('#year-container').datepicker({
                    format: "yyyy",
                    startView: 2,
                    minViewMode: 2,
                    autoclose: true
                }).on('changeDate', function (ev) {
                    if (ev.date) {
                        var year = ev.date.getFullYear();
                        drawAllChart(year);
                    }
                });
            </script>
            <div class="row-fluid">
                <div class="span12">
                    <article class="m-widget">
                        <header class="header">
                            <h4 class="title">投标情况</h4>
                            <img id="loading-tbqk" src="${ctx}/common/loading-circle.gif" alt="加载中..."
                                 class="loading-img"/>
                        </header>
                        <div id="chart-tbqk" style="min-width: 700px; height: 400px">
                        </div>
                    </article>
                </div>
            </div>
            <div class="row-fluid">
                <div class="span6">
                    <article class="m-widget">
                        <header class="header">
                            <h4 class="title">合同签订情况</h4>
                            <img id="loading-htgl" src="${ctx}/common/loading-circle.gif" alt="加载中..."
                                 class="loading-img"/>
                        </header>
                        <div id="chart-htgl" style="height: 400px">
                        </div>
                    </article>
                </div>
                <div class="span6">
                    <article class="m-widget">
                        <header class="header">
                            <h4 class="title">废标比例</h4>
                            <img id="loading-fbqk" src="${ctx}/common/loading-circle.gif" alt="加载中..."
                                 class="loading-img"/>
                        </header>
                        <div id="chart-fbqk" style="height: 400px">
                        </div>
                    </article>
                </div>
            </div>
            <script>
                drawAllChart(new Date().getFullYear());
            </script>
        </div>
        <!-- <div class="container-fluid">
            <div class="row-fluid">
                <div class="span12">
                    <ul class="breadcrumb">
                        <li><a href="sckf-home.do">市场开发</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div> -->
        <div class="container-fluid" style="font-size: 18px">
            <div class="row-fluid">
                <div class="span12">
                    <article class="m-widget">
                        <header class="header">
                            <h4 class="title">本周开标项目</h4>
                        </header>
                        <table id="xzZjOrder-infoGrid"
                               class="m-table table-hover table-bordered"
                               style="line-height: 25px;">
                            <thead>
                            <tr>
                                <th name="fkbdate" style="width: 180px;">开标时间</th>
                                <th name="fname" style="width: 360px;">工程名称</th>
                                <th name="fendtime" style="width: 90px;">制标人</th>
                                <th name="ffuzeren" style="width: 90px;">主办人</th>
                                <th name="fbzjstatus" style="width: 120px;">保证金状态</th>
                                <th name="fzjdc" style="width: 120px;">总监到场</th>
                                <th name="ffrdc" style="width: 120px;">法人到场</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${thisweek}" var="item">
                                <tr>
                                    <td style="width: 180px;"><fmt:formatDate
                                            value="${item.fkbdate}" pattern="yyyy-MM-dd HH:mm"/></td>
                                    <td style="width: 360px;">${item.fname}</td>
                                    <td style="width: 90px;">${ryMap[item.fbszzren].fname}</td>
                                    <td style="width: 90px;">${item.ffuzeren}</td>
                                    <td style="width: 120px;">${item.fbzjstatus}</td>
                                    <td style="width: 120px;">${item.fzjdc=='1'?'是':'否'}</td>
                                    <td style="width: 120px;">${item.ffrdc=='1'?'是':'否'}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </article>
                </div>
            </div>
            <div class="row-fluid">
                <div class="span12">
                    <article class="m-widget">
                        <header class="header">
                            <h4 class="title">下周开标项目</h4>
                        </header>
                        <table id="xzZjOrder-infoGrid"
                               class="m-table table-hover table-bordered"
                               style="line-height: 25px;">
                            <thead>
                            <tr>
                                <th name="fkbdate" style="width: 180px;">开标时间</th>
                                <th name="fname" style="width: 360px;">工程名称</th>
                                <th name="fendtime" style="width: 90px;">制标人</th>
                                <th name="ffuzeren" style="width: 90px;">主办人</th>
                                <th name="fbzjstatus" style="width: 120px;">保证金状态</th>
                                <th name="fzjdc" style="width: 120px;">总监到场</th>
                                <th name="ffrdc" style="width: 120px;">法人到场</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${nextweek}" var="item">
                                <tr>
                                    <td style="width: 180px;"><fmt:formatDate
                                            value="${item.fkbdate}" pattern="yyyy-MM-dd HH:mm"/></td>
                                    <td style="width: 360px;">${item.fname}</td>
                                    <td style="width: 90px;">${ryMap[item.fbszzren].fname}</td>
                                    <td style="width: 90px;">${item.ffuzeren}</td>
                                    <td style="width: 120px;">${item.fbzjstatus}</td>
                                    <td style="width: 120px;">${item.fzjdc=='1'?'是':'否'}</td>
                                    <td style="width: 120px;">${item.ffrdc=='1'?'是':'否'}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </article>
                </div>
            </div>
            <%-- 	<div class="row-fluid">
                <div class="content content-inner">
                    <form name="hr-plain-infoForm" method="post"
                        action="hr-plain-info-list.do" class="form-inline">
                        <label class="hrHomeTitle" style="font-size: 28px;">目前正在投标的项目数：</label>
                        <label class="hrHomeValue" style="font-size: 35px;color: blue;">15</label>&nbsp&nbsp&nbsp
                        <label class="hrHomeTitle" style="font-size: 28px;">本月中标项目数：</label>
                        <label class="hrHomeValue" style="font-size: 35px;color: blue;">5</label>
                        &nbsp;&nbsp;&nbsp; <label class="hrHomeTitle"
                            style="font-size: 28px;">上月中标项目数：</label> <label
                            class="hrHomeValue" style="font-size: 35px;color: blue;">13</label>&nbsp&nbsp&nbsp
                    </form>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span12">
                    <article class="m-widget">
                        <header class="header">
                            <h4 class="title">投中标情况发展图</h4>
                        </header>
                         <div id="chartdiv"  style="width: 100%; height: 400px;"></div>
                    </article>
                </div>
            <!-- 	<div class="span6">
                    <article class="m-widget">
                        <header class="header">
                            <h4 class="title">中标项目投资规模分析图</h4>
                        </header>
                        <div id="chartdiv2" style="width: 100%; height: 400px;"></div>
                    </article>
                </div> -->
            </div>
            <div class="row-fluid">
                <div class="span12">
                    <article class="m-widget">
                        <header class="header">
                            <h4 class="title">投标项目进度一览表</h4>
                        </header>
                        真实数据
                            <c:forEach items="${projectList.project}" var="bpmProcess">
                                <div class="row-fluid">
                                    <h4>${project.name}&nbsp;</h4>
                                    <p>${bpmProcess.descn}&nbsp;</p>
                                    <div class="progress progress-striped active progress-info"
                                        id="schedule">
                                        <div id="schedule-bar" class="bar" aria-valuemin="0"
                                            aria-valuemax="100" style="width:${model.fstate}">0%</div>
                                    </div>
                                    <h3 class="text">${model.fstatename}</h3>
                                </div>
                            </c:forEach>
                        <div class="control-group">
                            <div class="control-label" for="schedule1">郑东新区电力排管项目（投标文件完成）</div>
                            <div class="controls">
                                <div class="progress progress-striped active progress-info"
                                    id="schedule1" >
                                    <div id="schedule-bar" class="bar" aria-valuemin="0"
                                        aria-valuemax="100" style="width:60%">60%</div>
                                </div>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="control-label" for="schedule1">新乡变电站项目（已购买招标文件）</div>
                            <div class="controls">
                                <div class="progress progress-striped active progress-info"
                                    id="schedule1" >
                                    <div id="schedule-bar" class="bar" aria-valuemin="0"
                                        aria-valuemax="100" style="width:40%">40%</div>
                                </div>
                            </div>
                        </div>
                            <div class="control-group">
                            <div class="control-label" for="schedule1">安徽高铁站项目（正在报名）</div>
                            <div class="controls">
                                <div class="progress progress-striped active progress-info"
                                    id="schedule1" >
                                    <div id="schedule-bar" class="bar" aria-valuemin="0"
                                        aria-valuemax="100" style="width:10%">10%</div>
                                </div>
                            </div>
                        </div>
                    </article>
                </div>
            </div> --%>

        </div>
    </section>
    <!-- end of main -->
</div>

</body>

</html>
