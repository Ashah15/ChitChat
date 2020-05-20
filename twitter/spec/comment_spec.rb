RSpec.describe Comment, type: :model do

  context 'validation test' do
    it 'ensures comment cannot have empty content' do
      comment = Comment.new(text:'').save
      expect(comment).to eq(false)
    end

   end


 end