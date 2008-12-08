class Build
  include CouchPotato::Persistence
  
  property :name
  property :state
  property :cpu
  property :revision
  property :os
  property :time
  
  view :timeline, :key => :time, :properties => [:name, :state, :cpu, :revision, :os, :time]
end
