require "bookmark"

describe Bookmark do
  describe "all_bookmarks" do
    it "displays all bookmarks" do
      connection = PG.connect(dbname: "bookmark_manager_test")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.youtube.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.twitter.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.google.com');")

      bookmark = Bookmark.create(url: "https://www.youtube.com", title: "Youtube")
      Bookmark.create(url: "https://www.twitter.com", title: "Twitter")
      Bookmark.create(url: "https://www.google.com", title: "Google")

      bookmarks = Bookmark.all_bookmarks

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq "Youtube"
      expect(bookmarks.first.url).to eq "https://www.youtube.com"

      # expect(bookmarks).to include("https://www.youtube.com")
      # expect(bookmarks).to include("https://www.twitter.com")
      # expect(bookmarks).to include("https://www.google.com")
    end
  end

  describe "create" do
    it "create a new bookmark" do
      Bookmark.create(url: "https://www.example.org")

      expect(Bookmark.all_bookmarks).to include "https://www.example.org"
    end
  end
end
