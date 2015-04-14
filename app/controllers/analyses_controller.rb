class AnalysesController < ApplicationController
  before_filter :set_analysis, only: [:show, :edit, :update, :destroy]
  before_filter :check_for_cancel, :only => [:create, :update]

  respond_to :html
  
  def check_for_cancel
    if params[:commit] == "Cancel"
      redirect_to @analysis
    end
  end

  def index
    @userId = current_user.id
    @analyses = Analysis.where("user_id = " + @userId.to_s + " And enable = 0")
    respond_with(@analysis)
    #@analyses = Analysis.all
    #respond_with(@analyses)
  end

  def show
    respond_with(@analysis)
  end

  def new
    @analysis = Analysis.new
    #respond_with(@analysis)
  end

  def edit
  end

  def create
    @analysis = Analysis.new(params[:analysis])
    @analysis.user_id = current_user.id
    @analysis.enable = "True"
    @analysis.save
    session[:analysis_id] = @analysis.id
    respond_with(@analysis)
  end

  def update
    @analysis.update_attributes(params[:analysis])
    respond_with(@analysis)
  end

  def destroy
    @analysis.destroy
    respond_with(@analysis)
  end

  private
    def set_analysis
      @analysis = Analysis.find(params[:id])
    end
end
