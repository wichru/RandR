require 'rails_helper'

RSpec.describe Leave, type: :model do

  describe "validations" do
    before do
      @current_user = User.new(email: 'example@foo.com', first_name: 'Joe', last_name: 'Doe', admin: false)
    end

    it { is_expected.to validate_presence_of(:start_date) }
    it { is_expected.to validate_presence_of(:end_date) }
    it { should belong_to(:user) }

    context "when start date isn't before end date" do
      subject { Leave.new(start_date: start_date, end_date: end_date, user_id: @current_user.id).valid? }
      let(:start_date) { 2018-10-23}
      let(:end_date) { 2018-10-22}

      it "it's invalid" do
        is_expected.to eq false
      end

      context 'when it has valid params' do
        let(:start_date) { 2018-10-21}

        it "it's valid" do
          is_expected.to eq true
        end
      end
    end
  end
end
