class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  hirakatakan =  /[ぁ-んァ-ン一-龥]/
  katakana = /[ァ-ヶー－]+/
  with_options presence: true do
    validates :nick_name
    validates :date_of_birth
    validates :family_name, format: {with: hirakatakan }
    validates :first_name, format: {with: hirakatakan }
    validates :family_name_kana, format: {with: katakana }
    validates :first_name_kana, format: {with: katakana }
  end
  validates :password, format: { with: /(?=.*[0-9])(?=.*[a-zA-Z])[0-9a-zA-Z]/ }
  
  has_many :items
  has_many :orders
end
