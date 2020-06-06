defmodule Luminar.Questions.Question do
  use Ecto.Schema
  import Ecto.Changeset
  use Arc.Ecto.Schema

  schema "questions" do
    field :animal_type, :string
    field :answer_description, :string
    field :correct_answer, :string
    field :question_description, :string
    field :user_id, :integer
    field :wrong_answer, :string
    field :image, Luminar.ImageUploader.Type
    field :description_image, Luminar.ImageUploader.Type

    timestamps()
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:animal_type, :answer_description, :correct_answer, :question_description, :wrong_answer, :user_id, :image, :description_image])
    |> validate_required([:image])
  end
end
