class Api::V1::NotesController < ApplicationController
  before_action :authenticate_api_v1_user!, except: %i[index show]
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

  def search
    authorize Note

    def search_notes(id, title, content, user_id, company_id, created_at, updated_at, m, o)
      if m == 'and'
        if o == 'eq'
          puts "title: #{title}"
          puts "title_eq: #{Note.ransack(title_eq: title)}"
          @q = Note.ransack(id_eq: id, title_eq: title, content_eq: content, user_id_eq: user_id, company_id_eq: company_id, created_at_eq: created_at, updated_at_eq: updated_at)
        elsif o == 'like'
          @q = Note.ransack(id_cont: id, title_cont: title, content_cont: content, user_id_cont: user_id, company_id_cont: company_id, created_at_cont: created_at, updated_at_cont: updated_at)
        end
        @notes = @q.result(distinct: true)
      else
        if o == 'eq'
          @q = Note.ransack(id_eq: id).or(Note.ransack(title_eq: title)).or(Note.ransack(content_eq: content)).or(Note.ransack(user_id_eq: user_id)).or(Note.ransack(company_id_eq: company_id)).or(Note.ransack(created_at_eq: created_at)).or(Note.ransack(updated_at_eq: updated_at))
        elsif o == 'like'
          @q = Note.ransack(id_eq: id).or(Note.ransack(title_cont: title)).or(Note.ransack(content_cont: content)).or(Note.ransack(user_id_cont: user_id)).or(Note.ransack(company_id_cont: company_id)).or(Note.ransack(created_at_cont: created_at)).or(Note.ransack(updated_at_cont: updated_at))
        end
        @notes = @q
      end
      @notes
    end

    @notes = search_notes(params[:id], params[:title], params[:content], params[:user_id], params[:company_id], params[:created_at], params[:updated_at], params[:m], params[:o])

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
