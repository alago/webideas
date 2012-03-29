class CommentsController < ApplicationController
  
  def create
    
    @comment = Comment.new(params[:comment])
    @commentable = Comment.find(params[:commentable_id])
    @comment.commentable = @commentable
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @idea, notice: 'Comment was successfully created.' }
        format.json { render json: @idea, status: :created, location: @idea }
      else
        format.html { render action: @idea }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end
  
 
end
