class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :address, dependent: :destroy
  has_one :profile, dependent: :destroy

  with_options presence: true do
    validates :nickname, presence: true, uniqueness: true
    validates :email,   presence: true,
                        uniqueness: {case_sensitive: false},
                        format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}

    VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
    validates :password, presence: true, length: { minimum: 7 }, format: { with: VALID_PASSWORD_REGEX }
  end
end
