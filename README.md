ClassOptions
============

This is a small library to define class variables. These can then be used for
settings or information transportation.

Example
-------

    # a default controller for web projects
    class Controller
      extend ClassOptions::Options

      # the default request object to use
      option :request_class

      # we get a rack environment and create a new request object out of it
      def initialize(env)
        @request = self.class.request_class.new(env)
      end

      attr_reader :request
    end
    
    # now you can define the default before using the class
    Controller.request_class = Rack::Request
    Controller.request_class = Zero::Request

    Controller.new([]).request # => a Zero::Request

