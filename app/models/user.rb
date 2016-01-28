class User < ActiveRecord::Base
  has_many :boards
  has_many :tasks, :through => :boards
  accepts_nested_attributes_for :boards, :tasks

  before_save { self.email = email.downcase }
  has_secure_password

  validates :name, presence: true, length: { minimum: 3 },
                                   uniqueness: true,
                                   blacklist: true

  validates :email, length: { minimum: 6,
                              maximum: 100 },
                    email: true,
                    uniqueness: true

  validates :password, presence: true, length: { in: 6..20 }
  validates :password_confirmation, presence: true
end
