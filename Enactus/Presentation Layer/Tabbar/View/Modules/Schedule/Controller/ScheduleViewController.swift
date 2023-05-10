import UIKit
import FSCalendar

final class ScheduleViewController: UIViewController {
    
    var calendarHeightConstraint : NSLayoutConstraint?
    
    var viewModel: ScheduleViewModel?
    
    private lazy var calendar: FSCalendar = {
        let calendar = FSCalendar()
        calendar.delegate = self
        calendar.dataSource = self
        calendar.setScope(.week, animated: true)
        calendar.appearance.weekdayTextColor = .enFirstGradient
        calendar.appearance.headerTitleColor = .enFirstGradient
        calendar.appearance.selectionColor = .enFirstGradient
        calendar.appearance.todayColor = .enSecondGradient
        return calendar
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.cornerRadius = 8
        tableView.separatorStyle = .none
        tableView.regiter(cellClass: ScheduleTableViewCell.self)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        title = "Schedule"
    }
    
    private func setup() {
        setupSubviews()
        setupConstraints()
        viewModel?.getAllLessons()
        bindViewModel()
    }
    
    private func setupSubviews() {
        [calendar, tableView].forEach{
            view.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        calendarHeightConstraint = NSLayoutConstraint(item: calendar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)
        calendar.addConstraint(calendarHeightConstraint ?? NSLayoutConstraint())
        calendar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview().inset(24)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(calendar.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(24)
            make.bottom.equalToSuperview()
        }
    }
    
    func bindViewModel(){
           self.viewModel?.updateViewData = {
               DispatchQueue.main.async {
                   self.tableView.reloadData()
               }
           }
    }
    
    
}

extension ScheduleViewController: FSCalendarDelegate, FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendarHeightConstraint?.constant = bounds.height
        view.layoutIfNeeded()
    }
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        viewModel?.filterByWeekday(weekday: date.weekday)
    }
}

extension ScheduleViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.filteredArray.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ScheduleTableViewCell()
        var lesson = viewModel?.filteredArray[indexPath.row]
        cell.configure(lessonType: lesson?.typeID ?? 0,
                       lessonName: lesson?.lesson ?? "",
                       lessonTime: lesson?.timeOfTheLesson ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 92
    }
    
}


