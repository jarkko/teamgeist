class Performance < ActiveRecord::Base
  belongs_to  :user
  has_many    :mistakes
  
  def min_per_km
    return nil if (length.blank? || time.blank?)
    format_time(time / length)
  end
  
  def length=(len)
    write_attribute(:length, escape_comma(len))
  end
  
  def time=(time)    
    if md = time.match(/\A(\d+):(\d+):(\d+)$/)
      hrs, mins, secs = md[1], md[2], md[3]
    elsif md = time.match(/\A(\d+):(\d+)$/)
      mins, secs = md[1], md[2]
    else
      secs = time
    end
    
    res = (hrs rescue 0).to_i * 60 * 60
    res += (mins rescue 0).to_i * 60
    res += secs.to_i
    
    write_attribute(:time, res)
  end
  
  def formatted_time
    format_time(time)
  end
  
  def total_mistakes
    format_time(mistakes.sum(:amount))
  end
  
  def time_without_mistakes
    return nil if time.blank?
    format_time(time - mistakes.sum(:amount))
  end
  
  def formatted_winning_time
    format_time(winning_time)
  end
  
  private
  
  def escape_comma(str)
    str.gsub(",", ".") if str.respond_to?(:gsub)
  end
  
  def format_time(time)
    returning res = "" do
      hrs = time.to_i / 3600
      res << "#{hrs}:" if hrs > 0
      mins = time.to_i % 3600 / 60
      res << "#{sprintf('%02d', mins)}:"
      secs = time.to_i % 60
      res << "#{sprintf('%02d', secs)}"      
    end
  end
end