class PerformancesController < ApplicationController
  before_filter :require_user
  before_filter :fetch_user, :only => [:show, :update]
  
  def index
    @performances = current_user.performances
  end
  
  def new
    @performance = current_user.performances.create!
    redirect_to @performance
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
  
  private
  
  def fetch_user
    @performance = current_user.performances.find(params[:id])
  rescue
    render :text => "Not found", :status => :not_found
  end
end
