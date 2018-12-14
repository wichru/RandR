# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LeavesController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'when leaves are creating' do
      let(:valid_params) do
        { leave:
          { start_date: 2018-11-15,
            end_date: 2018-11-19,
            leave_type: 'Holiday' }}
      end

      let(:invalid_params) do
        { leave:
          { start_date: 2018-11-20,
            end_date: 2018-11-19,
            leave_type: 'Holiday' }}
      end

      it 'it creates leave request' do
        expect do
          post :create, params: valid_params
        end.to change(Leave, :count).by(1)
        expect(response).to redirect_to(leaves_path)
      end

      it "doesn't create leave request" do
        expect do
          post :create, params: invalid_params
        end.to change(Leave, :count)
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET 'new'" do
    it 'returns http success' do
      get :new
      response.is_expected be_successful
    end
  end
  describe "GET 'create'" do
    it 'returns http success' do
      get :create
      is_expected be_successful
    end
  end
  describe "GET 'edit'" do
    it 'returns http success' do
      get :edit
      is_expected be_successful
    end
  end
  describe "GET 'update'" do
    it 'returns http success' do
      get :update
      is_expected be_successful
    end
  end
  describe "GET 'destroy'" do
    it 'returns http success' do
      get :destroy
      is_expected be_successful
    end
  end
end
