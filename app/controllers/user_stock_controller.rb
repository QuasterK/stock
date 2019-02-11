class UserStockController < ApplicationController
  def create
    stock = Market.find_by ticker: params[:stock_ticker].upcase
    if stock.blank?
      stock = Market.search(params[:stock_ticker])
      stock.save
    end
    userStock = UserStock.find_by user_id: current_user.id, market: stock.id
    if userStock.blank?
    @user_stock = UserStock.create(user: current_user, market: stock)
    end
    redirect_to my_portfolio_path
  end

  def destroy
    stock = UserStock.find(params[:id])
    stock.destroy
    redirect_to my_portfolio_path
  end
end
