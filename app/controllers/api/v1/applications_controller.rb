class Api::V1::ApplicationsController < ApplicationController
  before_action :set_application, only: [:show, :edit, :update, :destroy]

  def index
    @applications = Application.all
  end

  def show
  end

  def create
    if Application.find_by(job_posting_id: params[:job_posting_id], user_id: current_user.id) == nil
      @application = Application.new(application_params)
      @application.user_id = current_user.id
      @application.save
      render json: { application: @application }
    else
      render json: { error: 'You already applied for this position!' }
    end
  end

  # PATCH/PUT /applications/1
  # PATCH/PUT /applications/1.json
  def update
    respond_to do |format|
      if @application.update(application_params)
        format.html { redirect_to @application, notice: 'Application was successfully updated.' }
        format.json { render :show, status: :ok, location: @application }
      else
        format.html { render :edit }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application.destroy
    respond_to do |format|
      format.html { redirect_to applications_url, notice: 'Application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def application_params
      params.permit(:job_posting_id, :resume, :cover_letter)
    end
end
