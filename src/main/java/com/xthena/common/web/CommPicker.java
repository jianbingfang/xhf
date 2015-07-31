package com.xthena.common.web;

import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.page.Page;
import com.xthena.sckf.domain.JyXm;
import com.xthena.sckf.manager.JyXmManager;
import com.xthena.util.JsonResponseUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * Created by xi on 2015/7/30.
 */

@Controller
@RequestMapping("sysconf")
public class CommPicker {

    @Autowired
    private  JyXmManager jyXmManager;

    // 项目picker
    @RequestMapping("jyXm-toubiao-simple-list")
    public void listXm2(@ModelAttribute Page page,
                        @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        //parameterMap.put("filter_EQS_fshenpiresult", "报名");
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = jyXmManager.pagedQuery(page, propertyFilters);
        JsonResponseUtil.write(response, page);
    }


}
