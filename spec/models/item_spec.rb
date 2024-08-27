require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)

    end
  

  describe '商品投稿機能' do
    context '商品投稿できるとき' do
    it 'nameとimage、priceとaddress_id、category_idとstatus_id、shipping_idとshipping_free、status_idとfeatureが存在すれば登録できる' do
      expect(@item).to be_valid
    end
  end 
  context '商品投稿できないとき' do
    it 'nameが空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'imageが空では登録できない' do
      @item.image.detach
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'address_idが空では登録できない' do
      @item.address_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Address can't be blank")
    end
    it 'category_idが空では登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'status_idが空では登録できない' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it 'shipping_day_idが空では登録できない' do
      @item.shipping_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day can't be blank")
    end
    it 'shipping_free_idが空では登録できない' do
      @item.shipping_free_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping free can't be blank")
    end
    it 'priceは300より小さい値は登録できない' do
      @item.price = 30
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it 'priceは9999999より大きい値は登録できない' do
      @item.price = 111111111111
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    it 'priceは半角英数字でないと登録できない' do
      @item.price = "ｓｓｓｓｓｓ"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it 'category_idが1の時は無効である' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank") 
    end
    it 'status_idが1の時は無効である' do
     @item.status_id = 1
     @item.valid?
     expect(@item.errors.full_messages).to include("Status can't be blank") 
    end
    it 'address_idが1の時は無効である' do
     @item.address_id = 1
     @item.valid?
     expect(@item.errors.full_messages).to include("Address can't be blank") 
    end
   it 'shipping_free_idが1の時は無効である' do
    @item.shipping_free_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping free can't be blank") 
   end
   it 'shipping_day_idが1の時は無効である' do
    @item.shipping_day_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping day can't be blank") 
   end
   it 'userが紐付いていないと保存できない' do
    @item.user = nil
    @item.valid?
    expect(@item.errors.full_messages).to include('User must exist')
  end
end

  
end
end
