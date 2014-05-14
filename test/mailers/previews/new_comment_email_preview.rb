class NewCommentEmailPreview <  ActionMailer::Preview
  def new_comment_email
    comment = Comment.create(
      content: 'Awesome post. Thanks for the info!'
      )

    commentable = Post.create(
      body: 'lots of great info for all!'
      )
    
    CommentMailer.new_comment_email(comment, commentable)
  end
end
