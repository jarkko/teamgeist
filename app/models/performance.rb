class Performance < ActiveRecord::Base
  belongs_to  :user
  has_many    :mistakes
  
  def min_per_km
    return nil if (length.blank? || time.blank?)
    format_time(time / length)
  end
  
  def length=(len)
    len = escape_comma(len).to_f
    Rails.logger.debug("rewriting length to #{len}")
    write_attribute(:length, len)
  end
  
  def total_mistakes
    format_time(mistakes.map(&:amount).sum)
  end
  
  def time_without_mistakes
    return nil if time.blank?
    format_time(time - mistakes.map(&:amount).sum)
  end
  
  def self.format_as_time(*time_methods)
    time_methods.each do |time_method|
      class_eval "
        def formatted_#{time_method}
          format_time(read_attribute(:#{time_method}))
        end
      "
      
      class_eval "
        def formatted_#{time_method}=(time)    
          res = time_to_secs(time)
          write_attribute(:#{time_method}, res)
        end
      "
    end
  end
  
  format_as_time :time, :winning_time
  
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
  
  def time_to_secs(time)
    if md = time.to_s.match(/\A(\d+):(\d+):(\d+)$/)
      hrs, mins, secs = md[1], md[2], md[3]
    elsif md = time.match(/\A(\d+):(\d+)$/)
      mins, secs = md[1], md[2]
    else
      secs = time
    end
    
    res = (hrs rescue 0).to_i * 60 * 60
    res += (mins rescue 0).to_i * 60
    res += secs.to_i
  end
end