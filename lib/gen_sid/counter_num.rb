module GenSid

  class CounterNum < GenSid::Counter

    def initialize(initial_value = 0)
      super(initial_value)
    end

    def value
      @current_value.nil? ? @initial_value : @current_value
    end

    def next_value
      increment
      if @skip_first_value
        increment
        @skip_first_value = false
      end
      next_val = @current_value
      status = @previous_value == 9 ? :rollover : :normal
      [next_val,status]
    end

    def increment
      @previous_value = @current_value
      if @current_value.nil?
        @current_value = @initial_value
      else
        if @current_value == 9
          @current_value = 0
        else
          @current_value += 1
        end
      end
    end

  end

end
