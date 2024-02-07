package utils;

import jakarta.servlet.jsp.JspWriter;

public class JSFunction {
    // 메시지 알림창을 띄운 후 명시한 URL로 이동합니다.
    public static void alertLocation(String msg, String url, JspWriter out) {
        try {
            String script = ""
                    + "<script>"
                    + " alert('" + msg + "');"
                    + " location.href='" + url + "';"
                    + "</script>";
            out.println(script);
        }
        catch (Exception e) {}
    }

    public static void alertBack(String msg, String url, JspWriter out) {
        try {
            String script = ""
                    + "<script>"
                    + " alert('" + msg + "');"
                    + " history.back();"
                    + "</script>";
            out.println(script);
        }
        catch (Exception e) {}
    }
}
