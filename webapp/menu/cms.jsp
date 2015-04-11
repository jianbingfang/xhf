<%@ page language="java" pageEncoding="UTF-8" %>
      <!-- start of sidebar -->
      <aside id="m-sidebar" class="accordion span2" data-spy="affix" data-offset-top="100">

        <div class="accordion-group">
          <div class="accordion-heading">
            <a class="accordion-toggle" data-toggle="collapse" data-parent="#m-sidebar" href="#collapse-cms">
              <i class="icon-file "></i>
              <span class="title">文章管理</span>
            </a>
          </div>
          <div id="collapse-cms" class="accordion-body collapse ${currentMenu == 'cms' ? 'in' : ''}">
            <ul class="accordion-inner nav nav-list">
			  <li><a href="${scopePrefix}/cms/cms-catalog-list.do"><i class="icon-list-alt"></i>栏目管理</a></li>
			  <li><a href="${scopePrefix}/cms/cms-article-list.do"><i class="icon-tasks"></i>文章管理</a></li>
			  <li><a href="${scopePrefix}/cms/cms-comment-list.do"><i class="icon-comment"></i>评论管理</a></li>
            </ul>
          </div>
        </div>

		<footer id="m-footer" class="text-center copyright">
		  <hr>
		  &copy;xthena
		</footer>
      </aside>
      <!-- end of sidebar -->
