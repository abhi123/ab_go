class AlbumsController < ApplicationController
  # GET /albums
  # GET /albums.xml
  layout "application", :except => [:tag_image]
  def index
    @album = Album.new
    @my_album = Album.paginate :page => params[:page], :conditions => ["user_id =? ", current_user.id]
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @albums }
    end
  end

  # GET /albums/1
  # GET /albums/1.xml
  def show
    @album = Album.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @album }
    end
  end

  # GET /albums/new
  # GET /albums/new.xml
  def new
    @album = Album.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @album }
    end
  end

  # GET /albums/1/edit
  def edit
    @album = Album.find(params[:id])
  end

  # POST /albums
  # POST /albums.xml
  def create
    @album = Album.new(params[:album])

    respond_to do |format|
      if @album.save && params[:return_to].present?
        format.html { redirect_to(params[:return_to], :notice => 'Photo was successfully loaded.') }
        format.xml  { render :xml => @album, :status => :created, :location => @album }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @album.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /albums/1
  # PUT /albums/1.xml
  def update
    @album = Album.find(params[:id])

    respond_to do |format|
      if @album.update_attributes(params[:album])
        format.html { redirect_to(@album, :notice => 'Album was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @album.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.xml
  def destroy
    @album = Album.find(params[:id])
    @album.album.destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to(albums_path, :notice => 'photo was successfully deleted.') }
      format.xml  { head :ok }
    end
  end
  
  def add_tag
   @tag = Jtag.new(:label => params[:label], :width => params[:width], :height => params[:height], :top => params[:top], :left => params[:left], :user_id => params[:user_id], :album_id => params[:album_id])
   @tag.save
   
    respond_to do |format|
      format.json {render :json => @tag.id} 
    end  
  end
  
  def remove_tag
    @tag = Jtag.find(params[:id])
    @tag.destroy
    respond_to do |format|
      format.json {render :json => "success"} 
    end  
  end
  
  def show_tag
    @tags = Jtag.find(:all, :conditions => ["user_id =? AND album_id =?", params[:user_id], params[:album_id]])
    
    respond_to do |format|
      format.json {render :json => @tags } 
    end  
  end
  
  def tag_image
    @album = Album.find(params[:id])   
    respond_to do |format|
      format.html 
    end  
  end
end
