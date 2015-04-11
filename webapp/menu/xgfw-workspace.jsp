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
          <div id="collapse-bpm-process" class="accordion-body collapse ${currentMenu == 'hr-zd' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/hr/hr-doc-bmzz.do"><i class="icon-user"></i>部门职责</a></li>
			  <li><a href="${scopePrefix}/hr/hr-doc-glzd-list.do"><i class="icon-user"></i>管理制度</a></li>
			  <li><a href="${scopePrefix}/hr/hr-doc-gzlc-list.do"><i class="icon-user"></i>工作流程</a></li>
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
          <div id="collapse-bpm-task" class="accordion-body collapse ${currentMenu == 'hr-plain' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/hr/hr-plain-info-list.do"><i class="icon-user"></i>月计划</a></li>
			  <li><a href="${scopePrefix}/hr/hr-week-plain-info-list.do"><i class="icon-user"></i>周计划</a></li>
            </ul>
          </div>
        </div>

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="#collapse-bpm-delegate">
              <i class="icon-user"></i>
              <span class="title">薪酬体系</span>
            </a>
          </div>
          <div id="collapse-bpm-delegate" class="accordion-body collapse ${currentMenu == 'hr-xc' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/hr/hr-doc-xctx-list.do"><i class="icon-user"></i>薪酬体系</a></li>
            </ul>
          </div>
        </div>

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="#collapse-cal">
              <i class="icon-user"></i>
              <span class="title">员工招聘</span>
            </a>
          </div>
          <div id="collapse-cal" class="accordion-body collapse ${currentMenu == 'cal' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/cal/cal-info-list.do"><i class="icon-user"></i>人员信息</a></li>
			  <li><a href="${scopePrefix}/cal/cal-info-input.do"><i class="icon-user"></i>劳动合同</a></li>
			  <li><a href="${scopePrefix}/cal/cal-info-input.do"><i class="icon-user"></i>社会统筹 </a></li>
			  <li><a href="${scopePrefix}/cal/cal-info-input.do"><i class="icon-user"></i>证件台账</a></li>
            </ul>
          </div>
        </div>

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="#collapse-msg">
              <i class="icon-user"></i>
              <span class="title">考勤管理</span>
            </a>
          </div>
          <div id="collapse-msg" class="accordion-body collapse ${currentMenu == 'msg' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/msg/msg-info-listReceived.do"><i class="icon-user"></i>考勤统计</a></li>
            </ul>
          </div>
        </div>

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="#collapse-doc">
              <i class="icon-user"></i>
              <span class="title">员工培训</span>
            </a>
          </div>
          <div id="collapse-doc" class="accordion-body collapse ${currentMenu == 'doc' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/doc/doc-info-list.do"><i class="icon-user"></i>内部培训</a></li>
			  <li><a href="${scopePrefix}/doc/doc-info-input.do"><i class="icon-user"></i>外部培训</a></li>
            </ul>
          </div>
        </div>

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="#collapse-forum">
              <i class="icon-user"></i>
              <span class="title">员工离职</span>
            </a>
          </div>
          <div id="collapse-forum" class="accordion-body collapse ${currentMenu == 'forum' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/forum/forum-topic-view.do"><i class="icon-user"></i>离职申请</a></li>
			  <li><a href="${scopePrefix}/forum/forum-topic-create.do"><i class="icon-user"></i>离职审批</a></li>
			   <li><a href="${scopePrefix}/forum/forum-topic-create.do"><i class="icon-user"></i>离职人员台账</a></li>
            </ul>
          </div>
        </div>
		<footer id="m-footer" class="text-center copyright">
		  <hr>
		  &copy;xthena
		</footer>
      </aside>
      <!-- end of sidebar -->
