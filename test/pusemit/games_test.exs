defmodule Pusemit.GamesTest do
  use Pusemit.DataCase

  alias Pusemit.Games

  describe "games" do
    alias Pusemit.Games.Game

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def game_fixture(attrs \\ %{}) do
      {:ok, game} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Games.create_game()

      game
    end

    test "list_games/0 returns all games" do
      game = game_fixture()
      assert Games.list_games() == [game]
    end

    test "get_game!/1 returns the game with given id" do
      game = game_fixture()
      assert Games.get_game!(game.id) == game
    end

    test "create_game/1 with valid data creates a game" do
      assert {:ok, %Game{} = game} = Games.create_game(@valid_attrs)
    end

    test "create_game/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Games.create_game(@invalid_attrs)
    end

    test "update_game/2 with valid data updates the game" do
      game = game_fixture()
      assert {:ok, %Game{} = game} = Games.update_game(game, @update_attrs)
    end

    test "update_game/2 with invalid data returns error changeset" do
      game = game_fixture()
      assert {:error, %Ecto.Changeset{}} = Games.update_game(game, @invalid_attrs)
      assert game == Games.get_game!(game.id)
    end

    test "delete_game/1 deletes the game" do
      game = game_fixture()
      assert {:ok, %Game{}} = Games.delete_game(game)
      assert_raise Ecto.NoResultsError, fn -> Games.get_game!(game.id) end
    end

    test "change_game/1 returns a game changeset" do
      game = game_fixture()
      assert %Ecto.Changeset{} = Games.change_game(game)
    end
  end

  describe "players" do
    alias Pusemit.Games.Player

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def player_fixture(attrs \\ %{}) do
      {:ok, player} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Games.create_player()

      player
    end

    test "list_players/0 returns all players" do
      player = player_fixture()
      assert Games.list_players() == [player]
    end

    test "get_player!/1 returns the player with given id" do
      player = player_fixture()
      assert Games.get_player!(player.id) == player
    end

    test "create_player/1 with valid data creates a player" do
      assert {:ok, %Player{} = player} = Games.create_player(@valid_attrs)
      assert player.name == "some name"
    end

    test "create_player/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Games.create_player(@invalid_attrs)
    end

    test "update_player/2 with valid data updates the player" do
      player = player_fixture()
      assert {:ok, %Player{} = player} = Games.update_player(player, @update_attrs)
      assert player.name == "some updated name"
    end

    test "update_player/2 with invalid data returns error changeset" do
      player = player_fixture()
      assert {:error, %Ecto.Changeset{}} = Games.update_player(player, @invalid_attrs)
      assert player == Games.get_player!(player.id)
    end

    test "delete_player/1 deletes the player" do
      player = player_fixture()
      assert {:ok, %Player{}} = Games.delete_player(player)
      assert_raise Ecto.NoResultsError, fn -> Games.get_player!(player.id) end
    end

    test "change_player/1 returns a player changeset" do
      player = player_fixture()
      assert %Ecto.Changeset{} = Games.change_player(player)
    end
  end

  describe "words" do
    alias Pusemit.Games.Word

    @valid_attrs %{spelling: "some spelling"}
    @update_attrs %{spelling: "some updated spelling"}
    @invalid_attrs %{spelling: nil}

    def word_fixture(attrs \\ %{}) do
      {:ok, word} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Games.create_word()

      word
    end

    test "list_words/0 returns all words" do
      word = word_fixture()
      assert Games.list_words() == [word]
    end

    test "get_word!/1 returns the word with given id" do
      word = word_fixture()
      assert Games.get_word!(word.id) == word
    end

    test "create_word/1 with valid data creates a word" do
      assert {:ok, %Word{} = word} = Games.create_word(@valid_attrs)
      assert word.spelling == "some spelling"
    end

    test "create_word/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Games.create_word(@invalid_attrs)
    end

    test "update_word/2 with valid data updates the word" do
      word = word_fixture()
      assert {:ok, %Word{} = word} = Games.update_word(word, @update_attrs)
      assert word.spelling == "some updated spelling"
    end

    test "update_word/2 with invalid data returns error changeset" do
      word = word_fixture()
      assert {:error, %Ecto.Changeset{}} = Games.update_word(word, @invalid_attrs)
      assert word == Games.get_word!(word.id)
    end

    test "delete_word/1 deletes the word" do
      word = word_fixture()
      assert {:ok, %Word{}} = Games.delete_word(word)
      assert_raise Ecto.NoResultsError, fn -> Games.get_word!(word.id) end
    end

    test "change_word/1 returns a word changeset" do
      word = word_fixture()
      assert %Ecto.Changeset{} = Games.change_word(word)
    end
  end
end
