class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :shipping_day
  belongs_to :shipping_free
  belongs_to :address
  belongs_to :status
  has_one_attached :image
  has_one :history  
  belongs_to :user


  validates :name, presence: true
  validates :feature, presence: true
  validates :price, presence: true,numericality: {only_integer:true,less_than_or_equal_to: 9999999, greater_than_or_equal_to: 300 }
  validates :image, presence: true
  validates :address_id,  presence: true,numericality: { other_than: 1 , message: "can't be blank" } 
  validates :category_id, presence: true, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :status_id, presence: true,numericality: { other_than: 1, message: "can't be blank"} 
  validates :shipping_day_id, presence: true,numericality: { other_than: 1 , message: "can't be blank" } 
  validates :shipping_free_id,presence: true, numericality: { other_than: 1 , message: "can't be blank" } 
  
end
