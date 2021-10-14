require "bookmark"
require "database_helpers"

describe Bookmark do
  describe "all_bookmarks" do
    it "displays all bookmarks" do
      connection = PG.connect(dbname: "bookmark_manager_test")

      bookmark = Bookmark.create(url: "https://www.youtube.com", title: "Youtube")
      Bookmark.create(url: "https://www.twitter.com", title: "Twitter")
      Bookmark.create(url: "https://www.google.com", title: "Google")

      bookmarks = Bookmark.all_bookmarks

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq "Youtube"
      expect(bookmarks.first.url).to eq "https://www.youtube.com"
    end

    describe "create" do
      it "creates a new bookmark" do
        bookmark = Bookmark.create(url: "https://www.example.org", title: "Test Bookmark")
        persisted_data = persisted_data(id: bookmark.id)

        expect(bookmark).to be_a Bookmark
        expect(bookmark.id).to eq persisted_data["id"]
        expect(bookmark.title).to eq "Test Bookmark"
        expect(bookmark.url).to eq "https://www.example.org"
      end
    end
  end
end
