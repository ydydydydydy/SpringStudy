package kr.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.spring.entity.tb_user;
import kr.spring.service.UserService;

@Controller
@RequestMapping("/member/*")
public class UserController {
   
   @Autowired
   private UserService userService;
   
   @PostMapping("/join")
   public String join(tb_user vo, RedirectAttributes rttr, HttpSession session) {
	  userService.join(vo);
      rttr.addFlashAttribute("msgType", "성공메세지");
      rttr.addFlashAttribute("msg", "회원가입에 성공했습니다.");
      return "redirect:/member/login";
   }
   
   @GetMapping("/login")
   public String login(tb_user vo) {
      return "member/login";
   }
   
   @GetMapping("/join")
   public String join() {
      return "member/join";
   }
   
   @RequestMapping("/registerCheck")
   public @ResponseBody boolean registerCheck(String username) {
      return userService.select(username);
   
   }
   
   @GetMapping("/mypage")
   public String mypage(tb_user vo) {
	   return "member/mypage";
   }
   
   @RequestMapping("/list")
   public String getList(Model model) {
	   Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	   String username = authentication.getName(); // 현재 로그인한 사용자의 username
	   
	   List<tb_user> list = userService.getList(username);
	   model.addAttribute("list", list);
	   model.addAttribute("username", username);
	   return "member/mypage";
   }
}