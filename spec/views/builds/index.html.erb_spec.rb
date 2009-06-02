require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/builds/index" do
  before(:each) do
    builds = mock("paged_array", :total_pages => 1, :each => nil)
    assigns[:builds] = builds
    render 'builds/index'
  end
  
  it "should tell you where to find the file" do
    response.should have_tag('div', /Timeline/)
  end
end
