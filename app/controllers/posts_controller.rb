class PostsController
  def initialize
    @view = PostsView.new
  end

  ################################################################
  # BEWARE: you MUST NOT use the global variable DB in this file #
  ################################################################

  def index
    # TODO: implement listing all posts
    @view.print_list(Post.all)
  end

  def create
    # TODO: implement creating a new post
    title = @view.ask_for_text("What's your user post title?")
    # instanciate a new post passing in title
    url = @view.ask_for_text("What's your user post url?")
    post = Post.new(title: title, url: url)
    post.save
  end

  def update
    # TODO: implement updating an existing post
    post_id = @view.ask_for_int("What's the id of the post you want to update?")
    post = Post.find(post_id)
    new_title = @view.ask_for_text("What's your new title?")
    new_url = @view.ask_for_text("What's your new url?")
    post.title = new_title
    post.url = new_url
    post.save
  end

  def destroy
    # TODO: implement destroying a post
    post_id = @view.ask_for_int("What's the id of the post you want to delete?")
    post = Post.find(post_id)
    post.destroy
  end

  def upvote
    # TODO: implement upvoting a post
    post_id = @view.ask_for_int("What's the id of the post you want to update?")
    post = Post.find(post_id)
    post.votes += 1
    post.save
  end
end
