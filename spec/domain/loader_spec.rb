require 'spec_helper'
describe Loader do

  let(:params) { {} }
  let(:loader) { Loader.new(params) }

  subject { loader }

  context "with empty params" do
    its(:stack) { should have(Settings.start_count).items }
  end

  context "when passing stack" do
    let(:params) { {stack: munis_id(:thun, :bern) } }

    its(:me) { should eq munis(:bern) }
    its(:you) { should be_present }
    it { munis(:aarberg, :muri).should include (subject.you) }
  end

  context "when passing me/you/type" do

    let(:params) { {stack: munis_id(:thun, :bern), me: munis_id(:muri),
                    you: munis_id(:aarberg) } }

    its(:me) { should eq munis(:muri) }
    its(:you) { should eq munis(:aarberg) }
  end

end

