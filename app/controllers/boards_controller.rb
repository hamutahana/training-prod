class BoardsController < ApplicationController
	def index
		@boards = Board.page(params[:page])
	end

	def new
		@board = Board.new
	end

	def create
		board = Board.create(board_params)
		flash[:notice] = "「#{board.title}」の掲示板を作成しました。"

		redirect_to board
	end

	def show
		@board = Board.find(params[:id])
	end

	def edit
		@board = Board.find(params[:id])
	end

	def update
		board = Board.find(params[:id])
		board.update(board_params)

		redirect_to board
	end

	def destroy
		board = Board.find(params[:id])
		board.delete
		flash[:notice] = "「#{board.title}」の掲示板を削除しました。"

		redirect_to boards_path
	end

	private
	def board_params
		params.require(:board).permit(:author_name, :title, :body)
	end
end