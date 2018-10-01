# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LeavesController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to be_successful
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
