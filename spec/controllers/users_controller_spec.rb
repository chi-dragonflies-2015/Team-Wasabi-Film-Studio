require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it 'assigns new user to @user' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new contact in the database" do
        expect{
          post :create, user: FactoryGirl.attributes_for(:user)
          }.to change(User,:count).by(1)
      end

      it "redirects to the home page" do
        post :create, user: FactoryGirl.attributes_for(:user)
        response.should redirect_to root_path
      end
    end

    context "with invalid attributes" do
      xit "does not save the new contact in the database" do

      end

      xit "re-renders the :new template" do

      end
    end
  end

end