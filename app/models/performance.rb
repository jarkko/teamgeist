class Performance < ActiveRecord::Base
  belongs_to  :user
  has_many    :mistakes
end
