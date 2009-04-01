class User < ActiveRecord::Base
  acts_as_authentic
  
  has_many :performances
  has_many :mistakes, :through => :performances
  has_many :mistake_types  
end
