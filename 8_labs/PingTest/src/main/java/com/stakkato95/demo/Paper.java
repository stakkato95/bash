package com.stakkato95.demo;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "Paper")
public class Paper {
    @Id
    public String id;
    public String author;
    public String name;
}
