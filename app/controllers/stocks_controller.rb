class StocksController < ApplicationController
  def new
    @stock =Stock.new
  end
  def create
    @stock = Stock.new(stock_param)
    if@stock.save
      @log = Log.create(description: "Added new stock"+ " "+ @stock.name, user: current_user)

      redirect_to @stock
    else
      render 'new'
      end
  end

  def show
    @stocks = Stock.find(params[:id])
  end

  def index
    @stocks = Stock.paginate(:page => params[:page], :per_page => 2)
  end

  def edit
    @stock = Stock.find(params[:id])
  end

  def update
    @stock = Stock.find(params[:id])
    @stock.update(stock_param)
    redirect_to @stock
  end

  def destroy
    @stock = Stock.destroy(params[:id])
    redirect_to @stock
  end

  private
  def stock_param
    params.require(:stock).permit( :item_id, :quantity, :unit_price, :est_sell_price)
  end
end
