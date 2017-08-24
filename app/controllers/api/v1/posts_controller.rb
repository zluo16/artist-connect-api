class Api::V1::PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :comments]

  def index
    render json: Post.all
  end

  def show
    render json: @post
  end

  def create
    @post = Post.new(text: params[:text], user_id: params[:user_id])

    if @post.save
      redirect_to action: 'index'
    else
      render json: {
        error: "There's a problem!"
      }, status: 422
    end
  end

  def update
    if @post.update(likes: params[:likes])
      redirect_to action: 'show'
    else
      render json: {
        error: "There's a problem!"
      }, status: 422
    end
  end

  def comments
    render json: @post.comments
  end

  def user_posts
    @posts = Post.all.select{|post| post.user.id == params[:id].to_i}
    render json: @posts
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.permit(:user, :text, :link, :like)
    end
end
