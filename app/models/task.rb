class Task < ActiveRecord::Base
  belongs_to :board, counter_cache: true
  has_many :comments, :dependent => :destroy
  accepts_nested_attributes_for :board, :comments

  validates :board_id, presence: true
  validates :content, presence: true, length: { minimum: 3, maximum: 160}, blacklist: true
end
