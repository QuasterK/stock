class WelcomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    aapl('aapl')
    tsla('tsla')
    msft('MSFT')
    ibm('ibm')
  end

  private
  def get_price(stock)
    stock.chart.map { |h| h['low'] if h['low'] > 1}.compact
  end

  def min_price(price)
    price.min.round - 0.5
  end

  def max_price(price)
    price.max.round + 0.5
  end

  def create_data(stock)
    stock.chart.map { |h| h.values_at('minute', 'low') if h['minute'].include?(':00') && h['low'] >= 1  }.compact
  end

  def aapl(company)
    stock = StockQuote::Stock.chart(company, '1d' )
    @aapl_data = create_data(stock)
    price = get_price(stock)
    @aapl_price_min = min_price(price)
    @aapl_price_max = max_price(price)
  end

  def tsla(company)
    stock = StockQuote::Stock.chart(company, '1d' )
    @tsla_data = create_data(stock)
    price = get_price(stock)
    @tsla_price_min = min_price(price)
    @tsla_price_max = max_price(price)
  end

  def tsla(company)
    stock = StockQuote::Stock.chart(company, '1d' )
    @tsla_data = create_data(stock)
    price = get_price(stock)
    @tsla_price_min = min_price(price)
    @tsla_price_max = max_price(price)
  end

  def msft(company)
    stock = StockQuote::Stock.chart(company, '1d' )
    @msft_data = create_data(stock)
    price = get_price(stock)
    @msft_price_min = min_price(price)
    @msft_price_max = max_price(price)
  end

  def ibm(company)
    stock = StockQuote::Stock.chart(company, '1d' )
    @ibm_data = create_data(stock)
    price = get_price(stock)
    @ibm_price_min = min_price(price)
    @ibm_price_max = max_price(price)
  end
end
