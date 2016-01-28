class Board < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, :dependent => :destroy
  accepts_nested_attributes_for :user, :tasks
  validates :user_id, presence: true
  validates :name, presence: true, length: { minimum: 3,
                                             maximum: 20},
                                  uniqueness: true,
                                  blacklist: true
end
