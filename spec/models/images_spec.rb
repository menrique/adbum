describe Image do
  let(:described_object) { build :image }

  describe '#factory' do

    it 'has a valid factory' do
      expect(described_object).to be_valid
    end

    it 'should create a new instance given valid attributes' do
      expect {
        described_object.save
      }.to change(described_class, :count).by(1)
    end

  end

  describe '#tags' do

    it 'should be implemented' do
      expect(described_object).to respond_to :tags
    end

    it 'should be required' do
      described_object.tags = nil
      expect(described_object).to_not be_valid
    end

    it 'should serialized as an array' do
      expect(described_object.tags).to be_a Array
    end

  end

  describe '#media' do

    it 'should be implemented' do
      expect(described_object).to respond_to :media
    end

    it 'should be required' do
      described_object.media = nil
      expect(described_object).to_not be_valid
    end

    it 'should only accept valid images' do
      described_object.media = fixture_file_upload('./spec/fixtures/test_document.pdf', 'application/pdf')
      expect(described_object).to_not be_valid
    end

  end

  describe '#width' do

    it 'should be implemented' do
      expect(described_object).to respond_to :width
    end

    it 'should be empty before save' do
      expect(described_object.width).to be_nil
    end

    it 'should be populated automatically after save' do
      described_object.save
      expect(described_object.width).to be > 0
    end

  end

  describe '#height' do

    it 'should be implemented' do
      expect(described_object).to respond_to :height
    end

    it 'should be empty before save' do
      expect(described_object.height).to be_nil
    end

    it 'should be populated automatically after save' do
      described_object.save
      expect(described_object.height).to be > 0
    end

  end

  describe '.tagged' do

    it 'should be implemented' do
      expect(described_class).to respond_to :tagged
    end

    it 'should return an Active Record relationship' do
      expect(described_class.tagged(Faker::Lorem.words(1..5))).to be_a ActiveRecord::Relation
    end

    it 'should return all records with the given tags' do

      # Set matching tags to filter images
      matching_tags = Faker::Lorem.words(1..5)

      # Created images to match with
      matched_images = rand(2..5).times.map do
        new_image = build :image
        new_image.tags = new_image.tags + matching_tags
        new_image.save
        new_image
      end

      # Create some noise
      rand(2..5).times.map{ create :image }

      # Expect everything OK
      expect(described_class.tagged(matching_tags)).to match_array matched_images
    end

  end

end