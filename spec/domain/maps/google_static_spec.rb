require 'spec_helper'
describe Maps::GoogleStatic do
  let(:muni) { munis(:bern) }
  subject { Maps::GoogleStatic.new.url(muni) }

  it { should =~ /^http/ }
  it { should =~ /staticmap/ }
  it { should =~ %r{#{muni.name}} }
  it { expect { URI.parse(subject) }.not_to raise_error }

  context "reads key form env" do
    before { ENV['GOOGLE_API_KEY'] = 'xxx' }
    it { should =~ /xxx/ }
  end

end

