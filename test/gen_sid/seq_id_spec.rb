require 'rspec'
require 'gen_sid'

describe 'SeqID' do

  it 'should handle the default case correctly' do
    seq = GenSid::SeqID.new
    # Default value is 'A1'
    expect(seq.next_value).to eq('A1')
    7.times {|i| seq.next_value}
    expect(seq.next_value).to eq('A9')
    next_val = seq.next_value
    expect(seq.next_value).to eq('B0')
    8.times {|i| seq.next_value}
    expect(seq.next_value).to eq('B9')
    expect(seq.next_value).to eq('C0')
  end

  # it "should handle a more complex case properly" do
  #   puts "Spec2"
  #   seq = GenSid::SeqID.new('CC1B')
  #   expect(seq.next_value == 'CC1B')
  #   expect(seq.next_value == 'CC1C')
  #   #21.times {|i| seq.next_value}
  #   puts seq.next_value
  #   expect(seq.next_value == 'CC1Z')
  #
  # end

end