extension OrganizationController {
    struct Section {
        enum Section {
            case details
        }
        
        enum Row {
            case image
            case title
            case location
            case description
        }
        
        let section: Section
        var rows: [Row]
    }
}
