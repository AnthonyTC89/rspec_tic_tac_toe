# frozen_string_literal: true

require './lib/tic_tac_toe.rb'

RSpec.describe TicTacToe do
  describe ' #initialize_Tic_tac_toe ' do
    it ' save the correct MARK in each player if player1 is X' do
      game = TicTacToe.new('X')
      cond = game.player1.identity == 'X' && game.player2.identity == 'O' ? true : false
      expect(cond).to be true
    end

    it ' save the correct MARK in each player if player1 is O' do
      game = TicTacToe.new('O')
      cond = game.player1.identity == 'O' && game.player2.identity == 'X' ? true : false
      expect(cond).to be true
    end
  end

  describe ' #initialize_Board ' do
    it ' test the correct number on each cell of the grid' do
      game = TicTacToe.new('X')
      cond = true
      m_board = game.board.main_board.flatten
      m_board.each_with_index do |cell, index|
        cond = cell.to_i == (index + 1)
        break unless cond
      end
      expect(cond).to be true
    end
  end

  describe ' #check_choise_player' do
    it ' when a player select a number of the empty grid ' do
      game = TicTacToe.new('X')
      cond = game.board.check_choise_player(game.player1, 1)
      cond = game.board.check_choise_player(game.player2, 2)
      expect(cond).to be true
    end

    it ' when a player select a number of the grid with saves' do
      game = TicTacToe.new('X')
      game.board.save_choise_player(game.player1, 1)
      game.board.save_choise_player(game.player2, 2)
      game.board.save_choise_player(game.player1, 3)

      cond = game.board.check_choise_player(game.player1, 1)
      cond = game.board.check_choise_player(game.player2, 2)
      cond = game.board.check_choise_player(game.player2, 3)
      expect(cond).to be false
    end
  end

  describe ' #save_choise_player ' do
    it ' when a mark is saved in the grid of each Player selection' do
      game = TicTacToe.new('X')

      game.board.save_choise_player(game.player1, 1)
      cond = game.board.main_board[0][0] == game.player1.identity

      game.board.save_choise_player(game.player2, 3)
      cond = game.board.main_board[0][2] == game.player2.identity

      expect(cond).to be true
    end
  end

  describe '#check_winnner' do
    it 'player is the winner' do
      game = TicTacToe.new('O')
      game.board.save_choise_player(game.player1, 1)
      game.board.save_choise_player(game.player1, 2)
      game.board.save_choise_player(game.player1, 3)
      cond = false
      if game.board.main_board[0][0] == game.board.main_board[0][1] &&
         game.board.main_board[0][1] == game.board.main_board[0][2] &&
         game.board.main_board[0][2] == game.player1.identity
        cond = true
      end
      expect(cond).to be true
    end
  end

  describe '#check space' do 
    it 'returns true when a space is availabe in the board' do 
      game = TicTacToe.new("X")
      cond = game.board.space?
      expect(cond).to be true
    end 

    it 'returns false when a space is not availabe in the board' do 
      game = TicTacToe.new("X")
      9.times do |n|
        game.board.save_choise_player(game.player1, n+1)
      end
      cond = game.board.space?
      expect(cond).to be false
    end 
  end 

end
