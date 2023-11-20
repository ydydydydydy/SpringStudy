package kr.spring.controller;

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
   public String mypage(tb_user vo, Model model) {
      Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
      String username = authentication.getName(); // 현재 로그인한 사용자의 username
      
      tb_user user= userService.getList(username);
      model.addAttribute("userVo", user);
      System.out.println(user);
      model.addAttribute("username", username);
      return "member/mypage";
   }
   
   @GetMapping("/update")
   public String update(tb_user vo, RedirectAttributes rttr, HttpSession session) {
     userService.update(vo);
      return "member/update";
   }
   
   
   @GetMapping("/delete")
   public String delete(Model model, RedirectAttributes rttr) {
       Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
       String username = authentication.getName(); // 현재 로그인한 사용자의 username
       
       // 회원 삭제를 userService에 위임
       userService.delete(username);
       
       // 세션에서 로그인 정보 삭제
       SecurityContextHolder.getContext().setAuthentication(null);

       // 회원 탈퇴 후 비밀번호 체크 페이지로 리다이렉트
       return "member/checkPassword";
   }
   
   @PostMapping("/delete")
   public String deleteConfirm(@RequestParam String password, RedirectAttributes rttr) {
       Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
       String username = authentication.getName(); // 현재 로그인한 사용자의 username

       try {
           // 비밀번호 확인
           userService.checkPassword(username, password);

           // 비밀번호가 확인되면 회원 삭제
           userService.delete(username);

           // 세션에서 로그인 정보 삭제
           SecurityContextHolder.getContext().setAuthentication(null);

           // 회원 탈퇴 후 로그인 페이지로 리다이렉트
           return "redirect:/member/login";
       } catch (IllegalArgumentException e) {
           // 비밀번호가 일치하지 않을 경우 예외 처리
           rttr.addFlashAttribute("msgType", "오류메세지");
           rttr.addFlashAttribute("msg", "비밀번호가 일치하지 않습니다.");
           return "redirect:/member/delete";
       }
   }
}