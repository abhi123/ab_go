module ProfileHelper
  def find_user(user_id)
    @user = User.find(user_id)
  end
  
  def send_friend_request?(user_id, friend_id)
    @already_friend = Friend.find(:first, :conditions => ["user_id =?  AND friend_id =?", user_id, friend_id])
    @already_sent_request = FriendRequest.find(:first, :conditions => ["user_id =?  AND requester_id =?", friend_id, user_id])
    user_id != friend_id && @already_friend == nil && @already_sent_request == nil  
  end
end
