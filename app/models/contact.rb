class Contact < ApplicationRecord
  belongs_to :user

  validates :name,:birth_date,:phone_number, presence: true
  validates :email, email: true, allow_blank: true

end
