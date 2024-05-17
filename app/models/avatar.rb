class Avatar < ApplicationRecord
  attr_accessor :correct_sounds

  has_many :sounds
end
