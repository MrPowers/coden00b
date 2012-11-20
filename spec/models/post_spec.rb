require 'spec_helper'

describe Post do
  subject { Post.new(:url => "http://www.google.com") }

  it { should validate_presence_of :title }
  it { should have_many :comments }
  it { should belong_to :user }

  describe "#valid?" do
    context "when url is not valid" do
      it "returns false" do
        Post.new(:url => "google.com", :title => 'wah!').should_not be_valid
      end
    end

    context "when given a title and valid url" do
      it "returns true" do
        Post.new(:url => "http://google.com", :title => 'wah!').should be_valid
      end
    end
  end
end
