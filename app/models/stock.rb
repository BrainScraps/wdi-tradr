class Stock < ActiveRecord::Base
  belongs_to :user
  attr_accessible :quantity, :starting_price, :symbol, :user_id


  def set_price(symbol)
    #quote = StockQuote::Stock.quote(symbol)

    quote = Stockery::Quote.new

    resp = quote.get_status(symbol)
    #self.starting_price = quote.last

    self.starting_price = resp[:price]

    
  before_create :set_starting_price

  def set_starting_price
    # quote = StockQuote::Stock.quote(symbol)
    # self.starting_price = quote.last

    quote = Ystock.get_stock(symbol).first[1]
    self.starting_price = quote[:price]
  end

  def latest_price
    # quote = StockQuote::Stock.quote(symbol)
    # quote.last

    quote = Ystock.get_stock(symbol).first[1]
    quote[:price]
  end

  def profit
    paid_initially         = (starting_price * quantity).to_f
    latest_value_of_shares = (latest_price   * quantity).to_f

    paid_initially - latest_value_of_shares
>>>>>>> fa0eda3101b5b9d794bc9323a3120d0c1b72b96e
  end
end
