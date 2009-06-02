require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe BuildsController do
  describe "should index" do
    before(:each) do
      Build.stub!(:paginate).and_return(@mock_builds = mock_model(Array))
    end

    it "successfully" do
      get :index
      response.should be_success
    end

    it "assign @builds" do
      get :index
      assigns(:builds).should == @mock_builds
    end
  end

  describe "couchdb connection refused exception" do
    before do
      Build.stub!(:find).and_raise(Errno::ECONNREFUSED)
    end

    it "renders an error text" do
      get :show, :id => "35340"
      response.should be_success
      response.should have_text("Database: connection refused")
    end
  end

  describe "should ping" do
    def do_ping
      post :ping
    end

    it "successfully" do
      do_ping
      response.should be_success
    end

    it "and respond 'Ok'" do
      do_ping
      response.should have_text("Ok")
    end
  end
end
