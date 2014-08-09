module GenSid

  class SeqID

    attr_reader :total, :pattern

    def initialize(pattern = 'A1')
      @pattern = pattern
      @reversed_counters = parse_pattern(@pattern).reverse
      # Set all but first counter to skip first value on increment
      1.upto(@reversed_counters.size - 1) do |pos|
        @reversed_counters[pos].skip_first_value = true
      end
    end

    def next_value

      # Counters are managed in reverse order - from least-significant (i.e. most rapidly varying)
      # to most-significant (i.e. least rapidly varying)

      last_processed = 0
      all_next = ""

      # Stop at first counter that yields a next value without a rollover
      0.upto(@reversed_counters.size - 1) do |pos|
        last_processed = pos
        counter = @reversed_counters[pos]
        next_value, status = counter.next_value
        all_next << next_value.to_s
        break if (status == :normal)
      end

      # Deal with remainder - get current values
      (last_processed + 1).upto(@reversed_counters.size - 1) do |pos|
        counter = @reversed_counters[pos]
        all_next << counter.value.to_s
      end

      # Reverse the result
      all_next.reverse

    end

    private # Private from here on

    # Returns an array of Counters, one per pattern element in the same order - i.e. most significant first
    def parse_pattern(pattern)
      counters = Array.new
      pattern.split("").each do |element|
        if element =~ /\d/
          counters << CounterNum.new(element.to_i)
        elsif element =~ /[[:alpha:]]/
          counters << CounterAlpha.new(element.upcase)
        else
          # Do nothing
        end
      end

      counters
    end


  end


end