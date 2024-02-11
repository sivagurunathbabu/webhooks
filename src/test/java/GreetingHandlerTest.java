import org.example.GreetingHandler;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

public class GreetingHandlerTest {
    private static GreetingHandler handler;

    @BeforeAll
    public static void setUp(){
        handler=new GreetingHandler();
    }
    @Test
    void should_return_green_when_sayHello(){

        String expected="Hello Bob";
        Assertions.assertEquals(handler.sayHelloTo("Bob"),expected);
    }
}
