module Wizard
  module Song
    STEPS = %w(step1 step2 step3 step4).freeze

    class Base
      include ActiveModel::Model
      attr_accessor :song
      attr_accessor :artist

      delegate *::Song.attribute_names.map { |attr| [attr, "#{attr}="] }.flatten, to: :song

      def initialize(song_attributes)
        @song = ::Song.new(song_attributes)
      end
    end

    class Step1 < Base
      validates :name, presence: true
    end

    class Step2 < Step1
      # validates :artist, presence: true
    end

    class Step3 < Step2
      validates :lyrics, presence: true
    end

    class Step4 < Step3
      validates :lyrics_en, presence: true
    end
  end
end
