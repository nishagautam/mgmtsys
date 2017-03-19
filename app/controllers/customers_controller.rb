class CustomersController < ApplicationController
  def new
    @customer =Customer.new
  end

  def create
    @customer = Customer.new(customer_param)
    if @customer.save
      redirect_to @customer

    else
      render 'new'
    end
  end

  def show
    @customers= Customer.find(params[:id])
  end

  def index
    @customers = Customer.paginate(:page => params[:page], :per_page => 3)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_param)
    redirect_to @customer
  end

  def destroy
    @customer = Customer.destroy(params[:id])
    redirect_to @customer
  end

  private
  def customer_param
    params.require(:customer).permit(:name, :phn_no, :address, :email)
  end
end
