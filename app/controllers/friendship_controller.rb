class FriendshipController < ApplicationController
  def create
    friend = User.find(params[:friend])
    already_friends = Friendship.where friend_id: friend.id
    if already_friends == []
      @friends = Friendship.create(user: current_user, friend: friend)
      redirect_to friendship_path
    else
      redirect_to friendship_path
    end
  end
end
