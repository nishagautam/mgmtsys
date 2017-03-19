class SuppliersController < ApplicationController
  def new
    @supplier =Supplier.new
  end
  def create
    @supplier = Supplier.new(supplier_param)
    if@supplier.save
    redirect_to @supplier
    else
      render 'new'
    end
    end

  def show
    @suppliers = Supplier.find(params[:id])
  end

  def index
    @suppliers = Supplier.paginate(:page => params[:page], :per_page => 3)
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def update
    @supplier = Supplier.find(params[:id])
    @supplier.update(supplier_param)
    redirect_to @supplier
  end

  def destroy
    @supplier = Supplier.destroy(params[:id])
    redirect_to @supplier
  end

  private
  def supplier_param
    params.require(:supplier).permit( :name, :phn_no, :address, :email)
  end
end
