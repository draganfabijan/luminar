defmodule LuminarWeb.QuestionControllerTest do
  use LuminarWeb.ConnCase

  alias Luminar.Questions

  @create_attrs %{animal_type: "some animal_type", answer_description: "some answer_description", correct_answer: "some correct_answer", description_image: "some description_image", image: "some image", question_description: "some question_description", question_image: "some question_image", user_id: 42, wrong_answer: "some wrong_answer"}
  @update_attrs %{animal_type: "some updated animal_type", answer_description: "some updated answer_description", correct_answer: "some updated correct_answer", description_image: "some updated description_image", image: "some updated image", question_description: "some updated question_description", question_image: "some updated question_image", user_id: 43, wrong_answer: "some updated wrong_answer"}
  @invalid_attrs %{animal_type: nil, answer_description: nil, correct_answer: nil, description_image: nil, image: nil, question_description: nil, question_image: nil, user_id: nil, wrong_answer: nil}

  def fixture(:question) do
    {:ok, question} = Questions.create_question(@create_attrs)
    question
  end

  describe "index" do
    test "lists all questions", %{conn: conn} do
      conn = get(conn, Routes.question_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Questions"
    end
  end

  describe "new question" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.question_path(conn, :new))
      assert html_response(conn, 200) =~ "New Question"
    end
  end

  describe "create question" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.question_path(conn, :create), question: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.question_path(conn, :show, id)

      conn = get(conn, Routes.question_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Question"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.question_path(conn, :create), question: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Question"
    end
  end

  describe "edit question" do
    setup [:create_question]

    test "renders form for editing chosen question", %{conn: conn, question: question} do
      conn = get(conn, Routes.question_path(conn, :edit, question))
      assert html_response(conn, 200) =~ "Edit Question"
    end
  end

  describe "update question" do
    setup [:create_question]

    test "redirects when data is valid", %{conn: conn, question: question} do
      conn = put(conn, Routes.question_path(conn, :update, question), question: @update_attrs)
      assert redirected_to(conn) == Routes.question_path(conn, :show, question)

      conn = get(conn, Routes.question_path(conn, :show, question))
      assert html_response(conn, 200) =~ "some updated animal_type"
    end

    test "renders errors when data is invalid", %{conn: conn, question: question} do
      conn = put(conn, Routes.question_path(conn, :update, question), question: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Question"
    end
  end

  describe "delete question" do
    setup [:create_question]

    test "deletes chosen question", %{conn: conn, question: question} do
      conn = delete(conn, Routes.question_path(conn, :delete, question))
      assert redirected_to(conn) == Routes.question_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.question_path(conn, :show, question))
      end
    end
  end

  defp create_question(_) do
    question = fixture(:question)
    %{question: question}
  end
end
