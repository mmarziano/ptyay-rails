module CommentsHelper

    def my_comment?
        @comment = Comment.find(params[:id])
        if @comment.user != current_user 
            flash[:alert] = "Cannot edit a comment that is not yours."
            redirect_to user_path(current_user)
        end 
    end 

        
end
