class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :scores, dependent: :destroy

  validates :name, length: { maximum: 50 }
  validates :country, length: { maximum: 50 }
  validates :gender, length: { maximum: 25 }
  validates :username, length: { maximum: 25 }
end
