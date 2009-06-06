require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BuildsHelper do
  describe "link_to_revision" do
    it "renders a link to a macports svn revision" do
      helper.link_to_revision(8735).should == "<a href='http://trac.macports.org/changeset/8735'>8735</a>"
    end
  end

  describe "linked_revision_list renders the comma-separated list of revision numbers" do
    before do
      @revisions = '234,345,456'
    end

    it "and links them using 3 anchors" do
      helper.linked_revision_list(@revisions).should match(/<a href=.*?>.*?<\/a>, <a href=.*?>.*?<\/a>, <a href=.*?>.*?<\/a>/)
    end    

    it "and links them with the right IDs" do
      helper.linked_revision_list(@revisions).should match(/234.*?345.*?456/)
    end    
  end
end
