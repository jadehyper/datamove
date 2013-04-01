class Util < ActiveRecord::Base
  def self.debug_it(obj)
    delimiter = "--------------------------------------------------------"
    
    logger.debug delimiter.inspect
    logger.debug delimiter.inspect
    
    logger.debug obj.inspect

    logger.debug delimiter.inspect
    logger.debug delimiter.inspect
  end
end