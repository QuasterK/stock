class UserController < ApplicationController
  def my_portfolio
      @user_stocks = UserStock.where user_id: current_user.id
  end
end
