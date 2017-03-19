class LogsController < ApplicationController
  def index
    @logs = Log.paginate(:page => params[:page], :per_page => 3)
  end

private
def log_param
  params.require(:log).permit(:user_id, :description)

end
  end