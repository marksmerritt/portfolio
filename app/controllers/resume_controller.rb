class ResumeController < ApplicationController
  def show
    respond_to do |format|
      format.html 
      format.pdf do 
        render pdf: "show",
               layout: "pdf"
      end
    end
  end
end
