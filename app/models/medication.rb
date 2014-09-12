class Medication < ActiveRecord::Base
  has_many :patients

end