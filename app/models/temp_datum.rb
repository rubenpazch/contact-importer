class TempDatum < ApplicationRecord
  belongs_to :user
  scope :show_inactive, -> { where(show: false)}
end
  