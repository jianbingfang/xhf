package com.xthena.cw.web;

import com.xthena.api.user.UserConnector;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;
import com.xthena.hr.manager.CommRyManager;
import com.xthena.sckf.domain.CommHt;
import com.xthena.sckf.manager.CommHtManager;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.PjXmMapUtil;
import com.xthena.xz.domain.XzZjDxlist;
import com.xthena.xz.manager.XzZjDxlistManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("cw")
public class CwCommHtController {
    private CommHtManager commHtManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private CommRyManager ryManager;
    @Autowired
    private CommHtManager htManager;
    @Autowired
    private XzZjDxlistManager xzZjDxlistManager;


    @RequestMapping("cw-commHt-info-list")
    public String list(@ModelAttribute Page page, @RequestParam(value = "state", required = false) String state,
                       @RequestParam Map<String, Object> parameterMap, Model model) {

        StringBuffer hql = new StringBuffer();
        //	"select b from CommHt b  where 1=1");//"select b from CommRy a,CommHt b  where a.fid=b.fzhubanren"
        Boolean zrnameBoolean = parameterMap.get("filter_LIKES_ffzrname") != null && !parameterMap.get("filter_LIKES_ffzrname").equals("");

        if (zrnameBoolean) {
            hql.append("select b from CommRy a,CommHt b  where a.fid=b.fzhubanren and b.fisf='0'  ");
            hql.append(" and a.fname like '%"
                    + parameterMap.get("filter_LIKES_ffzrname") + "%' ");
            if (parameterMap.get("fprovince") != null && !parameterMap.get("fprovince").equals("")) {
                hql.append(" and b.fprovince = '"
                        + parameterMap.get("fprovince") + "' ");
                /*parameterMap.put("filter_LIKES_fprovince", parameterMap.get("fprovince"));*/
            }

            if (state != null && !state.equals("")) {
                hql.append(" and b.fqiandingstatus='" + state + "' ");
            }
            if (parameterMap.get("fcity") != null && !parameterMap.get("fcity").equals("")) {
                hql.append(" and b.fcity = '"
                        + parameterMap.get("fcity") + "' ");
            /*	parameterMap.put("filter_LIKES_fcity", parameterMap.get("fcity"));*/
            }
            if (parameterMap.get("filter_LIKES_fhetongno") != null && !parameterMap.get("filter_LIKES_fhetongno").equals("")) {
                hql.append(" and b.fhetongno like '%"
                        + parameterMap.get("filter_LIKES_fhetongno") + "%' ");
            }
            if (parameterMap.get("filter_LIKES_fhtname") != null && !parameterMap.get("filter_LIKES_fhtname").equals("")) {
                hql.append(" and b.fhtname like '%"
                        + parameterMap.get("filter_LIKES_fhtname") + "%' ");
            }
            if (parameterMap.get("filter_LIKES_ftotalMoney") != null && !parameterMap.get("filter_LIKES_ftotalMoney").equals("")) {
                hql.append(" and b.ftotalMoney like '%"
                        + parameterMap.get("filter_LIKES_ftotalMoney") + "%' ");
            }
            if (parameterMap.get("filter_GTN_fjianlifei") != null && !parameterMap.get("filter_GTN_fjianlifei").equals("")) {
                hql.append(" and b.fjianlifei>"
                        + parameterMap.get("filter_GTN_fjianlifei") + " ");
            }
            if (parameterMap.get("filter_LTN_fjianlifei") != null && !parameterMap.get("filter_LTN_fjianlifei").equals("")) {
                hql.append(" and b.fjianlifei<"
                        + parameterMap.get("filter_LTN_fjianlifei") + " ");
            }
            if (parameterMap.get("filter_GTD_fstartdate") != null && !parameterMap.get("filter_GTD_fstartdate").equals("")) {
                hql.append(" and b.fjianlifei>'"
                        + parameterMap.get("filter_GTD_fstartdate") + "' ");
            }
            if (parameterMap.get("filter_LTD_fstartdate") != null && !parameterMap.get("filter_LTD_fstartdate").equals("")) {
                hql.append(" and b.fjianlifei<'"
                        + parameterMap.get("filter_LTD_fstartdate") + "' ");
            }
            if (parameterMap.get("filter_LIKES_fmemo4") != null && !parameterMap.get("filter_LIKES_fmemo4").equals("")) {
                hql.append(" and b.fmemo4 like '%"
                        + parameterMap.get("filter_LIKES_fmemo4") + "%' ");
            }
            if (parameterMap.get("filter_LIKES_fjsstate") != null && !parameterMap.get("filter_LIKES_fjsstate").equals("")) {
                hql.append(" and b.fjsstate like '%"
                        + parameterMap.get("filter_LIKES_fjsstate") + "%' ");
            }
            parameterMap.clear();
        } else {
            if (parameterMap.get("fprovince") != null && !parameterMap.get("fprovince").equals("")) {
                /*hql.append(" and b.fprovince = '"
                        + parameterMap.get("fprovince") + "' ");*/
                parameterMap.put("filter_LIKES_fprovince", parameterMap.get("fprovince"));
            }
            if (parameterMap.get("fcity") != null && !parameterMap.get("fcity").equals("")) {
                /*hql.append(" and b.fcity = '"
						+ parameterMap.get("fcity") + "' ");*/
                parameterMap.put("filter_LIKES_fcity", parameterMap.get("fcity"));
            }
            parameterMap.put("filter_EQS_fisf", "0");
            parameterMap.put("filter_EQS_fqiandingstatus", state);
            parameterMap.remove("filter_LIKES_ffzrname");
            parameterMap.remove("fprovince");
            parameterMap.remove("fcity");
        }
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page.setOrderBy("fhetongno");

        if (zrnameBoolean) {
            page = commHtManager.pagedQuery(hql.toString(), page, propertyFilters);
        } else
            page = commHtManager.pagedQuery(page, propertyFilters);
        //去除科学计数法
        ArrayList<CommHt> arr = (ArrayList<CommHt>) page.getResult();
        for (CommHt ht : arr) {
            Double ztz = ht.getFjianlifei();
            if (ztz != null) {
                NumberFormat nf = java.text.NumberFormat.getInstance();
                nf.setGroupingUsed(false);
                String a = nf.format(ztz);
                ht.setFmemo1(a);
            }
        }
        model.addAttribute("page", page);
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        model.addAttribute("state", state);

        return "cw/commHt-info-list";
    }

    @RequestMapping("cw-commHt-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
                        Model model) {
        if (id != null) {
            CommHt commHt = commHtManager.get(id);
            //去除科学计数法
            Double ztz = commHt.getFjianlifei();
            if (ztz != null) {
                NumberFormat nf = java.text.NumberFormat.getInstance();
                nf.setGroupingUsed(false);
                String a = nf.format(ztz);
                commHt.setFmemo1(a);
            }
            model.addAttribute("model", commHt);
        }
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "cw/commHt-info-input";
    }

    @RequestMapping("cw-commHt-info-inputFromTask")
    public String inputFromTask(@RequestParam(value = "taskId", required = false) String taskId,
                                Model model) {
        model.addAttribute("model", commHtManager.loadBzj(taskId));
        model.addAttribute("xmMap", PjXmMapUtil.getXmMap());
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        model.addAttribute("taskId", taskId);
        return "cw/commHt-info-inputFromTask";
    }


    @RequestMapping("cw-commHt-info-saveForTask")
    public String saveForTask(@ModelAttribute CommHt commHt, @RequestParam(value = "taskId", required = false) String taskId,
                              @RequestParam Map<String, Object> parameterMap,
                              RedirectAttributes redirectAttributes) {

        commHt.setFqiandingstatus("5");
        commHt.setFcwstatus("已确认");
        xzZjDxlistManager.mysave(commHt);
        commHtManager.dealBzj(commHt, taskId);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/cw/cw-commHt-info-list.do?state=5";
    }


    @RequestMapping("cw-commHt-info-save")
    public String save(@ModelAttribute CommHt commHt,
                       @RequestParam Map<String, Object> parameterMap,
                       RedirectAttributes redirectAttributes) {
        CommHt dest = null;

        Long id = commHt.getFid();

        if (id != null) {
            dest = commHtManager.get(id);
            String oldStatus = dest.getFqiandingstatus();
            beanMapper.copy(commHt, dest);

            dest.setFisf("0");
//            if(dest.getFqiandingstatus().equals("5")&&!oldStatus.equals("5")){
//            	 commHtManager.saveAndStartWorkFlow(dest);
//            }else{
//            	 commHtManager.save(dest);
//            }
            commHtManager.save(dest);

        } else {
            dest = commHt;
            dest.setFisf("0");
            commHtManager.save(dest);
        }

        // 生成XzZjDxlist数据
        xzZjDxlistManager.mysave(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/cw/cw-commHt-info-list.do?state=" + dest.getFqiandingstatus();
    }


    @RequestMapping("cw-commHt-info-saveinput")
    public String saveinput(@ModelAttribute CommHt commHt,
                            @RequestParam Map<String, Object> parameterMap,
                            RedirectAttributes redirectAttributes) {
        CommHt dest = null;

        Long id = commHt.getFid();

        if (id != null) {
            dest = commHtManager.get(id);
            beanMapper.copy(commHt, dest);
        } else {
            dest = commHt;
        }
        dest.setFisf("0");
        commHtManager.mysave(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "cw/commHt-info-input";
    }

    @RequestMapping("cw-commHt-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
                         RedirectAttributes redirectAttributes) {
        List<CommHt> commHts = commHtManager.findByIds(selectedItem);

        commHtManager.removeAll(commHts);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/cw/cw-commHt-info-list.do?state=5";
    }

    @RequestMapping("cw-commHt-info-export")
    public void export(@ModelAttribute Page page,
                       @RequestParam Map<String, Object> parameterMap,
                       HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = commHtManager.pagedQuery(page, propertyFilters);

        List<CommHt> commHts = (List<CommHt>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("commHt info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(commHts);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setCommHtManager(CommHtManager commHtManager) {
        this.commHtManager = commHtManager;
    }

    @Resource
    public void setXzZjDxlistManager(XzZjDxlistManager xzZjDxlistManager) {
        this.xzZjDxlistManager = xzZjDxlistManager;
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
