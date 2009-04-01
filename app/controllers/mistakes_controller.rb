class MistakesController < ApplicationController
  before_filter :fetch_performance
  
  def create
    @mistake = @performance.mistakes.create!(params[:mistake])
  end
  
  private
  
  def fetch_performance
    @performance = current_user.performances.find(params[:performance_id])
  rescue
    render :text => "Not found", :status => :not_found
  end
end
