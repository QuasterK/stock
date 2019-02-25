class WelcomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    stock = StockQuote::Stock.chart('aapl', '1d' )
    @stock = stock.chart
    @data = @stock.map { |h| h.values_at('minute', 'low') }
    price = @stock.map { |h| h.values_at('low') }
    @price_min = price.min
    @price_max = price.max
  end
end
