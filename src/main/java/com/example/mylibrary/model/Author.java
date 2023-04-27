package com.example.mylibrary.model;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Author {

    private int id;
    private String name;
    private String surname;
    private String email;
    private Date age;
}
