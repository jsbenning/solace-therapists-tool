class Client < ActiveRecord::Base
  belongs_to :therapist
  has_one :record
end