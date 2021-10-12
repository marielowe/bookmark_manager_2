feature "Viewing bookmarks" do
  scenario "can see the bookmarks" do
    visit("/bookmarks")
    expect(page).to have_content "https://youtube.com"
    expect(page).to have_content "https://github.com"
    expect(page).to have_content "https://google.com"
  end
end
