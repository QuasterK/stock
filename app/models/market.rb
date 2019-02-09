class Market < ApplicationRecord
  has_many :users, through: :user_stocks
  has_many :user_stocks
  def self.search(name)
    begin
    @stock = StockQuote::Stock.quote(name)
    new(name: @stock.company_name, ticker: @stock.symbol, last_price: @stock.latest_price)
    rescue
      return nil
    end
  end

end
