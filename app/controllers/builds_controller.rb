class BuildsController < ApplicationController

  protect_from_forgery :only => [:update, :destroy]   
  
  def index
    @builds = Build.paginate(params[:page] || 1, 10, :order => :time, :class => nil, :descending => true)
  end

  def show
    if params[:id]
      @build = Build.find(params[:id])
    else
      redirect_to :action => 'index'
    end
  rescue Errno::ECONNREFUSED
    render :text => "Database: connection refused"
  end

  def create
    build = Build.json_create(JSON.parse(request.body.read))
    build.save!
    render :json => build
  rescue Errno::ECONNREFUSED
    render :text => "Database: connection refused"
  end

  def ping
    render :text => "Ok"
  end
end
