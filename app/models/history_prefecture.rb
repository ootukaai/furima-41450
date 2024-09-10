class HistoryPrefecture 
  extend ActiveHash::Associations::ActiveRecordExtensions
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :first_address_id, :post_num, :second_address, :third_address, :forth_address, :tel_num, :first_address_id,:token

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :first_address_id, presence: true,numericality: { other_than: 1 , message: "can't be blank" }
  validates :second_address, presence: true
  validates :third_address, presence: true
  validates :post_num, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: "Enter it as follows (e.g. 123-4567)" }
  validates :tel_num, presence: true, length: { minimum: 10, message: "Phone number is too short" }, format: { with: /\A\d+\z/, message: "Phone number is invalid. Input only number" }
  validates :token, presence: true
 
  def save
  history = History.create(item_id: item_id, user_id: user_id)
  Prefecture.create(first_address_id: first_address_id, second_address: second_address, third_address: third_address, forth_address: forth_address, tel_num: tel_num, post_num: post_num, history_id: history.id)
 end
end

