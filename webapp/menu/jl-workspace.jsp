<%@ page language="java" pageEncoding="UTF-8" %>
      <!-- start of sidebar -->
      <aside id="m-sidebar" class="accordion span2"><!--  data-spy="affix" data-offset-top="100" -->
<script type="text/javascript" style="display: none" src="${ctx}/s/xthena/js/zd.js"></script>

  		<div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle"    href="${scopePrefix}/jl/yifa3tiaoli-info.do">
              <i class="icon-user "></i>
              <span class="title">法律法规</span>
            </a>
          </div>
          <%-- <div id="collapse-bpm-process" class="accordion-body collapse ${currentMenu == 'jl-fg' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/jl/yifa3tiaoli-info.do"><i class="icon-user"></i>一法三条例</a></li>
			  <li><a href="${scopePrefix}/jl/qitaflfg-info.do"><i class="icon-user"></i>其他法规</a></li>
            </ul>
          </div> --%>
        </div>
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('collapse-zd')">
              <i class="icon-book "></i>
              <span class="title">公司规定</span>
            </a>
          </div>
          <div id="collapse-zd" class="accordion-body collapse ${currentMenu == 'jl-zd' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
              <li><a href="${scopePrefix}/jl/jl-doc-gzlc-list.do"><i class="icon-th"></i>工作流程</a></li>
			  <li><a href="${scopePrefix}/jl/jl-doc-glzd-list.do"><i class="icon-flag"></i>管理制度</a></li>
			  <li><a href="${scopePrefix}/jl/jl-doc-khzd-list.do"><i class="icon-briefcase"></i>绩效考核制度</a></li>
            </ul>
          </div>
        </div>

    <%--     <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="#collapse-bpm-task">
              <i class="icon-user"></i>
              <span class="title">工作计划</span>
            </a>
          </div>
          <div id="collapse-bpm-task" class="accordion-body collapse ${currentMenu == 'jl-plain' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/hr/jl-plain-info-list.do"><i class="icon-user"></i>月计划</a></li>
			  <li><a href="${scopePrefix}/hr/jl-week-plain-info-list.do"><i class="icon-user"></i>周计划</a></li>
            </ul>
          </div>
        </div>
 --%>
 		<div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('collapse-jbxx')">
              <i class="icon-comment "></i>
              <span class="title">基本信息</span>
            </a>
          </div>
          <div id="collapse-jbxx" class="accordion-body collapse ${currentMenu == 'jl-jbxx' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
            <li><a href="${scopePrefix}/jl/jl-pjXm-info-input.do"><i class="icon-certificate"></i>项目信息</a></li>
			<li><a href="${scopePrefix}/jl/jlXgdw-info-list.do"><i class="icon-hdd"></i>参建单位</a></li>
			<%-- <li><a href="${scopePrefix}/jl/jlJd-info-input.do"><i class="icon-circle-arrow-right"></i>项目进度概况</a></li> --%>
			   <%--  <li><a href="${scopePrefix}/common/jsz.jsp"><i class="icon-user"></i>人员管理</a></li> --%>
            </ul>
          </div>
        </div>
        
     <%--    <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="#collapse-gf">
              <i class="icon-user"></i>
              <span class="title">规范图集</span>
            </a>
          </div>
          <div id="collapse-gf" class="accordion-body collapse ${currentMenu == 'jl-gf' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
				 <li><a href="${scopePrefix}/jl/jl-pjFanben-info-list.do"><i class="icon-user"></i>标准范本</a></li>
            </ul>
          </div>
        </div>
        
        <div class="accordion-group">
          <div class="accordion-heading">	
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="#collapse-jlf">
              <i class="icon-user"></i>
              <span class="title">监理费回收</span>
            </a>
          </div>
          <div id="collapse-jlf" class="accordion-body collapse ${currentMenu == 'jl-jlf' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/common/jsz.jsp"><i class="icon-user"></i>合同履约台账</a></li>
			  <li><a href="${scopePrefix}/jl/jlfRecord-info-list.do"><i class="icon-user"></i>监理费回收台账</a></li>
            </ul>
          </div>
        </div>
         --%>
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('collapse-xmjd')">
              <i class="icon-fullscreen "></i>
              <span class="title">项目进点</span>
            </a>
          </div>
          <div id="collapse-xmjd" class="accordion-body collapse ${currentMenu == 'jl-xmjd' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
              <li><a href="${scopePrefix}/jl/jl-doc-mbzrs-list.do"><i class="icon-book"></i>目标责任书</a></li>
			  <%-- <li><a href="${scopePrefix}/jl/gsdbsy-info.do"><i class="icon-user"></i>物品申领</a></li> --%>
			  <%--<li><a href="${scopePrefix}/jl/xmdbsy-info.do"><i class="icon-heart"></i>待办事宜</a></li>--%>
            </ul>
          </div>
        </div>
        		<div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('collapse-sqzb')">
              <i class="icon-time "></i>
              <span class="title">施工准备</span>
            </a>
          </div>
          <div id="collapse-sqzb" class="accordion-body collapse ${currentMenu == 'jl-sqzb' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/jl/jlShiqian-zl-input.do"><i class="icon-file"></i>工程建设资料</a></li>
			  <li><a href="${scopePrefix}/jl/jlShiqian-wenjian-input.do"><i class="icon-book"></i>监理资料</a></li>
			   <li><a href="${scopePrefix}/jl/jlShiqian-jswj-input.do"><i class="icon-bookmark"></i>施工资料</a></li>
			   <%--  <li><a href="${scopePrefix}/jl/jlzz-info-input.do"><i class="icon-tag"></i>参建单位资质文件</a></li> --%>
            </ul>
          </div>
        </div>
        		<div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('collapse-xcgl')">
              <i class="icon-ok "></i>
              <span class="title">施工过程</span>
            </a>
          </div>
          <div id="collapse-xcgl" class="accordion-body collapse ${currentMenu == 'jl-xcgl' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
            <%--   <li><a href="${scopePrefix}/jl/jl-sz-aqgl-input.do"><i class="icon-exclamation-sign"></i>安全管理</a></li>
              <li><a href="${scopePrefix}/jl/jl-sz-aqgl-input-new.do"><i class="icon-exclamation-sign"></i>安全管理</a></li>
			  <li><a href="${scopePrefix}/jl/jl-sz-zlkz-input.do"><i class="icon-book"></i>质量控制</a></li>
			  <li><a href="${scopePrefix}/jl/jl-sz-jdkz-input.do"><i class="icon-retweet"></i>进度控制</a></li>
			  <li><a href="${scopePrefix}/jl/jlTouzi-info-list2.do"><i class="icon-circle-arrow-right"></i>投资控制</a></li>
			  <li><a href="${scopePrefix}/jl/jl-sz-xxgl-input.do"><i class="icon-globe"></i>信息管理</a></li>
			  <li><a href="${scopePrefix}/jl/jlSght-info-list.do"><i class="icon-book"></i>合同管理</a></li>
			  <li><a href="${scopePrefix}/jl/jlShiZhongNew-info-listUserDefined.do?defineCode=TEST_CODE"><i class="icon-book"></i>合同管理</a></li>
			  <li><a href="${scopePrefix}/content/jl/jlxcxt-info.jsp"><i class="icon-user"></i>现场协调</a></li>  --%>
			  
			  
			    <li><a href="${scopePrefix}/jl/jl-sz-aqgl-input.do"><i class="icon-exclamation-sign"></i>安全管理</a></li>
			  <li><a href="${scopePrefix}/jl/jl-sz-zlkz-input.do"><i class="icon-book"></i>质量控制</a></li>
			  <li><a href="${scopePrefix}/jl/jl-sz-jdkz-input.do"><i class="icon-retweet"></i>进度控制</a></li>
			   <li><a href="${scopePrefix}/jl/jlTouzi-info-list2.do"><i class="icon-circle-arrow-right"></i>投资控制</a></li>
			    <li><a href="${scopePrefix}/jl/jl-sz-xxgl-input.do"><i class="icon-globe"></i>信息管理</a></li>
			    <li><a href="${scopePrefix}/jl/jlSght-info-list.do"><i class="icon-book"></i>合同管理</a></li>
			     <li><a href="${scopePrefix}/content/jl/jlxcxt-info.jsp"><i class="icon-user"></i>现场协调</a></li> 
			     
            </ul>
          </div>
        </div>
        
         <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="javascript:void(0)"   onclick="zd('collapse-ry')">
              <i class="icon-user "></i>
              <span class="title">人员管理</span>
            </a>
          </div>
          <div id="collapse-ry" class="accordion-body collapse ${currentMenu == 'jl-ry' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
            <li><a href="${scopePrefix}/jl/jl-pjRy-info-list.do"><i class="icon-align-justify"></i>人员台帐</a></li>
            <%--<li><a href="${scopePrefix}/jl/jl-pjKq-info-list.do"><i class="icon-info-sign"></i>人员考勤</a></li>--%>
            <li><a href="${scopePrefix}/jl/jl-pjYdkh-info-list.do"><i class="icon-heart"></i>人员考核</a></li>
          <%--<li><a href="${scopePrefix}/jl/jlRysq-info-list.do"><i class="icon-pencil"></i>申请增加人员</a></li>--%>
           <%--<li><a href="${scopePrefix}/jl/jl-pjRyRecord-info-list.do"><i class="icon-share-alt"></i>人员调配记录</a></li>--%>
           <li><a href="${scopePrefix}/jl/jl-hrLz-info-list.do"><i class="icon-arrow-right"></i>人员离职</a></li>
            </ul>
          </div>
        </div>
        
         <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="javascript:void(0)"   onclick="zd('collapse-wz')">
              <i class="icon-shopping-cart "></i>
              <span class="title">物资管理</span>
            </a>
          </div>
          <div id="collapse-wz" class="accordion-body collapse ${currentMenu == 'jl-wz' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
            <li><a href="${scopePrefix}/jl/jl-pjWz-info-list.do.do?wzKind=1"><i class="icon-certificate"></i>固定资产</a></li>
            <li><a href="${scopePrefix}/jl/jl-pjWz-info-list.do.do?wzKind=2"><i class="icon-hand-left"></i>低值易耗品</a></li>
            <li><a href="${scopePrefix}/jl/jl-xzKzList-info-list.do.do"><i class="icon-ok-circle"></i>项目章</a></li>
            </ul>
          </div>
        </div>
        
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="javascript:void(0)"   onclick="zd('collapse-ny')">
              <i class="icon-ok-sign "></i>
              <span class="title">内业管理</span>
            </a>
          </div>
          <div id="collapse-ny" class="accordion-body collapse ${currentMenu == 'jl-ny' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
         <li><a href="${scopePrefix}/jl/jl-neiyetaizhang-info-list.do"><i class="icon-file"></i>资料汇总</a></li>
            </ul>
          </div>
        </div>
        		<div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="javascript:void(0)"   onclick="zd('collapse-cd')">
              <i class="icon-exclamation-sign "></i>
              <span class="title">项目撤点</span>
            </a>
          </div>
          <div id="collapse-cd" class="accordion-body collapse ${currentMenu == 'jl-cd' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			<%--   <li><a href="${scopePrefix}/common/jsz.jsp"><i class="icon-user"></i>例会纪要</a></li>
			  <li><a href="${scopePrefix}/common/jsz.jsp"><i class="icon-user"></i>监理业务手册</a></li>
			  <li><a href="${scopePrefix}/common/jsz.jsp"><i class="icon-user"></i>监理工作总结</a></li> --%>
			  <li><a href="${scopePrefix}/jl/jl-pjNy-info-input.do"><i class="icon-book"></i>工程监理档案</a></li>
			  <li><a href="${scopePrefix}/jl/jlWzbackAsk-info-list.do"><i class="icon-random"></i>固定资产移交</a></li>
            </ul>
          </div>
        </div>
        
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle"  href="${scopePrefix}/jl/jl-ny-jlf-input.do">
              <i class="icon-ok-sign "></i>
              <span class="title">监理费回收</span>
            </a>
          </div>
        </div>
        
        
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" href="${scopePrefix}/jl/jlGuifantuji-info-list.do?type=1">
              <i class="icon-file "></i>
              <span class="title">参考资料</span>
            </a>
          </div>
      <%--     <div id="collapse-zl" class="accordion-body collapse ${currentMenu == 'jl-zl' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/jl/jl-pjFanben-info-list.do?fbType=1"><i class="icon-ok-circle"></i>规范</a></li>
			  <li><a href="${scopePrefix}/jl/jl-pjFanben-info-list.do?fbType=2"><i class="icon-picture"></i>图集</a></li>
            </ul>
          </div> --%>
        </div>
     
		<footer id="m-footer" class="text-center copyright">
		  <hr>
		  &copy;xthena
		</footer>
      </aside>
      <!-- end of sidebar -->
