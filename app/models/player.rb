class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include DeviseTokenAuth::Concerns::User

  has_many :scores, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :username, uniqueness: { case_sensitive: false }, length: { in: 2..25 }
  validates :name, length: { maximum: 50 }
  validates :country, length: { maximum: 50 }
  validates :gender, length: { maximum: 25 }

  # Only allow letter, number, underscore and punctuation.
  validates_format_of :username, with: /\A[a-zA-Z0-9_\.]*\z/

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_h).first
    end
  end
end
