<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="/taglibs.jsp" %>
<%
    pageContext.setAttribute("currentHeader", "xz-home");
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
    <script src="${ctx}/s/highcharts/highcharts.js" type="text/javascript"></script>
    <script src="${ctx}/s/highcharts/no-data-to-display.js" type="text/javascript"></script>
</head>
<body>
<script src="${ctx}/s/echart/echarts-all.js" type="text/javascript"></script>
<script src="${ctx}/s/echart/echarts-config.js" type="text/javascript"></script>

<%@include file="/header/bpm-workspace.jsp" %>

<div class="row-fluid">
    <%@include file="/menu/xz-workspace.jsp" %>

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
            <%--<div class="row-fluid">--%>
            <%--<div class="span12 form-inline">--%>
            <%--<label class="hrHomeTitle" style="font-size: 28px;">固定资产总数：</label>--%>
            <%--<label class="hrHomeValue" style="font-size: 35px;color: blue;">682</label>&nbsp&nbsp&nbsp--%>
            <%--<label class="hrHomeTitle" style="font-size: 28px;">车辆总数：</label>--%>
            <%--<label class="hrHomeValue" style="font-size: 35px;color: blue;">7</label>&nbsp&nbsp&nbsp--%>
            <%--<label class="hrHomeTitle" style="font-size: 28px;">电脑总数：</label> <label--%>
            <%--class="hrHomeValue" style="font-size: 35px;color: blue;">400</label>&nbsp&nbsp&nbsp--%>
            <%--<label class="hrHomeTitle" style="font-size: 28px;">印章总数：</label> <label--%>
            <%--class="hrHomeValue" style="font-size: 35px;color: blue;">652</label>&nbsp&nbsp&nbsp--%>
            <%--</div>--%>
            <%--</div>--%>
            <div class="row-fluid">
                <div class="span12">
                    <div class="row-fluid">
                        <div class="span6">
                            <article class="m-widget">
                                <header class="header">
                                    <h4 class="title">固定资产数量情况</h4>
                                    <img id="loading-gdzc" src="${ctx}/common/loading-circle.gif" alt="加载中..."
                                         style="margin: -3px 0px 0px 10px;"/>
                                </header>
                                <div id="chart-gdzc" style="height: 400px;"></div>
                            </article>
                        </div>
                        <div class="span6">
                            <article class="m-widget">
                                <header class="header">
                                    <h4 class="title">分公司分布</h4>
                                    <img id="loading-gsfb" src="${ctx}/common/loading-circle.gif" alt="加载中..."
                                         style="margin: -3px 0px 0px 10px;"/>
                                </header>
                                <div id="chart-gsfb" style="height: 400px;"></div>
                            </article>
                        </div>
                    </div>
                </div>
            </div>
            <span style="font-size: medium"><b>选择年份：</b></span>
            <input id="year-container" type="text" type="text" class="form-control">
            <script type="text/javascript">
                $('#year-container').val(moment().format('YYYY'));
                $('#year-container').datepicker({
                    format: "yyyy",
                    startView: 2,
                    minViewMode: 2,
                    autoclose: true,
                    endDate: moment().format('YYYY')
                }).on('changeDate', function (ev) {
                    if (ev.date) {
                        var year = ev.date.getFullYear();
                        drawChartZzxh(year);
                    }
                });
            </script>
            <div class="row-fluid">
                <div class="span12">
                    <article class="m-widget">
                        <header class="header">
                            <h4 class="title">纸张消耗情况</h4>
                            <img id="loading-zzxh" src="${ctx}/common/loading-circle.gif" alt="加载中..."
                                 style="margin: -3px 0px 0px 10px;"/>
                        </header>
                        <div id="chart-zzxh" style="width: 100%; height: 400px;"></div>
                    </article>
                </div>
            </div>
        </div>

    </section>
    <!-- end of main -->
</div>
<script src="${ctx}/s/xz/gsfb.js" type="text/javascript"></script>
<script src="${ctx}/s/xz/gdzc.js" type="text/javascript"></script>
<script src="${ctx}/s/xz/zzxh.js" type="text/javascript"></script>
<script>
    drawChartGdzc();
    drawChartGsfb();
    drawChartZzxh(moment().format('YYYY'));
</script>
</body>

</html>
