require 'spec_helper'
describe Region do


  subject { Region.all }
  it { should have(10).items }

  context "find by id" do
    subject { Region.find(241).name }
    it { should eq 'Berner Jura' }
  end


  context "stats" do
    let(:stack) { munis(:bern, :muri, :thun) }

    subject { Region.stats(stack) }
  end

end

