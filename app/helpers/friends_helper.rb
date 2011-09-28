module FriendsHelper
  def find_user(user_id)
    @user = User.find(user_id)
  end
end
