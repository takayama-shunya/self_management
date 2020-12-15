class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i

  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 30 }
                    # format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }


       
end
