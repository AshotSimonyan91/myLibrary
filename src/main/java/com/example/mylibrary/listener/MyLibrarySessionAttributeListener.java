package com.example.mylibrary.listener;

import com.example.mylibrary.model.User;
import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionAttributeListener;
import jakarta.servlet.http.HttpSessionBindingEvent;

import java.util.Date;

@WebListener
public class MyLibrarySessionAttributeListener implements HttpSessionAttributeListener {
    @Override
    public void attributeAdded(HttpSessionBindingEvent event) {
        String id = event.getSession().getId();
        String name = event.getName();
        User attributeValue = (User) event.getValue();
        if(name.equalsIgnoreCase("user")) {
            System.out.println("User with " + attributeValue.getEmail() +
                    " email logged in at " + new Date() + " sessionId=" + id);
        }
    }
}
