package com.hughes.bits.esb.custom.utils;

import java.io.Serializable;


public class PartnerValue implements Serializable {

    private String userName;
    private String partnerId;
    private String host;
    private int port;
    private String path;
    private boolean partnerInterfaceAlarmFlag = true;
    private String sanPrefix;
    private boolean sanPresent = false;
    private boolean notificationRequired = true;
    private boolean pollingRequired = false;
    private boolean superPartner = false;
    private boolean legacyNotificationRequired = false;
    private boolean partialAddressFlag = false;
    private boolean sSLRequired = false;
    private String busineeModel;
    private String msgsForPop;
    private boolean standardizeAddressFlag = false;
    private boolean hasStandardizeAddressFlag = false;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPartnerId() {
        return partnerId;
    }

    public void setPartnerId(String partnerId) {
        this.partnerId = partnerId;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public int getPort() {
        return port;
    }

    public void setPort(int port) {
        this.port = port;
    }

    public String getBusineeModel() {
        return busineeModel;
    }

    public void setBusineeModel(String busineeModel) {
        this.busineeModel = busineeModel;
    }

    public String getMsgsForPop() {
        return msgsForPop;
    }

    public void setMsgsForPop(String msgsForPop) {
        this.msgsForPop = msgsForPop;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public boolean isPartnerInterfaceAlarmFlag() {
        return partnerInterfaceAlarmFlag;
    }

    public void setPartnerInterfaceAlarmFlag(boolean partnerInterfaceAlarmFlag) {
        this.partnerInterfaceAlarmFlag = partnerInterfaceAlarmFlag;
    }

    public String getSanPrefix() {
        return sanPrefix;
    }

    public void setSanPrefix(String sanPrefix) {
        this.sanPrefix = sanPrefix;
    }

    public boolean isSanPresent() {
        return sanPresent;
    }

    public void setSanPresent(boolean sanPresent) {
        this.sanPresent = sanPresent;
    }

    public boolean isNotificationRequired() {
        return notificationRequired;
    }

    public void setNotificationRequired(boolean notificationRequired) {
        this.notificationRequired = notificationRequired;
    }

    public boolean isPollingRequired() {
        return pollingRequired;
    }

    public void setPollingRequired(boolean pollingRequired) {
        this.pollingRequired = pollingRequired;
    }

    public boolean isSuperPartner() {
        return superPartner;
    }

    public void setSuperPartner(boolean superPartner) {
        this.superPartner = superPartner;
    }

    public boolean isLegacyNotificationRequired() {
        return legacyNotificationRequired;
    }

    public void setLegacyNotificationRequired(boolean legacyNotificationRequired) {
        this.legacyNotificationRequired = legacyNotificationRequired;
    }

    public boolean isPartialAddressFlag() {
        return partialAddressFlag;
    }

    public void setPartialAddressFlag(boolean partialAddressFlag) {
        this.partialAddressFlag = partialAddressFlag;
    }

    public boolean issSLRequired() {
        return sSLRequired;
    }

    public void setsSLRequired(boolean sSLRequired) {
        this.sSLRequired = sSLRequired;
    }

    public boolean isStandardizeAddressFlag() {
        return standardizeAddressFlag;
    }

    public void setStandardizeAddressFlag(boolean standardizeAddressFlag) {
        this.standardizeAddressFlag = standardizeAddressFlag;
    }

    public boolean hasStandardizeAddressFlag() {
        return hasStandardizeAddressFlag;
    }

    public void setHasStandardizeAddressFlag(boolean hasStandardizeAddressFlag) {
        this.hasStandardizeAddressFlag = hasStandardizeAddressFlag;
    }

    public String toString() {
        StringBuffer sb = new StringBuffer();
        sb.append("UserName=" + getUserName() + "\n");
        sb.append("PartnerId=" + getPartnerId() + "\n");
        sb.append("Host=" + getHost() + "\n");
        sb.append("Port=" + getPort() + "\n");
        sb.append("Path=" + getPath() + "\n");
        sb.append("PartnerInterfaceAlarmFlag=" + isPartnerInterfaceAlarmFlag() + "\n");
        sb.append("SanPrefix=" + getSanPrefix() + "\n");
        sb.append("SanPresent=" + isSanPresent() + "\n");
        sb.append("NotificationRequired=" + isNotificationRequired() + "\n");
        sb.append("PollingRequired=" + isPollingRequired() + "\n");
        sb.append("SuperPartner=" + isSuperPartner() + "\n");
        sb.append("LegacyNotificationRequired=" + isLegacyNotificationRequired() + "\n");
        sb.append("PartialAddressFlag=" + isPartialAddressFlag() + "\n");
        sb.append("SSLRequired=" + issSLRequired() + "\n");
        sb.append("StandardizeAddressFlag=" + isStandardizeAddressFlag() + "\n");
        return sb.toString();
    }

} // End Of Class