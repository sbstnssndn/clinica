# Esta clase representa la adición de un examen a una batería
class ExamSelection < ApplicationRecord
  belongs_to :exam
  belongs_to :battery

  validates_presence_of :exam
  validates_presence_of :battery
  # La combinación batería-examen debe ser única
  # También se agregó un index a la tabla exam_selections:
  # add_index :exam_selections, [:exam_id, :battery_id], unique: true
  # esto asegura que haya una regla en la misma db que prohiba este caso
  validates_uniqueness_of :battery, scope: :exam

  def self.batteries_from_exam_except(exam_id, wanted_battery_ids)
    where(exam: exam_id).where.not(battery_id: wanted_battery_ids)
  end
end
