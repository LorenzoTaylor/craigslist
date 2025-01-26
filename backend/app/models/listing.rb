class listing
    attr_accessor :username, :title,:description, :id

    @@listings = []

    def initialize(username, title,description, id)
        @username = username
        @title = title
        @description = description
        @id = id

        @@listings << self
    end

    def self.all()
        @@listings
    end

    def self.find(id)
        @@listings.find { |listing| listing.id ==id}
        #TODO: implements better search query logic
    end

    def self.delete(id)
        listing = find(id)
        @@listings.delete(listing) if listing
    end

    def self.update(id, title, description)
        listing = find(id)
        listing.title = title
        listing.description = description
    end

end


# Improvement 1: Ensure ID uniqueness
# Use a class-level variable to auto-generate unique IDs for each listing.

# Improvement 2: Add validation for input data
# Ensure attributes like title and description are not empty. Raise an error if invalid.

# Improvement 3: Add error handling for update and delete methods
# Raise meaningful errors when attempting to update or delete a non-existent listing.

# Improvement 4: Improve readability
# Use consistent formatting and meaningful variable names for better code maintainability.

# Improvement 5: Enhance the self.find method
# Make the search logic more robust and scalable for future database integration.

# Improvement 6: Refactor code for scalability
# Plan for database integration in the future; for now, ensure the code remains modular.

# Improvement 7: Use consistent formatting
# Maintain consistent indentation and spacing for cleaner code.

# Improvement 8: Handle edge cases
# Ensure edge cases like empty arrays or duplicate IDs are considered in methods like delete and update.
