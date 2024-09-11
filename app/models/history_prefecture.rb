class HistoryPrefecture 
  extend ActiveHash::Associations::ActiveRecordExtensions
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :first_address_id, :post_num, :second_address, :third_address, :forth_address, :tel_num,:token

  with_options presence: true do
  validates :user_id
  validates :item_id
  validates :first_address_id,numericality: { other_than: 2 , message: "can't be blank" }
  validates :second_address
  validates :third_address
  validates :post_num, format: { with: /\A\d{3}-\d{4}\z/, message: "Enter it as follows (e.g. 123-4567)" }
  validates :tel_num, length: { minimum: 10, maximum: 11,message: "Phone number is too short" }, format: { with: /\A\d+\z/, message: "Phone number is invalid. Input only number" }
  validates :token
  end

  def save
  history = History.create(item_id: item_id, user_id: user_id)
  Prefecture.create(first_address_id: first_address_id, second_address: second_address, third_address: third_address, forth_address: forth_address, tel_num: tel_num, post_num: post_num, history_id: history.id)
 end
end

