<%@ page language="java" pageEncoding="UTF-8" %>
      <!-- start of sidebar -->
      <aside id="m-sidebar" class="accordion span2" ><!-- data-spy="affix" data-offset-top="100" -->
<script type="text/javascript" style="display: none" src="${ctx}/s/xthena/js/zd.js"></script>
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"   href="javascript:void(0)"   onclick="zd('collapse-bpm-process')">
              <i class="icon-book "></i>
              <span class="title">管理制度</span>
            </a>
          </div>
          <div id="collapse-bpm-process" class="accordion-body collapse ${currentMenu == 'gcgl-zd' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/gcgl/gcgl-doc-bmze-info.do"><i class="icon-user"></i>部门职责</a></li>
			  <li><a href="${scopePrefix}/gcgl/gcgl-doc-glzd-list.do"><i class="icon-flag"></i>管理制度</a></li>
			  <li><a href="${scopePrefix}/gcgl/gcgl-doc-gzlc-list.do"><i class="icon-th"></i>工作流程</a></li>
            </ul>
          </div>
        </div>

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"   href="javascript:void(0)"   onclick="zd('collapse-bpm-task')">
              <i class="icon-list "></i>
              <span class="title">工作计划</span>
            </a>
          </div>
          <div id="collapse-bpm-task" class="accordion-body collapse ${currentMenu == 'gcgl-plain' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/gcgl/gcgl-plain-info-list.do"><i class="icon-th-list"></i>月计划</a></li>
			  <li><a href="${scopePrefix}/gcgl/gcgl-week-plain-info-list.do"><i class="icon-calendar"></i>周计划</a></li>
            </ul>
          </div>
        </div>

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="javascript:void(0)"   onclick="zd('collapse-cal')">
              <i class="icon-share-alt "></i>
              <span class="title">在建（竣工）项目</span>
            </a>
          </div>
          <div id="collapse-cal" class="accordion-body collapse ${currentMenu == 'gcgl-zj' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/gcgl/pjXm-info-list.do?fstatus=1"><i class="icon-list-alt"></i>在建项目</a></li>
			  <li><a href="${scopePrefix}/gcgl/pjXm-info-list.do?fstatus=2"><i class="icon-list-alt"></i>完工项目</a></li>
			  <li><a href="${scopePrefix}/gcgl/pjXm-info-list.do?fstatus=3"><i class="icon-list-alt"></i>竣工项目</a></li>
            </ul>
          </div>
        </div>
         <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('collapse-xmgl')">
              <i class="icon-book  "></i>
              <span class="title">项目管理</span>
            </a>
          </div>
          <div id="collapse-xmgl" class="accordion-body collapse ${currentMenu == 'gcgl-xmgl' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
             <li><a href="${scopePrefix}/gcgl/pjXm-manager-list.do"><i class="icon-list"></i>在线项目</a></li>
			 <li><a href="${scopePrefix}/gcgl/jlDept-info-list.do"><i class="icon-ok"></i>组建项目监理部</a></li>
			 <li><a href="${scopePrefix}/gcgl/pjMbzrs-info-list.do"><i class="icon-ok"></i>目标责任书</a></li>
		 	 <li><a href="${scopePrefix}/gcgl/pjJindian-info-list.do"><i class="icon-resize-small"></i>项目进点</a></li>
			 <li><a href="${scopePrefix}/gcgl/pjFirstCheck-info-list.do"><i class="icon-certificate"></i>首次工作检查</a></li>
			 <li><a href="${scopePrefix}/gcgl/pjDucha-info-list.do"><i class="icon-user"></i>项目督查</a></li>
			 <li><a href="${scopePrefix}/gcgl/pjpeixun-info-list.do"><i class="icon-bullhorn"></i>培训</a></li>
			 <li><a href="${scopePrefix}/gcgl/pjkh-info-list.do"><i class="icon-leaf"></i>绩效考核</a></li>
			 <li><a href="${scopePrefix}/gcgl/pjVisit-info-list.do"><i class="icon-gift"></i>业主回访</a></li>
			 <li><a href="${scopePrefix}/gcgl/xmcd-info-input.do"><i class="icon-globe"></i>项目撤点</a></li> 
            </ul>
          </div>
        </div>
        
         <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('collapse-zjhy')">
              <i class="icon-book  "></i>
              <span class="title">总监会议</span>
            </a>
          </div>
          <div id="collapse-zjhy" class="accordion-body collapse ${currentMenu == 'gcgl-zjhy' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
              <li><a href="${scopePrefix}/gcgl/pjHuiyi-yt-info-list.do"><i class="icon-list"></i>研讨会</a></li>
			  <li><a href="${scopePrefix}/gcgl/pjHuiyi-zt-info-list.do"><i class="icon-ok"></i>座谈会</a></li>
            </ul>
          </div>
        </div>
        
         <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="javascript:void(0)"   onclick="zd('collapse-xmry')">
              <i class="icon-user  "></i>
              <span class="title">人员管理</span>
            </a>
          </div>
          <div id="collapse-xmry" class="accordion-body collapse ${currentMenu == 'gcgl-xmry' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/gcgl/pjRy-info-list.do" ><i class="icon-folder-close"></i>人员台账</a></li>
			  <li><a href="${scopePrefix}/gcgl/pjKq-info-list.do"><i class="icon-inbox"></i>人员考勤</a></li>
			  <li><a href="${scopePrefix}/gcgl/pjYdkh-info-list.do"><i class="icon-calendar"></i>人员月度考核</a></li>
			  <%--<li><a href="${scopePrefix}/gcgl/pjRyRecord-info-list.do"><i class="icon-list"></i>人员调配记录</a></li>--%>
            </ul>
          </div>
        </div>
         <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="javascript:void(0)"   onclick="zd('collapse-ny')">
              <i class="icon-heart  "></i>
              <span class="title">内业管理</span>
            </a>
          </div>
          <div id="collapse-ny" class="accordion-body collapse ${currentMenu == 'gcgl-ny' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/gcgl/pjWj-info-list.do"><i class="icon-list-alt"></i>上级文件</a></li>
			  <li><a href="${scopePrefix}/gcgl/xmny-info-input.do"><i class="icon-book"></i>部门资料</a></li>
			  <li><a href="${scopePrefix}/gcgl/pjYb-info-list.do"><i class="icon-book"></i>工程部月报</a></li>
			 
			  <%-- <li><a href="${scopePrefix}/common/jsz.jsp"><i class="icon-user"></i>项目资料</a></li> --%>
            </ul>
          </div>
        </div>
         <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="javascript:void(0)"   onclick="zd('collapse-jlf')">
              <i class="icon-certificate  "></i>
              <span class="title">监理费回收</span>
            </a>
          </div>
          <div id="collapse-jlf" class="accordion-body collapse ${currentMenu == 'gcgl-jlf' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">  
            <li><a href="${scopePrefix}/gcgl/gcgl-commHt-info-list.do"><i class="icon-fire"></i>合同台账</a></li>
			  <li><a href="${scopePrefix}/gcgl/pjHtly-info-list.do"><i class="icon-fire"></i>合同履约台账</a></li>
			  <li><a href="${scopePrefix}/gcgl/pjJlf-info-list.do"><i class="icon-screenshot"></i>监理费回收台账</a></li>
            </ul>
          </div>
        </div>
         <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="javascript:void(0)"   onclick="zd('collapse-yq')">
              <i class="icon-adjust  "></i>
              <span class="title">仪器管理</span>
            </a>
          </div>
          <div id="collapse-yq" class="accordion-body collapse ${currentMenu == 'gcgl-yq' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/gcgl/wzList-yq-info-list.do"><i class="icon-arrow-right"></i>监测仪器台账</a></li>
			  <li><a href="${scopePrefix}/gcgl/wzIo-info-list.do?2"><i class="icon-share-alt"></i>仪器调拨记录</a></li>
			   <li><a href="${scopePrefix}/gcgl/pjYqcheck-info-list.do"><i class="icon-book"></i>监测仪器年检台账</a></li>
			   <li><a href="${scopePrefix}/gcgl/pjYqcheck-info-input.do"><i class="icon-warning-sign"></i>仪器年检</a></li>
			     <%-- <li><a href="${scopePrefix}/common/jsz.jsp"><i class="icon-user"></i>检测工具对比记录</a></li> --%>
            </ul>
          </div>
        </div>
        
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="javascript:void(0)"   onclick="zd('collapse-xmda')">
              <i class="icon-adjust  "></i>
              <span class="title">竣工项目档案</span>
            </a>
          </div>
          <div id="collapse-xmda" class="accordion-body collapse ${currentMenu == 'gcgl-xmda' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/gcgl/pjTemplate-info-list.do"><i class="icon-arrow-right"></i>上报资料清单</a></li>
			  <li><a href="${scopePrefix}/gcgl/pjXm-info-list1.do?fstatus=3"><i class="icon-share-alt"></i>竣工项目台账</a></li>
            </ul>
          </div>
        </div>
      <%--   
         <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle"  href="${scopePrefix}/gcgl/pjYb-info-list.do">
              <i class="icon-adjust  "></i>
              <span class="title">工作总结</span>
            </a>
          </div>
        </div> --%>
        
        
             
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="javascript:void(0)"   onclick="zd('collapse-jlb')">
              <i class="icon-cog"></i>
              <span class="title">公众平台</span>
            </a>
          </div>
          <div id="collapse-jlb" class="accordion-body collapse ${currentMenu == 'gcgl-jlb' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
              <%-- <li><a href="${scopePrefix}/gcgl/jlDocTemplate-info-list.do"><i class="icon-user"></i>施工准备项目</a></li> --%>
             <%--  <li><a href="${scopePrefix}/gcgl/jl-szTemp-input.do"><i class="icon-user"></i>施工过程项目</a></li> --%>
			  <li><a href="${scopePrefix}/gcgl/jlDocTemplate-info-list.do"><i class="icon-user"></i>监理文档模板</a></li>
			  <li><a href="${scopePrefix}/gcgl/gcgl-jlFlFg-info-list.do"><i class="icon-user"></i>法律法规</a></li>
			  <li><a href="${scopePrefix}/gcgl/pjGuifantuji-info-list.do?type=1"><i class="icon-user"></i>规范图集</a></li>
			  <li><a href="${scopePrefix}/gcgl/jl-doc-glzd-list.do"><i class="icon-user"></i>管理规定</a></li>
			  <li><a href="${scopePrefix}/gcgl/jl-doc-khzd-list.do"><i class="icon-user"></i>绩效考核</a></li>
           	  <li><a href="${scopePrefix}/gcgl/jl-doc-gzlc-list.do"><i class="icon-user"></i>工作流程</a></li>
           	  <li><a href="${scopePrefix}/gcgl/jl-doc-mbzrs-list.do"><i class="icon-user"></i>目标责任书</a></li>
           	  <li><a href="${scopePrefix}/gcgl/pjGuifantuji-info-list.do?type=2"><i class="icon-user"></i>档案盒脊背</a></li>
           	  <li><a href="${scopePrefix}/gcgl/pjTzTemplat-info-list.do"><i class="icon-user"></i>台账范本</a></li>
           	  <li><a href="${scopePrefix}/gcgl/pjPxjcjlTemplat-info-list.do"><i class="icon-user"></i>平行检查记录范本</a></li>
            </ul>
          </div>
   		</div>
   		
   		
   		   <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle"  href="gcgl-doc-cbhs-list.do">
              <i class="icon-folder-open "></i>
              <span class="title">成本核算</span>
            </a>
          </div>
        </div>
        
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle"  href="gcgl-doc-gzzj-list.do">
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
