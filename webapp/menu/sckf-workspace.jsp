<%@ page language="java" pageEncoding="UTF-8" %>
      <!-- start of sidebar -->
      <aside id="m-sidebar" class="accordion span2" ><!-- data-spy="affix" data-offset-top="100" -->
<script type="text/javascript" style="display: none" src="${ctx}/s/xthena/js/zd.js"></script>
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="javascript:void(0)"   onclick="zd('collapse-bpm-process')">
              <i class="icon-book "></i>
              <span class="title">管理制度</span>
            </a>
          </div>

          <div id="collapse-bpm-process" class="accordion-body collapse ${currentMenu == 'sckf-zd' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/sckf/sckf-doc-bmze-info.do"><i class="icon-user"></i>部门职责</a></li>
			  <li><a href="${scopePrefix}/sckf/sckf-doc-glzd-list.do"><i class="icon-flag"></i>管理制度</a></li>
			  <li><a href="${scopePrefix}/sckf/sckf-doc-gzlc-list.do"><i class="icon-th"></i>工作流程</a></li>
            </ul>
          </div>
        </div>  

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('collapse-bpm-task')">
              <i class="icon-user"></i>
              <span class="title">工作计划</span>
            </a>
          </div>
          <div id="collapse-bpm-task" class="accordion-body collapse ${currentMenu == 'sckf-plain' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/sckf/sckf-plain-info-list.do"><i class="icon-th-list"></i>月计划</a></li>
			  <li><a href="${scopePrefix}/sckf/sckf-week-plain-info-list.do"><i class="icon-calendar"></i>周计划</a></li>
            </ul>
          </div>
        </div>

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('sckf-xx')">
              <i class="icon-comment "></i>
              <span class="title">项目信息</span>
            </a>
          </div>
          <div id="sckf-xx" class="accordion-body collapse ${currentMenu == 'sckf-xx' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			 <li><a href="${scopePrefix}/sckf/xinxishouji-input.do"><i class="icon-edit"></i>信息收集</a></li>
			 <li><a href="${scopePrefix}/sckf/jyXm-info-shenpi-list.do"><i class="icon-ok"></i>信息分析</a></li>
            </ul>
          </div>
        </div>
        
         <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle"  href="${scopePrefix}/sckf/sckf-xmps-info.do">
              <i class="icon-user"></i>
              <span class="title">项目评审</span>
            </a>
          </div>
       <%--    <div id="collapse-xmps" class="accordion-body collapse ${currentMenu == 'sckf-xmps' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			 <li><a href="${scopePrefix}/common/jsz.jsp"><i class="icon-user"></i>评审记录</a></li>
            </ul>
          </div> --%>
        </div> 
        
          <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle"   href="${scopePrefix}/sckf/sckf-xmgz-info.do">
              <i class="icon-user"></i>
              <span class="title">项目跟踪</span>
            </a>
          </div>
         <%--  <div id="collapse-xmgz" class="accordion-body collapse ${currentMenu == 'sckf-xmgz' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			 <li><a href="${scopePrefix}/common/jsz.jsp"><i class="icon-user"></i>跟踪汇总表</a></li>
            </ul>
          </div> --%>
        </div>
         
          <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('sckf-xmtb')">
              <i class="icon-file "></i>
              <span class="title">项目投标</span>
            </a>
          </div>
          <div id="sckf-xmtb" class="accordion-body collapse ${currentMenu == 'sckf-xmtb' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
            <li><a href="${scopePrefix}/sckf/jyXm-info-list.do"><i class="icon-user"></i>投标项目台账</a></li>
             <li><a href="${scopePrefix}/sckf/jyXm-info-toubiao-list.do"><i class="icon-user"></i>投标文件制作及审核</a></li>
			 <li><a href="${scopePrefix}/sckf/jyXm-info-kaibiao-list.do"><i class="icon-user"></i>开标项目</a></li>
             <li><a href="${scopePrefix}/sckf/jyXmFb-info-list.do"><i class="icon-user"></i>废标项目</a></li>
             <li><a href="${scopePrefix}/sckf/jyXm-info-tongzhishu-list.do"><i class="icon-user"></i>中标通知书记录</a></li>
			 <li><a href="${scopePrefix}/sckf/xzZjOrder-info-list.do"><i class="icon-user"></i>证件预定</a></li>
			  <li><a href="${scopePrefix}/xz/xzZjDxlist-info-list.do"><i class="icon-user"></i>证件预定表</a></li>
			<li><a href="${scopePrefix}/sckf/xzZjlist-info.do"><i class="icon-user"></i>证件表</a></li>
			<%--  <li><a href="${scopePrefix}/sckf/jyXm-info-list.do?filter_EQS_fstate=投标文件评审"><i class="icon-user"></i>投标文件评审</a></li>
			 <li><a href="${scopePrefix}/sckf/jyXm-info-list.do?filter_EQS_fstate=开标登记"><i class="icon-user"></i>开标登记</a></li> --%>
			<%--  <li><a href="${scopePrefix}/common/jsz.jsp"><i class="icon-user"></i>中标项目移交</a></li> --%>
            </ul>
          </div>
        </div>
          <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('collapse-bzj')">
              <i class="icon-flag "></i>
              <span class="title">保证金缴纳回收管理</span>
            </a>
          </div>
          <div id="collapse-bzj" class="accordion-body collapse ${currentMenu == 'sckf-bzj' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			 <li><a href="${scopePrefix}/sckf/sckf-cwBzj-info-list.do?type=1"><i class="icon-arrow-up"></i>投标保证金申请</a></li>
			 <li><a href="${scopePrefix}/sckf/sckf-cwBzj-info-list-hs.do?type=1"><i class="icon-arrow-up"></i>投标保证金回收</a></li>
			<%--  <li><a href="${scopePrefix}/sckf/sckf-cwBzj-info-lylist.do?type=2"><i class="icon-ok-sign"></i>履约保证金申请</a></li>
			 <li><a href="${scopePrefix}/sckf/sckf-cwBzj-info-lylist.do?type=2"><i class="icon-ok-sign"></i>履约保证金回收</a></li> --%>
            </ul>
          </div>
        </div>
          <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('sckf-ht')">
              <i class="icon-file "></i>
              <span class="title">合同管理</span>
            </a>
          </div>
          <div id="sckf-ht" class="accordion-body collapse ${currentMenu == 'sckf-ht' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			 <li><a href="${scopePrefix}/sckf/commHt-info-input.do"><i class="icon-edit"></i>合同起草及谈判</a></li>
	<%-- 		 <li><a href="${scopePrefix}/sckf/commHt-info-list.do"><i class="icon-ok"></i>合同会签</a></li> --%>
			 <li><a href="${scopePrefix}/sckf/commHt-info-list.do"><i class="icon-book"></i>合同台账</a></li>
            </ul>
          </div>
        </div>
        
         <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle"  href="jyXmYj-info-list.do">
              <i class="icon-file "></i>
              <span class="title">项目移交</span>
            </a>
          </div>
       <%--    <div id="sckf-ht" class="accordion-body collapse ${currentMenu == 'sckf-ht' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			 <li><a href="${scopePrefix}/sckf/commHt-info-input.do"><i class="icon-edit"></i>合同起草及谈判</a></li>
			 <li><a href="${scopePrefix}/sckf/commHt-info-list.do"><i class="icon-ok"></i>合同会签</a></li>
			 <li><a href="${scopePrefix}/sckf/commHt-info-list.do"><i class="icon-book"></i>合同台账</a></li>
            </ul>
          </div> --%>
        </div>
        
          <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="javascript:void(0)"   onclick="zd('collapse-nytz')">
              <i class="icon-folder-open "></i>
              <span class="title">内业存档</span>
            </a>
          </div>
          <div id="collapse-nytz" class="accordion-body collapse ${currentMenu == 'sckf-nytz' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			 <li><a href="${scopePrefix}/sckf/jyZhaobFile-info-list.do"><i class="icon-comment"></i>招标文件台账</a></li>
			 <li><a href="${scopePrefix}/sckf/jyXm-info-kaibiao-taizhang.do"><i class="icon-pencil"></i>投标项目档案</a></li>
			 <li><a href="${scopePrefix}/sckf/jyZhongbTaizhang-info-list.do"><i class="icon-arrow-up"></i>中标台账</a></li>
		<%-- 	 <li><a href="${scopePrefix}/sckf/jyZb-info-list.do"><i class="icon-star"></i>中标信息台账</a></li>
			 <li><a href="${scopePrefix}/common/jsz.jsp"><i class="icon-bookmark"></i>保证金台账</a></li> --%>
			 <%-- <li><a href="${scopePrefix}/common/jsz.jsp"><i class="icon-user"></i>中标项目交接台账</a></li> --%>
            </ul>
          </div>
        </div>
        
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle"  href="jyYb-info-list.do">
              <i class="icon-folder-open "></i>
              <span class="title">经营动态</span>
            </a>
          </div>
        </div>
          
          
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle"  href="sckf-doc-cbhs-list.do">
              <i class="icon-folder-open "></i>
              <span class="title">成本核算</span>
            </a>
          </div>
        </div>
        
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle"  href="sckf-doc-gzzj-list.do">
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
