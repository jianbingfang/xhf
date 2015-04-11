package com.xthena.user.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletResponse;

import com.xthena.api.scope.ScopeHolder;
import com.xthena.api.user.UserCache;
import com.xthena.api.user.UserDTO;
import com.xthena.auth.service.AuthService;

import com.xthena.core.hibernate.PropertyFilter;
import com.xthena.core.mapper.BeanMapper;
import com.xthena.core.page.Page;
import com.xthena.core.spring.MessageHelper;
import com.xthena.core.util.ServletUtils;

import com.xthena.ext.export.Exportor;
import com.xthena.ext.export.TableModel;

import com.xthena.security.util.SimplePasswordEncoder;

import com.xthena.user.persistence.domain.UserBase;
import com.xthena.user.persistence.domain.UserRepo;
import com.xthena.user.persistence.manager.UserBaseManager;
import com.xthena.user.persistence.manager.UserRepoManager;
import com.xthena.user.service.UserService;
import com.xthena.user.support.UserBaseWrapper;
import com.xthena.util.CommRyMapUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import sun.net.www.protocol.http.AuthScheme;

@Controller
@RequestMapping("user")
public class UserBaseController {
    private UserBaseManager userBaseManager;
    private UserRepoManager userRepoManager;
    private UserCache userCache;
    private MessageHelper messageHelper;
    private Exportor exportor;
    private BeanMapper beanMapper = new BeanMapper();
    private SimplePasswordEncoder simplePasswordEncoder;
    private UserService userService;

    @Autowired
    private AuthService authService;
    
    @RequestMapping("user-base-list")
    public String list(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        UserRepo userRepo = userRepoManager.findUniqueBy("code",
                ScopeHolder.getScopeCode());
        propertyFilters.add(new PropertyFilter("EQL_userRepo.id", Long
                .toString(userRepo.getId())));
        page = userBaseManager.pagedQuery(page, propertyFilters);

        List<UserBase> userBases = (List<UserBase>) page.getResult();
        List<UserBaseWrapper> userBaseWrappers = new ArrayList<UserBaseWrapper>();

        for (UserBase userBase : userBases) {
            userBaseWrappers.add(new UserBaseWrapper(userBase));
        }

        page.setResult(userBaseWrappers);
        model.addAttribute("page", page);

        return "user/user-base-list";
    }

    @RequestMapping("user-base-input")
    public String input(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        UserBase userBase = null;

        if (id != null) {
            userBase = userBaseManager.get(id);
        } else {
            userBase = new UserBase();

            UserRepo userRepo = userRepoManager.findUniqueBy("code",
                    ScopeHolder.getScopeCode());
            userBase.setUserRepo(userRepo);
        }

        UserBaseWrapper userBaseWrapper = new UserBaseWrapper(userBase);
        model.addAttribute("model", userBase);
        model.addAttribute("userBaseWrapper", userBaseWrapper);
        model.addAttribute("ryMap", CommRyMapUtil.getRyMap());

        return "user/user-base-input";
    }

    @RequestMapping("user-base-save")
    public String save(
            @ModelAttribute UserBase userBase,
            @RequestParam(value = "confirmPassword", required = false) String confirmPassword,
            @RequestParam("userRepoId") Long userRepoId,
            @RequestParam Map<String, Object> parameterMap,
            RedirectAttributes redirectAttributes) throws Exception {
        // 先进行校验
        if (userBase.getPassword() != null) {
            if (!userBase.getPassword().equals(confirmPassword)) {
                messageHelper.addFlashMessage(redirectAttributes,
                        "user.user.input.passwordnotequals", "两次输入密码不符");

                // TODO: 还要填充schema
                return "user/user-base-input";
            }

            if (simplePasswordEncoder != null) {
                userBase.setPassword(simplePasswordEncoder.encode(userBase
                        .getPassword()));
            }
        }

        Map<String, Object> parameters = ServletUtils
                .getParametersStartingWith(parameterMap, "_user_attr_");

        // 再进行数据复制
        UserBase dest = null;
        Long id = userBase.getId();

        if (id != null) {
            dest = userBaseManager.get(id);
			dest.setStatus(0);
            beanMapper.copy(userBase, dest);
            userService.updateUser(dest, userRepoId, parameters);
        } else {
            dest = userBase;
            userService.insertUser(dest, userRepoId, parameters);
        }

      //最后两个参数不明白啥意思 暂时写死
		authService.createOrGetUserStatus(dest.getUsername(), dest.getId().toString(), "1", "1");
		
		userBase.setRef(dest.getId().toString());
		userService.updateUser(userBase,  1L, new HashMap<String,Object>());
		  
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save",
                "保存成功");

        UserDTO userDto = new UserDTO();
        userDto.setId(Long.toString(dest.getId()));
        userDto.setUsername(dest.getUsername());
        userDto.setRef(dest.getRef());
        userDto.setUserRepoRef(Long.toString(userRepoId));
        userCache.removeUser(userDto);

        return "redirect:/user/user-base-list.do";
    }

    @RequestMapping("user-base-remove")
    public String remove(@RequestParam("selectedItem") List<Long> selectedItem,
            RedirectAttributes redirectAttributes) {
        List<UserBase> userBases = userBaseManager.findByIds(selectedItem);

        for (UserBase userBase : userBases) {
            userService.removeUser(userBase);

            UserDTO userDto = new UserDTO();
            userDto.setId(Long.toString(userBase.getId()));
            userDto.setUsername(userBase.getUsername());
            userDto.setRef(userBase.getRef());
            userDto.setUserRepoRef(Long
                    .toString(userBase.getUserRepo().getId()));
            userCache.removeUser(userDto);
        }

        messageHelper.addFlashMessage(redirectAttributes,
                "core.success.delete", "删除成功");

        return "redirect:/user/user-base-list.do";
    }

    @RequestMapping("user-base-search")
    public String search(@ModelAttribute Page page, Model model) {
        StringBuilder buff = new StringBuilder("select ub from UserBase ub");

        Map<String, Object> params = new HashMap<String, Object>();

        if (!params.isEmpty()) {
            page = userBaseManager.pagedQuery(buff.toString(),
                    page.getPageNo(), page.getPageSize(), params);

            List<UserBase> userBases = (List<UserBase>) page.getResult();
            List<UserBaseWrapper> userBaseWrappers = new ArrayList<UserBaseWrapper>();

            for (UserBase userBase : userBases) {
                userBaseWrappers.add(new UserBaseWrapper(userBase));
            }

            page.setResult(userBaseWrappers);
            model.addAttribute("page", page);
        }

        return "user/user-base-search";
    }

    @RequestMapping("user-base-export")
    public void export(@ModelAttribute Page page,
            @RequestParam Map<String, Object> parameterMap,
            HttpServletResponse response) throws Exception {
        List<PropertyFilter> propertyFilters = PropertyFilter
                .buildFromMap(parameterMap);
        page = userBaseManager.pagedQuery(page, propertyFilters);

        List<UserBase> userBases = (List<UserBase>) page.getResult();

        TableModel tableModel = new TableModel();
        tableModel.setName("user");
        tableModel.addHeaders("id", "username", "status");
        tableModel.setData(userBases);
        exportor.export(response, tableModel);
    }

    @RequestMapping("user-base-checkUsername")
    @ResponseBody
    public boolean checkUsername(@RequestParam("username") String username,
            @RequestParam(value = "id", required = false) Long id)
            throws Exception {
        String hql = "from UserBase where username=?";
        Object[] params = { username };

        if (id != null) {
            hql = "from UserBase where username=? and id<>?";
            params = new Object[] { username, id };
        }

        boolean result = userBaseManager.findUnique(hql, params) == null;

        return result;
    }

    // ~ ======================================================================
    @Resource
    public void setUserBaseManager(UserBaseManager userBaseManager) {
        this.userBaseManager = userBaseManager;
    }

    @Resource
    public void setUserRepoManager(UserRepoManager userRepoManager) {
        this.userRepoManager = userRepoManager;
    }

    @Resource
    public void setUserCache(UserCache userCache) {
        this.userCache = userCache;
    }

    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setSimplePasswordEncoder(
            SimplePasswordEncoder simplePasswordEncoder) {
        this.simplePasswordEncoder = simplePasswordEncoder;
    }

    @Resource
    public void setExportor(Exportor exportor) {
        this.exportor = exportor;
    }

    @Resource
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
