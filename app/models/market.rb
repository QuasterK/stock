class Market < ApplicationRecord

  def self.search(name)
    begin
    @stock = StockQuote::Stock.quote(name)
    new(name: @stock.company_name, ticker: @stock.symbol, last_price: @stock.latest_price)
    rescue
      return nil
    end
  end

end
