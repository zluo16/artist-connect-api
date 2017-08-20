class Api::V1::CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :destroy]

  def index
    @comments = Comment.all
    render json: @comments
  end

  def show
    render json: @comment
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to controller: 'posts', action: 'comments', id: @comment.post_id
    else
      render json: {
        error: "There's a problem!"
      }, status: 422
    end
  end

  def destroy
  end

  private

  def comment_params
    params.permit(:post_id, :user_id, :text)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
