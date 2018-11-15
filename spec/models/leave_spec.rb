RSpec.describe Leave, type: :model do

  describe "validations" do
    it { is_expected.to validate_presence_of(:start_date) }
    it { is_expected.to validate_presence_of(:end_date) }

    context "when start date isn't before end date" do
      subject { Leave.new(start_date: start_date, end_date: end_date).valid? }
      let(:start_date) { 2018-10-23}
      let(:end_date) { 2018-10-22}

      it "is invalid" do
        is_expected.to eq false
      end
    end
  end
end
