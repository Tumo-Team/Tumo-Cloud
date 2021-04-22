import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;

import java.util.HashMap;
import java.util.Map;

/**
 * @author tycoding
 * @since 2021/3/26
 */
@Slf4j
public class TumoCloudTest {

    @Test
    public void test() {
        Map<String, String> map = new HashMap<>();
        map.put("k1", "v1");
        map.put("k2", null);
        log.info("map: {}", map);

        Map<String, String> map2 = new HashMap<>();
        map2.put("k2", "v2");
        map2.put("k3", null);
        map2.put("k4", "v4");
        log.info("map2: {}", map2);

        Map<String, String> map3 = new HashMap<>();
        map3.putAll(map);
        map3.putAll(map2);
        log.info("map3: {}", map3);
    }
}
