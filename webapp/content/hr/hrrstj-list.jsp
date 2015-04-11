<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader",  "hr-home");%>
<%pageContext.setAttribute("currentMenu", "hrGzzj");%>
<!doctype html>
<html lang="zh">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.hrYwxTihuan-info.list.title" text="列表" /></title>
    <%@include file="/common/s.jsp"%>
    <script type="text/javascript">


$(function() {

    

    $('.monthpicker').datepicker({
		language: 'zh_CN',
		format: 'yyyy-mm'
	});
    
});
    </script>
  </head>

  <body>
    <%@include file="/header.jsp"%>

    <div class="row-fluid">
	   <%@include file="/menu/hr-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10">

	  <article class="m-widget">
        <header class="header">
		  <h4 class="title">查询</h4>
		  <div class="ctrl">
		    <a class="btn"><i id="hrYwxTihuan-infoSearchIcon" class="icon-chevron-up"></i></a>
		  </div>
		</header>
        <div id="hrYwxTihuan-infoSearch" class="content content-inner">

		  <form name="hrYwxTihuan-infoForm" method="post" action="hrrstj-list.do" class="form-inline">
		    <label for="hrYwxTihuan-info_name"><spring:message code='hrYwxTihuan-info.hrYwxTihuan-info.list.search.name' text='起始时间'/>:</label>
		    	<div class="input-append monthpicker date"
					style="padding-left: 0px;">
					<input id="commRy-info_fbirdate" type="text"
						name="start_date" value="${param.start_date}" size="40"
						class="text required"
						style="background-color:white;cursor:default; width: 175px;" />
					<span class="add-on"
						style="padding-top: 2px; padding-bottom: 2px;"><i
						class="icon-calendar"></i></span>
				</div>
		    <label for="hrYwxTihuan-info_name"><spring:message code='hrYwxTihuan-info.hrYwxTihuan-info.list.search.name' text='截止时间'/>:</label>
		    	<div class="input-append monthpicker date"
					style="padding-left: 0px;">
					<input id="commRy-info_fbirdate" type="text"
						name="end_date" value="${param.end_date}" size="40"
						class="text required"
						style="background-color:white;cursor:default; width: 175px;" />
					<span class="add-on"
						style="padding-top: 2px; padding-bottom: 2px;"><i
						class="icon-calendar"></i></span>
				</div>
			<button class="btn btn-small a-search" onclick="document.hrYwxTihuan-infoForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </article>

	    <div class="m-clear"></div>
	  </article>

      <article class="m-widget">
        <header class="header">
		  <h4 class="title"><spring:message code="hrYwxTihuan-info.hrYwxTihuan-info.list.title" text="列表"/></h4>
		</header>
        <div class="content">
<form id="hrYwxTihuan-infoGridForm" name="hrYwxTihuan-infoGridForm" method='post' action="hrYwxTihuan-info-remove.do" class="m-form-blank">
  <table id="hrYwxTihuan-infoGrid" class="m-table table-hover table-bordered">
    <thead>
      <tr>
        	<th name="fyearmonth">月份</th>
        	<th name="rzcount">入职</th>
        	<th name="lzcount">辞职</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${yearMonthList}" var="item">
      <tr>
      	 	 <td>${item}</td>
      	 	 <td>${rzMap[item]==null?0:rzMap[item]}</td>
      	 	 <td>${lzMap[item]==null?0:lzMap[item]}</td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
</form>
        </div>
      </article>
      <div class="m-spacer"></div>

      </section>
	  <!-- end of main -->
	</div>

  </body>

</html>
