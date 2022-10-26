# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'validations' do
    it { should belong_to(:listing) }
    it { should belong_to(:guest).class_name('User').with_foreign_key('guest_id') }
    it { should have_one(:host) }
    it { should validate_presence_of(:stars) }
    it { should validate_numericality_of(:stars).only_integer }
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_least(10).is_at_most(45) }
    it { should validate_length_of(:description).is_at_least(50).is_at_most(250) }
  end
end
