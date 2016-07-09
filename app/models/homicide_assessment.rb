class HomicideAssessment < ActiveRecord::Base
  include Collectable
  belongs_to :client
end