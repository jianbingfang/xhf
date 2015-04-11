<%@ page language="java" pageEncoding="UTF-8" %>
      <!-- start of sidebar -->
      <aside id="m-sidebar" class="accordion span2" >
<script type="text/javascript" style="display: none" src="${ctx}/s/xthena/js/zd.js"></script>
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('collapse-bpm-process')">
              <i class="icon-user"></i>
              <span class="title">法律法规</span>
            </a>
          </div>
          <div id="collapse-bpm-process" class="accordion-body collapse ${currentMenu == 'gh-fg' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
             <li><a href="${scopePrefix}/gh/gh-zc.do"><i class="icon-user"></i>工会章程</a></li>
			  <li><a href="${scopePrefix}/gh/ghf.do"><i class="icon-user"></i>工会法</a></li>
			  <li><a href="${scopePrefix}/gh/ldf.do"><i class="icon-user"></i>劳动法</a></li>
            </ul>
          </div>
        </div>

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="javascript:void(0)"   onclick="zd('collapse-bpm-task')">
              <i class="icon-user"></i>
              <span class="title">管理制度</span>
            </a>
          </div>
          <div id="collapse-bpm-task" class="accordion-body collapse ${currentMenu == 'gh-zd' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/gh/gh-doc-bmze-info.do"><i class="icon-user"></i>工会职责</a></li>
			  <li><a href="${scopePrefix}/gh/gh-doc-gzlc-list.do"><i class="icon-user"></i>工作流程</a></li>
			  <li><a href="${scopePrefix}/gh/gh-doc-glzd-list.do"><i class="icon-user"></i>管理办法</a></li>
            </ul>
          </div>
        </div>

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" href="${scopePrefix}/gh/gh-plain-info-list.do">
              <i class="icon-user"></i>
              <span class="title">工作计划</span>
            </a>
          </div>
          <%-- <div id="collapse-bpm-delegate" class="accordion-body collapse ${currentMenu == 'gh-xc' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/common/jsz.jsp"><i class="icon-user"></i>年计划</a></li>
            </ul>
          </div> --%>
        </div>

<div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="javascript:void(0)"   onclick="zd('collapse-msg')">
              <i class="icon-user"></i>
              <span class="title">工会活动</span>
            </a>
          </div>
          <div id="collapse-msg" class="accordion-body collapse ${currentMenu == 'gh-hd' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
            <li><a href="${scopePrefix}/gh/gh-hd-info-list.do?ftype=1"><i class="icon-user"></i>职工代表大会</a></li>
			  <li><a href="${scopePrefix}/gh/gh-hd-info-list.do?ftype=2"><i class="icon-user"></i>工会福利</a></li>
			  <li><a href="${scopePrefix}/gh/gh-hd-info-list.do?ftype=3"><i class="icon-user"></i>文体活动</a></li>
			  <li><a href="${scopePrefix}/gh/gh-hd-info-list.do?ftype=4"><i class="icon-user"></i>困难职工援助</a></li>
            </ul>
          </div>
        </div>

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('collapse-doc')">
              <i class="icon-user"></i>
              <span class="title">工会资费</span>
            </a>
          </div>
          <div id="collapse-doc" class="accordion-body collapse ${currentMenu == 'gh-zf' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/gh/ziFei-info-list.do?ftype=1"><i class="icon-user"></i>会费台账</a></li>
			  <li><a href="${scopePrefix}/gh/ziFei-info-list.do?ftype=2"><i class="icon-user"></i>捐款台账</a></li>
			  <li><a href="${scopePrefix}/gh/ziFei-info-list.do?ftype=3"><i class="icon-user"></i>资费申请</a></li>
            </ul>
          </div>
        </div>
        
        
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('collapse-cal')">
              <i class="icon-user"></i>
              <span class="title">工会新闻</span>
            </a>
          </div>
          <div id="collapse-cal" class="accordion-body collapse ${currentMenu == 'gh-xw' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/gh/gh-news-info-list.do?ftype=3"><i class="icon-user"></i>上级新闻</a></li>
			  <li><a href="${scopePrefix}/gh/gh-news-info-list.do?ftype=4"><i class="icon-user"></i>内部新闻</a></li>
            </ul>
          </div>
        </div>
         
          <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle"  href="gh-doc-cbhs-list.do">
              <i class="icon-folder-open "></i>
              <span class="title">成本核算</span>
            </a>
          </div>
        </div>
        
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle"  href="gh-doc-gzzj-list.do">
              <i class="icon-folder-open "></i>
              <span class="title">工作总结</span>
            </a>
          </div>
        </div>
   		
        
		<footer id="m-footer" class="text-center copyright">
		  <hr>
		  &copy;xthena
		</footer>
      </aside>
      <!-- end of sidebar -->
