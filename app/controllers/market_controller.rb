class MarketController < ApplicationController
  def search
    if params[:stock].present?
      puts "hello"
      @stock = Market.search(params[:stock])
      if @stock
      render 'user/my_portfolio'
      else
        redirect_to my_portfolio_path
      end
    else
      redirect_to my_portfolio_path
    end
  end
end
