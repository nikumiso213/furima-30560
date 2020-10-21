class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name, presence: true
  validates :email, format: { with: /\A[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-] +@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\z/}, presence: true
  validates :encrypted_password, presence: true
  validates :family_name, format: { with: /\A(ぁ-んァ-ンー-龥]|ー)+\z/}, presence: true
  validates :first_name, format: { with: /\A(ぁ-んァ-ンー-龥]|ー)+\z/}, presence: true
  validates :family_name_kana, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/}, presence: true
  validates :first_name_kana, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/}, presence: true
  validates :date_of_birth, presence: true

  has_many :items
  has_many :buyers
end
