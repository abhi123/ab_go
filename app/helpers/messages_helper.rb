module MessagesHelper
  def unread_msg(user_id)
    @count = Message.find(:all, :conditions => ["user_id =? AND status =?", user_id, 0])
  end
  
  def sent_message_count(user_id)
    @count = Message.find(:all, :conditions => ["sender_id =?", user_id])
  end
  
  def sender(user_id)
    @user = User.find(user_id)
  end
end
