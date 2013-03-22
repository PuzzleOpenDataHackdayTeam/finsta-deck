require 'spec_helper'
describe Muni do

  it { Muni.count.should eq 6 }

  context ".load(ids) maintains order" do
    let(:stack) { munis(:bern, :muri, :thun) }
    let(:ids) { stack.map(&:id) }

    it { stack.should have(3).items }
    it { ids.should have(3).items }

    it { Muni.load(ids).should eq stack }
    it { Muni.load(ids.reverse).should_not eq stack }
    it { Muni.load(ids.map(&:to_s)).should eq stack }
  end


  context "#numbers" do
    it { munis(:thun).numbers.should have(1).item }
    it { munis(:muri).numbers.should have(1).item }
    it { munis(:bern).numbers.should be_empty }
    it { munis(:aarberg).numbers.should be_empty }
  end

end

