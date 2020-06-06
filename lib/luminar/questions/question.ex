defmodule Luminar.Questions.Question do
  use Ecto.Schema
  import Ecto.Changeset

  schema "questions" do
    field :animal_type, :string
    field :answer_description, :string
    field :correct_answer, :string
    field :description_image, :string
    field :image, :string
    field :question_description, :string
    field :question_image, :string
    field :user_id, :integer
    field :wrong_answer, :string

    timestamps()
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:image, :animal_type, :answer_description, :correct_answer, :question_description, :wrong_answer, :user_id, :question_image, :description_image])
    |> validate_required([:image, :animal_type, :answer_description, :correct_answer, :question_description, :wrong_answer, :user_id, :question_image, :description_image])
  end
end
