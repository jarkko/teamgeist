class PerformancesController < ApplicationController
  before_filter :require_user
  
  def index
    @performances = current_user.performances
  end
  
  def new
    @performance = current_user.performances.create!
    redirect_to @performance
  end
  
  def show
    @performance = current_user.performances.find(params[:id])
  end
end
