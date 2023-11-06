package board.demo.service;

import board.demo.dto.MemberDTO;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

import static org.assertj.core.api.Assertions.*;

@SpringBootTest
public class MemberServiceTest {

    @Autowired
    MemberService memberService;

    @Test
    void join() {
        // 회원가입 테스트
        MemberDTO.MemberRequest memberDTO = MemberDTO.MemberRequest.builder()
                .memberEmail("email2")
                .memberPw("pw")
                .memberNickname("name")
                .memberAddr1("서울")
                .memberAddr2("동작")
                .memberAddr3("사당")
                .build();

        memberService.join(memberDTO);

    }

    @Test
    void memberEmailCheck() {
        String email = "email2";
        String email2 = "없는 이메일";
        String test = memberService.MemberEmailCheck(email);
        String test2 = memberService.MemberEmailCheck(email2);

        assertThat(test).isEqualTo("fail");
        assertThat(test2).isEqualTo("success");
    }
}
