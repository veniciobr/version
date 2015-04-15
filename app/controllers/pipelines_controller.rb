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
    @pipeline = Pipeline.new(params[:pipeline])
    @pipeline.analysis_id =  session[:analysis_id]
    @pipeline.save  
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
