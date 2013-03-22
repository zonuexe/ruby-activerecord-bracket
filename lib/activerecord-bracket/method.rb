# Implement of [] method
module ActiveRecord::Bracket::Method
  extend ::ActiveSupport::Concern

  # class methods for ActiveRecord
  module ClassMethods
    # [] method for ActiveRecord 3.x (using dynamic finder)
    def [] (key)
      self.send(:find_by_slug, key)
    end
  end
end
