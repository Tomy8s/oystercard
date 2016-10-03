require 'oystercard'

describe Oystercard do

  describe "#balance" do
    it 'should check if balance is 0' do
      expect( subject.balance ).to eq(0)
    end
  end

  describe "#top_up" do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'should add money to the balance' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end
  end
end
