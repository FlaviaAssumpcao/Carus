class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :donations, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :photo

  validates :first_name, :last_name, :email, :date_of_birth, presence: true
  validates :email, uniqueness: true
end
