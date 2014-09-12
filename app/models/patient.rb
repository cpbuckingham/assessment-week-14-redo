class Patient < ActiveRecord::Base
  has_many :prescriptions
  validates_presence_of :first_name, :last_name

end