require 'rspec'
require 'gen_sid'

describe "Initialize SeqID" do

  it 'should supply defaults' do
    sid = GenSid::SeqID.new
    expect(sid.pattern).to eq('A1')
  end


end