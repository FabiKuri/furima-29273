class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :items
  has_many :buyers

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
        validates :family_name, :first_name, presence: true
        validates :family_name_reading, :first_name_reading, presence: true
        validates :nickname, presence: true
        validates :birthday, presence: true
        validates :birthday, presence: true
end