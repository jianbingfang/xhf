package com.xthena.cms.web;

import java.util.List;
import javax.annotation.Resource;

import com.xthena.cms.domain.CmsArticle;
import com.xthena.cms.domain.CmsCatalog;
import com.xthena.cms.manager.CmsArticleManager;
import com.xthena.cms.manager.CmsCatalogManager;
import com.xthena.cms.service.RenderService;

import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.spring.MessageHelper;

import com.xthena.ext.export.Exportor;
import com.xthena.ext.store.StoreConnector;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/cms")
public class CmsController {
    private CmsArticleManager cmsArticleManager;
    private CmsCatalogManager cmsCatalogManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private MessageHelper messageHelper;
    private RenderService renderService;
    private StoreConnector storeConnector;

    @RequestMapping("index")
    public String index(Model model) {
        List<CmsCatalog> cmsCatalogs = cmsCatalogManager.getAll();
        model.addAttribute("cmsCatalogs", cmsCatalogs);

        return "cms/index";
    }

    @RequestMapping("catalog")
    public String catalog(@RequestParam("id") Long id, Model model) {
        CmsCatalog cmsCatalog = cmsCatalogManager.get(id);
        model.addAttribute("cmsCatalog", cmsCatalog);

        return "cms/catalog";
    }

    @RequestMapping("article")
    public String article(@RequestParam("id") Long id, Model model) {
        CmsArticle cmsArticle = cmsArticleManager.get(id);
        model.addAttribute("cmsArticle", cmsArticle);

        return "cms/article";
    }

    // ~ ======================================================================
    @Resource
    public void setCmsArticleManager(CmsArticleManager cmsArticleManager) {
        this.cmsArticleManager = cmsArticleManager;
    }

    @Resource
    public void setCmsCatalogManager(CmsCatalogManager cmsCatalogManager) {
        this.cmsCatalogManager = cmsCatalogManager;
    }

    @Resource
    public void setExportor(Exportor exportor) {
        this.exportor = exportor;
    }

    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setRenderService(RenderService renderService) {
        this.renderService = renderService;
    }

    @Resource
    public void setStoreConnector(StoreConnector storeConnector) {
        this.storeConnector = storeConnector;
    }
}
