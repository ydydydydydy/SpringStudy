package kr.spring.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.spring.entity.Member;
import kr.spring.mapper.MemberMapper;

@Controller
public class MemberController {
   
   @Autowired
   private MemberMapper mapper;
   
   
   @RequestMapping("/joinForm.do")
   public String joinForm() {
      return "member/joinForm";
   }
   
   @RequestMapping("/registerCheck.do")
   public @ResponseBody int registerCheck(@RequestParam("memID") String memID) {
      Member m = mapper.registerCheck(memID);
      // m == null -> 아이디 사용 가능
      // m != null -> 아이디 사용 불가능
      if(m != null || memID.equals("")) {
         return 0;
      }else {
         return 1;
      }
      
   }

   @RequestMapping("/join.do")
   public String join(Member m, RedirectAttributes rttr, HttpSession session) {
      System.out.println("회원가입 기능요청");
      
      // 유효성 검사
      if(m.getMemID() == null || m.getMemID().equals("") || 
         m.getMemPassword() == null || m.getMemPassword().equals("") ||
         m.getMemName() == null || m.getMemName().equals("") ||
         m.getMemAge() == 0 ||
         m.getMemEmail() == null || m.getMemEmail().equals("")
         ) {
         // 하나라도 누락되어 있어 회원가입을 할 수 없는 상태. 
         
         // 실패 시 joinForm.do로 msgType과 msg내용을 보내야함.
         // msgType : 실패메세지, msg : 모든 내용을 입력하세요
         // RedirectAttributes - 리다이렉트 방식으로 이동할 때 보낼 데이터를 저장하는 객체
         rttr.addFlashAttribute("msgType", "실패메세지");
         rttr.addFlashAttribute("msg", "모든 내용을 입력하세요.");
         
         return "redirect:/joinForm.do";
      }else {
         // 회원가입을 시도할 수 있는 상태
         m.setMemProfile("");
         int cnt = mapper.join(m);
         
         if(cnt == 1) {
            System.out.println("회원가입 성공!");
            rttr.addFlashAttribute("msgType", "성공메세지");
            rttr.addFlashAttribute("msg", "회원가입에 성공했습니다.");
            // 회원가입 성공 시 로그인 처리까지 시키기
            session.setAttribute("mvo", m);
            return "redirect:/";
         }else {
            System.out.println("회원가입 실패...");
            rttr.addFlashAttribute("msgType", "실패메세지");
            rttr.addFlashAttribute("msg", "회원가입에 실패했습니다.");
            
            return "redirect:/joinForm.do";
         }
      }
      
   }

   @RequestMapping("/logout.do")
   public String logout(HttpSession session) {
      session.invalidate();
      return "redirect:/";
   }
   
   @RequestMapping("/loginForm.do")
   public String loginForm() {
      return "member/loginForm";
   }
   
   @RequestMapping("/login.do")
   public String login(Member m,RedirectAttributes rttr, HttpSession session) {
      // mapper에 login이라는 메소드 이름으로 로그인 기능을 수행하시오
      // 로그인 성공 시 -> index.jsp 이동 후 로그인에 성공했습니다 modal창 띄우기
      // 로그인 실패 시 -> login.jsp 이동 후 로그인에 실패했습니다 modal창 띄우기
      Member mvo = mapper.login(m);
      if( mvo != null) {
         System.out.println("로그인 성공!");
         rttr.addFlashAttribute("msgType", "성공메세지");
         rttr.addFlashAttribute("msg", "로그인에 성공했습니다.");
         session.setAttribute("mvo", mvo);
         return "redirect:/";
      }else {
         System.out.println("로그인 실패");
         rttr.addFlashAttribute("msgType", "실패메세지");
         rttr.addFlashAttribute("msg", "로그인에 실패했습니다.");
         return "redirect:/loginForm.do";
      }
   }
   
   @RequestMapping("/updateForm.do")
   public String updateForm() {
	   return "member/updateForm";
   }
   
   @RequestMapping("/update.do")
   public String update(Member m, RedirectAttributes rttr, HttpSession session) {
	   
      if(m.getMemID() == null || m.getMemID().equals("") ||
            m.getMemPassword() == null || m.getMemPassword().equals("") ||
            m.getMemName() == null || m.getMemName().equals("") ||
            m.getMemAge() == 0 ||
            m.getMemEmail() == null || m.getMemEmail().equals("")
            ) {
         
         rttr.addFlashAttribute("msgType", "실패메세지");
         rttr.addFlashAttribute("msg", "모든 내용을 입력하세요.");
         
         return "redirect:/updateForm.do";
         
      }else {
         
    	 Member mvo = (Member)session.getAttribute("mvo"); // 회원정보 수정 후 기존 프로필 사진을 가져오는 법
    	  
         m.setMemProfile(mvo.getMemProfile()); // 로그인한 mvo의 기존 Profile값을 가져온다
         int cnt = mapper.update(m);
         
         if(cnt == 1) {
            rttr.addFlashAttribute("msgType", "성공메세지");
            rttr.addFlashAttribute("msg", "회원정보수정에 성공했습니다.");
            session.setAttribute("mvo", m);
            return "redirect:/";
         }else {
            rttr.addFlashAttribute("msgType", "실패메세지");
            rttr.addFlashAttribute("msg", "회원정보수정에 실패했습니다.");
            
            return "redirect:/updateForm.do";
         }
         
      }
      
   }
   @RequestMapping("/imageForm.do")
   public String imageForm() {
	   return "member/imageForm";
	   
   }
   
   @RequestMapping("/imageUpdate.do")
   public String imageUpdate(HttpServletRequest request, HttpSession session, RedirectAttributes rttr) {
	   
	   // 파일업로드를 할 수 있게 도와주는 객체 (cos.jar)
	   // 파일업로드를 할 수 있게 도와주는 MultipartRequest 객체를 생성하기 위해서는
	   // 5개의 정보가 필요하다
	   // 요청데이터, 저장경로, 최대크기, 인코딩, 파일명 중복제거
	   MultipartRequest multi = null;
	   // 저장경로
	   String savePath = request.getRealPath("resources/upload");
	   //이미지 최대크기
	   int fileMaxSize = 10 * 1024 * 1024 * 10; 
	   
	   // 이전 프로필 이미지 삭제
	   // - 로그인한 사람의 프로필값을 가져와야 한다
	   String memID = ((Member)session.getAttribute("mvo")).getMemID();
	   
	   // getMember 메소드는 memID와 일치하는 회원의 정보(Member)를 가져온다
	   String oldImg = mapper.getMember(memID).getMemProfile();
	   
	   // 기존의 프로필 사진 삭제
	   File oldFile = new File(savePath+"/"+oldImg);
	   if(oldFile.exists()) {
		   oldFile.delete();
	   }	   
	   
	   try {
		multi = new MultipartRequest(request, savePath, fileMaxSize, "UTF-8", new DefaultFileRenamePolicy());
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	   
	// 내가 업로드한 파일 가져오기
	File file = multi.getFile("memProfile");
	
	if(file != null) { // (어느 파일이든)업로드가 된 상태
		// System.out.println(file.getName());
		String ext = file.getName().substring(file.getName().lastIndexOf(".") + 1);
		// lastIndexOf 파일이름의 마지막 점(".")을 의미 파일 이름에 점이 여러개일때를 대비
		ext = ext.toUpperCase(); // 소문자를 모두 대문자로 바꿔줌
		if(!(ext.equals("PNG") || ext.equals("GIF") || ext.equals("JPG"))) {
			
			if(file.exists()) {
				file.delete();
	            rttr.addFlashAttribute("msgType", "실패메세지");
	            rttr.addFlashAttribute("msg", "이미지 파일만 가능합니다. (PNG, JPG, GIF)");
	            return "redirect:/imageForm.do";
			}
		}		
	}
	// 업로드한 파일의 이름을 가져오는 코드
	String newProfile = multi.getFilesystemName("memProfile");
	   
	Member mvo = new Member();
	mvo.setMemID(memID);
	mvo.setMemProfile(newProfile);
	
	mapper.profileUpdate(mvo);
	
	// 사진 업데이트 후 수정된 회원정보를 다시 가져와서 세션에 담기
	Member m = mapper.getMember(memID);
	session.setAttribute("mvo", m);
	
    rttr.addFlashAttribute("msgType", "성공메세지");
    rttr.addFlashAttribute("msg", "이미지 변경을 성공했습니다.");
    return "redirect:/imageForm.do";
   }
   
   
}