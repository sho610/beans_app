require 'rails_helper'

RSpec.describe 'Shopモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { shop.valid? }

    

    context 'nameカラム' do
      it '空欄でないこと' do
        book.name = ''
        is_expected.to eq false
      end
    end

    context 'overviewカラム' do
      it '空欄でないこと' do
        book.overview = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Shop.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end