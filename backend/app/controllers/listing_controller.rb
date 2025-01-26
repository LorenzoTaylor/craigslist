require_relative '../model/listing'
require_relative '../views/listing_views'

class ListingController
    currid = 0
    def initialize
        @view = ListingViews.new
    end

    def index
        listings = listing.all
        @view.display_all_listings(listings)
    end

    def create
        id = currid
        currid++
        username = "admin"
        title, description = @view.get_listing_input
        listing = listing.new(username, title,description, id)
        @view.display_listing_created(listing)
    end

    def update
        id = get_listing_id('update')
        listing = listing.find(id)
        if listing
            title, description = @view.get_listing_input
            listing.update(id, title, description)
            @view.display_listing_updated(listing)
        else
            @view.display_listing_not_found(id)
        end
    end

    def delete
        id = get_listing_id('delete')
        listing = listing.find(id)
        if listing
            listing.delete(id)
            @view.display_listing_deleted(id)
        else
            @view.display_listing_not_found(id)
        end
    end