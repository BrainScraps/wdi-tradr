class StocksController < ApplicationController
  def index
    @user = current_user
    @stocks = current_user.stocks

  end

  def new
    @stock = User.stocks.new
  end

  def create
    #current_user = @user
    @user = User.find(current_user.id)
    @stock = @user.stocks.new(symbol: params[:symbol], quantity: params[:quntity])
    @stock.set_price(params[:symbol])
    @stock.save

    @stocks = current_user.stocks
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
