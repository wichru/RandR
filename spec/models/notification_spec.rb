require 'rails_helper'

RSpec.describe Notification, type: :model do
  it { should belong_to(:recipient).class_name('User') }
  it { should belong_to(:actor).class_name('User') }
  it { should belong_to(:notibiable) }
end
