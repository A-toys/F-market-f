class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many :comments ,dependent: :destroy
  has_many :images ,dependent: :destroy,inverse_of: :item
  belongs_to :user,optional: true
  has_one :order
  belongs_to_active_hash :prefecture
  accepts_nested_attributes_for :images

  enum condition: {'新品未使用': 1, '未使用に近い': 2, '目立った傷や汚れなし': 3, '傷や汚れあり': 4, '全体的に状態が悪い': 5}
  enum fee_burden: {'送料込み（出品者負担）': 1, '着払い（購入者負担）': 2}
  enum service: {'未定': 1, 'らくらくメルカリ便': 2, 'ゆうメール': 3, 'レターパック': 4, '普通郵便（定形、定形外）': 5, 'クロネコヤマト': 6, 'ゆうパック': 7, 'クリックポスト': 8, 'ゆうパケット': 9}
  enum handing_time: {'１〜２日で発送': 1, '２〜３日で発送': 2, '４〜７日で発送': 3}
end
