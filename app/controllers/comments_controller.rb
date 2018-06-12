class CommentsController < ApplicationController
  def index
    @commentable = find_commentable
    @comments = @commentable.comments
  end

  def create
    @commentable = find_commentable
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to post_path(params[:post_id])
    else
      flash.now[:danger] = "error"
    end
  end

  def update

  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
  end

  private
    def find_commentable
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end
