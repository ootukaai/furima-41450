class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :shipping_day
  belongs_to :shipping_free
  belongs_to :address
  belongs_to :status

  validates :name, :string, presence: true
  validates :feature, :text, presence: true
  validates :price, :integer, presence: true
  validates :address_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :status_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :shipping_free_id, numericality: { other_than: 1 , message: "can't be blank" } 
 

end
