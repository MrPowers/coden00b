require 'spec_helper'

describe PostsController do
  describe "#new" do
    it "assigns a new post instance" do
      get(:new)
      assigns(:post).should be_an_instance_of(Post)
      assigns(:post).should be_new_record
    end
  end

  describe "#create" do
    it "does something" do
      #post(:create)
    end
  end

  describe "#show" do
    let(:post) { Post.create(:title => 'wah', :url => "http://www.google.com") }

    before :each do
      get(:show, :id => post.id)
    end

    it "assigns a post" do
      assigns(:post).should eq post
    end

    it "assigns comments" do
      assigns(:comments).should have(1).item
    end

    it "assigns a new comment" do
      assigns(:comment).should be_an_instance_of(Comment)
      assigns(:comment).should be_new_record
      assigns(:comment).post.should eq post
    end
  end

  describe "#index" do
    let(:posts) { [] }

    before :each do
      35.times do |i|
        posts << Post.create(:url => "http://www.google.com", :title => "post-#{i}")
      end
    end

    it "assigns 30 posts" do
      get(:index)
      assigns(:posts).should eq posts.reverse[0..29]
    end

    context "on page 2" do
      it "returns the last 5" do
        get(:index, :page => 2)
        assigns(:posts).should eq posts.reverse[30..34]
      end
    end
  end
end
