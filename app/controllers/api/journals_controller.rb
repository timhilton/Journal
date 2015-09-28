class Api::JournalsController < ApplicationController

  include Api::JournalsHelper

  before_action :current_api_user!

  def index
    render json: @current_user.journals
  end

  def create
    journal = @current_user.journals.create(journal_params)
    render json: journal
  end

  def show
    render json: @current_user.journals.find(params[:id])
  end

  def destroy
    @current_user.journals.destroy(params[:id])
    render status: 202
  end

  private

  def journal_params
    params.require(:journals).permit(:entry)
  end
end
