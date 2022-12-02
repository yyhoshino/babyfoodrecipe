class MoonAge < ActiveHash::Base
  self.data = [
    { id: 1, name: '月齢を選ぶ' },
    { id: 2, name: '5〜6ヶ月頃(初期)' },
    { id: 3, name: '7〜8ヶ月頃(中期)' },
    { id: 4, name: '9〜11ヶ月頃(後期)' },
    { id: 5, name: '12〜18ヶ月頃(完了期)' },
    { id: 6, name: '1歳半(幼児食)' },
    { id: 7, name: '指定しない' }
  ]
  include ActiveHash::Associations
  has_many :recipes

  end