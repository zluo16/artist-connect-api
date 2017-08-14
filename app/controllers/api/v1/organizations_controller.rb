class Api::V1::OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = Organization.all
    render json: @organizations.to_json(include: [:job_postings, :applications, :tags, :owners])
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
    @organization = Organization.find(params[:id])
    render json: @organization.to_json(include: [:job_postings, :applications, :tags, :owners])
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = User.new(organization_params)

    if @organization.save
      created_jwt = issue_token(id: @organization.id)
      render json: { email: @organization.email, jwt: created_jwt }
    else
      render json: {
        error: 'Email already exists'
      }, status: 422
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url, notice: 'Organization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_params
      params.permit(:name, :organization_type, :email, :password, :password_confirmation)
    end
end
