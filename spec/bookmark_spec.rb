require "bookmark"

describe Bookmark do
  describe "display_bookmarks" do
    it "displays all bookmarks" do
      bookmarks = Bookmark.all_bookmarks

      expect(bookmarks).to include("https://www.youtube.com")
      expect(bookmarks).to include("https://www.github.com")
      expect(bookmarks).to include("https://www.google.com")
    end
  end
end
