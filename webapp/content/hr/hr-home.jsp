<%@page contentType="text/html;charset=UTF-8" %>
<%@include file="/taglibs.jsp" %>
<%
    pageContext.setAttribute("currentHeader", "hr-home");
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
    <style type="text/css">
        .m-widget {
            box-shadow: #ddd 1px 1px 0px, #ddd -1px 1px 0px;
        }

        .m-widget .header {
            margin: 0 -1px;
        }
    </style>
</head>
<link rel="stylesheet" href="style.css" type="text/css">
<script src="${ctx}/s/highcharts/highcharts.js" type="text/javascript"></script>
<script src="${ctx}/s/highcharts/no-data-to-display.js" type="text/javascript"></script>

<body>
<%@include file="/header/bpm-workspace.jsp" %>

<div class="row-fluid">
    <%@include file="/menu/hr-workspace.jsp" %>

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
            <%--<div class="row-fluid">--%>
            <%--<div class="content content-inner" style="padding:0 0 0px 20px">--%>
            <%--<form name="hr-plain-infoForm" method="post"--%>
            <%--action="hr-plain-info-list.do" class="form-inline">--%>
            <%--<label class="hrHomeTitle" style="font-size: 22px;">在职员工总数：</label> <label--%>
            <%--class="hrHomeValue" style="font-size: 26px;color: blue;">120</label>&nbsp&nbsp&nbsp--%>
            <%--<label class="hrHomeTitle" style="font-size: 22px;">本月新入职员工数：</label>--%>
            <%--<label class="hrHomeValue" style="font-size: 26px;color: blue;">10</label> &nbsp&nbsp&nbsp--%>
            <%--<label class="hrHomeTitle" style="font-size: 22px;">本月离职员工数：</label>--%>
            <%--<label class="hrHomeValue" style="font-size: 26px;color: blue;">1</label>&nbsp&nbsp&nbsp--%>
            <%--</form>--%>
            <%--</div>--%>
            <%--</div>--%>
            <div class="row-fluid">
                <div class="span6">
                    <article class="m-widget">
                        <header class="header">
                            <h4 class="title">持证情况</h4>
                            <img id="loading-czqk" src="${ctx}/common/loading-circle.gif" alt="加载中..."
                                 style="margin: -3px 0px 0px 10px;"/>
                        </header>
                        <div id="chart-czqk" style="width: 100%; height: 400px;"></div>
                    </article>
                </div>
                <div class="span6">
                    <article class="m-widget">
                        <header class="header">
                            <h4 class="title">职称情况</h4>
                            <img id="loading-zcqk" src="${ctx}/common/loading-circle.gif" alt="加载中..."
                                 style="margin: -3px 0px 0px 10px;"/>
                        </header>
                        <div id="chart-zcqk" style="width: 100%; height: 400px;"></div>
                    </article>
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
                        drawChartRybd(year);
                    }
                });
            </script>
            <div class="row-fluid">
                <div class="span12">
                    <article class="m-widget">
                        <header class="header">
                            <h4 class="title">人员变动</h4>
                            <img id="loading-rybd" src="${ctx}/common/loading-circle.gif" alt="加载中..."
                                 style="margin: -3px 0px 0px 10px;"/>
                        </header>
                        <div id="chart-rybd" style="width: 100%; height: 400px;"></div>
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
<script src="${ctx}/s/hr/czqk.js" type="text/javascript"></script>
<script src="${ctx}/s/hr/zcqk.js" type="text/javascript"></script>
<script src="${ctx}/s/hr/rybd.js" type="text/javascript"></script>
<script>
    drawChartZcqk();
    drawChartCzqk();
    drawChartRybd(moment().format('YYYY'));
</script>
</body>

</html>
