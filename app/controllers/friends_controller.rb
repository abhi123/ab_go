class FriendsController < ApplicationController
  
  def send_friend_request
    @send_request = FriendRequest.new(:user_id => params[:id], :requester_id => params[:requester_id])
    respond_to do |format|
      if @send_request.save
        format.html {redirect_to(params[:return_to])}
      end
    end
  end
  
  def cancel_friend_request
    @send_request = FriendRequest.find(:first , :conditions => ["user_id =? AND requester_id =?", params[:id], params[:requester_id]])
    respond_to do |format|
      if @send_request.destroy
        format.html {redirect_to(params[:return_to])}
      end
    end
  end
  
  def show_friend_request
    @friend_request = FriendRequest.paginate :page => params[:page], :conditions => ["user_id =?", params[:user_id]]
    respond_to do |format|
        format.html 
    end
  end
  
  def accept_friend_request
     @friend_me = Friend.new(:user_id => params[:user_id], :friend_id => params[:friend_id])
     @friend_requester = Friend.new(:user_id => params[:friend_id], :friend_id => params[:user_id])
     @friend_request = FriendRequest.find(:first , :conditions => ["user_id =? AND requester_id =?", params[:user_id], params[:friend_id]])
     respond_to do |format|
      if @friend_me.save && @friend_requester.save && @friend_request.destroy
        format.html {redirect_to(params[:return_to])}
      end
    end
  end
  
  def reject_friend_request
    @friend_request = FriendRequest.find(:first , :conditions => ["user_id =? AND requester_id =?", params[:user_id], params[:requester_id]])
    respond_to do |format|
      if @friend_request.destroy
        format.html {redirect_to(params[:return_to])}
      end
    end
  end
  
  def friend
    @friends = Friend.paginate :page => params[:page], :conditions => ["user_id =? ", current_user.id]
    respond_to do |format|
        format.html 
    end
  end
  
  
end
