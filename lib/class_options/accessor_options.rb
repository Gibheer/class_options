module ClassOptions
  class AccessorOptions < Options
    def accept_options(*new_options)
      super
      new_options.each {|option| define_option_accessor(option) }
    end 

    protected

    def define_option_accessor(option)
      class_eval <<-RUBY, __FILE__, __LINE__ + 1
        def self.#{option}=(value)           # def self.primitive=(value)
          self.#{option}(value)              #   self.primitive(value)
        end                                  # end
      RUBY
    end
    end
  end
end
