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
          <div id="collapse-bpm-process" class="accordion-body collapse ${currentMenu == 'xz-zd' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/xz/xz-doc-bmze-info.do"><i class="icon-user"></i>部门职责</a></li>
			  <li><a href="${scopePrefix}/xz/xz-doc-glzd-list.do"><i class="icon-flag"></i>管理制度</a></li>
			  <li><a href="${scopePrefix}/xz/xz-doc-gzlc-list.do"><i class="icon-th"></i>工作流程</a></li>
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
          <div id="collapse-bpm-task" class="accordion-body collapse ${currentMenu == 'xz-plain' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/xz/xz-plain-info-list.do"><i class="icon-th-list"></i>月计划</a></li>
			  <li><a href="${scopePrefix}/xz/xz-week-plain-info-list.do"><i class="icon-calendar"></i>周计划</a></li>
            </ul>
          </div>
        </div>

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="javascript:void(0)"   onclick="zd('xz-xw')">
              <i class="icon-volume-up "></i>
              <span class="title">新闻平台</span>
            </a>
          </div>
          <div id="xz-xw" class="accordion-body collapse ${currentMenu == 'xz-xw' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/xz/xzCommNews-info-list.do"><i class="icon-arrow-up"></i>行业新闻</a></li>
			   <li><a href="${scopePrefix}/xz/xzCommNews-nb-info-list.do"><i class="icon-th-large"></i>内部新闻</a></li>
            </ul>
          </div>
        </div>

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="javascript:void(0)"   onclick="zd('xz-da')">
              <i class="icon-inbox "></i>
              <span class="title">档案管理</span>
            </a>
          </div>
          <div id="xz-da" class="accordion-body collapse ${currentMenu == 'xz-da' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/xz/xzZj-treelist.do"><i class="icon-file"></i>证件管理</a></li>
			  <li><a href="${scopePrefix}/xz/xzRyzs-info-list.do"><i class="icon-picture"></i>荣誉证书</a></li>
			  <li><a href="${scopePrefix}/xz/xz-commHt-info-list.do"><i class="icon-folder-close"></i>合同管理</a></li>
			  <li><a href="${scopePrefix}/xz/xzZbtzs-info-list.do"><i class="icon-bookmark"></i>中标通知书</a></li>
			  <li><a href="${scopePrefix}/xz/xzJgysbg-info-list.do"><i class="icon-bookmark"></i>竣工验收报告</a></li>
			  <li><a href="${scopePrefix}/xz/xzRedTape-wb-info-list.do"><i class="icon-star"></i>红头文件（外）</a></li>
			  <li><a href="${scopePrefix}/xz/xzRedTape-nb-info-list.do"><i class="icon-star"></i>红头文件（内）</a></li>
              <li><a href="${scopePrefix}/xz/xzChufa-info-list.do"><i class="icon-remove"></i>行政处罚</a></li>
               <li><a href="${scopePrefix}/xz/xzZjOrder-info-list.do"><i class="icon-remove"></i>证书预定</a></li>
            </ul>
          </div>
        </div>

<%--         <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="#xz-zz">
              <i class="icon-user"></i>
              <span class="title">资质管理</span>
            </a>
          </div>
          <div id="xz-zz" class="accordion-body collapse ${currentMenu == 'xz-zz' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
             <li><a href="${scopePrefix}/xz/xzZj-info-list.do"><i class="icon-user"></i>资质管理规定</a></li>
			  <li><a href="${scopePrefix}/xz/xzZj-info-list.do"><i class="icon-user"></i>资质类别</a></li>
			  <li><a href="${scopePrefix}/xz/xzZj-info-list.do"><i class="icon-user"></i>动态考核</a></li>
			  <li><a href="${scopePrefix}/xz/xzZj-info-list.do"><i class="icon-user"></i>资质申报 </a></li>
            </ul>
          </div>
        </div> --%>

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('xz-yz')">
              <i class="icon-tag "></i>
              <span class="title">印章管理</span>
            </a>
          </div>
          <div id="xz-yz" class="accordion-body collapse ${currentMenu == 'xz-yz' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
            <li><a href="${scopePrefix}/xz/xzYinzhang-info-list.do"><i class="icon-list-alt"></i>刻制启用 </a></li>
			 <%--   <li><a href="${scopePrefix}/xz/xzYinzhang-info-list.do"><i class="icon-tags"></i>印章管理</a></li> --%>
			  <li><a href="${scopePrefix}/xz/xzYzDj-info-list.do"><i class="icon-edit"></i>用印登记</a></li>
            </ul>
          </div>
        </div>
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="javascript:void(0)"   onclick="zd('xz-hy')">
              <i class="icon-comment "></i>
              <span class="title">会议管理</span>
            </a>
          </div>
          <div id="xz-hy" class="accordion-body collapse ${currentMenu == 'xz-hy' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/xz/xzCommHuiyi-info-list.do"><i class="icon-comment"></i>内部会议</a></li>
			  <li><a href="${scopePrefix}/xz/xzCommHuiyi-wb-info-list.do"><i class="icon-comment"></i>外部会议</a></li>
            </ul>
          </div>
        </div>
          <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('xz-py')">
              <i class="icon-star "></i>
              <span class="title">评先管理</span>
            </a>
          </div>
          <div id="xz-py" class="accordion-body collapse ${currentMenu == 'xz-py' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/xz/xzxjpy-info-list.do"><i class="icon-heart"></i>内部评先</a></li>
			  <li><a href="${scopePrefix}/xz/xzxjpy-wb-info-list.do"><i class="icon-star"></i>外部评先 </a></li>
            </ul>
          </div>
        </div>
        
         <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('xz-wz')">
              <i class="icon-plane "></i>
              <span class="title">物资管理</span>
            </a>
          </div>
          <div id="xz-wz" class="accordion-body collapse ${currentMenu == 'xz-wz' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/xz/wzAsk-info-list.do"><i class="icon-pencil"></i>申领审批</a></li>
			<%--   <li><a href="${scopePrefix}/xz/wzAsk-info-list.do"><i class="icon-ok"></i>领用审批</a></li>
			  <li><a href="${scopePrefix}/xz/wzIo-info-list.do"><i class="icon-user"></i>物品领用</a></li> --%>
			  <li><a href="${scopePrefix}/xz/wzIo-info-list.do"><i class="icon-share-alt"></i>调拨归还</a></li>
		     <li><a href="${scopePrefix}/xz/wzList-info-list.do"><i class="icon-folder-close"></i>物资台账</a></li>
		     <li><a href="${scopePrefix}/xz/wzStorage-info-list.do"><i class="icon-inbox"></i>库存管理</a></li>
		     <%-- <li><a href="${scopePrefix}/xz/wzKind-info-list.do"><i class="icon-list"></i>物品分类</a></li> --%>
		  <%--    <li><a href="${scopePrefix}/xz/wzTable-info-list.do"><i class="icon-tasks"></i>物品属性</a></li> --%>
			     <%-- <li><a href="${scopePrefix}/xz/wzStorage-info-list.do"><i class="icon-user"></i>库存调拨</a></li>  --%>
            </ul>
          </div>
        </div>
          <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('collapse-cl')">
              <i class="icon-road "></i>
              <span class="title">车辆管理</span>
            </a>
          </div>
          <div id="collapse-cl" class="accordion-body collapse ${currentMenu == 'xz-cl' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
             <%--<li><a href="../content/xz/xzCar-glzd-list.jsp"><i class="icon-user"></i>管理办法</a></li>--%>
			  <li><a href="${scopePrefix}/xz/xzCar-info-list.do"><i class="icon-user"></i>车辆台账</a></li>
			 <%--  <li><a href="${scopePrefix}/xz/xzCarRecord-info-list.do"><i class="icon-comment"></i>使用记录</a></li>
			  <li><a href="${scopePrefix}/xz/xzCarOilRecord-info-list.do"><i class="icon-tint"></i>加油记录</a></li>
			   <li><a href="${scopePrefix}/xz/xzCarWbrecord-info-list.do"><i class="icon-list-alt"></i>维保记录</a></li>
			    <li><a href="${scopePrefix}/xz/xzCarBxRecord-info-list.do"><i class="icon-edit"></i>保险登记</a></li>
			     <li><a href="${scopePrefix}/xz/xzCarSc-info-list.do"><i class="icon-check"></i>审车登记</a></li> --%>
			      <li><a href="${scopePrefix}/xz/xzCar-cost-list.do"><i class="icon-screenshot"></i>成本核算</a></li>
            </ul>
          </div>
        </div>
            <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('collapse-ws')">
              <i class="icon-star "></i>
              <span class="title">卫生安全</span>
            </a>
          </div>
          <div id="collapse-ws" class="accordion-body collapse ${currentMenu == 'xz-ws' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <%-- <li><a href="${scopePrefix}/xz/xz-doc-wszd-list.do"><i class="icon-user"></i>管理制度</a></li> --%>
			  <li><a href="${scopePrefix}/xz/xzWs-info-list.do?ftype=ws"><i class="icon-star-empty"></i>卫生检查</a></li>
			  <li><a href="${scopePrefix}/xz/xzWs-info-list.do?ftype=aq"><i class="icon-star-empty"></i>安全检查</a></li>
		   </ul>
          </div>
        </div>
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="javascript:void(0)"   onclick="zd('xz-fgs')">
              <i class="icon-th-list "></i>
              <span class="title">分公司管理</span>
            </a>
          </div>
          <div id="xz-fgs" class="accordion-body collapse ${currentMenu == 'xz-fgs' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/xz/commpany-info-list.do"><i class="icon-ok-sign"></i>注册备案</a></li>
			 <li><a href="${scopePrefix}/xz/commpanyGlxy-info-list.do"><i class="icon-user"></i>管理协议</a></li> 
            </ul>
          </div>
        </div>
        
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle"  href="xz-doc-cbhs-list.do">
              <i class="icon-folder-open "></i>
              <span class="title">成本核算</span>
            </a>
          </div>
        </div>
        
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar"  href="javascript:void(0)"   onclick="zd('xz-zj')">
              <i class="icon-th-list "></i>
              <span class="title">工作总结</span>
            </a>
          </div>
          <div id="xz-zj" class="accordion-body collapse ${currentMenu == 'xz-zj' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/xz/xzDsj-info-list.do"><i class="icon-ok-sign"></i>公司大事纪</a></li>
			   <li><a href="${scopePrefix}/xz/xzxhptj-info-list.do"><i class="icon-ok-sign"></i>消耗品统计</a></li>
			    <li><a href="${scopePrefix}/xz/xzGdzctj-info-list.do"><i class="icon-ok-sign"></i>固定资产统计</a></li>
            </ul>
          </div>
        </div>
        
   
  <!--       
        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle"  href="xz-doc-gzzj-list.do">
              <i class="icon-folder-open "></i>
              <span class="title">工作总结</span>
            </a>
          </div>
        </div> -->
   		
       
      <%--  <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" href="${scopePrefix}/xz/xzZjOrder-info-list.do">
              <i class="icon-th-list "></i>
              <span class="title">证件订单</span>
            </a>
          </div>
        </div> --%>
    
		<footer id="m-footer" class="text-center copyright">
		  <hr>
		  &copy;xthena
		</footer>
      </aside>
      <!-- end of sidebar -->
