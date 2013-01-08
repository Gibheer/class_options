module ClassOptions
  module Options
    def options(*names)
      names.each do |option|
        create_option(option)
      end
    end

    protected

    def create_option(option)
      class_eval <<-RUBY, __FILE__, __LINE__ + 1
        def self.#{option}=(value = ClassOptions::Undefined)
          @#{option} = value
          self
        end

        def self.#{option}
          @#{option} ||= ClassOptions::Undefined
        end
      RUBY
    end
  end
end
