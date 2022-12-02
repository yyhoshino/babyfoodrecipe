class Classification < ActiveHash::Base
  self.data = [
    { id: 1, name: '分類を選ぶ' },
    { id: 2, name: '主食 - ごはん' },
    { id: 3, name: '主食 - パン' },
    { id: 4, name: '主食 - 麺' },
    { id: 5, name: 'おかず - 野菜' },
    { id: 6, name: 'おかず - 芋' },
    { id: 7, name: 'おかず - 豆腐・豆' },
    { id: 8, name: 'おかず - 乳製品' },
    { id: 9, name: 'おかず - 卵' },
    { id: 10, name: 'おかず - 魚' },
    { id: 11, name: 'おかず - 肉' },
    { id: 12, name: 'その他 - スープ' },
    { id: 13, name: 'その他 - デザート' }
  ]

  include ActiveHash::Associations
  has_many :recipes

  end