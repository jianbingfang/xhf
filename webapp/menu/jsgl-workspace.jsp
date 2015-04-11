<%@ page language="java" pageEncoding="UTF-8" %>
      <!-- start of sidebar -->
      <aside id="m-sidebar" class="accordion span2" data-spy="affix" data-offset-top="100">

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="#collapse-bpm-process">
              <i class="icon-user"></i>
              <span class="title">管理制度</span>
            </a>
          </div>
          <div id="collapse-bpm-process" class="accordion-body collapse ${currentMenu == 'jsgl-zd' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/jsgl/jsgl-doc-bmzz.do"><i class="icon-user"></i>部门职责</a></li>
			  <li><a href="${scopePrefix}/jsgl/jsgl-doc-glzd-list.do"><i class="icon-user"></i>管理制度</a></li>
			  <li><a href="${scopePrefix}/jsgl/jsgl-doc-gzlc-list.do"><i class="icon-user"></i>工作流程</a></li>
            </ul>
          </div>
        </div>

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="#collapse-bpm-task">
              <i class="icon-user"></i>
              <span class="title">工作计划</span>
            </a>
          </div>
          <div id="collapse-bpm-task" class="accordion-body collapse ${currentMenu == 'jsgl-plain' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/jsgl/jsgl-plain-info-list.do"><i class="icon-user"></i>月计划</a></li>
			  <li><a href="${scopePrefix}/jsgl/jsgl-week-plain-info-list.do"><i class="icon-user"></i>周计划</a></li>
            </ul>
          </div>
        </div>

		<footer id="m-footer" class="text-center copyright">
		  <hr>
		  &copy;xthena
		</footer>
      </aside>
      <!-- end of sidebar -->
