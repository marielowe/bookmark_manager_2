require "bookmark"

describe Bookmark do
  describe "all_bookmarks" do
    it "displays all bookmarks" do
      connection = PG.connect(dbname: "bookmark_manager_test")
      connection.exec("INSERT INTO bookmarks (title, url) VALUES ('Youtube', 'https://www.youtube.com');")
      connection.exec("INSERT INTO bookmarks (title, url) VALUES('Twitter', 'https://www.twitter.com');")
      connection.exec("INSERT INTO bookmarks (title, url) VALUES('Google', 'https://www.google.com');")

      bookmarks = Bookmark.all_bookmarks
      urls = bookmarks.map { |bookmark| bookmark[:url] }
      expect(urls).to include("https://www.youtube.com")
      expect(urls).to include("https://www.twitter.com")
      expect(urls).to include("https://www.google.com")
    end

    describe "create" do
      it "create a new bookmark" do
        Bookmark.create(title: "Example", url: "https://www.example.org")
        bookmarks = Bookmark.all_bookmarks
        urls = bookmarks.map { |bookmark| bookmark[:url] }
        expect(urls).to include "https://www.example.org"
      end
    end
  end
end
