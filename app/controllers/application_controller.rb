class ApplicationController < ActionController::API

  def current_page
    params[:page] || 1
  end 

  def record_per_page
    params[:rpp] || 25
  end   

end
