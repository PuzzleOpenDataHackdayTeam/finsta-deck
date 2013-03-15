require 'spec_helper'
describe Service do

  let(:service) { Service.new(hash) }

  let(:defaults) { { stack: [munis(:bern)],
                   type: types_id(:sfg) } }

  context "compare - you win" do
    let(:hash) { defaults.merge(me: munis(:thun), you: munis(:muri)) }
    subject { service.compare }

    its(:winner) { should eq :you }
    its(:stack) { should have(1).items }

    its(:values) { should be_present }
  end


  context "compare - I win" do
    let(:hash) { defaults.merge(you: munis(:thun), me: munis(:muri)) }
    subject { service.compare }

    its(:winner) { should eq :me }
    its(:stack) { should have(3).items }
    its(:values) { should be_present }
  end

end

