module HasLocation
  module ClassMethods

  end

  module InstanceMethods
    def last_location
    end
  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end