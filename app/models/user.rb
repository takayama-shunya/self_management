class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  
  has_many :conditions, dependent: :destroy
  has_many :count_records, dependent: :destroy
  has_many :decimal_records, dependent: :destroy
  has_many :integer_records, dependent: :destroy
  has_many :time_records, dependent: :destroy
  has_many :check_records, dependent: :destroy



  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i

  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, length: { maximum: 30 }
                    # format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }

  def self.guest_user
    User.find_by(name: "user_1")
  end
       
end
