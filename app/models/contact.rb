class Contact < ApplicationRecord
  validates_format_of :name, with: /\A[a-zA-Z0-9\-]*\z/, :message => "has invalid format"
  belongs_to :user
end
