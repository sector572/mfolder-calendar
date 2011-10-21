# -*- encoding: utf-8

require 'spec_helper'

describe Presenters::EventsPresenter do
  context "performance optimizations" do
    let(:presenter) {Presenters::EventsPresenter.new(nil,nil,nil)}

    it "should call _months only once" do
      presenter.should_receive(:start_date).at_most(2).and_return(Date.today)
      presenter.header
      presenter.header
    end

     it "should call days only once" do
      presenter.should_receive(:start_date).and_return(Date.today)
      presenter.days
      presenter.days
    end
   
  end

  context "with empty parameters" do
    let(:presenter) {Presenters::EventsPresenter.new(nil,nil,nil)}

    it "should create empty presenter" do
      presenter.should_not be_nil
    end

    it "should have 1 day" do
      presenter.days.length.should == 1
    end

    it "should return empty structure events" do
      presenter.grouped_events.should be_empty
    end
  end

  context "with 2 months" do
    let(:presenter) {Presenters::EventsPresenter.new(Date.new(2010, 1, 1), Date.new(2010, 2, 1),nil)}

    it "should calculate 2 months" do
      presenter._months.length.should == 2
    end

    it "start date should be 2010.1.1" do
      presenter.start_date.should == Date.new(2010, 1, 1)
    end

    it "end date should be 2010.2.1" do
      presenter.end_date.should == Date.new(2010, 2, 1)
    end

    it "should have 32 days" do
      presenter.days.length.should == 32
    end

    it "days in Jan should be 31" do
      presenter._months[0].days.should == 31
    end

    it "days in Feb should be 1" do
      presenter._months[1].days.should == 1
    end    

  end
end