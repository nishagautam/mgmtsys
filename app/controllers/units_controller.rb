class UnitsController < ApplicationController
  add_breadcrumb "Home", :root_path
  add_breadcrumb "Units", :units_path

  def new
    @unit =Unit.new
  end
  def create
    @unit = Unit.new(unit_param)
   if @unit.save
      redirect_to @unit
   else

     render 'new'
     end
  end

  def show
    @units = Unit.find(params[:id])
  end

  def index
    @units = Unit.paginate(:page => params[:page], :per_page => 3)

  end

  def edit
    @unit = Unit.find(params[:id])
  end

  def update
    @unit = Unit.find(params[:id])
    @unit.update(unit_param)
    redirect_to @unit
  end

  def destroy
    @unit = Unit.destroy(params[:id])
    redirect_to @unit
  end

  private
  def unit_param
    params.require(:unit).permit( :name, :print_name)
  end
end


