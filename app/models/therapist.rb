class Therapist < ActiveRecord::Base
  has_many :clients
  has_many :activity_records, through: :clients
  has_many :releases, through: :clients
  has_many :drug_histories, through: :clients
  has_many :presenting_problems, through: :clients
  has_many :suicide_assessments, through: :clients
  has_many :homicide_assessments, through: :clients
  has_many :assessed_risks, through: :clients
  has_many :mental_statuses, through: :clients
  has_many :social_histories, through: :clients
  has_many :treatment_plans, through: :clients
  has_many :progress_notes, through: :clients

  has_secure_password
  validates_presence_of :username, :on => :create
  validates_presence_of :password, :on => :create
  validates_presence_of :first_name, :on => :create
  validates_presence_of :last_name, :on => :create
  validates_presence_of :license_type, :on => :create
  validates_presence_of :license_number, :on => :create
end