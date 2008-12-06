Given /^a successful build of package "(\w+)"$/ do |name|
  CouchPotato::Persistence.Db.save(:name => name, :state => 'success', :time => '2008-12-05 12:34:00')
end

Before do
  CouchPotato::Persistence.Db.delete!
end
