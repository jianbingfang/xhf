package com.xthena.xz.web;

import com.xthena.api.user.UserConnector;
import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;
import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;
import com.xthena.hr.manager.HrRyZjManager;
import com.xthena.sckf.manager.CommHtManager;
import com.xthena.util.CommRyMapUtil;
import com.xthena.util.JsonResponseUtil;
import com.xthena.util.JyXmMapUtil;
import com.xthena.xz.domain.XzZjDxlist;
import com.xthena.xz.domain.XzZjOrder;
import com.xthena.xz.domain.XzZjOrderGroup;
import com.xthena.xz.domain.XzZjOrderList;
import com.xthena.xz.manager.*;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("xz")
public class XzZjOrderController {
    private XzZjOrderManager xzZjOrderManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @Autowired
    private XzZjManager xzZjManager;

    @Autowired
    private HrRyZjManager hrRyZjManager;

    @Autowired
    private XzRyzsManager xzRyzsManager;

    @Autowired
    private CommHtManager commHtManager;

    @Autowired
    private XzJgysbgManager xzJgysbgManager;

    @Autowired
    private XzZbtzsManager xzZbtzsManager;

    @Autowired
    private XzZjOrderListManager xzZjOrderListManager;

    @Autowired
    private XzZjDxlistManager xzzjDxlistManager;

    @RequestMapping("xzZjOrder-info-list")
    public String list(@ModelAttribute Page page,
                       @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzZjOrderManager.pagedQuery(page, propertyFilters);

        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        model.addAttribute("xmMap", JyXmMapUtil.getXmMap());
        model.addAttribute("page", page);

        return "xz/xzZjOrder-info-list";
    }

    @InitBinder("xzZjOrder.")
    public void setBinderZjOrder(WebDataBinder webDataBinder) {
        webDataBinder.setFieldDefaultPrefix("xzZjOrder.");
    }

    @InitBinder("fzjlist.")
    public void setBinderFzjList(WebDataBinder webDataBinder) {
        webDataBinder.setFieldDefaultPrefix("fzjlist.");
    }

    @RequestMapping("xzZjOrder-info-save-ajax")
    @ResponseBody
    public void ajaxSave(@ModelAttribute XzZjOrderGroup xzZjOrderGroup, HttpServletResponse response,
                         @RequestParam Map<String, Object> parameterMap, Model model) {
        JsonResponseUtil.write(response, xzZjOrderManager.saveOrderAndList(xzZjOrderGroup));
        /*xzZjOrderManager.saveOrderAndList(xzZjOrderGroup);

		return "xz/xzZjOrder-info-list";*/
    }

    @RequestMapping("xzZjOrder-info-delete-ajax")
    public void xzZjOrderDelete(
            @RequestParam(value = "fid", required = false) long fid,
            HttpServletResponse response) {
        xzZjOrderListManager.removeById(fid);
        JsonResponseUtil.write(response, "ok");
    }

    @RequestMapping("xzZjOrder-info-search-ajax")
    public void ajaxSearch(
            @ModelAttribute Page page,
            @RequestParam(value = "startTime", required = false) Date startTime,
            @RequestParam(value = "endTime", required = false) Date endTime,
            @RequestParam(value = "pageSize", required = false) int pageSize,
            @RequestParam(value = "pageNo", required = false) int pageNo,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response, Model model) {
        String type = String.valueOf(parameterMap.get("type"));
        Map<String, Object> filerMap = new HashMap<String, Object>();
        List<HashMap<String, Object>> responseMapList = new ArrayList<HashMap<String, Object>>();
        List resultList = null;
        String hql = null;
        // page.setPageSize(20);
        if (type.equals("1")) {

            hql = " select xzZjDxlist ,(case when exists(select 1 from XzZjOrder zjO,XzZjOrderList zjOl where zjOl.forderid=zjO.fid and" +
                    "((zjO.fstarttime between '" + startTime + "' and '" + endTime + "' ) or (zjO.fendtime between '" + startTime + "' and '" + endTime + "')) " +
                    " and (zjO.fstatus ='已申请' or zjO.fstatus ='已领取') " +
                    " and xzZjDxlist.fid=zjOl.fzjid) then 1 else 0 end) as forderstatus  " +
                    " from XzZj xzzj,XzZjDxlist xzZjDxlist where xzZjDxlist.fzjid=xzzj.fid and xzZjDxlist.ftype=1  ";

            if (parameterMap.get("fname") != null && !String.valueOf(parameterMap.get("fname")).trim().equals("") && String.valueOf(parameterMap.get("fname")).equalsIgnoreCase(("undefined"))) {
                hql += " and xzzj.fname like '%" + String.valueOf(parameterMap.get("fname")) + "%'";
            }

            // page=  xzZjManager.pagedQuery(hql,page.getPageNo(),page.getPageSize());
            // resultList=  xzZjManager.find(hql);
        } else if (type.equals("2")) {

            hql = "select xzZjDxlist ,( case when exists(select 1 from XzZjOrder zjO,XzZjOrderList zjOl where zjOl.forderid=zjO.fid and" +
                    "((zjO.fstarttime between '" + startTime + "' and '" + endTime + "' ) or (zjO.fendtime between '" + startTime + "' and '" + endTime + "')) " +
                    " and (zjO.fstatus ='已申请' or zjO.fstatus ='已领取') " +
                    " and xzZjDxlist.fid=zjOl.fzjid) then 1 else 0 end) as forderstatus  from HrRyZj aa,CommRy ry,XzZjDxlist xzZjDxlist where xzZjDxlist.fzjid=aa.fid and xzZjDxlist.ftype=2 and aa.userid=ry.fid ";

            if (parameterMap.get("fname") != null && !String.valueOf(parameterMap.get("fname")).trim().equals("") && !String.valueOf(parameterMap.get("fname")).equalsIgnoreCase(("undefined"))) {
                hql += " and ry.fname like '%" + String.valueOf(parameterMap.get("fname")) + "%'";
            }
            if (parameterMap.get("filter_LIKES_fname") != null && !String.valueOf(parameterMap.get("filter_LIKES_fname")).trim().equals("") && !String.valueOf(parameterMap.get("filter_LIKES_fname")).equalsIgnoreCase(("undefined"))) {
                hql += " and aa.fname = '" + String.valueOf(parameterMap.get("filter_LIKES_fname")) + "'";
            }
            if (parameterMap.get("filter_EQS_fzhuanye") != null && !String.valueOf(parameterMap.get("filter_EQS_fzhuanye")).trim().equals("") && !String.valueOf(parameterMap.get("filter_EQS_fzhuanye")).equalsIgnoreCase(("undefined"))) {
                hql += " and ry.fzhuanye = '" + String.valueOf(parameterMap.get("filter_EQS_fzhuanye")) + "'";
            }

            if (parameterMap.get("fagestart") != null && !String.valueOf(parameterMap.get("fagestart")).trim().equals("") && !String.valueOf(parameterMap.get("fagestart")).equalsIgnoreCase(("undefined"))) {
                Calendar c = Calendar.getInstance();
                c.set(c.get(Calendar.YEAR), 0, 0, 0, 0, 0);
                int birYeay = -(Integer.valueOf(String.valueOf(parameterMap.get("fagestart"))));
                c.add(Calendar.YEAR, birYeay);
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                hql += " and ry.fbirdate < '" + sdf.format(c.getTime()) + "' ";
                // paramList.add(c.getTime());
            }

            if (parameterMap.get("fageend") != null && !String.valueOf(parameterMap.get("fageend")).trim().equals("") && !String.valueOf(parameterMap.get("fageend")).equalsIgnoreCase(("undefined"))) {
                Calendar c = Calendar.getInstance();
                c.set(c.get(Calendar.YEAR), 0, 0, 0, 0, 0);
                int birYeay = -(Integer.valueOf(String.valueOf(parameterMap.get("fageend"))));
                c.add(Calendar.YEAR, birYeay);
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                hql += " and ry.fbirdate > '" + sdf.format(c.getTime()) + "' ";
            }
            if (parameterMap.get("fbydatestart") != null && !String.valueOf(parameterMap.get("fbydatestart")).trim().equals("") && !String.valueOf(parameterMap.get("fbydatestart")).equalsIgnoreCase(("undefined"))) {
                hql += " and ry.fbydate > '" + parameterMap.get("fbydatestart") + "'";
            }
            if (parameterMap.get("fbydateend") != null && !String.valueOf(parameterMap.get("fbydateend")).trim().equals("") && !String.valueOf(parameterMap.get("fbydateend")).equalsIgnoreCase(("undefined"))) {
                hql += " and ry.fbydate < '" + parameterMap.get("fbydateend") + "'";
            }
            if (parameterMap.get("filter_EQS_flevel") != null && !String.valueOf(parameterMap.get("filter_EQS_flevel")).trim().equals("") && !String.valueOf(parameterMap.get("filter_EQS_flevel")).equalsIgnoreCase(("undefined"))) {
                hql += " and aa.fname like '%" + String.valueOf(parameterMap.get("filter_EQS_flevel")) + "%'";
            }

            if (parameterMap.get("commRy-zicheng_zhuanye") != null && !String.valueOf(parameterMap.get("commRy-zicheng_zhuanye")).trim().equals("") && String.valueOf(parameterMap.get("commRy-zicheng_zhuanye")).equalsIgnoreCase(("undefined"))) {
                hql += " and xzzj.fname like '%" + String.valueOf(parameterMap.get("fname")) + "%'";
            }

        } else if (type.equals("3")) {

            hql = "select xzZjDxlist,( case when exists(select 1 from XzZjOrder zjO,XzZjOrderList zjOl where zjOl.forderid=zjO.fid and" +
                    "((zjO.fstarttime between '" + startTime + "' and '" + endTime + "' ) or (zjO.fendtime between '" + startTime + "' and '" + endTime + "')) " +
                    "  and (zjO.fstatus ='已申请' or zjO.fstatus ='已领取') " +
                    " and xzZjDxlist.fid=zjOl.fzjid) then 1 else 0 end) as forderstatus  from XzRyzs xzRyzs,XzZjDxlist xzZjDxlist,CommRy ry where xzRyzs.fhuojiangr=ry.fid and xzZjDxlist.fzjid=xzRyzs.fid and xzZjDxlist.ftype=3 ";

            if (parameterMap.get("fname") != null && !String.valueOf(parameterMap.get("fname")).trim().equals("") && !String.valueOf(parameterMap.get("fname")).equalsIgnoreCase(("undefined"))) {
                hql += " and (xzRyzs.ftype like '%" + String.valueOf(parameterMap.get("fname")) + "%' or xzRyzs.fhjname like '%" + String.valueOf(parameterMap.get("fname")) + "%')";
            }

	      	  
	      	  /*if(parameterMap.get("ftype")!=null&&!String.valueOf(parameterMap.get("ftype")).trim().equals("")&&!String.valueOf(parameterMap.get("ftype")).equalsIgnoreCase(("undefined"))){
                    hql+=" and (xzRyzs.ftype like '%"+String.valueOf(parameterMap.get("fname"))+"%' )";
	      	  }
	      	  */

            if (parameterMap.get("fxm") != null && !String.valueOf(parameterMap.get("fxm")).trim().equals("") && !String.valueOf(parameterMap.get("fxm")).equalsIgnoreCase(("undefined"))) {
                hql += " and (xzRyzs.fhjname like '%" + String.valueOf(parameterMap.get("fxm")) + "%' )";
            }


            if (parameterMap.get("fzj") != null && !String.valueOf(parameterMap.get("fzj")).trim().equals("") && !String.valueOf(parameterMap.get("fzj")).equalsIgnoreCase(("undefined"))) {
                hql += " and (ry.fname like '%" + String.valueOf(parameterMap.get("fzj")) + "%')";
            }


            if (parameterMap.get("fyear") != null && !String.valueOf(parameterMap.get("fyear")).trim().equals("") && !String.valueOf(parameterMap.get("fyear")).equalsIgnoreCase(("undefined"))) {
                hql += " and (xzRyzs.fyear like '%" + String.valueOf(parameterMap.get("fyear")) + "%')";
            }


        } else if (type.equals("4")) {

            hql = "select xzZjDxlist ,( case when exists(select 1 from XzZjOrder zjO,XzZjOrderList zjOl where zjOl.forderid=zjO.fid and" +
                    "((zjO.fstarttime between '" + startTime + "' and '" + endTime + "' ) or (zjO.fendtime between '" + startTime + "' and '" + endTime + "')) " +
                    " and (zjO.fstatus ='已申请' or zjO.fstatus ='已领取') " +
                    " and xzZjDxlist.fid=zjOl.fzjid) then 1 else 0 end) as forderstatus from CommHt commht,CommRy ry,XzZjDxlist xzZjDxlist "
                    + " where xzZjDxlist.fzjid=commht.fid and xzZjDxlist.ftype=4 and commht.fzongjian=ry.fid ";

            if (parameterMap.get("fname") != null && !String.valueOf(parameterMap.get("fname")).trim().equals("") && !String.valueOf(parameterMap.get("fname")).equalsIgnoreCase(("undefined"))) {
                hql += " and commht.fhtname like '%" + String.valueOf(parameterMap.get("fname")) + "%'";
            }

            if (parameterMap.get("ftouzistart") != null && !String.valueOf(parameterMap.get("ftouzistart")).trim().equals("") && !String.valueOf(parameterMap.get("ftouzistart")).equalsIgnoreCase(("undefined"))) {
                hql += " and commht.ftotalMoney >= " + String.valueOf(parameterMap.get("ftouzistart"));
            }

            if (parameterMap.get("ftouziend") != null && !String.valueOf(parameterMap.get("ftouziend")).trim().equals("") && !String.valueOf(parameterMap.get("ftouziend")).equalsIgnoreCase(("undefined"))) {
                hql += " and commht.ftotalMoney <= " + String.valueOf(parameterMap.get("ftouziend"));
            }


            if (parameterMap.get("fjianlifeistart") != null && !String.valueOf(parameterMap.get("fjianlifeistart")).trim().equals("") && !String.valueOf(parameterMap.get("fjianlifeistart")).equalsIgnoreCase(("undefined"))) {
                hql += " and commht.fjianlifei >= " + String.valueOf(parameterMap.get("fjianlifeistart"));
            }

            if (parameterMap.get("fjianlifeiend") != null && !String.valueOf(parameterMap.get("fjianlifeiend")).trim().equals("") && !String.valueOf(parameterMap.get("fjianlifeiend")).equalsIgnoreCase(("undefined"))) {
                hql += " and commht.fjianlifei <= " + String.valueOf(parameterMap.get("fjianlifeiend"));
            }


            if (parameterMap.get("fzjName") != null && !String.valueOf(parameterMap.get("fzjName")).trim().equals("") && !String.valueOf(parameterMap.get("fzjName")).equalsIgnoreCase(("undefined"))) {
                hql += " and ry.fname like '%" + String.valueOf(parameterMap.get("fzjName")) + "%'";
            }

            if (parameterMap.get("fkaigongstart") != null && !String.valueOf(parameterMap.get("fkaigongstart")).trim().equals("") && !String.valueOf(parameterMap.get("fkaigongstart")).equalsIgnoreCase(("undefined"))) {
                hql += " and commht.fstartdate >= '" + String.valueOf(parameterMap.get("fkaigongstart")) + "'";
            }

            if (parameterMap.get("fkaigongend") != null && !String.valueOf(parameterMap.get("fkaigongend")).trim().equals("") && !String.valueOf(parameterMap.get("fkaigongend")).equalsIgnoreCase(("undefined"))) {
                hql += " and commht.fstartdate <= '" + String.valueOf(parameterMap.get("fkaigongend")) + "'";
            }

            if (parameterMap.get("fjungongstart") != null && !String.valueOf(parameterMap.get("fjungongstart")).trim().equals("") && !String.valueOf(parameterMap.get("fjungongstart")).equalsIgnoreCase(("undefined"))) {
                hql += " and commht.fenddate >= '" + String.valueOf(parameterMap.get("fjungongstart")) + "'";
            }

            if (parameterMap.get("fjungongend") != null && !String.valueOf(parameterMap.get("fjungongend")).trim().equals("") && !String.valueOf(parameterMap.get("fjungongend")).equalsIgnoreCase(("undefined"))) {
                hql += " and commht.fenddate <= '" + String.valueOf(parameterMap.get("fjungongend")) + "'";
            }

            if (parameterMap.get("fprojecttype") != null && !String.valueOf(parameterMap.get("fprojecttype")).trim().equals("") && !String.valueOf(parameterMap.get("fprojecttype")).equalsIgnoreCase(("undefined"))) {
                hql += " and commht.fprojecttype = '" + String.valueOf(parameterMap.get("fprojecttype")) + "'";
            }

        } else if (type.equals("5")) {
            hql = "select xzZjDxlist,( case when exists(select 1 from XzZjOrder zjO,XzZjOrderList zjOl where zjOl.forderid=zjO.fid and" +
                    "((zjO.fstarttime between '" + startTime + "' and '" + endTime + "' ) or (zjO.fendtime between '" + startTime + "' and '" + endTime + "')) " +
                    "  and (zjO.fstatus ='已申请' or zjO.fstatus ='已领取') " +
                    " and xzZjDxlist.fid=zjOl.fzjid) then 1 else 0 end) as forderstatus  from XzZbtzs xzZbtzs,CommRy ry,XzZjDxlist xzZjDxlist where xzZjDxlist.fzjid=xzZbtzs.fid and xzZjDxlist.ftype=5 and xzZbtzs.fzongjian=ry.fid ";

            if (parameterMap.get("fname") != null && !String.valueOf(parameterMap.get("fname")).trim().equals("") && !String.valueOf(parameterMap.get("fname")).equalsIgnoreCase(("undefined"))) {
                hql += " and xzZbtzs.fxmname like '%" + String.valueOf(parameterMap.get("fname")) + "%'";
            }

            if (parameterMap.get("fzj") != null && !String.valueOf(parameterMap.get("fzj")).trim().equals("") && !String.valueOf(parameterMap.get("fzj")).equalsIgnoreCase(("undefined"))) {
                hql += " and (ry.fname like '%" + String.valueOf(parameterMap.get("fzj")) + "%')";
            }


        } else if (type.equals("6")) {
            hql = "select xzZjDxlist,( case when exists(select 1 from XzZjOrder zjO,XzZjOrderList zjOl where zjOl.forderid=zjO.fid and" +
                    "((zjO.fstarttime between '" + startTime + "' and '" + endTime + "' ) or (zjO.fendtime between '" + startTime + "' and '" + endTime + "')) " +
                    " and (zjO.fstatus ='已申请' or zjO.fstatus ='已领取') " +
                    " and xzZjDxlist.fid=zjOl.fzjid) then 1 else 0 end) as forderstatus  from XzJgysbg xzJgysbg,CommRy ry,XzZjDxlist xzZjDxlist where xzZjDxlist.fzjid=xzJgysbg.fid and xzZjDxlist.ftype=6 and xzJgysbg.fzongjian=ry.fid ";

            if (parameterMap.get("fname") != null && !String.valueOf(parameterMap.get("fname")).trim().equals("") && !String.valueOf(parameterMap.get("fname")).equalsIgnoreCase(("undefined"))) {
                hql += " and xzJgysbg.fxmname like '%" + String.valueOf(parameterMap.get("fname")) + "%'";
            }

            if (parameterMap.get("fzj") != null && !String.valueOf(parameterMap.get("fzj")).trim().equals("") && !String.valueOf(parameterMap.get("fzj")).equalsIgnoreCase(("undefined"))) {
                hql += " and (ry.fname like '%" + String.valueOf(parameterMap.get("fzj")) + "%')";
            }
        } else if (type.equals("7")) {
            hql = "select xzZjDxlist,( case when exists(select 1 from XzZjOrder zjO,XzZjOrderList zjOl where zjOl.forderid=zjO.fid and" +
                    "((zjO.fstarttime between '" + startTime + "' and '" + endTime + "' ) or (zjO.fendtime between '" + startTime + "' and '" + endTime + "')) " +
                    " and (zjO.fstatus ='已申请' or zjO.fstatus ='已领取') " +
                    " and xzZjDxlist.fid=zjOl.fzjid) then 1 else 0 end) as forderstatus  from XzRedTape xzRedTape,XzZjDxlist xzZjDxlist where xzZjDxlist.fzjid=xzRedTape.fid and xzZjDxlist.ftype=7 ";

            if (parameterMap.get("fname") != null && !String.valueOf(parameterMap.get("fname")).trim().equals("") && !String.valueOf(parameterMap.get("fname")).equalsIgnoreCase(("undefined"))) {
                hql += " and (xzRedTape.ftaptitle like '%" + String.valueOf(parameterMap.get("fname")) + "%' or xzRedTape.fhjxm like '%" + String.valueOf(parameterMap.get("fname")) + "%' or xzRedTape.fzj like '%" + String.valueOf(parameterMap.get("fname")) + "%' )";
            }

        } else if (type.equals("8")) {
            hql = "select xzZjDxlist,( case when exists(select 1 from XzZjOrder zjO,XzZjOrderList zjOl where zjOl.forderid=zjO.fid and" +
                    "((zjO.fstarttime between '" + startTime + "' and '" + endTime + "' ) or (zjO.fendtime between '" + startTime + "' and '" + endTime + "')) " +
                    " and (zjO.fstatus ='已申请' or zjO.fstatus ='已领取') " +
                    " and xzZjDxlist.fid=zjOl.fzjid) then 1 else 0 end) as forderstatus  from XzXjpy xzXjpy,XzZjDxlist xzZjDxlist where xzZjDxlist.fzjid=xzXjpy.fid and xzZjDxlist.ftype=8 ";

            if (parameterMap.get("fname") != null && !String.valueOf(parameterMap.get("fname")).trim().equals("") && !String.valueOf(parameterMap.get("fname")).equalsIgnoreCase(("undefined"))) {
                hql += " and ( xzXjpy.ftitle like '%" + String.valueOf(parameterMap.get("fname")) + "%' or  xzXjpy.fzj like '%" + String.valueOf(parameterMap.get("fname")) + "%' or xzXjpy.fjlgcs like '%" + String.valueOf(parameterMap.get("fname")) + "%'";
            }
        }

        Query query = xzZjManager.createQuery(hql);
        query.setFirstResult((pageNo - 1) * pageSize);
        query.setMaxResults(pageSize);
        resultList = query.list();

        for (Object objList : resultList) {
            Object[] objs = (Object[]) objList;
            XzZjDxlist xzZjDxlist = (XzZjDxlist) objs[0];

            HashMap<String, Object> responseMap = new HashMap<String, Object>();
            responseMap.put("fid", xzZjDxlist.getFid());
            responseMap.put("ftype", type);
            responseMap.put("fzjinfo", xzZjDxlist.getFname());
            responseMap.put("fstatus", xzZjDxlist.getFstate());
            responseMap.put("lastupdate", xzZjDxlist.getFupdatetime());
            responseMap.put("forderStutas", objs[1]);
            responseMapList.add(responseMap);
        }

        page.setResult(responseMapList);
        model.addAttribute("page", page);
        JsonResponseUtil.write(response, responseMapList);
    }

    @RequestMapping("xzZjOrder-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
                        Model model) {

        List<HashMap<String, Object>> responseMapList = new ArrayList<HashMap<String, Object>>();

        if (id != null) {
            XzZjOrder xzZjOrder = xzZjOrderManager.get(id);
            model.addAttribute("model", xzZjOrder);

            String hql = "select xzZjDxlist,zjOl from XzZjDxlist xzZjDxlist,XzZjOrderList zjOl  where zjOl.fzjid=xzZjDxlist.fid and zjOl.forderid=" + id;
            List resultList = xzZjManager.find(hql);
            for (Object xzzj : resultList) {
                Object[] obj = (Object[]) xzzj;
                XzZjDxlist xzZjDxlist = (XzZjDxlist) obj[0];
                XzZjOrderList zjOl = (XzZjOrderList) obj[1];
                HashMap<String, Object> responseMap = new HashMap<String, Object>();
                responseMap.put("fid", zjOl.getFid());
                responseMap.put("fzjid", xzZjDxlist.getFid());
                responseMap.put("ftype", xzZjDxlist.getFtype());
                responseMap.put("fzjinfo", xzZjDxlist.getFname());
                responseMap.put("fstatus", xzZjDxlist.getFstate());
                responseMap.put("lastupdate", xzZjDxlist.getFupdatetime());
                responseMapList.add(responseMap);
            }
            model.addAttribute("responseMapList", responseMapList);
        }
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());
        model.addAttribute("xmMap", JyXmMapUtil.getXmMap());

        return "xz/xzZjOrder-info-input";
    }

    @RequestMapping("xzZjOrder-info-save")
    public String save(@ModelAttribute XzZjOrder xzZjOrder,
                       @RequestParam Map<String, Object> parameterMap,
                       RedirectAttributes redirectAttributes) {
        XzZjOrder dest = null;

        Long id = xzZjOrder.getFid();

        if (id != null) {
            dest = xzZjOrderManager.get(id);
            beanMapper.copy(xzZjOrder, dest);
        } else {
            dest = xzZjOrder;
            dest.setFcreatetime(new Date());
        }

        xzZjOrderManager.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/xz/xzZjOrder-info-list.do";
    }

    @RequestMapping("xzZjOrder-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
                         RedirectAttributes redirectAttributes) {
        List<XzZjOrder> xzZjOrders = xzZjOrderManager.findByIds(selectedItem);

        xzZjOrderManager.removeAll(xzZjOrders);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/xz/xzZjOrder-info-list.do";
    }

    @RequestMapping("xzZjOrder-info-export")
    public void export(@ModelAttribute Page page,
                       @RequestParam Map<String, Object> parameterMap,
                       HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = xzZjOrderManager.pagedQuery(page, propertyFilters);

        List<XzZjOrder> xzZjOrders = (List<XzZjOrder>) page.getResult();

        TableModel tableModel = new TableModel();
        // tableModel.setName("xzZjOrder info");
        // tableModel.addHeaders("id", "name");
        tableModel.setData(xzZjOrders);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setXzZjOrderManager(XzZjOrderManager xzZjOrderManager) {
        this.xzZjOrderManager = xzZjOrderManager;
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
