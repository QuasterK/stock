class MarketController < ApplicationController
  def search
    @stock = Market.search(params[:stock])
    render 'user/my_portfolio'
  end
end
