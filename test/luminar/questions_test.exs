defmodule Luminar.QuestionsTest do
  use Luminar.DataCase

  alias Luminar.Questions

  describe "questions" do
    alias Luminar.Questions.Question

    @valid_attrs %{animal_type: "some animal_type", answer_description: "some answer_description", correct_answer: "some correct_answer", description_image: "some description_image", image: "some image", question_description: "some question_description", question_image: "some question_image", user_id: 42, wrong_answer: "some wrong_answer"}
    @update_attrs %{animal_type: "some updated animal_type", answer_description: "some updated answer_description", correct_answer: "some updated correct_answer", description_image: "some updated description_image", image: "some updated image", question_description: "some updated question_description", question_image: "some updated question_image", user_id: 43, wrong_answer: "some updated wrong_answer"}
    @invalid_attrs %{animal_type: nil, answer_description: nil, correct_answer: nil, description_image: nil, image: nil, question_description: nil, question_image: nil, user_id: nil, wrong_answer: nil}

    def question_fixture(attrs \\ %{}) do
      {:ok, question} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Questions.create_question()

      question
    end

    test "list_questions/0 returns all questions" do
      question = question_fixture()
      assert Questions.list_questions() == [question]
    end

    test "get_question!/1 returns the question with given id" do
      question = question_fixture()
      assert Questions.get_question!(question.id) == question
    end

    test "create_question/1 with valid data creates a question" do
      assert {:ok, %Question{} = question} = Questions.create_question(@valid_attrs)
      assert question.animal_type == "some animal_type"
      assert question.answer_description == "some answer_description"
      assert question.correct_answer == "some correct_answer"
      assert question.description_image == "some description_image"
      assert question.image == "some image"
      assert question.question_description == "some question_description"
      assert question.question_image == "some question_image"
      assert question.user_id == 42
      assert question.wrong_answer == "some wrong_answer"
    end

    test "create_question/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Questions.create_question(@invalid_attrs)
    end

    test "update_question/2 with valid data updates the question" do
      question = question_fixture()
      assert {:ok, %Question{} = question} = Questions.update_question(question, @update_attrs)
      assert question.animal_type == "some updated animal_type"
      assert question.answer_description == "some updated answer_description"
      assert question.correct_answer == "some updated correct_answer"
      assert question.description_image == "some updated description_image"
      assert question.image == "some updated image"
      assert question.question_description == "some updated question_description"
      assert question.question_image == "some updated question_image"
      assert question.user_id == 43
      assert question.wrong_answer == "some updated wrong_answer"
    end

    test "update_question/2 with invalid data returns error changeset" do
      question = question_fixture()
      assert {:error, %Ecto.Changeset{}} = Questions.update_question(question, @invalid_attrs)
      assert question == Questions.get_question!(question.id)
    end

    test "delete_question/1 deletes the question" do
      question = question_fixture()
      assert {:ok, %Question{}} = Questions.delete_question(question)
      assert_raise Ecto.NoResultsError, fn -> Questions.get_question!(question.id) end
    end

    test "change_question/1 returns a question changeset" do
      question = question_fixture()
      assert %Ecto.Changeset{} = Questions.change_question(question)
    end
  end
end
