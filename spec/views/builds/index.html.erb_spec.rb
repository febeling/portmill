require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/builds/index" do
  before(:each) do
    builds = mock("paged_array", :total_pages => 1, :each => nil)
    assigns[:builds] = builds
    render 'builds/index', :layout => 'application'
  end
  
  it "should tell you where to find the file" do
    response.should have_tag('div', /Timeline/)
  end

  it "should have a feed autodiscovery link" do
    response.should have_tag(%q{link[title=RSS][rel=alternate][type=application/rss+xml]})
  end
end
