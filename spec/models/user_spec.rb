require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' 
    context '新規登録がうまくいかないとき' do
      it 'nicknameが空では登録できないこと' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'first_nameが空では登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_nameが空では登録できないこと' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'birth_dayが空では登録できないこと' do
      @user.birth_day = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end

      it 'emailに＠を含まない場合は登録できないこと' do
      @user.email = 'aaabb'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'password:半角英数混合でなければ登録できないこと' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できないこと' do
      @user.first_name = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors[:first_name]).to include('全角文字を使用してください')
      end

      it 'last_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できないこと' do
      @user.last_name = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors[:last_name]).to include('全角文字を使用してください')
      end

      it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
      @user.first_name_kana = 'あいうえお'
      @user.valid?
      expect(@user.errors[:first_name_kana]).to include('全角カタカナを使用してください')
      end

      it 'last_name_kanaが全角カタカナでなければ登録できないこと' do
      @user.last_name_kana = 'あいうえお'
      @user.valid?
      expect(@user.errors[:last_name_kana]).to include('全角カタカナを使用してください')
      end
    end
  end
end
