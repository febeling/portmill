require 'pp'
require 'rubygems'
require 'couch_potato'
require 'couchrest'

def db
  @db ||= CouchRest.database("mpbuilds")
end

# Problems with other implementations:
#
# potato:    paginate liest jedesmal alle ein und geht nur fuer has_many!
# couchrest: can't do include_docs!

# approach: paginate an empty view to get ids, bulk-fetch docs.
# The view determines ordering _and_ needs to have unique IDs.
# If the IDs were not unique one would need index access, but 
# that is expensive!

def page(page = 1, per_page = 3)
  skip = (page - 1) * per_page
  res = db.view('builds/timeline', :count => per_page, :skip => skip)
  ids = res['rows'].map{ |row| row['id'] }
  db.view("content/summaries", :keys => ids)['rows']
end

page1 = page(1)
puts '=== Page 1'
pp page1

page2 = page(2)
puts '=== Page 2'
pp page2
