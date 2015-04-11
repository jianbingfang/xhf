<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jl-zd");%>
<!doctype html>
<html lang="en">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.jl-plain-info.list.title" text="薪酬体系 - 人力资源"/></title>
    <%@include file="/common/s.jsp"%>
     <script type="text/javascript" src="${ctx}/s/xthena/js/jquery.PrintArea.js"></script>
    <script type="text/javascript">
	function printDiv() {
		$("div#contentDiv").printArea();
	}
    </script>
  </head>

  <body>
    <%@include file="/header.jsp"%>

    <div class="row-fluid">
	  <%@include file="/menu/jl-workspace.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="span10" style='text-justify-trim:punctuation;font-family: 宋体;'>
		
		 <c:forEach items="${page.result}" var="item">
	      <p><a  href="jl-doc-glzd-input.do?id=${item.fid}" style="font-size: 16px;" >《${item.ftitle}》</a></p>
	      </c:forEach>

      </section>
	  <!-- end of main -->
	</div>

  </body>

</html>
