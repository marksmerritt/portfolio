class NotebooksController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @notebooks = Notebook.all
  end

  def show
    @notebook = Notebook.find(params[:id])
  end

  def new
    @notebook = Notebook.new
  end

  def create
    @notebook = Notebook.new(notebook_params)

    if @notebook.save
      redirect_to @notebook
    else
      render :new
    end
  end


  private

  def notebook_params
    params.require(:notebook).permit(:name)
  end
end
