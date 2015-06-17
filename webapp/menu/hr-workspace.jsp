<%@ page language="java" pageEncoding="UTF-8" %>
      <!-- start of sidebar -->

      <aside id="m-sidebar" class="accordion span2" ><!-- data-spy="affix" data-offset-top="100" -->
<script type="text/javascript" style="display: none" src="${ctx}/s/xthena/js/zd.js"></script>
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('collapse-bpm-process')">
              <i class="icon-book "></i>
              <span class="title">管理制度</span>
            </a>
          </div>
          <div id="collapse-bpm-process" class="accordion-body collapse ${currentMenu == 'hr-zd' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/hr/hr-doc-bmze-info.do"><i class="icon-user"></i>部门职责</a></li>
			  <li><a href="${scopePrefix}/hr/hr-doc-glzd-list.do"><i class="icon-flag"></i>管理制度</a></li>
			  <li><a href="${scopePrefix}/hr/hr-doc-gzlc-list.do"><i class="icon-th"></i>工作流程</a></li>
            </ul>
          </div>
        </div>

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('collapse-bpm-task')">
              <i class="icon-user "></i>
              <span class="title">工作计划</span>
            </a>
          </div>
          <div id="collapse-bpm-task" class="accordion-body collapse ${currentMenu == 'hr-plain' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/hr/hr-plain-info-list.do"><i class="icon-th-list"></i>月计划</a></li>
			  <li><a href="${scopePrefix}/hr/hr-week-plain-info-list.do"><i class="icon-calendar"></i>周计划</a></li>
            </ul>
          </div>
        </div>


        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"   href="javascript:void(0)"   onclick="zd('collapse-bpm-delegate')">
              <i class="icon-asterisk "></i>
              <span class="title">薪酬体系</span>
            </a>
          </div>
          <div id="collapse-bpm-delegate" class="accordion-body collapse ${currentMenu == 'hr-xc' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/hr/xzjiegou-input.do"><i class="icon-asterisk"></i>薪资结构</a></li>
			   <li><a href="${scopePrefix}/hr/hr-doc-zplc-input.do"><i class="icon-asterisk"></i>基本工资计算器</a></li>
            </ul>
          </div>
        </div>

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"   href="javascript:void(0)"   onclick="zd('collapse-ygzp')">
              <i class="icon-bullhorn "></i>
              <span class="title">招聘管理</span>
            </a>
          </div>
          <div id="collapse-ygzp" class="accordion-body collapse ${currentMenu == 'hrGwbm' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/hr/hrZhaopPlain-info-list.do"><i class="icon-cog"></i>招聘计划</a></li>
			  <li><a href="${scopePrefix}/hr/hrryzp-input.do"><i class="icon-th"></i>人员招聘</a></li>
			  <li><a href="${scopePrefix}/hr/hrypRecord-info-list.do"><i class="icon-th"></i>应聘记录</a></li>
			  <li><a href="${scopePrefix}/hr/commRy-info-input.do"><i class="icon-th"></i>人员录用</a></li>
              <li><a href="${scopePrefix}/hr/hrGwbm-info-list.do"><i class="icon-th"></i>招聘岗位</a></li>


            </ul>
          </div>
        </div>


		
		<div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('collapse-yggl')">
              <i class="icon-user "></i>
              <span class="title">员工管理</span>
            </a>
          </div>
          <div id="collapse-yggl" class="accordion-body collapse ${currentMenu == 'commRy' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">

			  <li><a href="${scopePrefix}/hr/commRy-info-list.do"><i class="icon-comment"></i>员工信息</a></li>
			  <li><a href="${scopePrefix}/hr/hrRyyj-info-list.do"><i class="icon-comment"></i>业绩档案</a></li>
			  <li><a href="${scopePrefix}/hr/hrRyZj-treelist.do"><i class="icon-book"></i>证件台账</a></li><!-- hrRyZj-info-list -->

              <li><a href="${scopePrefix}/hr/hrZhengjian-managelist.do"><i class="icon-book"></i>证书录入</a></li>

              <li><a href="${scopePrefix}/hr/hrLdht-info-list.do"><i class="icon-file"></i>劳动合同</a></li>
			  <li><a href="${scopePrefix}/hr/hrShtc-info-list.do"><i class="icon-certificate"></i>社会统筹 </a></li>
			  <li><a href="${scopePrefix}/hr/ldjl-input.do"><i class="icon-certificate"></i>劳动纪律 </a></li>

            </ul>
          </div>
        </div>
        
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('collapse-kq')">
              <i class="icon-time "></i>
              <span class="title">考勤管理</span>
            </a>
          </div>
          <div id="collapse-kq" class="accordion-body collapse ${currentMenu == 'hrKq' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/hr/hrKq-info-list.do"><i class="icon-edit"></i>考勤统计</a></li>
			  <li><a href="${scopePrefix}/hr/hrKqJiangfa-info-list.do"><i class="icon-edit"></i>考勤奖罚</a></li>
            </ul>
          </div>
        </div>

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('collapse-doc')">
              <i class="icon-heart "></i>
              <span class="title">员工培训</span>
            </a>
          </div>
          <div id="collapse-doc" class="accordion-body collapse ${currentMenu == 'hrPx' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/hr/hrPx-info-list.do"><i class="icon-ok-circle"></i>内部培训</a></li>
			  <li><a href="${scopePrefix}/hr/hrPx-wb-info-list.do"><i class="icon-circle-arrow-left"></i>外部培训</a></li>
			  <li><a href="${scopePrefix}/hr/hrKs-info-list.do"><i class="icon-check"></i>考试评定</a></li>
            </ul>
          </div>
        </div>

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('collapse-lz')">
              <i class="icon-arrow-right "></i>
              <span class="title">员工离职</span>
            </a>
          </div>
          <div id="collapse-lz" class="accordion-body collapse ${currentMenu == 'hrLz' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/hr/hrLz-info-input.do"><i class="icon-list-alt"></i>离职申请</a></li>
				<%--<li><a href="${scopePrefix}/common/jsz.jsp"><i class="icon-user"></i>离职审批</a></li> --%>
			   <li><a href="${scopePrefix}/hr/hrLz-info-list.do"><i class="icon-bookmark"></i>离职人员台账</a></li>
            </ul>
          </div>
        </div>
        
          <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle"  href="hr-doc-cbhs-list.do">
              <i class="icon-folder-open "></i>
              <span class="title">成本核算</span>
            </a>
          </div>
        </div>
        
           <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="javascript:void(0)"   onclick="zd('collapse-hrGzzj')">
              <i class="icon-arrow-right "></i>
              <span class="title">工作总结</span>
            </a>
          </div>
          <div id="collapse-hrGzzj" class="accordion-body collapse ${currentMenu == 'hrGzzj' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/hr/hrrstj-list.do"><i class="icon-list-alt"></i>人事统计</a></li>
			  <li><a href="${scopePrefix}/hr/hrhtbxtj-list.do"><i class="icon-user"></i>合同保险统计</a></li> 
			  <li><a href="${scopePrefix}/hr/hrpxtj-list.do"><i class="icon-bookmark"></i>培训统计</a></li>
			  <li><a href="${scopePrefix}/hr/hr-doc-gzzj-list.do"><i class="icon-bookmark"></i>年终总结</a></li>
            </ul>
          </div>
        </div>
        
         
        
   		
   		
		<footer id="m-footer" class="text-center copyright">
		  <hr>
		  &copy;xthena
		</footer>
      </aside>
      <!-- end of sidebar -->
