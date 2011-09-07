require "spec_helper"

describe AmountsController do
  describe "routing" do

    it "routes to #index" do
      get("/amounts").should route_to("amounts#index")
    end

    it "routes to #new" do
      get("/amounts/new").should route_to("amounts#new")
    end

    it "routes to #show" do
      get("/amounts/1").should route_to("amounts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/amounts/1/edit").should route_to("amounts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/amounts").should route_to("amounts#create")
    end

    it "routes to #update" do
      put("/amounts/1").should route_to("amounts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/amounts/1").should route_to("amounts#destroy", :id => "1")
    end

  end
end
