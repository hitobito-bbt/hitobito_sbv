class AddPreferredPlayDaysOnGroupParticipations < ActiveRecord::Migration[4.2]
  def change
    add_column :event_group_participations, :preferred_play_day_1, :integer
    add_column :event_group_participations, :preferred_play_day_2, :integer
  end
end
