class WelcomeController < ApplicationController
  before_action :check_signed_in

  def index
    @message = Message.new
  end

  private

  def check_signed_in
    redirect_to notebooks_path if current_user.present?
  end
end
