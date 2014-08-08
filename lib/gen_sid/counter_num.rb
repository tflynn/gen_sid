module GenSid

  class CounterNum < GenSid::Counter

    def initialize(initial_value = 0)
      super(initial_value)
      @ignore_first_rollover = initial_value == 0
    end

    def next_value
      next_val = @current_value

      if (@current_value == 0)
        if (@ignore_first_rollover)
          @ignore_first_rollover = false
          status = :normal
        else
          status = :rollover
        end
      else
        status = :normal
      end

      @current_value = @current_value == 9 ? 0 : @current_value + 1

      [next_val,status]

    end
  end

end
