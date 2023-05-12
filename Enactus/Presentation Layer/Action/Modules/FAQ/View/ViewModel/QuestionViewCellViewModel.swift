protocol QuestionViewModelProtocol {
    var questions: [QuestionModel] { get set }
}

struct QuestionViewModel: QuestionViewModelProtocol {
    var questions: [QuestionModel] = [
        .init(question: "Как редактировать мой профиль?"),
        .init(question: "Как переводить коины своему другу?"),
        .init(question: "Куда обращаться в случае возрата товара ?"),
        .init(question: "Можно ли отменять заказы?"),
        .init(question: "Как узнать счет своего кошелька?"),
        .init(question: "Могу ли я оплатить кредиты досрочно?"),
        .init(question: "Как оплатить кредит за обучение?"),
        .init(question: "Как купить товар с магазина?"),
        .init(question: "Кому я могу переводить свои коины?"),
    ]
}
