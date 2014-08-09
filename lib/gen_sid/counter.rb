module GenSid


  class Counter

    attr_reader :initial_value, :current_value
    attr_accessor :skip_first_value

    def initialize(initial_value)
      @initial_value = initial_value
      @previous_value = nil
      @current_value = nil
      @skip_first_value = false
    end

    def next_value
      raise "Method next_value must be implemented by sub class"
    end

  end

end
