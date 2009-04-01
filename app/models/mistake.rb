class Mistake < ActiveRecord::Base
  belongs_to :performance
  delegate :user, :to => :performance
  belongs_to :mistake_type
  
  attr_accessor :description
  
  before_validation :parse_description
  
  validates_presence_of :control, :amount, :mistake_type_id
  
  private
  
  def parse_description
    unless description.blank?
      reg = /\A\s*(\d+)\s+(\w+)\s+(\d+)\s*(.*)$/
      return false unless md = reg.match(description)
      self.control = md[1]
      mistake_type_code = md[2]
      unless mt = user.mistake_types.find_by_abbreviation(mistake_type_code)
        return false
      end
      self.mistake_type = mt
      self.amount = md[3]
      self.comments = md[4]
    end
  end
end