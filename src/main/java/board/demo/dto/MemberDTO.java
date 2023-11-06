package board.demo.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import javax.validation.Valid;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import java.time.LocalDateTime;

public class MemberDTO {

    @Getter
    @Setter
    @Builder
    public static class MemberRequest {
        private Long id;

        @Email(message = "올바른 이메일을 입력해주세요")
        private String memberEmail;

        @NotBlank(message = "비밀번호를 입력해주세요")
        private String memberPw;
        
        @NotBlank(message = "닉네임을 입력해주세요")
        private String memberNickname;

        //우편번호
        @NotEmpty(message = "주소를 입력해주세요")
        private String memberAddr1;

        //주소
        @NotEmpty(message = "주소를 입력해주세요")
        private String memberAddr2;

        //상세주소
        @NotEmpty(message = "주소를 입력해주세요")
        private String memberAddr3;

        //관리자 구분(0:사용자, 1:관리자)
        private Integer adminCk;

        private LocalDateTime regDate;
        private Integer money;
        private Integer point;
    }

    @Getter
    @Setter
    @Builder
    public static class LoginRequest {
        @Email(message = "올바른 이메일을 입력해주세요")
        private String memberEmail;
        
        @NotBlank(message = "비밀번호를 입력해주세요")
        private String memberPw;
    }
}
