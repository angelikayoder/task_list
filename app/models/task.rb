class Task < ApplicationRecord
  acts_as_list

  # scope :is_done, -> { where(is_done: true) }
  scope :completed, -> { where(is_done: true) }
  scope :not_completed, -> { where(is_done: false) }

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def mark_complete!
    update_attribute(:is_done, true)
  end
end

# undeeded comment
