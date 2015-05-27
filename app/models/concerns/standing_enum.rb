module StandingEnum
  extend ActiveSupport::Concern

  included do
    enum standing: [:lowerclassman, :upperclassman]
  end
end
