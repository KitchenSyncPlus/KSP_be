require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    @group = Group.new(name: 'Foo Group', about: 'about foo stuff')
  end
  describe 'a single instance of a Group' do
    it 'exists' do
      expect(@group).to be_a Group
    end

    it 'has @name' do
      expect(@group.name).to eq('Foo Group')
    end

    it 'has @about' do
      expect(@group.about).to eq('about foo stuff')
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:about) }
  end

  describe 'associations' do
    it { should have_many(:group_users) }
    it { should have_many(:recipes) }
    it { should have_many(:users).through(:group_users) }
  end

  describe 'methods' do
    it '#user_count' do
      chipmunk_smackdown = Group.create!(name: "2022 Chipmunk Smackdown", about: "It's going to be nutz")
      fish_fighters = Group.create!(name: "2022 Fish Fighters", about: "Step on the Scale")
      alvin = chipmunk_smackdown.users.create!(name: "Alvin", email: "Acorn@tree.com")
      theo = chipmunk_smackdown.users.create!(name: "Theodore", email: "Walnut@tree.com")
      simon = fish_fighters.users.create!(name: "Simon", email: "outcastvermin@trap.com")

      expect(chipmunk_smackdown.user_count).to eq(2)
    end
  end
end
