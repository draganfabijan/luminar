defmodule Luminar.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :animal_type, :string
      add :answer_description, :text
      add :correct_answer, :string
      add :question_description, :string
      add :wrong_answer, :string
      add :user_id, :integer
      add :image, :string
      add :description_image, :string

      timestamps()
    end

  end
end
