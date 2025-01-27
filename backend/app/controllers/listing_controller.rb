class ListingController
    def index
      listings = Listing.all
      @view.display_all_listings(listings)
    end
  
    def create
      input = @view.get_listing_input
      listing = Listing.new(username: 'admin', title: input[:title], description: input[:description])
      if listing.save
        @view.display_listing_created(listing)
      else
        puts JSON.generate({ error: 'Failed to create listing' })
      end
    end
  
    def update
      id = @view.get_listing_id('update')
      listing = Listing.find_by(id: id)
      if listing
        input = @view.get_listing_input
        if listing.update(title: input[:title], description: input[:description])
          @view.display_listing_updated(listing)
        else
          puts JSON.generate({ error: 'Failed to update listing' })
        end
      else
        @view.display_listing_not_found(id)
      end
    end
  
    def delete
      id = @view.get_listing_id('delete')
      listing = Listing.find_by(id: id)
      if listing&.destroy
        @view.display_listing_deleted(id)
      else
        @view.display_listing_not_found(id)
      end
    end
  end
  