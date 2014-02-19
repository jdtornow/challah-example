require 'spec_helper'

describe HomeController do

  let(:user) { create(:user) }

  describe "GET index" do
    context "without a user session" do
      before { get :index }

      it "returns success" do
        expect(response.status).to eq(200)
      end
    end

    context "with a user session" do

      before do
        signin_as(user)
        get :index
      end

      it { expect(response.status).to eq(200) }

      it "has a user record" do
        expect(assigns(:current_user)).to eq(user)
      end
    end
  end

end
