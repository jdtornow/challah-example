require 'spec_helper'

describe ProfileController do

  let(:user) { create(:user) }

  describe "GET edit" do
    context "without a user session" do
      before { get :edit }

      it "redirects to sign in" do
        expect(response).to redirect_to(signin_path)
      end
    end

    context "with a user session" do
      before do
        signin_as(user)
        get :edit
      end

      it { expect(response.status).to eq(200) }
    end
  end

  describe "PUT update" do
    before { signin_as(user) }

    context "with a valid update" do
      before do
        User.any_instance.stubs(:valid?).returns(true)
        put :update, id: user.to_param, user: { first_name: "bob" }
      end

      it "redirects back to profile" do
        expect(response).to redirect_to(profile_path)
      end
    end

    context "with a valid update" do
      before do
        User.any_instance.stubs(:valid?).returns(false)
        put :update, id: user.to_param, user: { first_name: "" }
      end

      it "stays on form" do
        expect(response.status).to eq(200)
      end
    end
  end

end
