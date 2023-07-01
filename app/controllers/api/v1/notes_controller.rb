class Api::V1::NotesController < ApplicationController
  before_action :set_note, only: [:show, :update, :destroy]

  def index
    notes = Note.order(created_at: :desc)
    render json: { notes: notes }
  end

  def show
    render json: { note: @note }
  end

  def create
    # note = Note.new(note_params)
    note = current_v1_user.notes.new(note_params)
    if note.save
      render json: { status: 'success', note: note }
    else
      render json: { status: 'error', errors: note.errors }
    end
  end

  def update
    if @note.update(note_params)
      render json: { status: 'success', note: @note }
    else
      render json: { status: 'error', errors: @note.errors }
    end
  end

  def destroy
    if @note.destroy
      render json: { status: 'success', note: @note }
    else
      render json: { status: 'error', errors: @note.errors }
    end
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.permit(:title, :content)
  end
end
