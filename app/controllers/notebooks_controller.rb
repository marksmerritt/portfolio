class NotebooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_notebook, only: [:show, :edit, :update, :toggle_status]
  
  def index
    @notebooks = Notebook.active
  end

  def show
    @notes = @notebook.notes
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

  def edit
  end

  def update
    if @notebook.update(notebook_params)
      redirect_to @notebook
    else
      render :edit
    end
  end

  # TODO: Add Flash
  def toggle_status
    @notebook.toggle_status!
    redirect_to notebooks_path
  end


  private

  def notebook_params
    params.require(:notebook).permit(:name)
  end

  def set_notebook
    @notebook = Notebook.find(params[:id])
  end
end
