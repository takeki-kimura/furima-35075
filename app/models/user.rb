class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,           presence: true
  validates :password,           presence: true
  # , length: {minimum: 6 }
  validates :password_confirmation , presence: true
  # , length: {minimum: 6 }
  validates :first_name,         presence: true
  validates :family_name,        presence: true
  validates :first_name_kana,    presence: true
  validates :family_name_kana,   presence: true
  validates :birth,              presence: true
end
