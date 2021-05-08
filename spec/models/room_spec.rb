require 'rails_helper'

RSpec.describe Room, type: :model do
  describe '手順書新規作成' do
    before do
      @room = FactoryBot.build(:room)
    end

    it '必要な情報があれば新規作成が行える' do
      expect(@room).to be_valid
    end

    it 'imageが空では作成ができない' do
      @room.image = nil
      @room.valid?
      expect(@room.errors.full_messages).to include("画像を入力してください")
    end
    it 'group_nameが空では作成できない' do
      @room.group_name = ''
      @room.valid?
      expect(@room.errors.full_messages).to include("グループ名を入力してください")
    end
    it 'group_nameが1文字以下では作成できない' do
      @room.group_name = 'あ'
      @room.valid?
      expect(@room.errors.full_messages).to include("グループ名は2文字以上で入力してください")
    end
    it 'group_nameが11文字以上では作成できない' do
      @room.group_name = '12345678910'
      @room.valid?
      expect(@room.errors.full_messages).to include("グループ名は10文字以内で入力してください")
    end
    it 'speciesが空では作成できない' do
      @room.species = ''
      @room.valid?
      expect(@room.errors.full_messages).to include("機種を入力してください")
    end
    it 'speciesが1文字以下では作成できない' do
      @room.species = 'あ'
      @room.valid?
      expect(@room.errors.full_messages).to include("機種は2文字以上で入力してください")
    end
    it 'speciesが11文字以上では作成できない' do
      @room.species = '12345678910'
      @room.valid?
      expect(@room.errors.full_messages).to include("機種は10文字以内で入力してください")
    end
    it 'first_workが空では作成できない' do
      @room.first_work = ''
      @room.valid?
      expect(@room.errors.full_messages).to include("作業名1を入力してください")
    end
    it 'first_workが1文字以下では作成できない' do
      @room.first_work = 'あ'
      @room.valid?
      expect(@room.errors.full_messages).to include("作業名1は2文字以上で入力してください")
    end
    it 'first_workが21文字以上では作成できない' do
      @room.first_work = '123456789101112131415'
      @room.valid?
      expect(@room.errors.full_messages).to include("作業名1は20文字以内で入力してください")
    end
    it 'first_textが空では作成できない' do
      @room.first_text = ''
      @room.valid?
      expect(@room.errors.full_messages).to include("作業名1の作業手順を入力してください")
    end
  end
end
