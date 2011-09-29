module SearchHelper
  def already_sent?(requester_id, user_id)
    @friend_request = FriendRequest.find(:first, :conditions => ["user_id =? AND requester_id =?", user_id, requester_id])
    @friend_request != nil 
  end
  
  def friend_requests_count(user_id)
    @friend_requests = FriendRequest.find(:all, :conditions => ["user_id =? ", user_id])
  end
  
  def friends_count(user_id)
    @count = current_user.friends
  end
  
  def send_friend_request?(user_id, friend_id)
    @already_friend = Friend.find(:first, :conditions => ["user_id =?  AND friend_id =?", user_id, friend_id])
    @already_sent_request = FriendRequest.find(:first, :conditions => ["user_id =?  AND requester_id =?", friend_id, user_id])
    user_id != friend_id && @already_friend == nil && @already_sent_request == nil  
  end
end
