require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
  @user_order = FactoryBot.build(:user_order)
  end

  it 'すべての値が正しく入力されていれば保存できること' do
    expect(@user_order).to be_valid
  end

  it 'building_nameが存在しなくても保存できること' do
    @user_order.building_name = nil
    expect(@user_order).to be_valid
  end

  it 'tokenが存在しない場合保存できないこと' do
    @user_order.token = nil
    @user_order.valid?
    expect(@user_order.errors.full_messages).to include("Token can't be blank")
  end

  it 'postal_codeが存在していない場合保存できないこと' do
    @user_order.postal_code = nil
    @user_order.valid?
    expect(@user_order.errors.full_messages).to include("Postal code can't be blank", "Postal code はハイフンを(-)を含んで記述してください。")
  end

  it 'postal_codeにハイフンが含まれていない場合保存できないこと' do
    @user_order.postal_code = '1234567'
    @user_order.valid?
    expect(@user_order.errors.full_messages).to include("Postal code はハイフンを(-)を含んで記述してください。")
  end

  it 'prefecture_idが存在していない場合保存できないこと' do
    @user_order.prefecture_id = nil
    @user_order.valid?
    expect(@user_order.errors.full_messages).to include("Prefecture can't be blank", "Prefecture を選択してください")
  end

  it 'prefecture_idが1の場合保存できないこと' do
    @user_order.prefecture_id = 1
    @user_order.valid?
    expect(@user_order.errors.full_messages).to include("Prefecture を選択してください")
  end

  it 'municipalitiesが存在しない場合保存できないこと' do
    @user_order.municipalities = nil
    @user_order.valid?
    expect(@user_order.errors.full_messages).to include("Municipalities can't be blank")
  end

  it 'addressが存在しない場合保存できないこと' do
    @user_order.address = nil
    @user_order.valid?
    expect(@user_order.errors.full_messages).to include("Address can't be blank")
  end

  it 'phone_numberが存在しない場合保存できないこと' do
    @user_order.phone_number = nil
    @user_order.valid?
    expect(@user_order.errors.full_messages).to include("Phone number can't be blank", "Phone number は10桁か11桁の半角数字ハイフン(-)なしで入力してください ")
  end

  it 'phone_numberが半角数字でない場合保存できないこと' do
    @user_order.phone_number ='０９０１２３４５６７８'
    @user_order.valid?
    expect(@user_order.errors.full_messages).to include("Phone number は10桁か11桁の半角数字ハイフン(-)なしで入力してください ")
  end

  it 'phone_numberが9桁以下の場合保存できないこと' do
    @user_order.phone_number = '090123456'
    @user_order.valid?
    expect(@user_order.errors.full_messages).to include("Phone number は10桁か11桁の半角数字ハイフン(-)なしで入力してください ")
  end

  it 'phone_numberが12桁以上の場合保存できないこと' do
    @user_order.phone_number = '090123456789'
    @user_order.valid?
    expect(@user_order.errors.full_messages).to include("Phone number は10桁か11桁の半角数字ハイフン(-)なしで入力してください ")
  end

  it 'phone_numberがハイフンを含む場合保存できないこと' do
    @user_order.phone_number = '090-1234-5678'
    @user_order.valid?
    expect(@user_order.errors.full_messages).to include("Phone number は10桁か11桁の半角数字ハイフン(-)なしで入力してください ")
  end
end



