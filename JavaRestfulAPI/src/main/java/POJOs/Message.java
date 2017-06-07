package POJOs;
// Generated Jun 7, 2017 1:31:19 AM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Message generated by hbm2java
 */
public class Message  implements java.io.Serializable {


     private int messageId;
     private MessageType messageType;
     private User userByUserIdSend;
     private User userByUserIdRecevie;
     private String messageContent;
     private Date time;

    public Message() {
    }

	
    public Message(int messageId) {
        this.messageId = messageId;
    }
    public Message(int messageId, MessageType messageType, User userByUserIdSend, User userByUserIdRecevie, String messageContent, Date time) {
       this.messageId = messageId;
       this.messageType = messageType;
       this.userByUserIdSend = userByUserIdSend;
       this.userByUserIdRecevie = userByUserIdRecevie;
       this.messageContent = messageContent;
       this.time = time;
    }
   
    public int getMessageId() {
        return this.messageId;
    }
    
    public void setMessageId(int messageId) {
        this.messageId = messageId;
    }
    public MessageType getMessageType() {
        return this.messageType;
    }
    
    public void setMessageType(MessageType messageType) {
        this.messageType = messageType;
    }
    public User getUserByUserIdSend() {
        return this.userByUserIdSend;
    }
    
    public void setUserByUserIdSend(User userByUserIdSend) {
        this.userByUserIdSend = userByUserIdSend;
    }
    public User getUserByUserIdRecevie() {
        return this.userByUserIdRecevie;
    }
    
    public void setUserByUserIdRecevie(User userByUserIdRecevie) {
        this.userByUserIdRecevie = userByUserIdRecevie;
    }
    public String getMessageContent() {
        return this.messageContent;
    }
    
    public void setMessageContent(String messageContent) {
        this.messageContent = messageContent;
    }
    public Date getTime() {
        return this.time;
    }
    
    public void setTime(Date time) {
        this.time = time;
    }




}

