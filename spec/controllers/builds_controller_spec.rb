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

  describe "handles CouchDB connection refused exception" do
    describe "on /show" do
      before do
        Build.stub!(:find).and_raise(Errno::ECONNREFUSED)
      end
      
      it "renders an error message" do
        get :show, :id => "35340"
        response.should be_success
        response.should have_text("Database: connection refused")
      end
    end

    describe "on /create" do
      before do
        JSON.stub!(:parse)
        Build.stub!(:json_create).and_raise(Errno::ECONNREFUSED)
      end
      
      it "renders an error message" do
        put :create, :post => { :body => nil }
        response.should be_success
        response.should have_text("Database: connection refused")
      end
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

  describe "feed action" do
    before do
      builds = []
      10.times do
        builds << mock_model(Build)
      end
      Build.should_receive(:paginate).with(1,10,an_instance_of(Hash)).and_return(builds)
    end

    it "create response" do
      get :feed
      response.should be_success
    end

    it "set content type" do
      get :feed
      response.headers["type"].should match(/application\/rss\+xml/)
    end
  end

end
