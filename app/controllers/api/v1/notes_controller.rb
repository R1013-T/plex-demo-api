class Api::V1::NotesController < ApplicationController
  before_action :authenticate_api_v1_user!
  before_action :set_note, only: [:show, :update, :destroy]
  def index
    notes = Note.order(created_at: :desc)
    authorize notes
    render json: { notes: notes }
  end

  def show
    authorize @note
    render json: { note: @note }
  end

  def create
    authorize Note
    note = Note.new(note_params)
    if note.save
      render json: { status: 'success', note: note }
    else
      render json: { status: 'error', errors: note.errors }
    end
  end

  def update
    authorize @note
    if @note.update(note_params)
      render json: { status: 'success', note: @note }
    else
      render json: { status: 'error', errors: @note.errors }
    end
  end

  def destroy
    authorize @note
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
    params.permit(:title, :content, :user_id, :company_id)
  end
end
