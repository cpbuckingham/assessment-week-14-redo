class Prescription < ActiveRecord::Base
  belongs_to :patient
  belongs_to :medication
end