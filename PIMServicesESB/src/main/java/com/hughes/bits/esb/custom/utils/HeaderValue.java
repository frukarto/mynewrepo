package com.hughes.bits.esb.custom.utils;




public class HeaderValue {
    private String userName;
    private String password;
    private String ipList;
    private String msgList;
    private String partnerId;

    public void setUserName(String str) {
        userName=str;
    }
    public void setPassword(String str) {
        password=str;
    }
    public void setIpList(String str) {
        ipList=str;
    }
    public void setMsgList(String str) {
        msgList=str;
    }
    public String getUserName() {
        return userName;
    }
    public String getPassword() {
        return password;
    }
    public String getIpList() {
        return ipList;
    }
    public String getMsgList() {
        return msgList;
    }

    public String getPartnerId() {
        return partnerId;
    }

    public void setPartnerId(String partnerId) {
        this.partnerId = partnerId;
    }
}