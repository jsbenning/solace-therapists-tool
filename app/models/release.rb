class Release < ActiveRecord::Base
  include Collectable
  belongs_to :client
end