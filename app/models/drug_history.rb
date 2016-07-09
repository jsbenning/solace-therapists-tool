class DrugHistory < ActiveRecord::Base
  include Collectable
  belongs_to :client
end