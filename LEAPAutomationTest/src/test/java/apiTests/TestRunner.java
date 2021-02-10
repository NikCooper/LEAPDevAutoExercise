package apiTests;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

public class TestRunner {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:apiTests").tags("~@ignore").parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}