class ForosController < ApplicationController
  before_filter :authenticate_user!
  
  
  # GET /foros
  # GET /foros.json
  def index
    @foros = Foro.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @foros }
    end
  end

  # GET /foros/1
  # GET /foros/1.json
  def show
    @foro = Foro.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @foro }
    end
  end

  # GET /foros/new
  # GET /foros/new.json
  def new
    @foro = Foro.new
    @comment = Comment.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @foro }
    end
  end

  # GET /foros/1/edit
  def edit
    @foro = Foro.find(params[:id])
  end

  # POST /foros
  # POST /foros.json
  def create
    @foro = Foro.new(params[:foro])
    @foro.user = current_user
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    @foro.comments << @comment

    respond_to do |format|
      if @foro.save
        format.html { redirect_to @foro, notice: 'Foro was successfully created.' }
        format.json { render json: @foro, status: :created, location: @foro }
      else
        format.html { render action: "new" }
        format.json { render json: @foro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /foros/1
  # PUT /foros/1.json
  def update
    @foro = Foro.find(params[:id])

    respond_to do |format|
      if @foro.update_attributes(params[:foro])
        format.html { redirect_to @foro, notice: 'Foro was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @foro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foros/1
  # DELETE /foros/1.json
  def destroy
    @foro = Foro.find(params[:id])
    @foro.destroy

    respond_to do |format|
      format.html { redirect_to foros_url }
      format.json { head :no_content }
    end
  end
end
