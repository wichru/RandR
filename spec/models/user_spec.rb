require 'rails_helper'

RSpec.describe User, type: :model do
  it { have_many(:notifications) }
  it { have_many(:leaves) }
end
