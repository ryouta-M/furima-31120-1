require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録成功' do
      it '全ての項目を正しく登録する' do
        expect(@user).to be_valid
      end

      it 'emailに@が含まれていると登録ができる'do
        @user.email = 'test@test.ne.jp'
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上で登録できる'do
        @user.password = 'test000'
        @user.password_confirmation = 'test000'
        expect(@user).to be_valid
      end
      it 'emailが重複しなければ登録できる'do
        @user.email = 'test@test.jp'
        @user.save
        user_test = FactoryBot.build(:user)
        user_test.email = 'testt@test.jp'
        expect(user_test).to be_valid
      end
      it 'passwordが半角英数混合であれば登録できる'do
        password = '111111a'
        @user.password = password
        @user.password_confirmation = password
        expect(@user).to be_valid
      end
      it 'first_nameとlast_nameが全角漢字であれば登録できる'do
        @user.first_name = '漢字'
        @user.last_name = '漢字'
        expect(@user).to be_valid
      end
      it 'first_name_kanaとlast_name_kanaが全角カタカナであれば登録できる'do
        @user.first_name_kana = 'カタカナ'
        @user.last_name_kana = 'カタカナ'
        expect(@user).to be_valid
      end
    end

    describe 'ユーザー新規登録失敗'do
    it 'nick_nameが空の場合登録できない'do
      @user.nick_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailに@が含まれていない場合登録できない'do
      @user.email = 'testtest.jp'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'emailが重複していると登録できない'do
      @user.save
      user_test = FactoryBot.build(:user)
      user_test.email = @user.email
      user_test.valid?
      expect(user_test.errors.full_messages).to include("Email has already been taken")
    end
    it 'passwordが空だと登録できない'do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("password can't be blank")
    end
    it 'passwordが5文字以下だと登録できない'do
      @user.password = 'a123'
      @user.valid?
      expect(@user.errors.full_messages).to include("password is too short (minimum is 6 characters)")
    end
    it 'passwordとpassword_confirmationが一致しないと登録できない'do
      @user.password = 'a123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("password confirmation doesn't match password")
    end
    it 'passwordが半角でなければ登録できない'do
      @user.password = 'bcdd12３'
      @user.valid?
      expect(@user.errors.full_messages).to include('password is invalid')
    end
    it 'passwordに数字が入っていないと登録できない'do
      @user.password = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("password is invalid")
    end
    it 'パスワードに英語が入っていないと登録できない'do
      @user.password = 1111111
      @user.valid?
      expect(@user.errors.full_messages).to include("password is invalid")
    end
    it 'first_nameが空だと登録できない'do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("first name can't be blank")
    end
    it 'first_nameが全角でないと登録できない'do
      @user.first_name = 'hurima'
      @user.valid?
      expect(@user.errors.full_messages).to include("first name is invalid")
    end
    it 'first_nameにアルファベットや記号が含まれると登録できない'do
      @user.first_name = 'ふriま,'
      @user.valid?
    expect(@user.errors.full_messages).to include("first name is invalid")
    end
    it 'last_nameにアルファベットや記号が含まれると登録できない'do
      @user.last_name = 'huりま.'
      @user.valid?
      expect(@user.errors.full_messages).to include("last name is invalid")
    end
    it 'last_nameが空だと登録できない'do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("last name can't be blank")
    end
    it 'last_nameが全角でないと登録できない'do
      @user.last_name = 'abcdefg'
      @user.valid?
      expect(@user.errors.full_messages).to include("last name is invalid")
    end
    it 'first_name_kanaが空だと登録できない'do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("first name kana can't be blank")
    end
    it 'first_name_kanaが全角でなければ保存できない'do
      @user.first_name_kana = 'furima'
      @user.valid?
      expect(@user.errors.full_messages).to include("first name kana is invalid")
    end
    it 'first_name_kanaにカタカナ以外が含まれると保存できない'do
    @user.first_name_kana = 'フリま'
    @user.valid?
    expect(@user.errors.full_messages).to include("first name kana is invalid")
  end
  it 'last_name_kanaが空だと登録できない'do
  @user.last_name_kana = ''
  @user.valid?
  expect(@user.errors.full_messages).to include("last name kana can't be blank")
  end
  it 'last_name_kanaが全角でなければ保存できない'do
    @user.last_name_kana = 'furima'
    @user.valid?
    expect(@user.errors.full_messages).to include("last name kana is invalid")
  end
  it 'last_name_kanaにカタカナ以外が含まれると保存できない'do
    @user.last_name_kana = 'ふりマ'
    @user.valid?
    expect(@user.errors.full_messages).to include("last name kana is invalid")
  end
  it '生年月日が空だと登録できない'do
    @user.birth_date = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("birth date can't be blank")
   end
  end
 end
end