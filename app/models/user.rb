class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :address, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_many :items
  has_many :comments, dependent: :destroy

  with_options presence: true do
    validates :nickname, presence: true, uniqueness: true
    validates :email,   presence: true,
                        uniqueness: {case_sensitive: false},
                        format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  end
end
