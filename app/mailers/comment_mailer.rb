class CommentMailer < ActionMailer::Base
  default from: "from@example.com"
  default to: "receiver@example.com"

  def new_comment_email(comment, commentable)
    @comment = comment
    @commentable = commentable
    mail(subject: "Derpa derpa derp comment.")
  end
end
