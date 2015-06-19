package com.xthena.sckf.web;

import com.xthena.api.user.UserConnector;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;
import com.xthena.jl.domain.JlFujian;
import com.xthena.jl.manager.JlDocTemplateManager;
import com.xthena.jl.manager.JlFujianManager;
import com.xthena.sckf.domain.JyXm;
import com.xthena.sckf.manager.JyXmManager;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.JsonResponseUtil;
import com.xthena.util.JyXmMapUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("sckf")
public class JyXmController {
    private JyXmManager jyXmManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private JlDocTemplateManager jlDocTemplateManager;

    @Autowired
    private JlFujianManager jlFujianManager;


    @PostConstruct
    public void intRmMap() {
        JyXmMapUtil.initRyMap(jyXmManager);
    }

    @RequestMapping("jyXm-info-list")
    public String list(@ModelAttribute Page page,
                       @RequestParam Map<String, Object> parameterMap, Model model) {

//        if(parameterMap.containsKey("fprovince")) {
//            Object province = parameterMap.get("fprovince");
//            parameterMap.put("filter_EQS_fprovince", province);
//        }
//        if(parameterMap.containsKey("fcity")) {
//            Object city = parameterMap.get("fcity");
//            parameterMap.put("filter_EQS_fcity", city);
//        }

        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page.setOrderBy("fkbdate");
        page.setOrder("desc");
        page = jyXmManager.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        model.addAttribute("fstate", parameterMap.get("filter_EQS_fstate"));
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "sckf/jyXm-info-list";
    }

    @RequestMapping("jyXm-info-collect-list")
    public String list2(@ModelAttribute Page page,
                        @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page.setOrderBy("fkbdate");
        page.setOrder("desc");
        page = jyXmManager.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "sckf/jyXm-info-collect-list";
    }


    @RequestMapping("jyxm-info-load-ajax")
    public void loadInfoAjax(@RequestParam(value = "fxmid", required = false) Long fxmid, HttpServletResponse response,
                             Model model) {
        JsonResponseUtil.write(response, jyXmManager.get(fxmid));
    }


    @RequestMapping("jyXm-info-collect")
    public String input2(@RequestParam(value = "id", required = false) Long id,
                         Model model) {
        if (id != null) {
            JyXm jyXm = jyXmManager.get(id);
            model.addAttribute("model", jyXm);
        }
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

        return "sckf/jyXm-info-collect";
    }

    @RequestMapping("jyXm-info-collect-save")
    public String save2(@ModelAttribute JyXm jyXm,
                        @RequestParam Map<String, Object> parameterMap,
                        RedirectAttributes redirectAttributes) {
        JyXm dest = null;

        Long id = jyXm.getFid();

        if (id != null) {
            dest = jyXmManager.get(id);
            beanMapper.copy(jyXm, dest);
        } else {
            dest = jyXm;
        }

        jyXmManager.save(dest);
        JyXmMapUtil.refreshRyMap(dest);
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/sckf/jyXm-info-collect-list.do";
    }

    @RequestMapping("jyXm-info-shenpi-list")
    public String list3(@ModelAttribute Page page,
                        @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jyXmManager.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "sckf/jyXm-info-shenpi-list";
    }


    @RequestMapping("jyXm-info-shenpi")
    public String input3(@RequestParam(value = "id", required = false) Long id,
                         Model model) {
        if (id != null) {
            JyXm jyXm = jyXmManager.get(id);
            model.addAttribute("model", jyXm);
        }
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

        return "sckf/jyXm-info-shenpi";
    }

    @RequestMapping("jyXm-info-shenpi-save")
    public String save3(@ModelAttribute JyXm jyXm,
                        @RequestParam Map<String, Object> parameterMap,
                        RedirectAttributes redirectAttributes) {
        JyXm dest = null;

        Long id = jyXm.getFid();

        if (id != null) {
            dest = jyXmManager.get(id);
            beanMapper.copy(jyXm, dest);
        } else {
            dest = jyXm;
        }
        jyXmManager.save(dest);
        JyXmMapUtil.refreshRyMap(dest);
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");
        return "redirect:/sckf/jyXm-info-shenpi-list.do";
    }

    @RequestMapping("jyXm-info-toubiao-list")
    public String listtoubiao(@ModelAttribute Page page,
                              @RequestParam Map<String, Object> parameterMap, Model model) {
        parameterMap.put("filter_INS_fstate", "投标文件登记,开标登记,转换成项目");
        page.setOrderBy("fkbdate");
        page.setOrder("desc");
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jyXmManager.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        model.addAttribute("fstate", parameterMap.get("filter_EQS_fstate"));
        model.addAttribute("fprovince", parameterMap.get("filter_EQS_fprovince"));
        model.addAttribute("fcity", parameterMap.get("filter_EQS_fcity"));

        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "sckf/jyXm-info-toubiao-list";
    }


    @RequestMapping("jyXm-info-zhongbiao-list")
    public String listzhongbiao(@ModelAttribute Page page,
                                @RequestParam Map<String, Object> parameterMap, Model model) {
        parameterMap.put("filter_EQS_fzbstatus", "是");
        page.setOrderBy("fkbdate");
        page.setOrder("desc");
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jyXmManager.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "sckf/jyXm-info-zhongbiao-list";
    }

    @RequestMapping("jyXm-info-toubiao")
    public String inputtoubiao(@RequestParam(value = "xmid", required = false) Long id,
                               Model model) {
        if (id != null) {
            JyXm jyXm = jyXmManager.get(id);
            model.addAttribute("model", jyXm);
        }
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "sckf/jyXm-info-toubiao";
    }

    @RequestMapping("jyXm-info-toubiao-save")
    public String savetoubiao(@ModelAttribute JyXm jyXm,
                              @RequestParam Map<String, Object> parameterMap,
                              RedirectAttributes redirectAttributes) {
        JyXm dest = null;

        Long id = jyXm.getFid();

        if (id != null) {
            dest = jyXmManager.get(id);
            beanMapper.copy(jyXm, dest);
        } else {
            dest = jyXm;
        }
        dest.setFstate("投标登记");
        jyXmManager.save(dest);
        JyXmMapUtil.refreshRyMap(dest);
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");
        return "redirect:/sckf/jyXm-info-toubiao-list.do";
    }


    @RequestMapping("jyXm-info-kaibiao-list")
    public String listkaibiao(@ModelAttribute Page page,
                              @RequestParam Map<String, Object> parameterMap, Model model) {
        parameterMap.put("filter_INS_fstate", "开标登记,转换成项目");
        page.setOrderBy("fkbdate");
        page.setOrder("desc");
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jyXmManager.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        model.addAttribute("fstate", parameterMap.get("filter_EQS_fstate"));
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "sckf/jyXm-info-kaibiao-list";
    }

    @RequestMapping("jyXm-info-kaibiao-taizhang")
    public String taizhangkaibiao(@ModelAttribute Page page,
                                  @RequestParam Map<String, Object> parameterMap, Model model) {
        parameterMap.put("filter_INS_fstate", "投标文件登记,开标登记,转换成项目");
        page.setOrderBy("fkbdate");
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jyXmManager.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        model.addAttribute("fstate", parameterMap.get("filter_EQS_fstate"));
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "sckf/jyXm-info-kaibiao-taizhang";
    }


    @RequestMapping("jyXm-info-kaibiao")
    public String inputkaibiao(@RequestParam(value = "xmid", required = false) Long id,
                               Model model) {
        if (id != null) {
            JyXm jyXm = jyXmManager.get(id);
            model.addAttribute("model", jyXm);
        }
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

        return "sckf/jyXm-info-kaibiao";
    }

    @RequestMapping("jyXm-info-kaibiao-save")
    public String savekaibiao(@ModelAttribute JyXm jyXm,
                              @RequestParam Map<String, Object> parameterMap,
                              RedirectAttributes redirectAttributes) {
        JyXm dest = null;

        Long id = jyXm.getFid();
        if (id != null) {
            dest = jyXmManager.get(id);
            beanMapper.copy(jyXm, dest);
        } else {
            dest = jyXm;
        }
        dest.setFstate("开标登记");
        jyXmManager.save(dest);
        JyXmMapUtil.refreshRyMap(dest);
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");
        return "redirect:/sckf/jyXm-info-kaibiao-list.do";
    }


    @RequestMapping("jyXm-info-tongzhishu-list")
    public String listtongzhishu(@ModelAttribute Page page,
                                 @RequestParam Map<String, Object> parameterMap, Model model) {
        parameterMap.put("filter_INS_fstate", "转换成项目");
        page.setOrderBy("fkbdate");
        page.setOrder("desc");
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jyXmManager.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        model.addAttribute("fstate", parameterMap.get("filter_EQS_fstate"));
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "sckf/jyXm-info-tongzhishu-list";
    }


    @RequestMapping("jyXm-info-tongzhishu")
    public String inputtongzhishu(@RequestParam(value = "xmid", required = false) Long id,
                                  Model model) {
        if (id != null) {
            JyXm jyXm = jyXmManager.get(id);
            model.addAttribute("model", jyXm);
        }
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

        return "sckf/jyXm-info-tongzhishu";
    }

    @RequestMapping("jyXm-info-tongzhishu-save")
    public String savetongzhishu(@ModelAttribute JyXm jyXm,
                                 @RequestParam Map<String, Object> parameterMap,
                                 RedirectAttributes redirectAttributes) {
        JyXm dest = null;

        Long id = jyXm.getFid();

        if (id != null) {
            dest = jyXmManager.get(id);
            beanMapper.copy(jyXm, dest);
        } else {
            dest = jyXm;
        }
        dest.setFstate("中标通知书领取");
        jyXmManager.save(dest);
        JyXmMapUtil.refreshRyMap(dest);
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");
        return "redirect:/sckf/jyXm-info-tongzhishu-list.do";
    }


    @RequestMapping("xinxishouji-input")
    public String xinxishouji(@ModelAttribute Page page,
                              @RequestParam Map<String, Object> parameterMap) {
        return "sckf/xinxishouji-input";
    }


    @RequestMapping("jyXm-simple-list")
    public void listXm(@ModelAttribute Page page,
                       @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jyXmManager.pagedQuery(page, propertyFilters);
        JsonResponseUtil.write(response, page);
    }


    @RequestMapping("jyXm-toubiao-simple-list")
    public void listXm2(@ModelAttribute Page page,
                        @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        //parameterMap.put("filter_EQS_fshenpiresult", "报名");
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jyXmManager.pagedQuery(page, propertyFilters);
        JsonResponseUtil.write(response, page);
    }


    @RequestMapping("jyXm-info-input")
    public String input(@RequestParam(value = "xmid", required = false) Long id, @RequestParam(value = "state", required = false) String state,
                        Model model) {
        if (id != null) {
            JyXm jyXm = jyXmManager.get(id);
            model.addAttribute("model", jyXm);
        }
        List<JlFujian> jlFujians = jlFujianManager.find("select fujian from JlFujian fujian where fmainid=? and ftablename=?", id, "t_jl_shizhong");
        model.addAttribute("fujians", jlFujians);
        model.addAttribute("state", state);
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

        return "sckf/jyXm-info-input";
    }

    @RequestMapping("jlShizhong-info-deleteFujian")
    public String deleteFujian(@RequestParam(value = "fujianid", required = false) Long fujianid, @RequestParam(value = "id", required = false) Long id,
                               Model model) {
        if (fujianid != null) {
            jlFujianManager.removeById(fujianid);
            JyXm jyXm = jyXmManager.get(id);
            model.addAttribute("model", jyXm);

            List<JlFujian> jlFujians = jlFujianManager.find("select fujian from JlFujian fujian where fmainid=? and ftablename=?", id, "t_jl_shizhong");
            model.addAttribute("fujians", jlFujians);
        }

        return "jl/jlShizhong-info-input";
    }


    @RequestMapping("jyXm-info-save")
    public String save(@ModelAttribute JyXm jyXm,
                       @RequestParam Map<String, Object> parameterMap,
                       RedirectAttributes redirectAttributes) {
        JyXm dest = null;
        Long id = jyXm.getFid();
        if (id != null) {
            dest = jyXmManager.get(id);
            beanMapper.copy(jyXm, dest);
        } else {
            dest = jyXm;
        }
        dest.setFtoubiaostatus("1");
        jyXmManager.save(dest);
        JyXmMapUtil.refreshRyMap(dest);
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");
        return "redirect:/sckf/jyXm-info-list.do";
    }

    @RequestMapping("jyXm-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
                         RedirectAttributes redirectAttributes) {
        List<JyXm> jyXms = jyXmManager.findByIds(selectedItem);

        jyXmManager.removeAll(jyXms);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/sckf/jyXm-info-list.do";
    }

    @RequestMapping("jyXm-info-export")
    public void export(@ModelAttribute Page page,
                       @RequestParam Map<String, Object> parameterMap,
                       HttpServletResponse response) throws Exception {
        parameterMap.put("filter_INS_fstate", "投标文件登记,开标登记,转换成项目");
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);

        page.setOrderBy("fkbdate");
        page.setOrder("desc");
        page = jyXmManager.pagedQuery(page, propertyFilters);

        List<JyXm> jyXms = (List<JyXm>) page.getResult();

        TableModel tableModel = new TableModel();
        tableModel.setName("jyXm info");
        tableModel.addHeaders("fkbdate", "fname", "fscale", "ftze", "fzbmoney", "fzj", "ffuzeren", "fshuxing");
        tableModel.addColNames("开标时间", "工程名称", "规模", "投资", "金额", "投标总监", "主办人", "属性");
        tableModel.setData(jyXms);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setJyXmManager(JyXmManager jyXmManager) {
        this.jyXmManager = jyXmManager;
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
