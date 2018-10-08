require 'rails_helper'

RSpec.describe Admin::DashboardController, type: :controller do

  describe 'user access' do

    describe "GET 'index'" do
      it "returns http success" do
        user = User.create(
          email: 'admin@example.com',
          password: 'secret',
          password_confirmation: 'secret'
        )
        session[:user_id] = user

        get 'index'
        expect(response).to be_successful
      end
    end
  end

end
