extension MainViewController {
    struct Action {
        enum Section {
            case action
        }
        
        enum Row {
            case remittance
            case shop
            case credits
            case faq
        }
        
        let section: Section
        var rows: [Row]
    }
}
