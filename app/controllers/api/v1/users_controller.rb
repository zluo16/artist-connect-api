class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    year = params[:dob].split('/')[0].to_i
    month = params[:dob].split('/')[1].to_i
    day = params[:dob].split('/')[2].to_i
    dob = DateTime.new(year,day,month)

    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], stage_name: params[:stage_name], email: params[:email], dob: dob, password: params[:password], password_confirmation: params[:password_confirmation])

    if @user.save
      created_jwt = issue_token(id: @user.id)
      render json: { user: @user, jwt: created_jwt }
    else
      render json: {
        error: 'Email already exists'
      }, status: 422
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.permit(:first_name, :last_name, :stage_name, :email, :dob, :password, :password_confirmation)
    end
end
