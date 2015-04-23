<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="/taglibs.jsp" %>
<%
    pageContext.setAttribute("currentHeader", "cw-home");
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
<script src="${ctx}/s/highcharts/highcharts.js" type="text/javascript"></script>
<script src="${ctx}/s/highcharts/no-data-to-display.js" type="text/javascript"></script>
<body>
<%@include file="/header.jsp" %>
<script src="${ctx}/s/cw/jlf.js" type="text/javascript"></script>
<script src="${ctx}/s/cw/tbbzj.js" type="text/javascript"></script>
<script src="${ctx}/s/cw/lybzj.js" type="text/javascript"></script>
<div class="row-fluid">
    <%@include file="/menu/cw-workspace.jsp" %>

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
                        drawChartJlf(year);
                        drawChartLybzj(year);
                        drawChartTbbzj(year);
                    }
                });
            </script>

            <div class="row-fluid">
                <div class="content content-inner">
                    <form name="hr-plain-infoForm" method="post"
                          action="hr-plain-info-list.do" class="form-inline">
                        <label class="hrHomeTitle" style="font-size: 18px;">应收账款：</label>
                        <label class="hrHomeValue" style="font-size: 18px;color: blue;"><span
                                id="txt-yingshou"> - </span>
                            元</label>&nbsp&nbsp&nbsp <label class="hrHomeTitle"
                                                             style="font-size: 18px;">已收账款：</label> <label
                            class="hrHomeValue" style="font-size: 18px;color: blue;"><span id="txt-yishou"> - </span>
                        元</label> &nbsp&nbsp&nbsp <label class="hrHomeTitle"
                                                          style="font-size: 18px;">未收账款：</label> <label
                            class="hrHomeValue" style="font-size: 18px;color: blue;"><span id="txt-weishou"> - </span>
                        元</label>&nbsp&nbsp&nbsp
                    </form>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span12">
                    <article class="m-widget">
                        <header class="header">
                            <h4 class="title">监理费回收动态图</h4>
                            <img id="loading-jlf" src="${ctx}/common/loading-circle.gif" alt="加载中..."
                                 style="margin: -3px 0px 0px 10px;"/>
                        </header>
                        <div id="chart-jlf" style="height: 400px; padding-top: 20px;"></div>
                    </article>
                </div>
            </div>

            <div class="row-fluid">
                <div class="span6">
                    <article class="m-widget">
                        <header class="header">
                            <h4 class="title">投标保证金回收情况图</h4>
                            <img id="loading-tbbzj" src="${ctx}/common/loading-circle.gif" alt="加载中..."
                                 style="margin: -3px 0px 0px 10px;"/>
                        </header>
                        <div id="chart-tbbzj" style="width: 100%; height: 400px;"></div>
                    </article>
                </div>
                <div class="span6">
                    <article class="m-widget">
                        <header class="header">
                            <h4 class="title">履约保证金回收情况图</h4>
                            <img id="loading-lybzj" src="${ctx}/common/loading-circle.gif" alt="加载中..."
                                 style="margin: -3px 0px 0px 10px;"/>
                        </header>
                        <div id="chart-lybzj" style="width: 100%; height: 400px;"></div>
                    </article>
                </div>
            </div>
        </div>
    </section>
    <script>
        var nowYear = new Date().getFullYear();
        drawChartJlf(nowYear);
        drawChartLybzj(nowYear);
        drawChartTbbzj(nowYear);
    </script>
    <!-- end of main -->
</div>

</body>

</html>
