class Mistake < ActiveRecord::Base
  belongs_to :performance
  delegate :user, :to => :performance
  belongs_to :mistake_type
  belongs_to :mistake_place
  
  acts_as_taggable_on :tags
    
  attr_accessor :description
  
  before_validation :parse_description
  
  validates_presence_of :control, :amount
  
  private
  
  def parse_description
    unless description.blank?
      reg = /\A\s*(\d+)\s+(\w+)\s+(\w+)\s+(\d+)\s*(.*)$/
      return false unless md = reg.match(description)
      self.control = md[1]
      
      place = md[2]
      unless pl = MistakePlace.find_by_abbreviation(place)
        return false
      end
      self.mistake_place = pl
      mistake_type_code = md[3]
      unless mt = MistakeType.find_by_abbreviation(mistake_type_code)
        return false
      end
      self.mistake_type = mt
      self.amount = md[4]
      self.comments = md[5]
    end
  end
end