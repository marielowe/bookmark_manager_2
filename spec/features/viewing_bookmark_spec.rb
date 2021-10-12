feature "Viewing bookmarks" do
  scenario "can see the bookmarks" do
    visit("/bookmarks")
    expect(page).to have_content "https://www.youtube.com"
    expect(page).to have_content "https://www.github.com"
    expect(page).to have_content "https://www.google.com"
  end
end
