package com.xthena.hr.web;

import com.xthena.api.user.UserConnector;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;
import com.xthena.hr.domain.HrRyZj;
import com.xthena.hr.domain.HrZhengjianinfoEntity;
import com.xthena.hr.manager.CommRyManager;
import com.xthena.hr.manager.HrRyZjManager;
import com.xthena.hr.manager.HrZhengjianinfoManager;
import com.xthena.jl.domain.JlFujian;
import com.xthena.jl.manager.JlFujianManager;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.JsonResponseUtil;
import com.xthena.xz.manager.XzZjDxlistManager;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//import com.xthena.jl.domain.JlFujianArray;

@Controller
@RequestMapping("hr")
public class HrRyZjController {
    @Autowired
    private CommRyManager commRyManager;
    private HrRyZjManager hrRyZjManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private JlFujianManager jlFujianManager;

    @Autowired
    private XzZjDxlistManager xzZjDxlistManager;

    @Autowired
    private HrZhengjianinfoManager hrZhengjianinfoManager;

    @ResponseBody
    @RequestMapping("hrRyZj-info-list")
    public Object list(@ModelAttribute Page page, @RequestParam(value = "ryid", required = false) Long ryid,
                       @RequestParam Map<String, Object> parameterMap, Model model, HttpServletResponse response) {


        // 根据人员姓名查询
        StringBuffer hql = new StringBuffer("select ys from CommRy ry,HrRyZj ys  where ry.fid=ys.userid");
        if (ryid != null) {
            hql.append(" and ry.fid=" + ryid);
        } else if (parameterMap.get("filter_LIKES_name") != null && !parameterMap.get("filter_LIKES_name").equals("")) {
            hql.append(" and ry.fname like '%" + parameterMap.get("filter_LIKES_name") + "%' ");
        }

        if (parameterMap.get("filter_GTD_fyxjs") != null && !parameterMap.get("filter_GTD_fyxjs").equals("")) {
            hql.append(" and  ys.fyxjs>= '" + String.valueOf(parameterMap.get("filter_GTD_fyxjs")) + "'");
        }
        if (parameterMap.get("filter_LTD_fyxjs") != null && !parameterMap.get("filter_LTD_fyxjs").equals("")) {
            hql.append(" and  ys.fyxjs<='" + String.valueOf(parameterMap.get("filter_LTD_fyxjs")) + "'");
        }
        if (parameterMap.get("filter_LIKES_fname") != null && !parameterMap.get("filter_LIKES_fname").equals("")) {
            String inviocecode = parameterMap.get("filter_LIKES_fname").toString();
            hql.append(" and  ys.fname like '%" + inviocecode + "%'");
        }
        if (parameterMap.get("filter_LIKES_fzhuanye") != null && !parameterMap.get("filter_LIKES_fzhuanye").equals("")) {
            String fzhuanye = parameterMap.get("filter_LIKES_fzhuanye").toString();
            hql.append(" and  ys.fzhuanye like '%" + fzhuanye + "%'");
        }
        if (parameterMap.get("filter_LIKES_fzhengjianno") != null && !parameterMap.get("filter_LIKES_fzhengjianno").equals("")) {
            String fzhengjianno = parameterMap.get("filter_LIKES_fzhengjianno").toString();
            hql.append(" and  ys.fzhengjianno like '%" + fzhengjianno + "%'");
        }
        hql.append(" order by  ry.fname,ys.fname");

        parameterMap.clear();
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        List result = hrRyZjManager.find(hql.toString());

        page.setTotalCount(result.size());
        page.setResult(result);
        model.addAttribute("page", page);
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

        return result;
    }


    @RequestMapping("hrRyZj-treelist")
    public String treelist(@ModelAttribute Page page,
                           @RequestParam Map<String, Object> parameterMap, Model model) {

        //	StringBuffer hql1 = new StringBuffer("select ry from CommRy ry,HrRyZj ys  where ry.fid=ys.userid");
        // 根据人员姓名查询
        StringBuffer hql = new StringBuffer("select DISTINCT ry from CommRy ry,HrRyZj ys  where ry.fid=ys.userid");//
        if (parameterMap.get("filter_LIKES_name") != null && !parameterMap.get("filter_LIKES_name").equals("")) {
            hql.append(" and ry.fname like '%" + parameterMap.get("filter_LIKES_name") + "%' ");
        }

        if (parameterMap.get("filter_GTD_fyxjs") != null && !parameterMap.get("filter_GTD_fyxjs").equals("")) {
            hql.append(" and  ys.fyxjs>= '" + String.valueOf(parameterMap.get("filter_GTD_fyxjs")) + "'");
        }
        if (parameterMap.get("filter_LTD_fyxjs") != null && !parameterMap.get("filter_LTD_fyxjs").equals("")) {
            hql.append(" and  ys.fyxjs<='" + String.valueOf(parameterMap.get("filter_LTD_fyxjs")) + "'");
        }
        if (parameterMap.get("filter_LIKES_fname") != null && !parameterMap.get("filter_LIKES_fname").equals("")) {
            String inviocecode = parameterMap.get("filter_LIKES_fname").toString();
            hql.append(" and  ys.fname like '%" + inviocecode + "%'");
        }
        if (parameterMap.get("filter_LIKES_fzhuanye") != null && !parameterMap.get("filter_LIKES_fzhuanye").equals("")) {
            String fzhuanye = parameterMap.get("filter_LIKES_fzhuanye").toString();
            hql.append(" and  ys.fzhuanye like '%" + fzhuanye + "%'");
        }
        if (parameterMap.get("filter_LIKES_fzhengjianno") != null && !parameterMap.get("filter_LIKES_fzhengjianno").equals("")) {
            String fzhengjianno = parameterMap.get("filter_LIKES_fzhengjianno").toString();
            hql.append(" and  ys.fzhengjianno like '%" + fzhengjianno + "%'");
        }
        page = commRyManager.pagedQuery(hql.toString(), page.getPageNo(), page.getPageSize());


        hql = new StringBuffer("select count(ry) from CommRy ry,HrRyZj ys  where ry.fid=ys.userid");//

        if (parameterMap.get("filter_LIKES_name") != null && !parameterMap.get("filter_LIKES_name").equals("")) {
            hql.append(" and ry.fname like '%" + parameterMap.get("filter_LIKES_name") + "%' ");
        }

        if (parameterMap.get("filter_GTD_fyxjs") != null && !parameterMap.get("filter_GTD_fyxjs").equals("")) {
            hql.append(" and  ys.fyxjs>= '" + String.valueOf(parameterMap.get("filter_GTD_fyxjs")) + "'");
        }
        if (parameterMap.get("filter_LTD_fyxjs") != null && !parameterMap.get("filter_LTD_fyxjs").equals("")) {
            hql.append(" and  ys.fyxjs<='" + String.valueOf(parameterMap.get("filter_LTD_fyxjs")) + "'");
        }
        if (parameterMap.get("filter_LIKES_fname") != null && !parameterMap.get("filter_LIKES_fname").equals("")) {
            String inviocecode = parameterMap.get("filter_LIKES_fname").toString();
            hql.append(" and  ys.fname like '%" + inviocecode + "%'");
        }
        if (parameterMap.get("filter_LIKES_fzhuanye") != null && !parameterMap.get("filter_LIKES_fzhuanye").equals("")) {
            String fzhuanye = parameterMap.get("filter_LIKES_fzhuanye").toString();
            hql.append(" and  ys.fzhuanye like '%" + fzhuanye + "%'");
        }
        if (parameterMap.get("filter_LIKES_fzhengjianno") != null && !parameterMap.get("filter_LIKES_fzhengjianno").equals("")) {
            String fzhengjianno = parameterMap.get("filter_LIKES_fzhengjianno").toString();
            hql.append(" and  ys.fzhengjianno like '%" + fzhengjianno + "%'");
        }

        hql.append(" group by ry.fid ");


        List result = commRyManager.find(hql.toString());
        page.setTotalCount(result.size());


        // 下拉证书菜单
        List<HrZhengjianinfoEntity> zhengjianinfoEntities = hrZhengjianinfoManager.getAll();
        List<HashMap<String, Object>> deptList = new ArrayList<HashMap<String, Object>>();
        for (HrZhengjianinfoEntity zhengjianinfoEntity : zhengjianinfoEntities) {
            HashMap<String, Object> hashMap = new HashMap<String, Object>();
            hashMap.put("fid", zhengjianinfoEntity.getFid());
            hashMap.put("fname", zhengjianinfoEntity.getFname());
            deptList.add(hashMap);
        }

        model.addAttribute("zjInfos", deptList);

        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        model.addAttribute("page", page);
        model.addAttribute("hql", hql.toString());
        return "hr/hrRyZj-info-list";
    }

    @RequestMapping("hrRyZj-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id, @RequestParam(value = "ryid", required = false) Long ryid,
                        Model model) {
        if (id != null) {
            HrRyZj hrPzRy = hrRyZjManager.get(id);
            model.addAttribute("model", hrPzRy);
        }
        if (ryid != null) {
			/*List<HrRyZj> hrLdhts = hrRyZjManager.findBy("userid", ryid);
			if (!hrLdhts.isEmpty()) {
				hrLdhts.get(0).setUserid(ryid);
				model.addAttribute("model", hrLdhts.get(0));
			} else {*/
            HrRyZj hrLdht = new HrRyZj();
            hrLdht.setUserid(ryid);
            model.addAttribute("model", hrLdht);
        }

        // 下拉证书菜单
        List<HrZhengjianinfoEntity> zhengjianinfoEntities = hrZhengjianinfoManager.getAll();
        List<HashMap<String, Object>> deptList = new ArrayList<HashMap<String, Object>>();
        for (HrZhengjianinfoEntity zhengjianinfoEntity : zhengjianinfoEntities) {
            HashMap<String, Object> hashMap = new HashMap<String, Object>();
            hashMap.put("fid", zhengjianinfoEntity.getFid());
            hashMap.put("fname", zhengjianinfoEntity.getFname());
            deptList.add(hashMap);
        }

        model.addAttribute("zjInfos", deptList);
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        return "hr/hrRyZj-info-input";
    }

    @RequestMapping("hrRyZj-info-save")
    public String save(@ModelAttribute HrRyZj hrRyZj,
                       @RequestParam Map<String, Object> parameterMap,
                       RedirectAttributes redirectAttributes, Model model) {
        HrRyZj dest = null;

        Long id = hrRyZj.getFid();
        if (id != null) {
            dest = hrRyZjManager.get(id);
            beanMapper.copy(hrRyZj, dest);
        } else {
            dest = hrRyZj;
        }

        hrRyZjManager.mysave(dest);
        // model.addAttribute("model", dest);
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/hr/hrRyZj-info-input.do?id=" + dest.getFid();
    }

    @RequestMapping("hrRyZj-info-saveAndNew")
    public String saveAndNew(@ModelAttribute HrRyZj hrRyZj,
                             @RequestParam Map<String, Object> parameterMap,
                             RedirectAttributes redirectAttributes, Model model) {
        HrRyZj dest = null;

        Long id = hrRyZj.getFid();
        if (id != null) {
            dest = hrRyZjManager.get(id);
            beanMapper.copy(hrRyZj, dest);
        } else {
            dest = hrRyZj;
        }

        hrRyZjManager.save(dest);
        //model.addAttribute("model", dest);
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        messageHelper.addFlashMessage(redirectAttributes, "core.success.saveAndNew",
                "保存成功");

        return "redirect:/hr/hrRyZj-info-input.do?ryid=" + dest.getUserid();
    }


    @RequestMapping("saveZjScan")
    public void saveZjScan(@RequestParam("zjId") Long zjid, @RequestParam("jlFujians") String fujians, HttpServletResponse response) {

        JSONArray jsonArray = JSONArray.fromObject(fujians);

        for (int i = 0; i < jsonArray.size(); i++) {
            JlFujian jlFujian = new JlFujian();
            jlFujian.setFname(jsonArray.getJSONObject(i).getString("fname"));
            jlFujian.setFurl(jsonArray.getJSONObject(i).getString("furl"));
            jlFujian.setFmainid(zjid);
            jlFujian.setFtablename("t_hr_ry_zj");
            jlFujianManager.save(jlFujian);
        }

        JsonResponseUtil.write(response, "ok");
    }


    @RequestMapping("deleteImg")
    public void deleteImg(@RequestParam("fjId") Long fjId, HttpServletResponse response) {
        jlFujianManager.removeById(fjId);
        JsonResponseUtil.write(response, "ok");
    }


    @RequestMapping("hrRyZj-info-remove")
    @ResponseBody
    public String remove(@ModelAttribute HrRyZj hrRyZj,
                         RedirectAttributes redirectAttributes, HttpServletRequest request) {

        String[] selectitems = request.getParameter("selecteditems").split("@");

        List<Long> Selectedlist = new ArrayList<>();

        for (int i = 0; i < selectitems.length; i++) {
            Long cur = Long.parseLong(selectitems[i]);
            Selectedlist.add(cur);
        }

        List<HrRyZj> hrRyZjs = hrRyZjManager.findByIds(Selectedlist);
        hrRyZjManager.removeAll(hrRyZjs);
        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return null;
        //return "redirect:/hr/hrRyZj-info-list";
    }

    @RequestMapping("hrRyZj-info-export")
    public void export(@ModelAttribute Page page,
                       @RequestParam Map<String, Object> parameterMap,
                       HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = hrRyZjManager.pagedQuery(page, propertyFilters);

        List<HrRyZj> hrRyZjs = (List<HrRyZj>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("hrRyZj info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(hrRyZjs);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setHrRyZjManager(HrRyZjManager hrRyZjManager) {
        this.hrRyZjManager = hrRyZjManager;
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
