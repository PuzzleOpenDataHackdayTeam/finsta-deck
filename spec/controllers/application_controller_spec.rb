require 'spec_helper'
describe ApplicationController do

  specify "#get :start" do
    get :start
    assigns(:stack).should have(Settings.start_count).items
  end


  context "show" do
    let(:stack) { Muni.pluck(:id).sample(3) }

    specify do
      get :show, stack: stack
      assigns(:stack).should have(2).items
      assigns(:me).should be_present
      assigns(:you).should be_present
    end
  end

  context "compare" do

    specify "winning" do
      get :compare, stack: [munis_id(:aarberg)], type: types_id(:sfg),
        you: munis_id(:thun), me: munis_id(:muri)

      assigns(:result).winner.should eq :me
:A

      assigns(:stack).should have(3).items
      assigns(:stack)[0..1].should eq munis(:muri, :thun)
    end


    specify "loosing" do
      get :compare, stack: [munis_id(:aarberg)], type: types_id(:sfg),
        me: munis_id(:thun), you: munis_id(:muri)

      assigns(:result).winner.should eq :you
      assigns(:stack).should have(1).item
    end
  end


end

