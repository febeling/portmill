require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/build2s/ping" do
  before(:each) do
    render 'build2s/ping'
  end
  
  #Delete this example and add some real ones or delete this file
  it "should tell you where to find the file" do
    response.should have_tag('p', %r[Find me in app/views/build2s/ping])
  end
end
