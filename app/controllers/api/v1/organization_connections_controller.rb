class Api::V1::OrganizationConnectionsController < ApplicationController
  before_action :set_organization_connection, only: [:show, :edit, :update, :destroy]

  # GET /organization_connections
  # GET /organization_connections.json
  def index
    @organization_connections = OrganizationConnection.all
  end

  # GET /organization_connections/1
  # GET /organization_connections/1.json
  def show
  end

  # GET /organization_connections/new
  def new
    @organization_connection = OrganizationConnection.new
  end

  # GET /organization_connections/1/edit
  def edit
  end

  # POST /organization_connections
  # POST /organization_connections.json
  def create
    @organization_connection = OrganizationConnection.new(organization_connection_params)

    respond_to do |format|
      if @organization_connection.save
        format.html { redirect_to @organization_connection, notice: 'Organization connection was successfully created.' }
        format.json { render :show, status: :created, location: @organization_connection }
      else
        format.html { render :new }
        format.json { render json: @organization_connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organization_connections/1
  # PATCH/PUT /organization_connections/1.json
  def update
    respond_to do |format|
      if @organization_connection.update(organization_connection_params)
        format.html { redirect_to @organization_connection, notice: 'Organization connection was successfully updated.' }
        format.json { render :show, status: :ok, location: @organization_connection }
      else
        format.html { render :edit }
        format.json { render json: @organization_connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organization_connections/1
  # DELETE /organization_connections/1.json
  def destroy
    @organization_connection.destroy
    respond_to do |format|
      format.html { redirect_to organization_connections_url, notice: 'Organization connection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization_connection
      @organization_connection = OrganizationConnection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_connection_params
      params.require(:organization_connection).permit(:user_id, :organization_id)
    end
end
