package com.store.model.customers;

import java.util.Date;

public class SessionUser {
    private int id;
    private String sessionID;
    private User user;
    private Date dateCreate ;
    private Date dateEnd;
    private boolean isActive;

    private static int currentID = 0;

    public SessionUser() {

    }

    public SessionUser(String sessionID, User user) {
//        this.id = ++currentID;
        this.sessionID = sessionID;
        this.user = user;
    }

    public SessionUser(String sessionID, User user, Date dateCreate, Date dateEnd, boolean isActive) {
        this(sessionID, user);
        this.dateCreate = dateCreate;
        this.dateEnd = dateEnd;
        this.isActive = isActive;
    }

    public SessionUser(int id, String sessionID, User user, Date dateCreate, Date dateEnd, boolean isActive) {
        this.id = id;
        this.sessionID = sessionID;
        this.user = user;
        this.dateCreate = dateCreate;
        this.dateEnd = dateEnd;
        this.isActive = isActive;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSessionID() {
        return sessionID;
    }

    public void setSessionID(String sessionID) {
        this.sessionID = sessionID;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(Date dateCreate) {
        this.dateCreate = dateCreate;
    }

    public Date getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(Date dateEnd) {
        this.dateEnd = dateEnd;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public static int getCurrentID() {
        return currentID;
    }

    public static void setCurrentID(int currentID) {
        SessionUser.currentID = currentID;
    }
}
