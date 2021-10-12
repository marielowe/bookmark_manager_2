require "bookmark"

describe Bookmark do
  describe "display_bookmarks" do
    it "displays all bookmarks" do
      bookmarks = Bookmark.all_bookmarks

      expect(bookmarks).to include("https://youtube.com")
      expect(bookmarks).to include("https://github.com")
      expect(bookmarks).to include("https://google.com")
    end
  end
end
