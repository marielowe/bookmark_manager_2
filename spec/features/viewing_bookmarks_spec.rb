require "pg"

feature "Viewing bookmarks" do
  scenario "A user can see the bookmarks" do
    Bookmark.create(url: "https://www.youtube.com")
    Bookmark.create(url: "https://www.twitter.com")
    Bookmark.create(url: "https://www.google.com")

    visit("/bookmarks")

    expect(page).to have_content "https://www.youtube.com"
    expect(page).to have_content "https://www.twitter.com"
    expect(page).to have_content "https://www.google.com"
  end
end
