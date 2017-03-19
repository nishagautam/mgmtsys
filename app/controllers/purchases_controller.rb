class PurchasesController < ApplicationController
  def new
    @purchase =Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_param)
    if @purchase.save
      redirect_to @purchase

    else
      render 'new'
    end
  end

  def show
    @purchase= Purchase.find(params[:id])
  end

  def index
    @purchase= Purchase.all
  end

  def edit
    @purchase = Purchase.find(params[:id])
  end

  def update
    @purchase = Purchase.find(params[:id])
    @purchase.update(purchase_param)
    redirect_to @purchase
  end

  def destroy
    @purchase = Purchase.destroy(params[:id])
    redirect_to @purchase
  end

  private
  def purchase_param
    params.require(:customer).permit(:supplier_id, :bill_no, :fiscal_year_id, :purchase_date, :total, :discount, :tax)
  end
end
