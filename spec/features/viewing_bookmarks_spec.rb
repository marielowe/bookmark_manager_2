require "pg"

feature "Viewing bookmarks" do
  scenario "A user can see the bookmarks" do
    connection = PG.connect(dbname: "bookmark_manager_test")

    connection.exec("INSERT INTO bookmarks VALUES(1, 'https://www.youtube.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'https://www.twitter.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'https://www.google.com');")

    visit("/bookmarks")

    expect(page).to have_content "https://www.youtube.com"
    expect(page).to have_content "https://www.twitter.com"
    expect(page).to have_content "https://www.google.com"
  end
end
