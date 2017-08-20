class Api::V1::UserConnectionsController < ApplicationController
  before_action :set_user_connection, only: [:show, :edit, :update, :destroy]

  def index
    @user_connections = UserConnection.all
    render json: @user_connections.to_json
  end

  def create
    if UserConnection.find_by(connectee_id: user_connection_params, connector_id: current_user.id) == nil
      @user_connection = UserConnection.new(connectee_id: user_connection_params, connector_id: current_user.id)
      @user_connection.save
      render json: { user_connection: @user_connection }
    else
      render json: { error: 'Your are already connected!' }
    end
  end

  # PATCH/PUT /user_connections/1
  # PATCH/PUT /user_connections/1.json
  def update
    respond_to do |format|
      if @user_connection.update(user_connection_params)
        format.html { redirect_to @user_connection, notice: 'User connection was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_connection }
      else
        format.html { render :edit }
        format.json { render json: @user_connection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_connections/1
  # DELETE /user_connections/1.json
  def destroy
    @user_connection.destroy
    respond_to do |format|
      format.html { redirect_to user_connections_url, notice: 'User connection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_connection
      @user_connection = UserConnection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_connection_params
      params.require(:connectionId)
    end
end
