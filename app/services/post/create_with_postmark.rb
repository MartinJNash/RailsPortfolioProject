class Post::CreateWithPostmark

  def self.call(request)
    mail = Postmark::Mitt.new(request.body.read)
    user = User.find_by(email: mail.from)
    post = Post.create(title: mail.subject, body: mail.text_body, author: user)
    post
  end

end
