class PipelinesController < ApplicationController
  before_filter :set_pipeline, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if !params[:analysis_id].nil?
      @analysis_id = params[:analysis_id]
      session[:analysis_id] = params[:analysis_id]
    else
      if not session[:analysis_id].nil?
        @analysis_id = session[:analysis_id]
      end
    end
    @analysis = Analysis.find(@analysis_id)  
    @pipelines = Pipeline.where("analysis_id = " + @analysis.id.to_s)
    respond_with(@pipelines)
  end

  def show
    redirect_to(:action => :index)
  end

  def new
    @pipeline = Pipeline.new
    #respond_with(@pipeline)
  end

  def edit
  end

  def create
    logger.debug "#########################################"
    logger.debug session[:analysis_id]
    @pipeline = Pipeline.new(params[:pipeline])
    @pipeline.analysis_id =  session[:analysis_id]
    @pipeline.save

    @dir = "#{Rails.root}/Analysis/#{@pipeline.id}/"
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
        
    session[:pipeline_id] = @pipeline.id  
    respond_with(@pipeline)
  end

  def update
    @pipeline.update_attributes(params[:pipeline])
    respond_with(@pipeline)
  end

  def destroy
    @pipeline.destroy
    respond_with(@pipeline)
  end

  private
    def set_pipeline
      @pipeline = Pipeline.find(params[:id])
    end
end
