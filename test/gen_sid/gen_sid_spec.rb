require 'rspec'
require 'gen_sid'

describe "Initialize SeqID" do

  it 'should supply defaults' do
    sid = GenSid::SeqID.new
    expect(sid.total == 1)
    expect(sid.pattern == 'A1')
  end


end