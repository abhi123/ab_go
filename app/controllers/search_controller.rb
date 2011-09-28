class SearchController < ApplicationController
  def search_user
    if(params[:search].present?)
     @user = User.paginate :page => params[:page], :conditions => ['first_name LIKE ? OR last_name LIKE ?', "%" + params[:search] + "%", "%" + params[:search] + "%"]
    end
    respond_to do |format|
      format.html 
    end
  end
  
  def send_friend_request?(user_id, friend_id)
    @already_friend = Friend.find(:first, :conditions => ["user_id =?  AND friend_id =?", user_id, friend_id])
    @already_sent_request = FriendRequest.find(:first, :conditions => ["user_id =?  AND requester_id =?", friend_id, user_id])
    user_id != friend_id && @already_friend == nil && @already_sent_request == nil  
  end
  
end
