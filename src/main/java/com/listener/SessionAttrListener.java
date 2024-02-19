package com.listener;

import jakarta.servlet.http.HttpSessionAttributeListener;
import jakarta.servlet.http.HttpSessionBindingEvent;

public class SessionAttrListener implements HttpSessionAttributeListener {
    public void attributeAdded(HttpSessionBindingEvent event) {
        System.out.println("[리스너] 세션 속성 추가 : " + event.getName() + " = " + event.getValue());
    }
    public void attributeRemoved(HttpSessionBindingEvent event) {
        System.out.println("[리스너] 세션 속성 제거 : " + event.getName() + " = " + event.getValue());
    }
    public void attributeReplaced(HttpSessionBindingEvent event) {
        System.out.println("[리스너] 세션 속성 변경 : " + event.getName() + " = " + event.getValue());
    }

}
