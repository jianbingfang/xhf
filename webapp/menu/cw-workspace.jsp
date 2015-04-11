<%@ page language="java" pageEncoding="UTF-8" %>
      <!-- start of sidebar -->
   
      <aside id="m-sidebar" class="accordion span2" ><!-- data-spy="affix" data-offset-top="100" -->
         <script type="text/javascript" style="display: none" src="${ctx}/s/xthena/js/zd.js"></script>

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle"  data-toggle="collapse"  data-parent="#m-sidebar" href="javascript:void(0)"   onclick="zd('cw-zd')"><!-- #collapse-bpm-process -->
              <i class="icon-book "></i>
              <span class="title">管理制度</span>
            </a>
          </div>
          <div id="cw-zd" class="accordion-body collapse  ${currentMenu == 'cw-zd' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/cw/cw-doc-bmze-info.do"><i class="icon-user"></i>部门职责</a></li>
			  <li><a href="${scopePrefix}/cw/cw-doc-glzd-list.do"><i class="icon-flag"></i>管理制度</a></li>
			  <li><a href="${scopePrefix}/cw/cw-doc-gzlc-list.do"><i class="icon-th"></i>工作流程</a></li>
            </ul>
          </div>
        </div>

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="javascript:void(0)"   onclick="zd('cw-plain')">
              <i class="icon-list "></i>
              <span class="title">工作计划</span>
            </a>
          </div>
          <div id="cw-plain" class="accordion-body collapse ${currentMenu == 'cw-plain' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/cw/cw-plain-info-list.do"><i class="icon-th-list"></i>月计划</a></li>
			  <li><a href="${scopePrefix}/cw/cw-week-plain-info-list.do"><i class="icon-calendar"></i>周计划</a></li>
            </ul>
          </div>
        </div>

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="javascript:void(0)"   onclick="zd('cw-zk')">
              <i class="icon-asterisk "></i>
              <span class="title">往来账款</span>
            </a>
          </div>
          <div id="cw-zk" class="accordion-body collapse ${currentMenu == 'cw-zk' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			    <li><a href="${scopePrefix}/cw/cwYingShou-treelist.do"><i class="icon-star"></i>应收账款台账</a></li>
			    <li><a href="${scopePrefix}/cw/cwKaiPiao-info-list.do"><i class="icon-retweet"></i>票据开具明细</a></li>
			     <li><a href="${scopePrefix}/cw/cwYiShou-info-list.do"><i class="icon-ok"></i>已收账款明细</a></li>
		         <li><a href="${scopePrefix}/cw/cwBzj-info-tblist.do?type=1"><i class="icon-tag"></i>投标保证金</a></li>
		         <li><a href="${scopePrefix}/cw/cwBzj-info-list.do?type=2"><i class="icon-bookmark"></i>履约保证金</a></li>
		         <li><a href="${scopePrefix}/cw/hrYwxjn-info-list.do"><i class="icon-bookmark"></i>意外险</a></li>
		         <li><a href="${scopePrefix}/cw/cwBzj-info-list.do?type=4"><i class="icon-bookmark"></i>统筹</a></li>
            </ul>
          </div>
        </div>
        
         <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="javascript:void(0)"   onclick="zd('collapse-ht')">
              <i class="icon-file "></i>
              <span class="title">合同管理</span>
            </a>
          </div>
          <div id="collapse-ht" class="accordion-body collapse ${currentMenu == 'cw-ht' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
            <li><a href="${scopePrefix}/cw/cw-commHt-info-list.do?state=2"><i class="icon-check"></i>合同盖章</a></li>
            <li><a href="${scopePrefix}/cw/cw-commHt-info-list.do?state=4"><i class="icon-check"></i>合同回收</a></li>
          <%--   <li><a href="${scopePrefix}/cw/cw-commHt-info-list.do?state=5"><i class="icon-check"></i>合同移交</a></li> --%>
			<li><a href="${scopePrefix}/cw/cw-commHt-info-list.do?state=5"><i class="icon-align-justify"></i>合同台账</a></li>
			<li><a href="${scopePrefix}/cw/cwHtfxlist-info-list.do"><i class="icon-comment"></i>合同分析</a></li>
            </ul>
          </div>
        </div>
        
         <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="javascript:void(0)"   onclick="zd('cw-zc')">
              <i class="icon-briefcase "></i>
              <span class="title">固定资产</span>
            </a>
          </div>
          <div id="cw-zc" class="accordion-body collapse ${currentMenu == 'cw-zc' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			   <li><a href="${scopePrefix}/cw/cwZc-info-list.do?fstatus=1"><i class="icon-tasks"></i>固定资产台账</a></li>
			   <li><a href="${scopePrefix}/cw/cwGd-info-list.do"><i class="icon-retweet"></i>固定资产折旧</a></li>
			   <li><a href="${scopePrefix}/cw/cwZc-info-list.do?fstatus=2"><i class="icon-remove"></i>固定资产清理</a></li>
            </ul>
          </div>
        </div>
         <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle"  href="${scopePrefix}/cw/tCommGongzi-info-list.do">
              <i class="icon-star "></i>
              <span class="title">工资发放</span>
            </a>
          </div>
          <%-- <div id="collapse-zbb" class="accordion-body collapse ${currentMenu == 'cw-zbb' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			   <li><a href="${scopePrefix}/cw/cw-report.do"><i class="icon-align-justify"></i>财务总报表</a></li>
            </ul>
          </div> --%>
        </div>
        
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="javascript:void(0)"   onclick="zd('collapse-hs')">
              <i class="icon-file "></i>
              <span class="title">项目核算</span>
            </a>
          </div>
          <div id="collapse-hs" class="accordion-body collapse ${currentMenu == 'cw-hs' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
               <li><a href="${scopePrefix}/cw/cwXmhslist-info-list.do"><i class="icon-align-justify"></i>项目核算表</a></li>
			   <li><a href="${scopePrefix}/cw/cwcb-info-list.do"><i class="icon-align-justify"></i>项目成本登记</a></li>         
            </ul>
          </div>
        </div>
        
     <%--   <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="${scopePrefix}/cw/cw-report.do">
              <i class="icon-flag "></i>
              <span class="title">成本控制</span>
            </a>
          </div>
           <div id="collapse-zbb" class="accordion-body collapse ${currentMenu == 'cw-zbb' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			   <li><a href="${scopePrefix}/cw/cw-report.do"><i class="icon-align-justify"></i>财务总报表</a></li>
            </ul>
          </div> 
        </div>--%>
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle"  href="${scopePrefix}/cw/cwfujian-info-input.do"  >
              <i class="icon-tag"></i>
              <span class="title">经审计的财务报表</span>
            </a>
          </div>
          <%-- <div id="collapse-zbb" class="accordion-body collapse ${currentMenu == 'cw-zbb' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			   <li><a href="${scopePrefix}/cw/cw-report.do"><i class="icon-align-justify"></i>财务总报表</a></li>
            </ul>
          </div> --%>
        </div>
         <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="javascript:void(0)"   onclick="zd('collapse-zbb')">
              <i class="icon-list-alt "></i>
              <span class="title">财务分析</span>
            </a>
          </div>
          <div id="collapse-zbb" class="accordion-body collapse ${currentMenu == 'cw-zbb' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			   <li><a href="${scopePrefix}/cw/cwreport-info-list.do"><i class="icon-align-justify"></i>财务基本指标</a></li><!-- cw-report.do -->
            </ul>
          </div>
        </div>
           <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle"  href="cw-doc-cbhs-list.do">
              <i class="icon-folder-open "></i>
              <span class="title">成本核算</span>
            </a>
          </div>
        </div>
   		
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle"  href="cw-doc-gzzj-list.do">
              <i class="icon-remove "></i>
              <span class="title">工作总结</span>
            </a>
          </div>
          <%-- <div id="collapse-zbb" class="accordion-body collapse ${currentMenu == 'cw-zbb' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			   <li><a href="${scopePrefix}/cw/cw-report.do"><i class="icon-align-justify"></i>财务基本指标</a></li>
            </ul>
          </div> --%>
        </div>
		<footer id="m-footer" class="text-center copyright">
		  <hr>
		  &copy;xthena
		</footer>
      </aside>

      <!-- end of sidebar -->
