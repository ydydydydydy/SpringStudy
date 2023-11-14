package kr.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.entity.tb_request;
import kr.spring.service.CollaborationService;

@Controller
@RequestMapping("/collaboration/*")
public class CollaborationController {
   
   @Autowired
   private CollaborationService collaborationService;
      
   @RequestMapping("/request")
   public String request() {
      return "collaboration/request";
   }

   @PostMapping("/request")
   public String request(tb_request vo) {
      collaborationService.request(vo);
      return "index";
   }
   
   @RequestMapping("/list")
   public String getList(Model model) { // 게시글 전체조회 
      Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
      String username = authentication.getName(); // 현재 로그인한 사용자의 username
      
      List<tb_request> list = collaborationService.getList(username);
      model.addAttribute("req_list", list);
      return "collaboration/req_list";
   }
   

   
}