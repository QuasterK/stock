class UserController < ApplicationController
  def my_portfolio
      @user_stocks = UserStock.where user_id: current_user.id
  end
  def friendship
      @friends = Friendship.where user_id: current_user.id
  end

  def search
    if params[:friend].present?
      find = User.where name: params[:friend]
      @friend = find.first
      if @friend
        respond_to do |format|
          format.js {render partial: 'user/friend'}
        end
      else
        redirect_to friendship_path && return
      end
    else
      redirect_to friendship_path && return
    end
  end

end
