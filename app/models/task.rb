class Task < ActiveRecord::Base
  belongs_to :board, counter_cache: true
  has_many :comments, :dependent => :destroy
  accepts_nested_attributes_for :board, :comments
  before_save :set_start_date_if_empty

  validates :board_id, presence: true
  validates :content, presence: true, length: {minimum: 3, maximum: 160}, blacklist: true
  validates :start_date, presence: true
  validates_date :start_date, :on => :create, :on_or_after => lambda { Date.current }
  validates_date :finish_date, :on_or_after => lambda { Date.current }, :allow_blank => true


  private
  def set_start_date_if_empty
    if self.start_date.nil?
      self.start_date = self.created_at
    end
  end

  def set_finished_if_empty
    if self.finished.nil?
      self.finished = false
    end
  end
end
