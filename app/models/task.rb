class Task < ApplicationRecord
  belongs_to :user
  validates :status, inclusion: { in: %w(pending in-progress completed) }

end
