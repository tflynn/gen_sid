require 'rspec'
require 'gen_sid'

describe 'An alpha counter' do

  it 'should initialize with an  explicit value' do
    counter = GenSid::CounterAlpha.new
    expect(counter.initial_value == 'A')
  end

  it 'should return a next value' do
    counter = GenSid::CounterAlpha.new
    expect(counter.next_value != nil)
  end

  it "should return 'A' as the initial next value without marking it as a rollover" do
    counter = GenSid::CounterAlpha.new
    next_value, status = counter.next_value
    expect(next_value == 'A')
    expect(status == :normal)
  end

  it "should return 'B' as the second value" do
    counter = GenSid::CounterAlpha.new
    next_value, status = counter.next_value
    expect(next_value == 'A')
    expect(status == :normal)
    next_value, status = counter.next_value
    expect(next_value == 'B')
    expect(status == :normal)
  end


  it "should indicate the first rollover when the first range is exceeded" do
    counter = GenSid::CounterAlpha.new
    next_value, status = counter.next_value # initial 'A'
    expect(next_value == 'A')
    expect(status == :normal)

    # 'B' - 'Y'
    1.upto(24) do |i|
      counter.next_value
    end

    next_value, status = counter.next_value # 'Z'
    expect(next_value == 'Z')
    expect(status == :normal)

    next_value, status = counter.next_value # 'A' with rollover
    expect(next_value == 'A')
    expect(status == :rollover)

    next_value, status = counter.next_value # 'B'
    expect(next_value == 'B')
    expect(status == :normal)

  end
end