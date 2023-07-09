class Api::V1::NotesController < ApplicationController
  before_action :authenticate_api_v1_user!, except: %i[index show]
  before_action :set_note, only: [:show, :update, :destroy]

  def index
    notes = Note.order(created_at: :desc)
    authorize notes
    render json: { data: notes }
  end

  def show
    authorize @note
    render json: { data: @note }
  end

  def create
    authorize Note
    note = Note.new(note_params)
    if note.save
      render json: { status: 'success', data: note }
    else
      render json: { status: 'error', errors: note.errors }
    end
  end

  def update
    authorize @note
    if @note.update(note_params)
      render json: { status: 'success', data: @note }
    else
      render json: { status: 'error', errors: @note.errors }
    end
  end

  def destroy
    authorize @note
    if @note.destroy
      render json: { status: 'success', data: @note }
    else
      render json: { status: 'error', errors: @note.errors }
    end
  end

  def search
    authorize Note

    match_type = params[:q][:match] || 'and'
    search_params = params[:q][:queries]

    puts params[:q]

    if match_type == 'and'
      @notes = Note.ransack(search_params).result(distinct: true)
    else
      search_hash = Hash[search_params.keys.zip(search_params.values)]
      @notes = Note.ransack(search_hash.merge(m: 'or')).result(distinct: true)
    end

    render json: { notes: @notes }
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.permit(:id, :title, :content, :user_id, :company_id, :created_at, :updated_at)
  end
end