module CommentsHelper

    def my_comment?
        @comment = Comment.find(params[:id])
        @comment.user == current_user
    end 
        
end
