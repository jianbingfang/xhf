package  com.xthena.dzb.web;

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
import com.xthena.util.CommRyMapUtil;
import com.xthena.dzb.domain.News;
import com.xthena.dzb.manager.NewsManager;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("dzb")
public class NewsController {
    private NewsManager newsManager;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private UserConnector userConnector;
    private MessageHelper messageHelper;

    @RequestMapping("news-info-list")
    public String list(@ModelAttribute Page page,@RequestParam(value = "ftype", required = false) String ftype,
            @RequestParam Map<String, Object> parameterMap, Model model) {
    	 if(ftype != null){
    		 parameterMap.put("filter_EQS_fmemo2", ftype);
         }
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = newsManager.pagedQuery(page, propertyFilters);
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

        model.addAttribute("page", page);
        if(ftype != null && ftype.equals("2")){
        	return "dzb/news-sj-info-list";
        }
        return "dzb/news-info-list";
    }

    @RequestMapping("news-info-input")
    public String input(@RequestParam(value = "id", required = false) Long id,@RequestParam(value = "ftype", required = false) String ftype,
            Model model) {
        if (id != null) {
            News news = newsManager.get(id);
            model.addAttribute("model", news);
        }
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

        if(ftype != null && ftype.equals("2")){
        	return "dzb/news-sj-info-input";
        }
        return "dzb/news-info-input";
    }

    @RequestMapping("news-info-save")
    public String save(@ModelAttribute News news,@RequestParam(value = "ftype", required = false) String ftype,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) {
        News dest = null;

        Long id = news.getFid();

        if (id != null) {
            dest = newsManager.get(id);
            beanMapper.copy(news, dest);
        } else {
            dest = news;
        }
        dest.setFmemo2(ftype);
        newsManager.save(dest);
      //  if(ftype != null){
        	
        //}
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        return "redirect:/dzb/news-info-list.do?ftype="+ftype;
    }

    @RequestMapping("news-info-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<News> newss = newsManager.findByIds(selectedItem);

        newsManager.removeAll(newss);

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/dzb/news-info-list.do";
    }

    @RequestMapping("news-info-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = newsManager.pagedQuery(page, propertyFilters);

        List<News> newss = (List<News>) page.getResult();

        TableModel tableModel = new TableModel();
        //tableModel.setName("news info");
        //tableModel.addHeaders("id", "name");
        tableModel.setData(newss);
        exportor.export(response, tableModel);
    }

    // ~ ======================================================================
    @Resource
    public void setNewsManager(NewsManager newsManager) {
        this.newsManager = newsManager;
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
