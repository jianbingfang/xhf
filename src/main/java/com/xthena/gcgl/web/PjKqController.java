package com.xthena.gcgl.web;

import com.xthena.api.user.UserConnector;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;
import com.xthena.gcgl.domain.PjKq;
import com.xthena.gcgl.domain.PjKqV;
import com.xthena.gcgl.domain.PjXm;
import com.xthena.gcgl.manager.PjKqManager;
import com.xthena.gcgl.manager.PjKqVManager;
import com.xthena.jl.domain.JlKqFujian;
import com.xthena.jl.manager.JlKqFujianManager;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.JsonResponseUtil;
import com.xthena.util.PjXmMapUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("gcgl")
public class PjKqController {
    private PjKqManager pjKqManager;
    private PjKqVManager pjKqVManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private JlKqFujianManager jlKqFujianManager;

    @RequestMapping("pjKq-kq-input")
    public String kqinput(Model model, @RequestParam(value = "id", required = false) Long id, @ModelAttribute Page page) {
        model.addAttribute("kqid", id);
        PjKq pjKq = pjKqManager.get(id);
        List<JlKqFujian> jlKqFujians = jlKqFujianManager.findBy("fkqid", id);

        PjXm p = null;
        if (pjKq != null) {
            p = PjXmMapUtil.getXmMap().get(pjKq.getFxmid());
        }
        if (p != null) {
            model.addAttribute("fxmName", p.getFxmname());
        }
        model.addAttribute("jlfujians", jlKqFujians);
        model.addAttribute("kq", pjKq);
        model.addAttribute("page", page);
        return "gcgl/pjKq-kq-input";
    }

    @RequestMapping("pjKq-info-list")
    public String list(@ModelAttribute Page page,
                       @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page.setOrderBy("fxmname");
        page = pjKqVManager.pagedQuery(page, propertyFilters);

        model.addAttribute("page", page);

        return "gcgl/pjKq-info-list";
    }

    @RequestMapping("pjKq-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
                        Model model) {
        if (id != null) {
            PjKq pjKq = pjKqManager.get(id);
            model.addAttribute("model", pjKq);
        }

        return "gcgl/pjKq-info-input";
    }

    @RequestMapping("pjKq-info-save")
    public String save(@ModelAttribute PjKq pjKq,
                       @RequestParam Map<String, Object> parameterMap,
                       RedirectAttributes redirectAttributes) {
        PjKq dest = null;

        Long id = pjKq.getFid();

        if (id != null) {
            dest = pjKqManager.get(id);
            beanMapper.copy(pjKq, dest);
        } else {
            dest = pjKq;
        }

        pjKqManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/gcgl/pjKq-info-list.do";
    }

    @RequestMapping("gcgl-kq-save-fstatus-ajax")
    public void saveFstausAjax(@ModelAttribute PjKq pjKq,
                               @RequestParam Map<String, Object> parameterMap, HttpServletResponse response,
                               RedirectAttributes redirectAttributes) {
        PjKq dest = null;

        Long id = pjKq.getFid();

        if (id != null) {
            dest = pjKqManager.get(id);
            beanMapper.copy(pjKq, dest);
        } else {
            dest = pjKq;
        }

        pjKqManager.save(dest);

        JsonResponseUtil.write(response, "ok");
    }


    @RequestMapping("pjKq-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
                         RedirectAttributes redirectAttributes) {
        List<PjKq> pjKqs = pjKqManager.findByIds(selectedItem);

        pjKqManager.removeAll(pjKqs);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/gcgl/pjKq-info-list.do";
    }

    @RequestMapping("pjKq-info-export")
    public void export(@ModelAttribute Page page,
                       @RequestParam Map<String, Object> parameterMap,
                       HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = pjKqManager.pagedQuery(page, propertyFilters);

        List<PjKq> pjKqs = (List<PjKq>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("pjKq info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(pjKqs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setPjKqManager(PjKqManager pjKqManager) {
        this.pjKqManager = pjKqManager;
    }

    @Resource
    public void setPjKqVManager(PjKqVManager pjKqVManager) {
        this.pjKqVManager = pjKqVManager;
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
