package com.xthena.party.web;

import java.util.List;
import javax.annotation.Resource;

import com.xthena.party.domain.PartyEntity;
import com.xthena.party.domain.PartyStructType;
import com.xthena.party.manager.PartyEntityManager;
import com.xthena.party.manager.PartyStructTypeManager;
import com.xthena.party.service.PartyService;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("party")
public class TreeController {
    private PartyEntityManager partyEntityManager;
    private PartyStructTypeManager partyStructTypeManager;
    private PartyService partyService;

    @RequestMapping("tree-list")
    public String list(
            @RequestParam(value = "partyStructTypeId", required = false) Long partyStructTypeId,
            Model model) {
        List<PartyStructType> partyStructTypes = partyStructTypeManager
                .getAll();

        List<PartyEntity> partyEntities = partyService
                .getTopPartyEntities(partyStructTypeId);
        model.addAttribute("partyStructTypes", partyStructTypes);
        model.addAttribute("partyEntities", partyEntities);

        return "party/tree-list";
    }

    // ~ ======================================================================
    @Resource
    public void setPartyEntityManager(PartyEntityManager partyEntityManager) {
        this.partyEntityManager = partyEntityManager;
    }

    @Resource
    public void setPartyStructTypeManager(
            PartyStructTypeManager partyStructTypeManager) {
        this.partyStructTypeManager = partyStructTypeManager;
    }

    @Resource
    public void setPartyService(PartyService partyService) {
        this.partyService = partyService;
    }
}
