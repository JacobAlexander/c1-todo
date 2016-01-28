class Comment < ActiveRecord::Base
  belongs_to :task
  validates :task_id, presence: true
  validates :content, presence: true, length: { minimum: 3, maximum: 160}, blacklist: true
end
