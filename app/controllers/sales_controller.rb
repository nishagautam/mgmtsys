class SalesController < ApplicationController
  def new
    @sale =Sale.new
  end

  def create
    @sale = Sale.new(sale_param)
    if @sale.save
      @log = Log.create(description: "Added new item"+ " "+ @sale.name, user: current_user)

      redirect_to @sale
    else
      render 'new'
    end
  end

  def show
    @sales = Sale.find(params[:id])
  end

  def index
    @sales = Sale.paginate(:page => params[:page], :per_page => 3)

  end

  def edit
    @sale = Sale.find(params[:id])
    @log = Log.create(description: "Edited new item"+ " "+ @sale.name, user: current_user)

  end

  def update
    @sale = Sale.find(params[:id])
    @sale.update(sale_param)
    redirect_to @sale
  end

  def destroy
    @sale = Sale.destroy(params[:id])
    @log = Log.create(description: "Deleted new item"+ " "+ @sale.name, user: current_user)

    redirect_to @sale
  end

  private
  def sale_param
    params.require(:sale).permit(:item_id, :unit_sell_price, :quantity, :cash_credit, :customer_id)
  end
end
