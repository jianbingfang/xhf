<%@ page language="java" pageEncoding="UTF-8" %>
      <!-- start of sidebar -->
      <aside id="m-sidebar" class="accordion span2" >
<script type="text/javascript" style="display: none" src="${ctx}/s/xthena/js/zd.js"></script>
  		 <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('collapse-bpm-process')">
              <i class="icon-user"></i>
              <span class="title">党章党史</span>
            </a>
          </div>
          <div id="collapse-bpm-process" class="accordion-body collapse ${currentMenu == 'dzb-zd' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/dzb/dzb-dz.do"><i class="icon-user"></i>党章</a></li>
			  <li><a href="${scopePrefix}/dzb/dzb-ds.do"><i class="icon-user"></i>党史</a></li>
            </ul>
          </div>
        </div>


        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('collapse-dzb-gd')">
              <i class="icon-user"></i>
              <span class="title">支部规定</span>
            </a>
          </div>
          <div id="collapse-dzb-gd" class="accordion-body collapse ${currentMenu == 'dzb-gd' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/dzb/dzb-doc-glzd-list.do"><i class="icon-user"></i>管理制度</a></li>
			    <li><a href="${scopePrefix}/dzb/dzb-doc-bmze-info.do"><i class="icon-user"></i>支部职责</a></li>
			  <li><a href="${scopePrefix}/dzb/dzb-plain-info-list.do"><i class="icon-user"></i>工作计划</a></li>
			  <li><a href="${scopePrefix}/dzb/dzb-doc-gzlc-list.do"><i class="icon-user"></i>工作流程</a></li>
            </ul>
          </div>
        </div>

     <%--    <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="#collapse-bpm-task">
              <i class="icon-user"></i>
              <span class="title">工作计划</span>
            </a>
          </div>
          <div id="collapse-bpm-task" class="accordion-body collapse ${currentMenu == 'dzb-plain' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/common/jsz.jsp"><i class="icon-user"></i>年计划</a></li>
            </ul>
          </div>
        </div>
 --%>
       
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('collapse-cal')">
              <i class="icon-user"></i>
              <span class="title">党员管理</span>
            </a>
          </div>
          <div id="collapse-cal" class="accordion-body collapse ${currentMenu == 'dzb-dy' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/dzb/dy-info-list.do?ftype=1"><i class="icon-user"></i>注册党员</a></li>
			    <li><a href="${scopePrefix}/dzb/dy-info-list.do?ftype=2"><i class="icon-user"></i>流动党员</a></li>
			  <li><a href="${scopePrefix}/dzb/dy-info-list.do?ftype=3"><i class="icon-user"></i>积极分子</a></li>
            </ul>
          </div>
        </div>

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('collapse-msg')">
              <i class="icon-user"></i>
              <span class="title">支部活动</span>
            </a>
          </div>
          <div id="collapse-msg" class="accordion-body collapse ${currentMenu == 'dzb-hd' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/dzb/hd-info-list.do?ftype=1"><i class="icon-user"></i>培训学习</a></li>
			  <li><a href="${scopePrefix}/dzb/hd-info-list.do?ftype=2"><i class="icon-user"></i>义务劳动</a></li>
			  <li><a href="${scopePrefix}/dzb/hd-info-list.do?ftype=3"><i class="icon-user"></i>参观考察</a></li>
            </ul>
          </div>
        </div>

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('collapse-doc')">
              <i class="icon-user"></i>
              <span class="title">党费缴纳</span>
            </a>
          </div>
          <div id="collapse-doc" class="accordion-body collapse ${currentMenu == 'dzb-df' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/dzb/df-info-list.do"><i class="icon-user"></i>党费台账</a></li>
            </ul>
          </div>
        </div>
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="javascript:void(0)"   onclick="zd('collapse-bpm-delegate')">
              <i class="icon-user"></i>
              <span class="title">新闻平台</span>
            </a>
          </div>
          <div id="collapse-bpm-delegate" class="accordion-body collapse ${currentMenu == 'dzb-xw' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/dzb/news-info-list.do?ftype=1"><i class="icon-user"></i>上级新闻</a></li>
			  <li><a href="${scopePrefix}/dzb/news-info-list.do?ftype=2"><i class="icon-user"></i>支部新闻</a></li>
            </ul>
          </div>
        </div>
        
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle"  href="dzb-doc-cbhs-list.do">
              <i class="icon-folder-open "></i>
              <span class="title">成本核算</span>
            </a>
          </div>
        </div>
        
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle"  href="dzb-doc-gzzj-list.do">
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
