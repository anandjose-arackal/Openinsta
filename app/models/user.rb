class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :user_name, presence: true, length: { minimum: 4, maximum: 24 }
  validates :first_name, presence: true, length: { minimum: 1, maximum: 24 }
  validates :last_name, presence: true, length: { minimum: 1, maximum: 24 }

end
