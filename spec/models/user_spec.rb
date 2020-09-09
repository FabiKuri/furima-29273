require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it "すべての値が正しく入力されていれば保存できること" do
      expect(@user).to be_valid
    end
    it "nicknameが空だと登録できない" do 
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailには@が含まれていること" do
      @user.email = "/@.+/"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid. Input @")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'family_nameとfirst_nameがないと保存できないこと' do
      @user.family_name = ""
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name and First name can't be blank")
    end
    it 'family_nameが全角日本語でないと保存できないこと' do
      @user.family_name = "yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid. Input full-width characters.")
    end
    it 'first_nameが全角日本語でないと保存できないこと' do
      @user.family_name = "tanaka"
      @user.valid?
      expect(@user.errors.full_messages).to includeinclude("Family name anname can't be blank")
    end
    it 'family_name_radingとfirst_name_readingがないと保存できないこと' do
      @user.family_name_reading = ""
      @user.first_name_reading = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name reading and First name reading can't be blank")
    end
    it 'family_name_readingが全角日本語カナでないと保存できないこと' do
      @user.family_name = "ﾔﾏﾀﾞ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name reading is invalid. Input full-width characters.")
    end
    it 'first_name_readingが全角日本語カナでないと保存できないこと' do
      @user.family_name = "ﾀﾛｳ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading is invalid. Input full-width characters")
    end
    it 'Birthdayが空だと保存できないこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end