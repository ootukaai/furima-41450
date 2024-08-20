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
| first-name         | string              | null: false               |
| last-name          | string              | null: false               |
| first-name-kana    | string              | null: false               |
| last-name-kana     | string              | null: false               |
| birthday           | integer             | null: false               |

### Association

* has_many :items
* has_many :comments
* has_one  :order

## orders table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| credit-num                          | integer    | null: false                    |
| limit                               | integer    | null: false                    |
| cord                                | integer    | null: false                    |
| post-num                            | integer    | null: false                    |
| first-address_id                    | integer    | null: false                    |
| second-address                      | string     | null: false                    |
| third-address                       | integer    | null: false                    |
| forth-address                       | string     |                                |
| tel-num                             | integer    | null: false                    |
| user                                | references | null: false, foreign_key: true |
### Association

- belongs_to :user


## comments table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| content     | text       | null: false                    |
| items       | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :user

## items table
 
| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| nickname         | string     | null: false                    |
| category_id      | integer    | null: false,                   |
| states_id        | integer    | null: false,                   |
| shipping_free_id | integer    | null: false,                   |
| shipping_place_id| integer    | null: false,                   |
| shipping_day_id  | integer    | null: false,                   |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- has_many   :comment
- belongs_to :user