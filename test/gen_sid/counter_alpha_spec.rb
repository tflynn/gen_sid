require 'rspec'
require 'gen_sid'

describe 'An alpha counter' do

  it 'should initialize with an  explicit value' do
    counter = GenSid::CounterAlpha.new
    expect(counter.initial_value).to eq('A')
  end

  it 'should return a next value' do
    counter = GenSid::CounterAlpha.new
    expect(counter.next_value).to be
  end

  it "should return 'A' as the initial next value without marking it as a rollover" do
    counter = GenSid::CounterAlpha.new
    next_value, status = counter.next_value
    expect(next_value).to eq('A')
    expect(status).to eq(:normal)
  end

  it "should return 'B' as the second value" do
    counter = GenSid::CounterAlpha.new
    next_value, status = counter.next_value
    expect(next_value).to eq('A')
    expect(status).to eq(:normal)
    next_value, status = counter.next_value
    expect(next_value).to eq('B')
    expect(status).to eq(:normal)
  end


  it "should indicate the first rollover when the first range is exceeded" do
    counter = GenSid::CounterAlpha.new
    next_value, status = counter.next_value # initial 'A'
    expect(next_value).to eq('A')
    expect(status).to eq(:normal)

    # 'B' - 'Y'
    1.upto(24) do |i|
      counter.next_value
    end

    next_value, status = counter.next_value # 'Z'
    expect(next_value).to eq('Z')
    expect(status).to eq(:normal)

    next_value, status = counter.next_value # 'A' with rollover
    expect(next_value).to eq('A')
    expect(status).to eq(:rollover)

    next_value, status = counter.next_value # 'B'
    expect(next_value).to eq('B')
    expect(status).to eq(:normal)

  end


  it "should initialize to any supplied value and increment properly" do
    counter = GenSid::CounterAlpha.new('Z')
    next_value, status = counter.next_value # initial 'Z'
    expect(next_value).to eq('Z')
    expect(status).to eq(:normal)

    next_value, status = counter.next_value # 'A' with rollover
    expect(next_value).to eq('A')
    expect(status).to eq(:rollover)
  end
end