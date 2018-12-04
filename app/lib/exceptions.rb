module Exceptions
    class RideError < StandardError
        def initialize(msg = "You cannot ride this ride.")
            super
        end
    end

    class NotTallEnoughError < RideError
        def initialize(ride = "ride")
            super("Sorry. You are not tall enough to ride the #{ride}.")
        end
    end

    class NotEnoughTicketsError < RideError
        def initialize(ride = "ride")
            super("Sorry. You do not have enough tickets to ride the #{ride}.")
        end
    end
end