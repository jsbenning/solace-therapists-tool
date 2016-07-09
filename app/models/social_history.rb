class SocialHistory < ActiveRecord::Base
    include Collectable
  belongs_to :client
end