class CompanyProfilesController < ApplicationController
  add_breadcrumb "Home", :root_path
  add_breadcrumb "CompanyProfiles", :company_profiles_path

  def new
      @company_profile =CompanyProfile.new
    end


  def create
    @company_profile = CompanyProfile.new(company_profile_param)
    if@company_profile.save
    redirect_to @company_profile
    else
      render 'new'
      end
    @company_profile.logo_url = params[:file]
  end

  def show
    @company_profiles = CompanyProfile.find(params[:id])
  end

  def index
    @company_profiles = CompanyProfile.all
  end

  def edit
    @company_profile = CompanyProfile.find(params[:id])
  end

  def update
    @company_profile = CompanyProfile.find(params[:id])
    @company_profile.update(company_profile_param)
    redirect_to @company_profile
  end

  def destroy
    @company_profile = CompanyProfile.destroy(params[:id])
    redirect_to @company_profile
  end

  private
  def company_profile_param
    params.require(:company_profile).permit( :name, :address, :vdc_mun,
                                  :ward_no, :phone, :vat_pan_num, :logo_url, :district,
    :zone, :fiscal_year_id)
  end
end
