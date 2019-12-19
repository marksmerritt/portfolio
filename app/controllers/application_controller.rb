class ApplicationController < ActionController::Base
  layout :set_layout

  protected 

  def set_layout
    controller_name == "welcome" ? "application" : "notes"
  end

  def after_sign_in_path_for(resource)
    notebooks_path
  end
end
