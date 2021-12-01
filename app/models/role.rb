class Role < ActiveRecord::Base 
    has_many :auditions

    def get_auditions
        self.auditions.all
    end

    def get_actors
        self.auditions.map do |audition|
            audition.actor
        end
    end

    def get_locations
        self.auditions.map do |audition|
            audition.location
        end
    end

    def get_lead
        auditions.where('hired = ?', true).first || 'no actor has been hired for this role!'
    end

    def understudy
        auditions.where('hired = ?', true).second || 'no actor has been hired for understudy for this role!'
    end
end