<%@ page language="java" pageEncoding="UTF-8" %>
      <!-- start of sidebar -->
      <aside id="m-sidebar" class="accordion span2" >
<script type="text/javascript" style="display: none" src="${ctx}/s/xthena/js/zd.js"></script>
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('collapse-bpm-process')">
              <i class="icon-user"></i>
              <span class="title">管理制度</span>
            </a>
          </div>
          <div id="collapse-bpm-process" class="accordion-body collapse ${currentMenu == 'kh-zd' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/kh/kh-doc-bmze-info.do"><i class="icon-user"></i>机构职责</a></li>
			  <li><a href="${scopePrefix}/kh/kh-doc-glzd-list.do"><i class="icon-user"></i>管理办法</a></li>
			  <li><a href="${scopePrefix}/kh/kh-doc-gzlc-list.do"><i class="icon-user"></i>工作流程</a></li>
            </ul>
          </div>
        </div>

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle"  href="${scopePrefix}/kh/kh-plain-info-list.do">
              <i class="icon-user"></i>
              <span class="title">工作计划</span>
            </a>
          </div>
         <%--  <div id="collapse-bpm-task" class="accordion-body collapse ${currentMenu == 'kh-plain' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/kh/kh-plain-info-list.do"><i class="icon-user"></i>月计划</a></li>
            </ul>
          </div> --%>
        </div>

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('collapse-bpm-delegate')">
              <i class="icon-user"></i>
              <span class="title">考核办法</span>
            </a>
          </div>
          <div id="collapse-bpm-delegate" class="accordion-body collapse ${currentMenu == 'kh-bf' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/kh/kh-doc-khbf-list.do?khtype=1"><i class="icon-user"></i>中高层考核办法</a></li>
			  <li><a href="${scopePrefix}/kh/kh-doc-khbf-list.do?khtype=2"><i class="icon-user"></i>机关考核办法</a></li>
			  <li><a href="${scopePrefix}/kh/kh-doc-khbf-list.do?khtype=3"><i class="icon-user"></i>部门考核办法</a></li>
			  <li><a href="${scopePrefix}/kh/kh-doc-khbf-list.do?khtype=4"><i class="icon-user"></i>项目考核办法</a></li>
            </ul>
          </div>
        </div>

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle"  href="${scopePrefix}/kh/kh-doc-jlzd-list.do?khtype=">
              <i class="icon-user"></i>
              <span class="title">激励制度</span>
            </a>
          </div>
         <%--  <div id="collapse-cal" class="accordion-body collapse ${currentMenu == 'kh-jl' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/common/jsz.jsp"><i class="icon-user"></i>激励制度</a></li>
            </ul>
          </div> --%>
        </div>

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('collapse-msg')">
              <i class="icon-user"></i>
              <span class="title">内业资料</span>
            </a>
          </div>
          <div id="collapse-msg" class="accordion-body collapse ${currentMenu == 'kh-ny' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/kh/khJl-info-list.do?ftype=1"><i class="icon-user"></i>考核记录</a></li>
			    <li><a href="${scopePrefix}/kh/khJl-info-list.do?ftype=2"><i class="icon-user"></i>激励记录</a></li>
            </ul>
          </div>
        </div>

           <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle"  href="kh-doc-cbhs-list.do">
              <i class="icon-folder-open "></i>
              <span class="title">成本核算</span>
            </a>
          </div>
        </div>
        
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle"  href="kh-doc-gzzj-list.do">
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
