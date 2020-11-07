class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  with_options presence: true do
    validates :nickname
    validates :email
    validates :password
    validates :password_confirmation
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana
    validates :birth_day
  end

  with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end

  with_options format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/.freeze
  validates :password, presence: true,
                       format: { with: VALID_PASSWORD_REGEX, message: '半角英字・数字それぞれを含む必要があります' }
end
