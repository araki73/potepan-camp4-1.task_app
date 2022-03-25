class Plan < ApplicationRecord

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :date_before_start
  validate :date_before_end
  validate :start_end_check

  def date_before_start
    if start_date != nil
      if start_date < Date.today
        errors.add(:start_date, "は今日以降の日付で選択してください")
      end
    end    
  end

  def date_before_end
    if start_date != nil
      if end_date < Date.today
        errors.add(:end_date, "は今日以降の日付で選択してください")
      end
    end    
  end

  def start_end_check
    if start_date != nil
      errors.add(:end_date, "は開始日以降の日付で選択してください") unless
      self.start_date < self.end_date 
    end    
  end

end
