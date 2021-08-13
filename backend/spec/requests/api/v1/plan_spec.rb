require 'rails_helper'

RSpec.describe Plan, type: :request do
  describe 'Plan' do
    before(:each) do
      @plan = create(:plan)
    end

    it '練習プラン一覧取得' do
      get '/api/v1/plans/'
      json = JSON.parse(response.body)
      expect(response.status).to eq(200)
    end

  end
end



