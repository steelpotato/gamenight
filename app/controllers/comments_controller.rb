class CommentsController < ApplicationController
  layout 'standard'
  before_filter :load_game
  
  def load_game
    @game = Game.find(params[:game_id])
  end
  
  # GET /comments
  # GET /comments.xml
  def index
    @comments = @game.comments.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = @game.comments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @comment = @game.comments.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = @game.comments.find(params[:id])
  end

  # POST /comments
  # POST /comments.xml
  def create
    @comment = @game.comments.build(params[:comment])

    respond_to do |format|
      if @comment.save
        # flash[:notice] = 'Comment was successfully created.'
        format.html { redirect_to(@game) }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
        format.js   { render :text => 'Comment was successfully created' }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
        format.js   { render :text => 'unable to add comment'}
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = @game.comments.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        flash[:notice] = 'Comment was successfully updated.'
        format.html { redirect_to(@comment) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = @game.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(comments_url) }
      format.xml  { head :ok }
    end
  end
end
