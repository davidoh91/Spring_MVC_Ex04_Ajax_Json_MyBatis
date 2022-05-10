package mvc.controller;

import mvc.dto.Member;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

@RestController //@Controller + @ResponseBody
public class AjaxController {

    @RequestMapping(value="/load", produces="text/html;charset=UTF-8")
    public String load() {
        return "tesing Ajax + Spring... ajax 와 spring 의 만남";
    }


    @RequestMapping(value="/ajax", produces="text/html;charset=UTF-8")
    public String ajax(String name) {
        System.out.println("name : " + name);
        return name + ", welcome..";
    }

    /*
        자바의 객체를 응답해주기 위해서는 json으로 변환해주는 jackson LIB가 필요하다.
     */
    @RequestMapping(value="/json")
    public List<String> ajax() {
        System.out.println("json 요청됨...");

        return Arrays.asList("menu1", "menu2", "menu3", "menu4" ,"menu5");
    }


    @RequestMapping("/memberDto")
    public Member test() {
        return new Member("dave123", "David", 30, "KOR");
    }


    @RequestMapping("/memberList")
    public List<Member> test2() {
        List<Member> list = new ArrayList<>();
        list.add(new Member("dave1111", "David1111", 30, "KOR111"));
        list.add(new Member("dave2222", "David2222", 30, "KOR222"));
        list.add(new Member("dave3333", "David3333", 30, "KOR333"));
        list.add(new Member("dave4444", "David4444", 30, "KOR444"));

        return list;
    }


    @RequestMapping("/map")
    public Map<String, Object> test3() {
        Map<String, Object> map = new HashMap<>();
        map.put("message", "message : Learning Spring..");
        map.put("pageNo", 30);
        map.put("dto", new Member("dave9349394", "David9349394", 30, "KOR9349394"));

        List<Member> list = new ArrayList<>();
        list.add(new Member("dave1111", "David1111", 30, "KOR111"));
        list.add(new Member("dave2222", "David2222", 30, "KOR222"));
        list.add(new Member("dave3333", "David3333", 30, "KOR333"));
        list.add(new Member("dave4444", "David4444", 30, "KOR444"));

        map.put("memberList", list);

        return map;
    }


}
