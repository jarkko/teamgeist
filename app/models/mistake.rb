class Mistake < ActiveRecord::Base
  belongs_to :performance
  belongs_to :mistake_type
  
  attr_accessor :description
end