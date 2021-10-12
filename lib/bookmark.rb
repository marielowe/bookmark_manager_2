require "pg"

class Bookmark
  def self.all_bookmarks
    connection = PG.connect(dbname: "bookmark_manager")
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark["url"] }
  end
end

