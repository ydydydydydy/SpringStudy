package kr.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.spring.entity.Member;
import kr.spring.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
   
   @Autowired
   private MemberService memberService;
   
   @PostMapping("/join")
   public String join(Member vo, RedirectAttributes rttr, HttpSession session) {
      memberService.join(vo);
      rttr.addFlashAttribute("msgType", "성공메세지");
      rttr.addFlashAttribute("msg", "회원가입에 성공했습니다.");
      return "redirect:/member/login";
   }
   
   @GetMapping("/login")
   public String login(Member vo) {
      return "member/login";
   }
   
   @GetMapping("/join")
   public String join() {
      return "member/join";
   }
   
   @RequestMapping("/registerCheck")
   public @ResponseBody boolean registerCheck(String username) {
      return memberService.select(username);
   
      
   }
}