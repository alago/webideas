class CommentsController < ApplicationController
  
  def create
    
    @comment = Comment.new(params[:comment])
    @idea = Idea.find(params[:idea_id])
    @comment.commentable = @idea
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
