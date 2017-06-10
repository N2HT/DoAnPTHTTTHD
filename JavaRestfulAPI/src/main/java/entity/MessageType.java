package entity;
// Generated Jun 10, 2017 12:19:01 PM by Hibernate Tools 4.3.1


import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * MessageType generated by hbm2java
 */
@Entity
@Table(name="MessageType"
    ,schema="dbo"
    ,catalog="CardProcessing"
)
public class MessageType  implements java.io.Serializable {


     private int messageTypeId;
     private Serializable messageTypeName;
     private Set<Message> messages = new HashSet<Message>(0);

    public MessageType() {
    }

	
    public MessageType(int messageTypeId) {
        this.messageTypeId = messageTypeId;
    }
    public MessageType(int messageTypeId, Serializable messageTypeName, Set<Message> messages) {
       this.messageTypeId = messageTypeId;
       this.messageTypeName = messageTypeName;
       this.messages = messages;
    }
   
     @Id 

    
    @Column(name="MessageTypeId", unique=true, nullable=false)
    public int getMessageTypeId() {
        return this.messageTypeId;
    }
    
    public void setMessageTypeId(int messageTypeId) {
        this.messageTypeId = messageTypeId;
    }

    
    @Column(name="MessageTypeName")
    public Serializable getMessageTypeName() {
        return this.messageTypeName;
    }
    
    public void setMessageTypeName(Serializable messageTypeName) {
        this.messageTypeName = messageTypeName;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="messageType")
    public Set<Message> getMessages() {
        return this.messages;
    }
    
    public void setMessages(Set<Message> messages) {
        this.messages = messages;
    }




}


