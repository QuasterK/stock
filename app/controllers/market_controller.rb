class MarketController < ApplicationController
  def search
    if params[:stock].present?
      puts "hello"
      @stock = Market.search(params[:stock])
      if @stock
        respond_to do |format|
          format.js {render partial: 'user/stock'}
        end
      else
        redirect_to my_portfolio_path
      end
    else
      redirect_to my_portfolio_path
    end
  end
end
