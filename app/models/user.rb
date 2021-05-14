class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :products
         has_many :purchase_managements
         validates :nickname, presence: true
         validates :email, uniqueness: { case_sensitive: true }

         with_options presence: true do
          validates :nickname, format: { with: /\A[ぁ-んァ-ン一-龥a-zA-Z0-9]+\z/}
          validates :email, format: { with:/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
          validates :password,format: { with: /[a-z\d]{6,}/i}
          validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
          validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/i}
          validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/}
          validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/i}
          validates :birth_day, format: { with: /\A[0-9]/}
        end
end
