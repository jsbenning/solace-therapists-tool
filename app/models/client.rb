class Client < ActiveRecord::Base
  belongs_to :therapist
  has_one :release
  has_one :presenting_problem
  has_one :drug_hist
  has_one :mental_status
  has_one :suicide_assessment
  has_one :homicide_assessment
  has_one :assessed_risk
  has_one :social_history
  has_many :progress_notes
  has_one :treatment_plan
  has_many :activity_records
end