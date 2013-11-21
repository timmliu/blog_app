require 'spec_helper'

describe User do

  before { @user = User.new(username: "user1", email: "user1@example.com", password: "foobar", password_confirmation: "foobar") }

  subject { @user }

  it { should respond_to(:username) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "when username is not present" do
  	before { @user.username = " " }
  	it { should_not be_valid }
  end

	describe "when username is too long" do
  	before { @user.username = "a" * 26 }
  	it { should_not be_valid }
  end

  describe "when username format is invalid" do
    it "should be invalid" do
      sample_usernames = %w[_abc abc__ 3abc abc$ @abc]
      sample_usernames.each do |invalid_username|
        @user.username = invalid_username
        expect(@user).not_to be_valid
      end
    end
  end

  describe "when username format is valid" do
    it "should be valid" do
      sample_usernames = %w[abc_ abc123 abc_123 a1b2c3 a_b_c a_1_b_2_c_3]
      sample_usernames.each do |valid_username|
        @user.username = valid_username
        expect(@user).to be_valid
      end
    end
  end

  describe "when username is already taken" do
  	before do
  		user_with_same_username = @user.dup
  		user_with_same_username.save
  	end
  	it { should_not be_valid }
  end

  describe "when email is not present" do
  	before { @user.email = " " }
  	it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end
    it { should_not be_valid }
  end

  describe "when password is not present" do
    before do
      @user = User.new(username: "user1", email: "user1@example.com", password: " ", password_confirmation: " ")
    end
    it { should_not be_valid}
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end
end