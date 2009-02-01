class BuildsController < ApplicationController

  protect_from_forgery :only => [:update, :destroy]   
  
  def index
    @builds = Build.timeline
  end

  def pages
    @builds = Build.paginate(params[:page] || 1, 5, :order => :time, :class => nil, :descending => true)
  end
#   def create
#     build = Build.json_create JSON.parse(request.body.read)
#     render :json => build
#   end
end
