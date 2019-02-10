class UserController < ApplicationController
  def my_portfolio
      @user_stocks = UserStock.search(current_user.id)
  end
end
