class BuildsController < ApplicationController
  
  def index
    @builds = Build.timeline
  end
  
end
