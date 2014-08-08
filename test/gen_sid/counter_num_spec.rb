require 'rspec'
require 'gen_sid'

describe 'A numeric counter' do

  it 'should initialize with an  explicit value' do
    counter = GenSid::CounterNum.new
    expect(counter.initial_value == 0)
  end

  it 'should return a next value' do
    counter = GenSid::CounterNum.new
    expect(counter.next_value != nil)
  end

  it "should return 0 as the initial next value without marking it as a rollover" do
    counter = GenSid::CounterNum.new
    next_value, status = counter.next_value
    expect(next_value == 0)
    expect(status == :normal)
  end

  it "should indicate the first rollover when the first range is exceeded" do
    counter = GenSid::CounterNum.new
    next_value, status = counter.next_value # initial 0
    expect(next_value == 0)
    expect(status == :normal)

    counter.next_value # = 1
    counter.next_value # = 2
    counter.next_value # = 3
    counter.next_value # = 4
    counter.next_value # = 5
    counter.next_value # = 6
    counter.next_value # = 7
    counter.next_value # = 8

    next_value, status = counter.next_value # 9
    expect(next_value == 9)
    expect(status == :normal)

    next_value, status = counter.next_value # 0 with rollover
    expect(next_value == 0)
    expect(status == :rollover)

    next_value, status = counter.next_value # 1
    expect(next_value == 1)
    expect(status == :normal)

  end
end