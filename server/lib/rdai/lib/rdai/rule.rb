module RDAI
  module Rule
    
    def self.included(base)
      base.extend(ClassMethods)
    end
    
    module ClassMethods
      def acts_as_rule
        include InstanceMethods
      end
    end
    
    module InstanceMethods
      def fire
        eval <<-EOV          
          #{camelize(name)}.fire
        EOV
      end
      
      private
      
      def camelize(lower_case_and_underscored_word, first_letter_in_uppercase = true)
        if first_letter_in_uppercase
          lower_case_and_underscored_word.to_s.gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase }
        else
          lower_case_and_underscored_word.to_s[0].chr.downcase + camelize(lower_case_and_underscored_word)[1..-1]
        end
      end
      
    end

  end
end