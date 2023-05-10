extension CreditDetailController {
    struct Section {
        enum Section {
            case payment
            case calendar
        }
        
        enum Row {
        }
        
        let section: Section
        var rows: [Row]
    }
}
