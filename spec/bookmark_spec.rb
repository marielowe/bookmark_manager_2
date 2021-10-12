require "bookmark"

describe Bookmark do
  describe "all_bookmarks" do
    it "displays all bookmarks" do
      connection = PG.connect(dbname: "bookmark_manager_test")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.youtube.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.twitter.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.google.com');")

      bookmarks = Bookmark.all_bookmarks

      expect(bookmarks).to include("https://www.youtube.com")
      expect(bookmarks).to include("https://www.twitter.com")
      expect(bookmarks).to include("https://www.google.com")
    end
  end
end
