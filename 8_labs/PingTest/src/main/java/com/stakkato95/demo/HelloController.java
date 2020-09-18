package com.stakkato95.demo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.Marker;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
    
    private MongoTemplate template;

    public HelloController(MongoTemplate template) {
        this.template = template;
    }

    @RequestMapping("ping/{param}")
    public String ping(@PathVariable String param) {
        return String.format("ping with '%s'", param);
    }

    @RequestMapping("add/{author}/{name}")
    public Paper add(@PathVariable String author, @PathVariable String name) {
        Paper p = new Paper();
        p.author = author;
        p.name = name;
        template.save(p);
        return p;
    }
}
