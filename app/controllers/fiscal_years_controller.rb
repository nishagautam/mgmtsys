class FiscalYearsController < ApplicationController
  add_breadcrumb "Home", :root_path
  add_breadcrumb "FiscalYear", :fiscal_years_path

  def new
    @fiscal_year = FiscalYear.new
  end


  def create
    @fiscal_year = FiscalYear.new(fiscal_year_param)
    if@fiscal_year.save
    redirect_to @fiscal_year
    else
      render 'new'
    end
    end

  def show
    @fiscal_years = FiscalYear.find(params[:id])
  end

  def index
    @fiscal_year = FiscalYear.all
  end

  def edit
    @fiscal_year = FiscalYear.find(params[:id])
  end

  def update
    @fiscal_year = FiscalYear.find(params[:id])
    @fiscal_year.update(fiscal_year_param)
    redirect_to @fiscal_year
  end

  def destroy
    @fiscal_year = FiscalYear.destroy(params[:id])
    redirect_to @fiscal_year
  end

  private
  def fiscal_year_param
    params.require(:fiscal_year).permit( :name, :start_date, :end_date)
  end
end

