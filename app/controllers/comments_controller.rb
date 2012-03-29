class CommentsController < ApplicationController
  
  def create
    
    @comment = Comment.new(params[:comment])
    @commentable = find_commentable
    @comment.commentable = @commentable
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @commentable, notice: 'Comment was successfully created.' }
        format.json { render json: @commentable, status: :created, location: @commentable }
      else
        format.html { render action: @commentable }
        format.json { render json: @commentable.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private

def find_commentable
  params.each do |name, value|
    if name =~ /(.+)_id$/
      return $1.classify.constantize.find(value)
    end
  end
  nil
end
  
 
end
