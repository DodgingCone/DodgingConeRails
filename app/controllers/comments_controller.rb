class CommentsController < ApplicationController
  before_action :authenticate_player!

  def create
    score = Score.find(params[:score_id])

    comment = score.comments.create(comment_params)
    comment.player_id = current_player.id
    comment.save

    redirect_to score_path(score)
  end

  def destroy
    comment = Comment.find(params[:id])

    score = comment.score

    # Check the user privileges
    if current_player.id == comment.score.player.id
      comment.destroy
    end

    redirect_to score_path(score)
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end
end
