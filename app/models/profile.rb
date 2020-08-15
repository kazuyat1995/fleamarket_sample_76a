class Profile < ApplicationRecord
  belongs_to :user, optional: true
  validates :first_name_kana, format: {
    with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
    message: "全角カタカナのみで入力して下さい"
  },presence: true
  
  validates :family_name_kana,format: {
    with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,
    message: "全角カタカナのみで入力して下さい"
  },presence: true

  validates :first_name, format: {
    with: /\A[^ -~｡-ﾟ]+\z/,
    message: "全角で入力して下さい"
  },presence: true

  validates :family_name, format: {
    with: /\A[^ -~｡-ﾟ]+\z/,
    message: "全角で入力して下さい"
  },presence: true
end
