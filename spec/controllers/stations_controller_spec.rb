require 'rails_helper'

RSpec.describe StationsController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Station. As you add validations to Station, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryGirl.build(:station).attributes.symbolize_keys
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # StationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "fetches 45 BART stations from the database" do
      get :index, {}, valid_session
      expect(assigns(:stations).count).to eq(45)
    end
  end

  describe "GET show" do
    it "assigns any requested station to @station" do
      station = Station.create! valid_attributes
      get :show, {:id => station.to_param}, valid_session
      expect(assigns(:station)).to eq(station)
    end
  end

  describe "GET show_by_abbr" do
    it "fetches a station by its abbreviation" do
      station = Station.create! valid_attributes
      get :show_by_abbr, {:abbr => station[:abbr].downcase.to_param}, valid_session
      expect(assigns(:station)).to eq(station)
    end
  end
  describe "POST create" do
    describe "with valid params" do
      xit "creates a new Station" do
        expect {
          post :create, {:station => valid_attributes}, valid_session
        }.to change(Station, :count).by(1)
      end

      xit "assigns a newly created station as @station" do
        post :create, {:station => valid_attributes}, valid_session
        expect(assigns(:station)).to be_a(Station)
        expect(assigns(:station)).to be_persisted
      end

      xit "redirects to the created station" do
        post :create, {:station => valid_attributes}, valid_session
        expect(response).to redirect_to(Station.last)
      end
    end

    describe "with invalid params" do
      xit "assigns a newly created but unsaved station as @station" do
        post :create, {:station => invalid_attributes}, valid_session
        expect(assigns(:station)).to be_a_new(Station)
      end

      xit "re-renders the 'new' template" do
        post :create, {:station => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      xit "updates the requested station" do
        station = Station.create! valid_attributes
        put :update, {:id => station.to_param, :station => new_attributes}, valid_session
        station.reload
        skip("Add assertions for updated state")
      end

      xit "assigns the requested station as @station" do
        station = Station.create! valid_attributes
        put :update, {:id => station.to_param, :station => valid_attributes}, valid_session
        expect(assigns(:station)).to eq(station)
      end

      xit "redirects to the station" do
        station = Station.create! valid_attributes
        put :update, {:id => station.to_param, :station => valid_attributes}, valid_session
        expect(response).to redirect_to(station)
      end
    end

    describe "with invalid params" do
      xit "assigns the station as @station" do
        station = Station.create! valid_attributes
        put :update, {:id => station.to_param, :station => invalid_attributes}, valid_session
        expect(assigns(:station)).to eq(station)
      end

      xit "re-renders the 'edit' template" do
        station = Station.create! valid_attributes
        put :update, {:id => station.to_param, :station => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    xit "destroys the requested station" do
      station = Station.create! valid_attributes
      expect {
        delete :destroy, {:id => station.to_param}, valid_session
      }.to change(Station, :count).by(-1)
    end

    xit "redirects to the stations list" do
      station = Station.create! valid_attributes
      delete :destroy, {:id => station.to_param}, valid_session
      expect(response).to redirect_to(stations_url)
    end
  end

end
