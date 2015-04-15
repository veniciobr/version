class DocumentsController < ApplicationController
  # GET /documents
  # GET /documents.json
  def index
    if !params[:pipeline_id].nil?
      @pipeline_id = params[:pipeline_id]
      session[:pipeline_id] = params[:pipeline_id]
    else
      if not session[:pipeline_id].nil?
        @pipeline_id = session[:pipeline_id]
      end
    end
    if !params[:analysis_id].nil?
      @analysis_id = params[:analysis_id]
      session[:analysis_id] = params[:analysis_id]
    else
      if not session[:analysis_id].nil?
        @analysis_id = session[:analysis_id]
      end
    end    
    
    @pipelines = Pipeline.find(@pipeline_id)
    @documents = Document.where("pipeline_id = " + @pipeline_id.to_s)

    respond_to do |format|
      format.html # index.html.erb
      # format.json { render json: @documents }
      format.json { render json: @documents.map{|document| document.to_jq_upload } }
    end
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    redirect_to(:action => :index)
  end

  # GET /documents/new
  # GET /documents/new.json
  def new
    @document = Document.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @document }
    end
  end

  # GET /documents/1/edit
  def edit
    @document = Document.find(params[:id])

    # Load Combobox data
    @filetypes = Document.load_filetypes
      
logger.debug "==================================================="
logger.debug  @filetypes
logger.debug "==================================================="

  end

  # POST /documents
  # POST /documents.json
  def create

    @document = Document.new(params[:document])
    respond_to do |format|
      @document.pipeline_id =  session[:pipeline_id]
      if @document.save

          @dir = "#{Rails.root}/Analysis/#{@document.id}/"
          @subdir = @dir+"/files/controle"
          @contrdir = @dir+"/files"
          @plotpath = @subdir+"/plot"
          @alignpath = @subdir+"/alignments"
          @trimmedpath = @subdir+"/trimmed"

          FileUtils.mkdir_p(@dir) unless File.directory?(@dir)
          FileUtils.mkdir_p(@subdir) unless File.directory?(@subdir)
          FileUtils.mkdir_p(@plotpath) unless File.directory?(@plotpath)        
          FileUtils.mkdir_p(@alignpath) unless File.directory?(@alignpath)
          FileUtils.mkdir_p(@trimmedpath) unless File.directory?(@trimmedpath)

          FileUtils.chmod 0777, @dir, :verbose => true
          FileUtils.chmod 0777, @subdir 
          FileUtils.chmod 0777, @contrdir
          FileUtils.chmod 0777, @plotpath
          FileUtils.chmod 0777, @alignpath
          FileUtils.chmod 0777, @trimmedpath

          format.html {
            render :json => [@document.to_jq_upload].to_json,
            :content_type => 'text/html',
            :layout => false
          }
          format.json { render json: {files: [@document.to_jq_upload]}, status: :created, location: @document }
      else
        format.html { render action: "new" }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end    
  end

  # PUT /documents/1
  # PUT /documents/1.json
  def update
    @document = Document.find(params[:id])

    respond_to do |format|
      if @document.update_attributes(params[:document])
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document = Document.find(params[:id])
    @document.destroy

    respond_to do |format|
      format.html { redirect_to documents_url }
      format.json { head :no_content }
    end
  end
end
