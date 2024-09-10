FactoryBot.define do
 

  factory :history_prefecture do

    first_address_id { 2 }
    second_address { "京都市" }
    third_address { "山科区" }
    forth_address { "" }
    post_num { "600-3333" }
    tel_num { "60033333333" }
    token {"tok_abcdefghijk00000000000000000"}
    

  end

end