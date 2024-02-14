package com.fileupload;

public class MyFileDTO {
    public String getIdx() {
        return idx;
    }

    public void setIdx(String idx) {
        this.idx = idx;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCate() {
        return cate;
    }

    public void setCate(String cate) {
        this.cate = cate;
    }

    public String getOfile() {
        return ofile;
    }

    public void setOfile(String ofile) {
        this.ofile = ofile;
    }

    public String getSfile() {
        return sfile;
    }

    public void setSfile(String sfile) {
        this.sfile = sfile;
    }

    public String getpostdate() {
        return postdate;
    }

    public void setpostdate(String postdate) {
        this.postdate = postdate;
    }

    private String idx;
    private String title;
    private String cate;
    private String ofile;
    private String sfile;
    private String postdate;

    public MyFileDTO() {
    }


}
