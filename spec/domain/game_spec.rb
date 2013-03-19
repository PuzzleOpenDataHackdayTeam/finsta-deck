require 'spec_helper'
describe Game do


  let(:default_args) { { stack: munis_id(:bern), me: munis_id(:muri), you: munis_id(:thun) } }
  let(:options) { { start_count: 3 } }
  let(:game) { Game.new(args, options) }
  subject { game }


  context "starting new game" do
    let(:args)  { { } }

    its(:me) { should be_present }
    its(:you) { should be_present }
    its(:stack) { should be_present }
    its(:stack) { should_not =~ [game.me,game.you] }
  end

  context "loading data" do
    let(:args)  { default_args.merge(stack: [munis_id(:bern), munis_id(:lenk)]) }

    its(:stack) { should eq [munis(:bern), munis(:lenk)] }
    its(:me) { should eq munis(:muri) }
    its(:you) { should eq munis(:thun) }
  end

  context "comparing, me wins" do
    let(:args)  { default_args.merge(type: types_id(:sfg)) }
    before { game.compare }


    its(:stack) { should eq [munis(:muri), munis(:thun), munis(:bern)] }
    its(:me) { should eq munis(:muri) }
    its(:you) { should eq munis(:thun) }
  end

  context "comparing, you wins" do
    let(:args)  { default_args.merge(type: types_id(:sfg), you: munis_id(:muri), me: munis_id(:thun) ) }
    before { game.compare }

    its(:stack) { should eq [munis(:bern)] }
    its(:me) { should eq munis(:thun) }
    its(:you) { should eq munis(:muri) }
  end
end

