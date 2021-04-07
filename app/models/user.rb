class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :nickname
  validate :first_name
  validate :family_name
  validate :first_name_kana
  validate :family_name_kana
end
