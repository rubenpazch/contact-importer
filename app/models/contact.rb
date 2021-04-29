class Contact < ApplicationRecord
  validates_format_of :name, with: /\A[a-zA-Z\s\-][^\\$%!"#&\/()='?¡~¿¨´\+\*\[\]\{\}_:\.,;]*\z/, :message => "has invalid format"
  #validates_format_of :email, with: /\A[\w.+-]+@\w+\.\w+\z/, :message => "has invalid format"
  validates :name, presence: true 
  validates :date_of_birth, presence: true
  #validates :date_of_birth, validates_with GoodnessValidator

  belongs_to :user
end
