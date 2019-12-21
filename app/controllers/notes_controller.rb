class NotesController < ApplicationController
  before_action :set_notebook, only: [:new, :create]
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = Note.all
  end

  def show
  end

  def new
    @note = Note.new
  end

  def create
    @note = @notebook.notes.new(note_params)

    if @note.save
      redirect_to @notebook
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to @note
    else
      render :edit
    end
  end

  def destroy
    @notebook = @note.notebook

    if @note.destroy
      redirect_to @notebook
    else
      redirect_back(fallback_location: notebooks_path)
    end
  end


  private

  def note_params
    params.require(:note).permit(:title, :body)
  end

  def set_notebook
    @notebook = Notebook.find(params[:notebook_id])
  end

  def set_note
    @note = Note.find(params[:id])
  end

end









