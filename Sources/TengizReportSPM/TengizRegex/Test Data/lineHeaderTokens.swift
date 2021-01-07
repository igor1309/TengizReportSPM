import Foundation

public struct LineHeaderToken {
    public let line: String
    public let token: Tokens.HeaderToken

    public init(line: String, token: Tokens.HeaderToken) {
        self.line = line
        self.token = token
    }
}

public let lineHeaderTokens = [
    // Nov
    LineHeaderToken(line: "Название объекта: Саперави Аминьевка",
                    token: .company("Саперави Аминьевка")),
    LineHeaderToken(line: "Ноябрь2020",
                    token: .month("Ноябрь2020")),
    LineHeaderToken(line: "Оборот:1.885.280",
                    token: .headerItem("Оборот", 1_885_280)),
    LineHeaderToken(line: "Средний показатель: 83.475",
                    token: .headerItem("Средний показатель", 83_475)),
    // Oct
    LineHeaderToken(line: "Название объекта: Саперави Аминьевка",
                    token: .company("Саперави Аминьевка")),
    LineHeaderToken(line: "Октябрь2020",
                    token: .month("Октябрь2020")),
    LineHeaderToken(line: "Оборот:2.587.735",
                    token: .headerItem("Оборот", 2_587_735)),
    LineHeaderToken(line: "Средний показатель: 83.475",
                    token: .headerItem("Средний показатель", 83_475)),
    // Sep
    LineHeaderToken(line: "Название объекта: Саперави Аминьевка",
                    token: .company("Саперави Аминьевка")),
    LineHeaderToken(line: "Месяц: сентябрь2020",
                    token: .month("сентябрь2020")),
    LineHeaderToken(line: "Оборот:2.440.021",
                    token: .headerItem("Оборот", 2_440_021)),
    LineHeaderToken(line: "Средний показатель: 83.475",
                    token: .headerItem("Средний показатель", 81_334)),
    // Aug
    LineHeaderToken(line: "Название объекта: Саперави Аминьевка",
                    token: .company("Саперави Аминьевка")),
    LineHeaderToken(line: "Месяц: август2020",
                    token: .month("август2020")),
    LineHeaderToken(line: "Оборот:1.738.788",
                    token: .headerItem("Оборот", 1_738_788)),
    LineHeaderToken(line: "Средний показатель: 83.475",
                    token: .headerItem("Средний показатель", 56_089)),
    // July
    LineHeaderToken(line: "Название объекта: Саперави Аминьевка",
                    token: .company("Саперави Аминьевка")),
    LineHeaderToken(line: "Месяц: июль2020",
                    token: .month("июль2020")),
    LineHeaderToken(line: "Оборот:1.067.807",
                    token: .headerItem("Оборот", 1_067_807)),
    LineHeaderToken(line: "Средний показатель: 83.475",
                    token: .headerItem("Средний показатель", 34_445)),
    // June
    LineHeaderToken(line: "Название объекта: Саперави Аминьевка",
                    token: .company("Саперави Аминьевка")),
    LineHeaderToken(line: "Месяц: июнь2020 (с 24 по 30 июня)",
                    token: .month("июнь2020")),
    LineHeaderToken(line: "Оборот:266.285",
                    token: .headerItem("Оборот", 266_285)),
    LineHeaderToken(line: "Средний показатель: 83.475",
                    token: .headerItem("Средний показатель", 38_040))
]
