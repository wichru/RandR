require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'signed user' do
    before do
      user = User.create!(
        email: 'example@example.com',
        password: 'test123',
        first_name: 'John',
        last_name: 'Kowalski',
        admin: false
      )
      sign_in
    end

    describe 'GET #index' do
      it 'returns HTTP success' do
        get :index
        expect(response).to redirect_to(leaves_path)
      end
    end
  end
end
