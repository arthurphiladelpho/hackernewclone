class Post
  # TODO: Gather all code from all previous exercises
  # - reader and accessors
  attr_reader :id
  attr_accessor :title, :url, :votes

  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @url = attributes[:url]
    @votes = attributes[:votes] || 0
  end

  def self.find(id)
    query = <<-SQL
      SELECT * FROM posts WHERE id = ?
    SQL
    DB.results_as_hash = true
    posts = DB.execute(query, id)
    unless posts.empty?
      Post.new(id: posts[0]["id"], title: posts[0]["title"], url: posts[0]["url"], votes: posts[0]["votes"])
    end
  end

  def self.all
    query = <<-SQL
      SELECT * FROM posts
    SQL
    DB.results_as_hash = true
    posts = DB.execute(query)
    posts.map do |record|
      Post.new(id: record["id"], title: record["title"], url: record["url"], votes: record["votes"])
    end
  end

  def save
    if id
      DB.execute("UPDATE posts SET title = ?, url = ?, votes = ? WHERE id = ?", [title, url, votes, id])
    else
      DB.execute("INSERT INTO posts (title, url, votes) VALUES (?, ?, ?)", [title, url, votes])
      @id = DB.last_insert_row_id
    end
  end

  def destroy
    # TODO: destroy the current instance from the database
    query = <<-SQL
      DELETE FROM posts WHERE id = ?
    SQL
    DB.execute(query, id)
  end
end
