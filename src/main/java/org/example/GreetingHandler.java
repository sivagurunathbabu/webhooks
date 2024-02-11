package org.example;

public class GreetingHandler {
    public static void main(String[] args) {
        GreetingHandler handler=new GreetingHandler();
        System.out.println(handler.sayHelloTo("Bob"));
    }

    public String sayHelloTo(String userName){
        return "Hello "+userName;
    }
}