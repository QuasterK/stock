class FriendshipController < ApplicationController
  def create
    friend = User.find(params[:friend])
    already_friends = Friendship.where(user_id: current_user.id ,friend_id: friend.id)
    if already_friends == []
      @friends = Friendship.create(user: current_user, friend: friend)
      redirect_to friendship_path
    else
      redirect_to friendship_path
    end
  end

  def destroy
    friendship = Friendship.where(user_id: current_user.id, friend_id: params[:friend_id]).first.id
    if friendship
      @friends = Friendship.destroy(friendship)
      redirect_to friendship_path
    else
      redirect_to root_path
    end
  end

  def portfolio
    friend = User.find(params[:friend_id])
    @friend_portfolio = friend.user_stocks.all
  end
end
