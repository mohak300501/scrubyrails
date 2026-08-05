# ===== SANSKRITWEEK SETTING MODEL =====
# To remove: delete this file

class SanskritweekSetting < ApplicationRecord

  validates :key,   presence: true, uniqueness: true
  validates :value, presence: true

  # Helper — call anywhere: SanskritweekSetting.get('google_form_url')
  def self.get(key)
    find_by(key: key)&.value
  end

  # Helper — call anywhere: SanskritweekSetting.set('google_form_url', 'https://...')
  def self.set(key, value)
    setting = find_or_initialize_by(key: key)
    setting.update(value: value)
  end

end
# ===== END SANSKRITWEEK SETTING MODEL =====