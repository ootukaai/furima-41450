class CreatePrefectures < ActiveRecord::Migration[7.0]
  def change
    create_table :prefectures do |t|
      t.integer    :first_address_id,   null:false
      t.string     :second_address,     null:false
      t.string     :third_address,      null:false
      t.string     :forth_address      
      t.string     :tel_num,            null:false
      t.string     :post_num,           null:false
      t.references :history,            null:false, foreign_key: true

      t.timestamps
    end
  end
end
