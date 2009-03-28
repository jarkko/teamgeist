class PerformancesController < ApplicationController
  before_filter :require_user
  before_filter :fetch_user, :only => [:show, :update, :destroy]
  
  def index
    @performances = current_user.performances
  end
  
  def new
    @performance = current_user.performances.build
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
end
