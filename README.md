# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# DB 設計 
 
## users table  
 
| Column             | Type                | Options                   | 
|--------------------|---------------------|---------------------------| 
| nickname           | string              | null: false,              | 
| email              | string              | null: false, unique: true | 
| encrypted_password | string              | null: false               | 
| first_name         | string              | null: false               | 
| last_name          | string              | null: false               | 
| first_name_kana    | string              | null: false               |  
| last_ame_kana      | string              | null: false               | 
| birthday           | integer             | null: false               | 
 
### Association 

* has_many :items 
* has_many :comments 
* has_one  :addresses 

## addresses table 

| Column                              | Type       | Options                        | 
|-------------------------------------|------------|--------------------------------| 
| post_num                            | integer    | null: false                    | 
| first_address_id                    | integer    | null: false                    | 
| second_address                      | string     | null: false                    | 
| third_address                       | integer    | null: false                    | 
| forth_address                       | string     |                                | 
| tel_num                             | integer    | null: false                    | 
| histories                           | references | null: false, foreign_key: true | 

### Association 

- belongs_to :user 
 
 
## histories table 
 
| Column      | Type       | Options                        | 
|-------------|------------|--------------------------------| 
| items       | references | null: false, foreign_key: true | 
| user        | references | null: false, foreign_key: true | 
 
### Association 
 
- belongs_to :items 
- belongs_to :user 
 
## items table 
  
| Column           | Type       | Options                        | 
|------------------|------------|--------------------------------| 
| name             | string     | null: false                    | 
| feature          | text       | null: false                    |
| category_id      | integer    | null: false,                   | 
| states_id        | integer    | null: false,                   | 
| shipping_free_id | integer    | null: false,                   | 
| shipping_place_id| integer    | null: false,                   | 
| shipping_day_id  | integer    | null: false,                   | 
| price            | integer    | null: false                    | 
| user             | references | null: false, foreign_key: true | 
 
### Association 
 
- belongs_to :histories
- belongs_to :user 