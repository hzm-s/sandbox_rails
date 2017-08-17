class Users::NotesController < ApplicationController
  before_action :set_user

  def show
    @note = @user.note || Note.new
    render :show, layout: false
  end

  def create
    @note = @user.build_note(note_params)
    @note.save
    render :saved
  end

  def update
    @note = @user.note
    @note.update(note_params)
    render :saved
  end

  private

    def note_params
      params.require(:note).permit(:content)
    end

    def set_user
      @user = User.find(params[:user_id])
    end
end
