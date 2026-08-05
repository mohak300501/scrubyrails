module ApplicationHelper
    # ===== SANSKRITWEEK HELPERS =====
# To remove: delete these methods

def category_emoji(category)
  emojis = {
    'competition' => '🗣️',
    'workshop'    => '📚',
    'cultural'    => '🎭',
    'lecture'     => '🎤'
  }
  emojis[category] || '🪔'
end

# ===== END SANSKRITWEEK HELPERS =====
end
