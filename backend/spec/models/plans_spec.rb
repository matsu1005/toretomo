require 'rails_helper'

RSpec.describe Plan, type: :model do
  before do 
    @plan = build(:plan)
  end
  

  it '練習プラン作成' do
    expect(@plan).to be_valid
  end

  describe 'nullチェック' do
    it 'user_idが空だとNG' do
      @plan.user_id = ''
      expect(@plan.valid?).to eq(true)
    end

    it 'titleが空だとNG' do
      @plan.title = ''
      expect(@plan.valid?).to eq(false)
    end

    it 'detailが空だとNG' do
      @plan.detail = ''
      expect(@plan.valid?).to eq(false)
    end

    it 'event_clsが空だとNG' do
      @plan.event_cls = ''
      expect(@plan.valid?).to eq(false)
    end

    it 'train_strengthが空だとNG' do
      @plan.train_strength = ''
      expect(@plan.valid?).to eq(false)
    end

    it 'start_ymdが空だとNG' do
      @plan.start_ymd = ''
      expect(@plan.valid?).to eq(false)
    end
    
    it 'start_timeが空だとNG' do
      @plan.start_time = ''
      expect(@plan.valid?).to eq(false)
    end

    it 'durationが空だとNG' do
      @plan.duration = ''
      expect(@plan.valid?).to eq(false)
    end

    it 'placeが空だとNG' do
      @plan.place = ''
      expect(@plan.valid?).to eq(false)
    end

    it 'prefectureが空だとNG' do
      @plan.prefecture = ''
      expect(@plan.valid?).to eq(false)
    end

    it 'join_limitが空だとNG' do
      @plan.join_limit = ''
      expect(@plan.valid?).to eq(false)
    end
  end
end