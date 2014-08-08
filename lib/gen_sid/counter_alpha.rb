module GenSid

  class CounterAlpha < GenSid::Counter

    def initialize(initial_value = 'A')
      super(initial_value)
      @ignore_first_rollover = initial_value == 'A'
    end

    def next_value
      next_val = @current_value

      if (@current_value == 'A')
        if (@ignore_first_rollover)
          @ignore_first_rollover = false
          status = :normal
        else
          status = :rollover
        end
      else
        status = :normal
      end

      @current_value = @current_value == 'Z' ? 'A' : (@current_value[0].ord + 1).chr

      [next_val,status]

    end

  end

end
