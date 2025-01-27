class ListingViews
    require 'json'

    def display_all_listings(listings)
        if listings.empty?
            puts JSON.generate({ message: "No listings available"})
        else 
            listings_json = listings.map do |listing|
                {
                    id: listing.id,
                    title: listing.title,
                    description: listing.description,
                }
            end
            puts JSON.generate(listings_json)
        end
    end

    def get_listing_input
        print "Enter Title: "
        title = gets.chomp
        
        print "Enter Description: "
        description = gets.chomp

        { title: title, description: description}
    end

    def get_listing_id(action)
        print "Enter Listing ID: to #{action} "
        gets.chomp.to_i
    end

    def display_listing_created(listing)
        puts JSON.generate({ 
            message: "Listing successfully created", 
            listing: {
                id: listing.id,
                title: listing.title,
                description: listing.description
              }
        })
    end
    
    def display_listing_updated(listing)
        puts JSON.generate({ 
            message: "listing successfully updated",
            listing: {
                id: listing.id,
                title: listing.title,
                description: listing.description
            }

        })
    end
    
    def display_listing_deleted(id)
        puts JSON.generate({ 
            message: "listing with id #{id} has been deleted"
        })
    end

    def display_listing_not_found(id)
        puts JSON.generate({ 
            message: "listing with id #{id} could not be found"
        })
    end

end