require 'rspec'
require 'gen_sid'

describe 'A numeric counter' do

  it 'should initialize with an  explicit value' do
    counter = GenSid::CounterNum.new
    expect(counter.initial_value).to eq(0)
  end

  it 'should return a next value' do
    counter = GenSid::CounterNum.new
    expect(counter.next_value).to be
  end

  it "should return 0 as the initial next value without marking it as a rollover" do
    counter = GenSid::CounterNum.new
    next_value, status = counter.next_value
    expect(next_value).to eq(0)
    expect(status).to eq(:normal)
  end

  it "should indicate the first rollover when the first range is exceeded" do
    counter = GenSid::CounterNum.new
    next_value, status = counter.next_value # initial 0
    expect(next_value).to eq(0)
    expect(status).to eq(:normal)

    # 1 through 8
    1.upto(8) do |i|
      counter.next_value
    end

    next_value, status = counter.next_value # 9
    expect(next_value).to eq(9)
    expect(status).to eq(:normal)

    next_value, status = counter.next_value # 0 with rollover
    expect(next_value).to eq(0)
    expect(status).to eq(:rollover)

    next_value, status = counter.next_value # 1
    expect(next_value).to eq(1)
    expect(status).to eq(:normal)

  end

  it "should initialize to any supplied value and increment properly" do
    counter = GenSid::CounterNum.new(9)
    next_value, status = counter.next_value # initial 9
    expect(next_value).to eq(9)
    expect(status).to eq(:normal)

    next_value, status = counter.next_value # 0 with rollover
    expect(next_value).to eq(0)
    expect(status).to eq(:rollover)
  end

end