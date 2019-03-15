class PostsView
  # TODO: implement methods called by the PostsController
  def print_list(posts)
    puts "You got no posts yet..." if posts.length.zero?
    posts.each_with_index do |post, index|
      puts "#{index + 1}. #{post.title.capitalize} - #{post.url} (#{post.votes})."
    end
  end

  def ask_for_text(question)
    puts question
    print "--> "
    gets.chomp
  end

  def ask_for_int(question)
    puts question
    print "--> "
    gets.chomp.to_i
  end
end
