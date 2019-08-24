class CommentsController < ApplicationController
    layout "main"

    def new
        @comment = Comment.new
    end 

    def create
        raise.params.inspect
    end 

    def edit
        @comment = Comment.find(params[:id])
    end 

    def update
        @comment = Comment.find(params[:id])
    end 

    def destroy
        @comment = Comment.find(params[:id])
    end 

    private 
        def comment_params
            params.require(:comment).permit(:text, :user_id, :fundraiser_id)
        end 
end
