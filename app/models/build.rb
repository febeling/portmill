class Build
  include CouchPotato::Persistence
  
  property :name
  property :state
  
  view :timeline, :key => :time, :properties => [:name, :state]
end