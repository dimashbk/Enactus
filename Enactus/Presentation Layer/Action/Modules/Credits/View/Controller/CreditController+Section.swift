extension CreditController {
    struct Section {
        enum Section {
            case education
            case credit
        }
        
        enum Row {
            case overall
            case disc
        }
        
        let section: Section
        var rows: [Row]
    }
}
