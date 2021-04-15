package cn.tycoding.cloud.auth;

import org.junit.jupiter.api.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * @author tycoding
 * @since 2021/3/23
 */
public class PasswordGenerateTest {

    private static final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    @Test
    public void passwordTest() {
        // 默认用户名：Tumo-Cloud 密码：Tumo-Cloud
        System.out.println(passwordEncoder.encode("Tumo-Cloud")); // $2a$10$Ii0cjEF1LW3pV2up9lTZLOkAUyeANJu0i0mHJHfYH/b.KxNSCMpI2
    }
}
