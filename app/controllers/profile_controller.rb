class ProfileController < ApplicationController
  def user_profile
    @user = User.find(params[:id])
    @friends_list = @user.friends
    @friends = @friends_list.paginate(:page => params[:page], :per_page => 2)
    @albums = @user.albums
    
    respond_to do |format|
      format.html
    end
  end
end
