package  com.xthena.common.web;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.jl.domain.JlFujian;
import com.xthena.jl.manager.JlFujianManager;

import com.xthena.util.JsonResponseUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("comm")
public class FujianController {
	
	@Autowired
	private JlFujianManager jlFujianManager;
	@RequestMapping("fujianlist")
    public void uploadImage(@RequestParam("fmainid") Long fmainid,@RequestParam("fmaintable") String tableName,HttpServletResponse response) throws Exception {
		HashMap<String, Object> filterMap=new HashMap<String, Object>();
		filterMap.put("filter_EQL_fmainid", fmainid);
		filterMap.put("filter_EQS_ftablename", tableName);
		List<PropertyFilter> propertyFilters=PropertyFilter.buildFromMap(filterMap);
		List<JlFujian> jlFujians=jlFujianManager.find(propertyFilters);
		JsonResponseUtil.write(response, jlFujians);
    }
}
