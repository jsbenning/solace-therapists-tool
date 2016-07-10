class Therapist < ActiveRecord::Base
  has_many :clients
  has_many :records, through: :clients
  
  has_secure_password
  validates_presence_of :username, :on => :create
  validates_presence_of :password, :on => :create
  validates_presence_of :first_name, :on => :create
  validates_presence_of :last_name, :on => :create
  validates_presence_of :license_type, :on => :create
  validates_presence_of :license_number, :on => :create
en