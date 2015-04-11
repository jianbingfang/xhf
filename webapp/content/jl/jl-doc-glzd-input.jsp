<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "jl-home");%>
<%pageContext.setAttribute("currentMenu", "jl-zd");%>
<!doctype html>
<html lang="en">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title><spring:message code="dev.jl-plain-info.list.title" text="列表"/></title>
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
      <!-- 	<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<ul class="breadcrumb">
							<li><a href="jl-home.do">监理部</a> <span class="divider">/</span>
							</li>
							<li>公司规定<span class="divider">/</span>
							</li>
							<li class="active">管理制度</li>
						</ul>
					</div>
				</div>
			</div>
	    <div> -->
	    	<article class="m-widget well"  style="margin-left: auto;margin-right: auto;width: 90%">
		     <!-- <input type="button" value="打印" onclick="printDiv()"> -->
		      	<div id="contentDiv" style="margin-top: 50px;">
					${model.fmemo1}
				</div>
				</article>
    	</div>
      </section>
	  <!-- end of main -->
	</div>

  </body>

</html>
