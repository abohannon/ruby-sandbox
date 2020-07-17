require '../exercises/caesars_cipher'

describe '#caesars_cipher' do
  it 'works properly with positive numbers' do
    expect(caesars_cipher("What a string!", 5)).to eql("Bmfy f xywnsl!")
  end

  it 'works properly with mixed case and large numbers' do
    expect(caesars_cipher("MAssIve Number WitH Cr@zy Case!!?", 666)).to eql("CQiiYlu Dkcruh MyjX Sh@po Sqiu!!?")
  end

  it 'works properly with negative numbers' do
    expect(caesars_cipher("Let's go negative?", -50)).to eql("Ngv'u iq pgicvkxg?")
  end

  it 'works properly with all caps' do
    expect(caesars_cipher("ALL CAPS!", 20)).to eql("UFF WUJM!")
  end
end
