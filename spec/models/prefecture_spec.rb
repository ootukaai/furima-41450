require 'rails_helper'

RSpec.describe HistoryPrefecture, type: :model do
 

  before do

    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @history_prefecture = FactoryBot.build(:history_prefecture, user_id: @user.id, item_id: @item.id)
  end
  describe '商品出品機能' do
    context '商品出品できるとき' do
    it 'すべての値が存在すれば登録できる' do
      expect(@history_prefecture).to be_valid
    end
    it 'forth_addressが空でも登録できる' do
      @history_prefecture.forth_address = ""
      expect(@history_prefecture).to be_valid
    end
  end 
  context '商品出品できないとき' do
    it 'first_address_idが空では登録できない' do
      @history_prefecture.first_address_id = ''
      @history_prefecture.valid?
      expect(@history_prefecture.errors.full_messages).to include("First address can't be blank")
    end
    it 'second_addressが空では登録できない' do
      @history_prefecture.second_address = ''
      @history_prefecture.valid?
      expect(@history_prefecture.errors.full_messages).to include("Second address can't be blank")
    end
    it 'third_addressが空では登録できない' do
      @history_prefecture.third_address = ''
      @history_prefecture.valid?
      expect(@history_prefecture.errors.full_messages).to include("Third address can't be blank")
    end
    it 'post_numが空では登録できない' do
      @history_prefecture.post_num = ''
      @history_prefecture.valid?
      expect(@history_prefecture.errors.full_messages).to include("Post num can't be blank")
    end
    it 'tel_numが空では登録できない' do
      @history_prefecture.tel_num = ''
      @history_prefecture.valid?
      expect(@history_prefecture.errors.full_messages).to include("Tel num can't be blank")
    end
    it 'post_numは郵便番号の形式でしか登録できない' do
      @history_prefecture.post_num = "1234567"
      @history_prefecture.valid?
      expect(@history_prefecture.errors.full_messages).to include("Post num Enter it as follows (e.g. 123-4567)")
    end
    it 'tel_numは10桁からでないと登録できない' do
      @history_prefecture.tel_num = "123456"
      @history_prefecture.valid?
      expect(@history_prefecture.errors.full_messages).to include("Tel num Phone number is too short")
    end
    it 'tel_numは11桁以下でないと登録できない' do
      @history_prefecture.tel_num = "1234567891012"
      @history_prefecture.valid?
      expect(@history_prefecture.errors.full_messages).to include("Tel num Phone number is too short")
    end
    it 'tel_numは半角英数字でないと登録できない' do
      @history_prefecture.tel_num = "abcdefg1234"
      @history_prefecture.valid?
      expect(@history_prefecture.errors.full_messages).to include("Tel num Phone number is invalid. Input only number")
    end
    it 'first_address_idが1の時は無効である' do
      @history_prefecture.first_address_id = 1
      @history_prefecture.valid?
      expect(@history_prefecture.errors.full_messages).to include("First address can't be blank")
    end
    it "tokenが空では登録できないこと" do
      @history_prefecture.token = nil
      @history_prefecture.valid?
      expect(@history_prefecture.errors.full_messages).to include("Token can't be blank")
    end
    it 'user_idが空では登録できない' do
      @history_prefecture.user_id = ''
      @history_prefecture.valid?
      expect(@history_prefecture.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空では登録できない' do
      @history_prefecture.item_id = ''
      @history_prefecture.valid?
      expect(@history_prefecture.errors.full_messages).to include("Item can't be blank")
    end
        it 'third_addressが空では登録できない' do
      @history_prefecture.third_address = ''
      @history_prefecture.valid?
      expect(@history_prefecture.errors.full_messages).to include("Third address can't be blank")
    end

   end
  end
end