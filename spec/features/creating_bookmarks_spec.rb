feature "Adding a new bookmark" do
  scenario "A user can add a bookmark to Bookmark Manager" do
    visit("/bookmarks/new")
    fill_in("url", with: "https://example.org")
    click_button("Submit")

    expect(page).to have_content "https://example.org"
  end
end
