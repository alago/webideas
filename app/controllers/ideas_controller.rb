class IdeasController < ApplicationController
  before_filter :authenticate_user!, :except => :index
  
  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ideas }
    end
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    @idea = Idea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @idea }
    end
  end

  # GET /ideas/new
  # GET /ideas/new.json
  def new
    @idea = Idea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @idea }
    end
  end

  # GET /ideas/1/edit
  def edit
    @idea = Idea.find(params[:id])
    if @idea.user != current_user
      flash[:notice] = "No puedes modificar ideas de otros"
      redirect_to idea_url(@idea)
    end
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(params[:idea])
    @idea.user = current_user
    respond_to do |format|
      if @idea.save
        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
        format.json { render json: @idea, status: :created, location: @idea }
      else
        format.html { render action: "new" }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ideas/1
  # PUT /ideas/1.json
  def update
    @idea = Idea.find(params[:id])

    respond_to do |format|
      if @idea.update_attributes(params[:idea])
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy

    respond_to do |format|
      format.html { redirect_to ideas_url }
      format.json { head :no_content }
    end
  end
  
  def vote_up
    @idea = Idea.find(params[:id])
    @idea.liked_by current_user
    flash[:notice] = "Tu voto ha sido registrado"
    redirect_to idea_url(@idea)
  end
  
  def vote_down
    @idea = Idea.find(params[:id])
    @idea.downvote_from current_user
    flash[:notice] = "Tu voto ha sido registrado"
    redirect_to idea_url(@idea)
  end
  
  
  
end
