class Contact < ApplicationRecord
  belongs_to :user
  validates :first_name, :last_name, :phonenumber, presence: true
  validates :phonenumber, length: { maximum: 12 , minimum: 12}
  validates_numericality_of :phonenumber
end
