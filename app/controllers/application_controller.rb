class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    admin_dashboard_index_url
  end
  
  def after_sign_out_path_for(resource)
    dashboard_index_url
  end
end
