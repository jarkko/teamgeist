class PerformancesController < ApplicationController
  before_filter :require_user
  before_filter :fetch_user, :only => [:show, :update, :destroy]
  
  helper_method :sort_column, :sort_direction
  
  def index
    @performances = current_user.performances.find(
      :all,
      :include => [:mistakes],
      :order => (sort_column + " " + sort_direction)
    )
  end
  
  def new
    @performance = current_user.performances.build(:date => Date.today)
  end
  
  def create
    @performance = current_user.performances.create!(params[:performance])
    
    respond_to do |format|
      format.js do
        render :text => @performance.id
      end
    end
  end
  
  def show
  end
  
  def update
    @performance.update_attributes!(params[:performance])
    
    respond_to do |format|
      format.js do
        render :text => ""
      end
    end
  end
  
  def destroy
    @performance.destroy
    
    respond_to do |format|
      format.js do
        render :text => ""
      end
      format.html do
        redirect_to performances_url
      end
    end
  end
  
  private
  
  def fetch_user
    @performance = current_user.performances.find(params[:id])
  rescue
    render :text => "Not found", :status => :not_found
  end
  
  def sort_column
    %w[date name length time position winning_time].include?(params[:sort]) ? params[:sort] : "date"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
