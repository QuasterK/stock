class UserStock < ApplicationRecord
  belongs_to :user
  belongs_to :market

  def self.search(id)
    begin
      @user_stocks = UserStock.where user_id: id
    rescue
      return nil
    end
  end

end
