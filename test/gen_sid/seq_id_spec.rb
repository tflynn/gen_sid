require 'rspec'
require 'gen_sid'

describe 'SeqID' do

  it 'should handle the default case correctly' do
    seq = GenSid::SeqID.new
    # Default value is 'A1'
    expect(seq.next_value).to eq('A1')
    7.times {|i| seq.next_value}
    expect(seq.next_value).to eq('A9')
    expect(seq.next_value).to eq('B0')
    8.times {|i| seq.next_value}
    expect(seq.next_value).to eq('B9')
    expect(seq.next_value).to eq('C0')
  end

  it "should handle a more complex case properly" do
    seq = GenSid::SeqID.new('CC1B')
    expect(seq.next_value).to eq('CC1B')
    expect(seq.next_value).to eq('CC1C')
    22.times {|i| seq.next_value}
    expect(seq.next_value).to eq('CC1Z')
    expect(seq.next_value).to eq('CC2A')
  end

  it "should handle starting in the middle of a complex sequence properly" do
    seq = GenSid::SeqID.new('EF27Y')
    expect(seq.next_value).to eq('EF27Y')
    expect(seq.next_value).to eq('EF27Z')
    expect(seq.next_value).to eq('EF28A')
    seq = GenSid::SeqID.new('EF9ZZ')
    expect(seq.next_value).to eq('EF9ZZ')
    expect(seq.next_value).to eq('EG0AA')

  end

end