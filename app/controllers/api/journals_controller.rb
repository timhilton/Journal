class Api::JournalsController < ApplicationController

  include Api::JournalsHelper

  before_action :current_api_user!

  def index
    render json: @current_user.journals
  end

  def create
    render json: @current_user.journals.create(journal_params)
  end

  def update
    journal = @current_user.journals.find(params[:id])
    render json: journal.update(journal_params)
  end
  
  def show
    render json: @current_user.journals.find(params[:id])
  end

  def destroy
    @current_user.journals.destroy(params[:id])
    render json: {status: 202}
  end

  private

  def journal_params
    params.require(:journal).permit(:entry)
  end
end
