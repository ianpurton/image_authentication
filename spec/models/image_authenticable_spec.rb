require 'spec_helper'

describe Devise::Models::ImageAuthenticatable do

  let(:user)             { User.new }
  let(:valid_categories) { ['Cats', 'Dogs', 'Fish'] }
  let(:other_categories) { ['People', 'Cars', 'Houses'] }

  describe '#auth_categories=' do
    it 'sets auth_categories_mask to an integer' do
      expect {
        user.auth_categories = valid_categories
      }.to change(user, :auth_categories_mask).from(0).to(832)
    end
  end

  describe '#auth_categories' do
    before do
      user.auth_categories = valid_categories
    end

    it 'contains the categories set by the user' do
      expect(user.auth_categories).to eql(valid_categories)
    end
  end

  describe '#requires_image_authentication?' do

  end

  describe '#valid_images?' do
    before do
      user.auth_categories = valid_categories
    end

    context 'with matching categories' do
      it 'returns true' do
        expect(user.valid_images?(valid_categories)).to be_true
      end
    end

    context 'with different categories' do
      it 'returns false' do
        expect(user.valid_images?(other_categories)).to be_false
      end
    end

    context 'with no categories' do
      it 'returns false' do
        expect(user.valid_images?(nil)).to be_false
      end
    end
  end

  describe '#all_auth_categories' do
    it 'returns the categories in a random order' do
      expect(user.all_auth_categories).not_to eq(user.class::Categories)
    end
  end

  describe '#max_login_attempts?' do
    context 'when lock_after_failed_attempts is true' do
      before do
        User.lock_after_failed_attempts = true
        User.maximum_attempts           = 3
      end

      context 'when failed_attempts is >= maximum_attempts' do
        before do
          user.failed_attempts = 3
        end

        it 'returns true' do
          expect(user.max_login_attempts?).to be_true
        end
      end

      context 'when failed_attempts is < maximum_attempts' do
        before do
          user.failed_attempts = 1
        end

        it 'returns false' do
          expect(user.max_login_attempts?).to be_false
        end
      end
    end

    context 'when lock_after_failed_attempts is false' do
      before do
        User.lock_after_failed_attempts = false
        user.failed_attempts            = 3
      end

      it 'returns false' do
        expect(user.max_login_attempts?).to be_false
      end
    end
  end

end
