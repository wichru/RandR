require 'rails_helper'

RSpec.describe Leave, type: :model do

  describe "validations" do
    let(:user) { User.create(email: 'user@example.com', password: '0ksymoroN') }
    let(:leave) { Leave.new(start_date: start_date, end_date: end_date) }

    let(:start_date) { 2018 - 10 - 21 }
    let(:end_date) { 2018 - 10 - 22 }

    subject { leave.valid? }

    context "when start date isn't before end date" do
      let(:start_date) { 2018-10-23}
      let(:end_date) { 2018-10-22}

      it "is invalid" do
        is_expected.to eq false
      end
    end

    context "when start date doesn't exist" do
      let(:start_date) { nil }

      it "is invalid" do
        is_expected.to eq false
      end
    end

    context "when end date doesn't exist" do
      let(:end_date) { nil }

      it "is invalid" do
        is_expected.to eq false
      end
    end
  end
end
