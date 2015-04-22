package com.xthena.common.web;

import com.xthena.api.user.UserConnector;
import com.xthena.common.manager.XhfCommonDocManager;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("comm")
public class XhfIndexController {

    private XhfCommonDocManager xhfCommonDocManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("xhfindex")
    public String input() {
        return "../common/index";
    }

    // ~ ======================================================================
    @Resource
    public void setxhfCommonDocManager(XhfCommonDocManager xhfCommonDocManager) {
        this.xhfCommonDocManager = xhfCommonDocManager;
    }

    @Resource
    public void setExportor(Exportor exportor) {
        this.exportor = exportor;
    }

    @Resource
    public void setUserConnector(UserConnector userConnector) {
        this.userConnector = userConnector;
    }

    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }
}
