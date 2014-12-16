class Todo < ActiveRecord::Base

  belongs_to :user

  validates :description, length: { minimum: 5 }, presence: true

  def days_left
    (created_at.to_date - (DateTime.now.to_date - 6.days)).to_i
  end
end
