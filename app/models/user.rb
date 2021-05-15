class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :products
         has_many :purchase_managements
         validates :email, uniqueness: { case_sensitive: true }

        with_options presence: true do
          validates :nickname, format: { with: /\A[ぁ-んァ-ン一-龥a-zA-Z0-9]+\z/}
          validates :email, format: { with:/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
          validates :password,format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
         
            with_options format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/} do
              validates :family_name
              validates :first_name
            end

            with_options format: { with: /\A[ァ-ヶー－]+\z/i} do
              validates :family_name_kana
              validates :first_name_kana
            end

          validates :birth_day, format: { with: /\A[0-9]/}
        end
end
