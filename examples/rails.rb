# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Memoist

  MIN_PASSWORD_LENGTH = 6
  ONLINE_PERIOD = 2.minutes

  attr_reader :password, :password_confirmation

  scope :active, -> { where(active: true) }
  scope(:online, lambda do
    joins(:user_activity).where("user_activities.updated_at >= ?", ONLINE_PERIOD.ago)
  end)

  has_one :user_activity

  def new_method; end

  def activated?
    activated_at.present?
  end
  def online?
    user_activity && user_activity.updated_at >= ONLINE_PERIOD.ago # changed
  end
end
