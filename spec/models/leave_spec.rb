require 'rails_helper'

RSpec.describe Leave, type: :model do
  it { is_expected.to validate_presence_of(:start_date) }
end
