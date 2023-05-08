workspace {

    model {
        # People/Actors
        # <variable> = person <name> <description> <tag>
        publicUser = person "Public User" "A user of the book store, who can get book details, without personal bookstore accounts." "User"
        authorizedUser = person "Authorized User" "A user of the book store, who can search book records and administer book details, with personal bookstore accounts." "User"

        # Level 1: Context Diagram for Books Store System
        # Software System
        # <variable> = softwareSystem <name> <description> <tag>
        bookStoreSystem = softwareSystem "Book Store System" "Books Store System allows users to get, search book records and administering book details"

        # External Software Systems
        externalAuthorizeSystem = softwareSystem "External Authorize System" "An external Authorization System for authorization purposes" "External System"
        externalPublisherSystem = softwareSystem "External Publisher System" "An external Publisher System for giving details about books published" "External System"

        # Relationship between People/Actor and Software Systems
        publicUser -> bookStoreSystem "Gets book details"
        authorizedUser -> bookStoreSystem "Searchs book records and administers book details"
        bookStoreSystem -> externalAuthorizeSystem "Authorizes users using"
        bookStoreSystem -> externalPublisherSystem "Gets book details about books published using"
    }

    views {
        # Level 1: Context Diagram for Books Store System
        systemContext bookStoreSystem "SystemContext" {
            include *
            autoLayout
        }

        styles {
            # element <tag> {}
            element "User" {
                background #08427B
                color #ffffff
                fontSize 22
                shape Person
            }
            element "External System" {
                background #999999
                color #ffffff
            }
            relationship "Relationship" {
                dashed false
            }
        }

        theme default
    }

}