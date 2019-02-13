class UserController < ApplicationController
  def my_portfolio
      @user_stocks = UserStock.where user_id: current_user.id
  end
  def friendship
      @friends = Friendship.where user_id: current_user.id
      # or @friends = current_user.friends
  end

  def search
    if params[:friend].present?
      find_name = find_name(params[:friend])
      find_surname = find_surname(params[:friend])
      find_email = find_email(params[:friend])
      @friend = (find_name + find_surname + find_email).uniq
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

  def find_name(params)
    user = User.where("name like ?", "%#{params}%")
  end
  def find_surname(params)
    user = User.where("surname like ?", "%#{params}%")
  end
  def find_email(params)
    user = User.where("email like ?", "%#{params}%")
  end
end
