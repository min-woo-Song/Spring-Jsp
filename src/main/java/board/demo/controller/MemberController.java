package board.demo.controller;

import board.demo.dto.MemberDTO;
import board.demo.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Slf4j
@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {

    private final MemberService memberService;

    // 회원가입 폼
    @GetMapping("/join")
    public String joinForm(MemberDTO.MemberRequest memberRequest) {
        return "join";
    }

    // 회원가입
    @PostMapping("/join")
    public String join(@Valid MemberDTO.MemberRequest memberRequest, BindingResult bindingResult) {
        if(bindingResult.hasErrors()) {
            log.info("bindingResult 에러 보유");
            return "join";
        }

        memberService.join(memberRequest);
        return "redirect:/";
    }

    // 로그인 폼
    @GetMapping("/login")
    public String loginForm(MemberDTO.LoginRequest loginRequest) {
        return "login";
    }

    // 로그인
    @PostMapping("/login")
    public String login(@Valid MemberDTO.LoginRequest loginRequest, BindingResult bindingResult) {
        if(bindingResult.hasErrors()) {
            return "login";
        }

//        memberService.login(loginRequest);
        return "redirect:/";
    }

    // 이메일 중복 체크
    @ResponseBody
    @PostMapping("/memberEmailChk")
    public String memberEmailChk(String memberEmail) {
        return memberService.MemberEmailCheck(memberEmail);
    }

}
