class Api::V1::JobPostingsController < ApplicationController
  before_action :set_job_posting, only: [:show, :edit, :update, :destroy]

  # GET /job_postings
  # GET /job_postings.json
  def index
    @job_postings = JobPosting.all
    render json: @job_postings
  end

  def show
    @job_posting = JobPosting.find(params[:id])
    render json: @job_posting
  end

  def create
    @job_posting = JobPosting.new(job_posting_params)

    if @job_posting.save
      redirect_to action: 'show', id: @job_posting.id
    else
      render json: {
        error: "There's a problem!"
      }, status: 422
    end
  end

  # PATCH/PUT /job_postings/1
  # PATCH/PUT /job_postings/1.json
  def update
    respond_to do |format|
      if @job_posting.update(job_posting_params)
        format.html { redirect_to @job_posting, notice: 'Job posting was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_posting }
      else
        format.html { render :edit }
        format.json { render json: @job_posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_postings/1
  # DELETE /job_postings/1.json
  def destroy
    @job_posting.destroy
    respond_to do |format|
      # format.html { redirect_to job_postings_url, notice: 'Job posting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_posting
      @job_posting = JobPosting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_posting_params
      params.permit(:organization_id, :title, :description, :responsibilities, :qualifications)
    end
end
