RSpec.describe User, type: :model do

  context 'validation test' do
    it 'ensures username presence' do
      user = User.new(name: 'last', email: 'sample@example.com').save
      expect(user).to eq(false)
    end

    it 'ensures valid email' do
      user = User.new(name: 'last', email: 'sample').save
      expect(user).to eq(false)
    end

   end


 end