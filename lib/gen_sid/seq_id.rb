module GenSid

  class SeqID

    attr_reader :total, :pattern

    def intialize(total = 1, pattern = 'A1')
      @total = total
      @pattern = pattern
    end


  end

end