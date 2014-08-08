module GenSid


  class Counter

    attr_reader :initial_value

    def initialize(initial_value)
      @initial_value = initial_value
      @current_value = @initial_value
    end

    def next_value
      raise "Method next_value must be implemented by sub class"
    end

  end

end
