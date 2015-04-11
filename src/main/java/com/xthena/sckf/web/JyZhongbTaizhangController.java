package  com.xthena.sckf.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletResponse;

import com.xthena.api.user.UserConnector;


import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;

import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;

import com.xthena.security.util.SpringSecurityUtils;
import com.xthena.sckf.domain.JyZhongbTaizhang;
import com.xthena.sckf.manager.JyZhongbTaizhangManager;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("sckf")
public class JyZhongbTaizhangController {
    private JyZhongbTaizhangManager jyZhongbTaizhangManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("jyZhongbTaizhang-info-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jyZhongbTaizhangManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "sckf/jyZhongbTaizhang-info-list";
    }

    @RequestMapping("jyZhongbTaizhang-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            JyZhongbTaizhang jyZhongbTaizhang = jyZhongbTaizhangManager.get(id);
            model.addAttribute("model", jyZhongbTaizhang);
        }

        return "sckf/jyZhongbTaizhang-info-input";
    }

    @RequestMapping("jyZhongbTaizhang-info-save")
    public String save(@ModelAttribute JyZhongbTaizhang jyZhongbTaizhang,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        JyZhongbTaizhang dest = null;

        Long id = jyZhongbTaizhang.getFid();

        if (id != null) {
            dest = jyZhongbTaizhangManager.get(id);
            beanMapper.copy(jyZhongbTaizhang, dest);
        } else {
            dest = jyZhongbTaizhang;
        }

        jyZhongbTaizhangManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/sckf/jyZhongbTaizhang-info-list.do";
    }

    @RequestMapping("jyZhongbTaizhang-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<JyZhongbTaizhang> jyZhongbTaizhangs = jyZhongbTaizhangManager.findByIds(selectedItem);

        jyZhongbTaizhangManager.removeAll(jyZhongbTaizhangs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/sckf/jyZhongbTaizhang-info-list.do";
    }

    @RequestMapping("jyZhongbTaizhang-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jyZhongbTaizhangManager.pagedQuery(page, propertyFilters);

        List<JyZhongbTaizhang> jyZhongbTaizhangs = (List<JyZhongbTaizhang>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("jyZhongbTaizhang info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(jyZhongbTaizhangs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJyZhongbTaizhangManager(JyZhongbTaizhangManager jyZhongbTaizhangManager) {
        this.jyZhongbTaizhangManager = jyZhongbTaizhangManager;
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
