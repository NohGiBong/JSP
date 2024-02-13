package com.common; // 기본 패키지 이외의 패키지 (규약 1번)

public class DancingQueen {
    private String who; // private 멤버 변수 (규약 2번)
    private String what;    // private 멤버 변수 (규약 2번)

    public DancingQueen(String who, String what) {
        super();
        this.who = who;
        this.what = what;
    }

    public String getWho() { return who; }
    public void setWho(String Who) { this.who = Who; }
    public String getWhat() { return what; }
    public void setWhat(String What) { this.what = What; }
}
