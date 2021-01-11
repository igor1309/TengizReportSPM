//
//  BodyToken Samples.swift
//
//
//  Created by Igor Malyarov on 04.01.2021.
//

import Foundation

public extension Tokens.BodyToken {
    static var allBodyTokens: [[Tokens.BodyToken]] {
        [bodyTokens202006,
         bodyTokens202007,
         bodyTokens202008,
         bodyTokens202009,
         bodyTokens202010,
         bodyTokens202011]//.flatMap { $0 }
    }

    static var allSignificantBodyTokens: [[Tokens.BodyToken]] {
        allBodyTokens
            .map {
                $0.filter {
                    switch $0.symbol {
                        case let .item(_, number, _): return number != 0
                        case .header(_, _, _), .footer(_, _): return true
                        default: return false
                    }
                }
            }
    }

    // swiftlint:disable file_length
    // swiftlint:disable line_length
    
    static var bodyTokens202006: [Tokens.BodyToken] {
        [Tokens.BodyToken(source:"Основные расходы:\t\t25%", symbol: .header(title: "Основные расходы", value: Optional(0.25), percentage: nil)),
         Tokens.BodyToken(source:"5. Аренда головного офиса\t11.500", symbol: .item(title: "5. Аренда головного офиса", value: 11500.0, comment: nil)),
         Tokens.BodyToken(source:"ИТОГ:\t11.500", symbol: .footer(title: "ИТОГ", value: Optional(11500.0))),
         Tokens.BodyToken(source:"Зарплата:\t\t22%", symbol: .header(title: "Зарплата", value: Optional(0.22), percentage: nil)),
         Tokens.BodyToken(source:"1. ФОТ\t19.721 ( за вторую часть июня мы выдаем с 10 по 15 июля, а первая часть июля с 25 по 30 июля)", symbol: .item(title: "1. ФОТ", value: 19721.0, comment: Optional("( за вторую часть июня мы выдаем с 10 по 15 июля, а первая часть июля с 25 по 30 июля)"))),
         Tokens.BodyToken(source:"ИТОГ:\t19.721", symbol: .footer(title: "ИТОГ", value: Optional(19721.0))),
         Tokens.BodyToken(source:"Фактический приход товара и оплата товара:\t\t25%", symbol: .header(title: "Фактический приход товара и оплата товара", value: Optional(0.25), percentage: nil)),
         Tokens.BodyToken(source:"1. Приход товара по накладным\t451.198р 41к (из них у нас оплачено фактический 21.346р 15к)", symbol: .item(title: "1. Приход товара по накладным", value: 21346.15, comment: Optional("451.198р 41к (из них у нас оплачено фактический 21.346р 15к)"))),
         Tokens.BodyToken(source:"2. Предоплаченный товар, но не отраженный в приходе\t15.800", symbol: .item(title: "2. Предоплаченный товар, но не отраженный в приходе", value: 15800.0, comment: nil)),
         Tokens.BodyToken(source:"ИТОГ:\t37.146р 15к", symbol: .footer(title: "ИТОГ", value: Optional(37146.15))),
         Tokens.BodyToken(source:"Прочие расходы:\t\t8%", symbol: .header(title: "Прочие расходы", value: Optional(0.08), percentage: nil)),
         Tokens.BodyToken(source:"2. Банковское обслуживание\t4.544", symbol: .item(title: "2. Банковское обслуживание", value: 4544.0, comment: nil)),
         Tokens.BodyToken(source:"4. Банковская комиссия 1.6% за эквайринг\t2.120", symbol: .item(title: "4. Банковская комиссия 1.6% за эквайринг", value: 2120.0, comment: nil)),
         Tokens.BodyToken(source:"9. Реклама и IT поддержка\t16.300", symbol: .item(title: "9. Реклама и IT поддержка", value: 16300.0, comment: nil)),
         Tokens.BodyToken(source:"16. Текущие мелкие расходы \t1.200", symbol: .item(title: "16. Текущие мелкие расходы", value: 1200.0, comment: nil)),
         Tokens.BodyToken(source:"ИТОГ:\t24.164", symbol: .footer(title: "ИТОГ", value: Optional(24164.0))),
         Tokens.BodyToken(source:"Расходы на доставку:", symbol: .header(title: "Расходы на доставку", value: nil, percentage: nil)),
         Tokens.BodyToken(source:"ИТОГ:", symbol: .footer(title: "ИТОГ", value: nil)),
        ]
    }
    
    static var bodyTokens202007: [Tokens.BodyToken] {
        [Tokens.BodyToken(source:"Основные расходы:\t\t25%", symbol: .header(title: "Основные расходы", value: Optional(0.25), percentage: nil)),
         Tokens.BodyToken(source:"1. Аренда торгового помещения\t46.667 (за июнь)", symbol: .item(title: "1. Аренда торгового помещения", value: 46667.0, comment: Optional("(за июнь)"))),
         Tokens.BodyToken(source:"5. Аренда головного офиса\t11.500", symbol: .item(title: "5. Аренда головного офиса", value: 11500.0, comment: nil)),
         Tokens.BodyToken(source:"6. Аренда головного склада\t7.000", symbol: .item(title: "6. Аренда головного склада", value: 7000.0, comment: nil)),
         Tokens.BodyToken(source:"ИТОГ:\t65.167", symbol: .footer(title: "ИТОГ", value: Optional(65167.0))),
         Tokens.BodyToken(source:"Зарплата:\t\t22%", symbol: .header(title: "Зарплата", value: Optional(0.22), percentage: nil)),
         Tokens.BodyToken(source:"1. ФОТ\t 704.848 ( за вторую часть июня мы выдаем с 10 по 15 июля, а первая часть июля с 25 по 30 июля)", symbol: .item(title: "1. ФОТ", value: 704848.0, comment: Optional("( за вторую часть июня мы выдаем с 10 по 15 июля, а первая часть июля с 25 по 30 июля)"))),
         Tokens.BodyToken(source:"2. ФОТ Бренд, логистика, бухгалтерия\t99.000", symbol: .item(title: "2. ФОТ Бренд, логистика, бухгалтерия", value: 99000.0, comment: nil)),
         Tokens.BodyToken(source:"ИТОГ:\t803.848", symbol: .footer(title: "ИТОГ", value: Optional(803848.0))),
         Tokens.BodyToken(source:"Фактический приход товара и оплата товара:\t\t25%", symbol: .header(title: "Фактический приход товара и оплата товара", value: Optional(0.25), percentage: nil)),
         Tokens.BodyToken(source:"1. Приход товара по накладным\t922.936р 37к (оплаты фактические: 313.570р 26к-переводы; 87.091р 20к-корпоративная карта; 97.712-наличные из кассы; Итого 498.373р 46к)", symbol: .item(title: "1. Приход товара по накладным", value: 498373.46, comment: Optional("922.936р 37к (оплаты фактические: 313.570р 26к-переводы; 87.091р 20к-корпоративная карта; 97.712-наличные из кассы; Итого 498.373р 46к)"))),
         Tokens.BodyToken(source:"2. Предоплаченный товар, но не отраженный в приходе\tБейсболки персонал-18.000; Подушки в зал-22.400; Итого 40.400", symbol: .item(title: "2. Предоплаченный товар, но не отраженный в приходе", value: 40400.0, comment: Optional("Бейсболки персонал-18.000; Подушки в зал-22.400; Итого 40.400"))),
         Tokens.BodyToken(source:"ИТОГ:\t538.773р 46к", symbol: .footer(title: "ИТОГ", value: Optional(538773.46))),
         Tokens.BodyToken(source:"Прочие расходы:\t\t8%", symbol: .header(title: "Прочие расходы", value: Optional(0.08), percentage: nil)),
         Tokens.BodyToken(source:"1. Налоговые платежи \t13.318р 93к", symbol: .item(title: "1. Налоговые платежи", value: 13318.93, comment: nil)),
         Tokens.BodyToken(source:"2. Банковское обслуживание\t5.778", symbol: .item(title: "2. Банковское обслуживание", value: 5778.0, comment: nil)),
         Tokens.BodyToken(source:"3. Юридическое сопровождение\t20.000", symbol: .item(title: "3. Юридическое сопровождение", value: 20000.0, comment: nil)),
         Tokens.BodyToken(source:"4. Банковская комиссия 1.6% за эквайринг\t12.785", symbol: .item(title: "4. Банковская комиссия 1.6% за эквайринг", value: 12785.0, comment: nil)),
         Tokens.BodyToken(source:"6. Обслуживание кассовой программы\t21.806р 20к", symbol: .item(title: "6. Обслуживание кассовой программы", value: 21806.2, comment: nil)),
         Tokens.BodyToken(source:"9. Реклама и IT поддержка\t104.000", symbol: .item(title: "9. Реклама и IT поддержка", value: 104000.0, comment: nil)),
         Tokens.BodyToken(source:"14. Контур (эл.отчетность)\t3.000", symbol: .item(title: "14. Контур (эл.отчетность)", value: 3000.0, comment: nil)),
         Tokens.BodyToken(source:"16. Текущие мелкие расходы \t2.910", symbol: .item(title: "16. Текущие мелкие расходы", value: 2910.0, comment: nil)),
         Tokens.BodyToken(source:"18. Регистрация Кассового аппарата (запасной)\t2.000", symbol: .item(title: "18. Регистрация Кассового аппарата (запасной)", value: 2000.0, comment: nil)),
         Tokens.BodyToken(source:"22. Хэдхантер (подбор пероснала)\t3.240", symbol: .item(title: "22. Хэдхантер (подбор пероснала)", value: 3240.0, comment: nil)),
         Tokens.BodyToken(source:"23. Аудит кантора (Бухуслуги)\t60.000", symbol: .item(title: "23. Аудит кантора (Бухуслуги)", value: 60000.0, comment: nil)),
         Tokens.BodyToken(source:"24. Столы Тенгиза\t6.100", symbol: .item(title: "24. Столы Тенгиза", value: 6100.0, comment: nil)),
         Tokens.BodyToken(source:"25. Стол Игорь\t5.470", symbol: .item(title: "25. Стол Игорь", value: 5470.0, comment: nil)),
         Tokens.BodyToken(source:"26. Вино отправляли в подарок\t1.900", symbol: .item(title: "26. Вино отправляли в подарок", value: 1900.0, comment: nil)),
         Tokens.BodyToken(source:"ИТОГ:\t262.308", symbol: .footer(title: "ИТОГ", value: Optional(262308.0))),
         Tokens.BodyToken(source:"Расходы на доставку:", symbol: .header(title: "Расходы на доставку", value: nil, percentage: nil)),
         Tokens.BodyToken(source:"2. Агрегаторы\t6.981", symbol: .item(title: "2. Агрегаторы", value: 6981.0, comment: nil)),
         Tokens.BodyToken(source:"ИТОГ:\t6.981", symbol: .footer(title: "ИТОГ", value: Optional(6981.0))),
        ]
    }
    
    static var bodyTokens202008: [Tokens.BodyToken] {
        [Tokens.BodyToken(source:"Основные расходы:\t\t20%\t12.56%", symbol: .header(title: "Основные расходы", value: Optional(0.2), percentage: Optional(0.12560000000000002))),
         Tokens.BodyToken(source:"1. Аренда торгового помещения\t 200.000 (за июль)", symbol: .item(title: "1. Аренда торгового помещения", value: 200000.0, comment: Optional("(за июль)"))),
         Tokens.BodyToken(source:"5. Аренда головного офиса\t11.500", symbol: .item(title: "5. Аренда головного офиса", value: 11500.0, comment: nil)),
         Tokens.BodyToken(source:"6. Аренда головного склада\t7.000", symbol: .item(title: "6. Аренда головного склада", value: 7000.0, comment: nil)),
         Tokens.BodyToken(source:"ИТОГ:\t218.500", symbol: .footer(title: "ИТОГ", value: Optional(218500.0))),
         Tokens.BodyToken(source:"Зарплата:\t\t20%\t57.13%", symbol: .header(title: "Зарплата", value: Optional(0.2), percentage: Optional(0.5713))),
         Tokens.BodyToken(source:"1. ФОТ\t 894.510( за вторую часть июля и первая часть августа)", symbol: .item(title: "1. ФОТ", value: 894510.0, comment: Optional("( за вторую часть июля и первая часть августа)"))),
         Tokens.BodyToken(source:"2. ФОТ Бренд, логистика, бухгалтерия\t99.000", symbol: .item(title: "2. ФОТ Бренд, логистика, бухгалтерия", value: 99000.0, comment: nil)),
         Tokens.BodyToken(source:"-10.000 за перерасход питание персонала в июле", symbol: .item(title: "Correction", value: -10000.0, comment: Optional("-10.000 за перерасход питание персонала в июле"))),
         Tokens.BodyToken(source:"ИТОГ:\t983.510", symbol: .footer(title: "ИТОГ", value: Optional(983510.0))),
         Tokens.BodyToken(source:"Фактический приход товара и оплата товара:\t\t25%", symbol: .header(title: "Фактический приход товара и оплата товара", value: Optional(0.25), percentage: nil)),
         Tokens.BodyToken(source:"1. Приход товара по накладным\t 753.950р 74к(оплаты фактические: 444.719р 16к -переводы; 75.255р 20к-корпоративная карта; 1.545-наличные из кассы; Итого 521.519р 36к)", symbol: .item(title: "1. Приход товара по накладным", value: 521519.36, comment: Optional("753.950р 74к(оплаты фактические: 444.719р 16к -переводы; 75.255р 20к-корпоративная карта; 1.545-наличные из кассы; Итого 521.519р 36к)"))),
         Tokens.BodyToken(source:"2. Предоплаченный товар, но не отраженный в приходе\t КНК Групп-17.300 (плейсметы;ИП Максимов-6.300 (шоколад фирм.,);Итого 23.600", symbol: .item(title: "2. Предоплаченный товар, но не отраженный в приходе", value: 23600.0, comment: Optional("КНК Групп-17.300 (плейсметы;ИП Максимов-6.300 (шоколад фирм.,);Итого 23.600"))),
         Tokens.BodyToken(source:"ИТОГ:\t545.119р 36к", symbol: .footer(title: "ИТОГ", value: Optional(545119.36))),
         Tokens.BodyToken(source:"Прочие расходы:\t\t15%", symbol: .header(title: "Прочие расходы", value: Optional(0.15), percentage: nil)),
         Tokens.BodyToken(source:"1. Налоговые платежи \t20.614", symbol: .item(title: "1. Налоговые платежи", value: 20614.0, comment: nil)),
         Tokens.BodyToken(source:"2. Банковское обслуживание\t7.234", symbol: .item(title: "2. Банковское обслуживание", value: 7234.0, comment: nil)),
         Tokens.BodyToken(source:"3. Юридическое сопровождение\t40.000", symbol: .item(title: "3. Юридическое сопровождение", value: 40000.0, comment: nil)),
         Tokens.BodyToken(source:"4. Банковская комиссия 1.6% за эквайринг\t19.769", symbol: .item(title: "4. Банковская комиссия 1.6% за эквайринг", value: 19769.0, comment: nil)),
         Tokens.BodyToken(source:"6. Обслуживание кассовой программы\t14.866", symbol: .item(title: "6. Обслуживание кассовой программы", value: 14866.0, comment: nil)),
         Tokens.BodyToken(source:"9. Реклама и IT поддержка\t53.500", symbol: .item(title: "9. Реклама и IT поддержка", value: 53500.0, comment: nil)),
         Tokens.BodyToken(source:"12. Интернет\t7.701+4.500", symbol: .item(title: "12. Интернет", value: 12201.0, comment: Optional("7.701+4.500"))),
         Tokens.BodyToken(source:"14. РПК Ника (крепления д/телевизоров и монтаж)\t30.000", symbol: .item(title: "14. РПК Ника (крепления д/телевизоров и монтаж)", value: 30000.0, comment: nil)),
         Tokens.BodyToken(source:"15. Аренда зарядных устройств и раций\t5.000", symbol: .item(title: "15. Аренда зарядных устройств и раций", value: 5000.0, comment: nil)),
         Tokens.BodyToken(source:"16. Текущие мелкие расходы \t2.250", symbol: .item(title: "16. Текущие мелкие расходы", value: 2250.0, comment: nil)),
         Tokens.BodyToken(source:"18. Аренда оборудования д/питьевой воды\t5.130", symbol: .item(title: "18. Аренда оборудования д/питьевой воды", value: 5130.0, comment: nil)),
         Tokens.BodyToken(source:"23. Аудит кантора (Бухуслуги)\t60.000", symbol: .item(title: "23. Аудит кантора (Бухуслуги)", value: 60000.0, comment: nil)),
         Tokens.BodyToken(source:"24. Стол Тенгиз\t10.552", symbol: .item(title: "24. Стол Тенгиз", value: 10552.0, comment: nil)),
         Tokens.BodyToken(source:"25. Стол Игорь\t45.440", symbol: .item(title: "25. Стол Игорь", value: 45440.0, comment: nil)),
         Tokens.BodyToken(source:"ИТОГ:\t326.556", symbol: .footer(title: "ИТОГ", value: Optional(326556.0))),
         Tokens.BodyToken(source:"Расходы на доставку:", symbol: .header(title: "Расходы на доставку", value: nil, percentage: nil)),
         Tokens.BodyToken(source:"2. Агрегаторы\t20.586", symbol: .item(title: "2. Агрегаторы", value: 20586.0, comment: nil)),
         Tokens.BodyToken(source:"ИТОГ:\t20.586", symbol: .footer(title: "ИТОГ", value: Optional(20586.0))),
        ]
    }
    
    static var bodyTokens202009: [Tokens.BodyToken] {
        [Tokens.BodyToken(source:"Основные расходы:\t\t20%\t8.95%", symbol: .header(title: "Основные расходы", value: Optional(0.2), percentage: Optional(0.0895))),
         Tokens.BodyToken(source:"1. Аренда торгового помещения\t 200.000 (за август)", symbol: .item(title: "1. Аренда торгового помещения", value: 200000.0, comment: Optional("(за август)"))),
         Tokens.BodyToken(source:"5. Аренда головного офиса\t11.500", symbol: .item(title: "5. Аренда головного офиса", value: 11500.0, comment: nil)),
         Tokens.BodyToken(source:"6. Аренда головного склада\t7.000", symbol: .item(title: "6. Аренда головного склада", value: 7000.0, comment: nil)),
         Tokens.BodyToken(source:"ИТОГ:\t218.500", symbol: .footer(title: "ИТОГ", value: Optional(218500.0))),
         Tokens.BodyToken(source:"Зарплата:\t\t20%\t43.4%", symbol: .header(title: "Зарплата", value: Optional(0.2), percentage: Optional(0.434))),
         Tokens.BodyToken(source:"1. ФОТ\t 960.056( за вторую часть августа и первую  часть сентября)", symbol: .item(title: "1. ФОТ", value: 960056.0, comment: Optional("( за вторую часть августа и первую  часть сентября)"))),
         Tokens.BodyToken(source:"2. ФОТ Бренд, логистика, бухгалтерия\t99.000", symbol: .item(title: "2. ФОТ Бренд, логистика, бухгалтерия", value: 99000.0, comment: nil)),
         Tokens.BodyToken(source:"ИТОГ:\t1.059.056", symbol: .footer(title: "ИТОГ", value: Optional(1059056.0))),
         Tokens.BodyToken(source:"Фактический приход товара и оплата товара:\t946.056р\t25%", symbol: .header(title: "Фактический приход товара и оплата товара", value: Optional(0.25), percentage: nil)),
         Tokens.BodyToken(source:"1. Приход товара по накладным\t 946.056 (оплаты фактические: 475.228р 52к -переводы; 157.455р 85к-корпоративная карта; 0-наличные из кассы; Итого 632.684р 37к)", symbol: .item(title: "1. Приход товара по накладным", value: 632684.37, comment: Optional("946.056 (оплаты фактические: 475.228р 52к -переводы; 157.455р 85к-корпоративная карта; 0-наличные из кассы; Итого 632.684р 37к)"))),
         Tokens.BodyToken(source:"2. Предоплаченный товар, но не отраженный в приходе\tСтудиопак-12.500 (влажные салфетки);", symbol: .item(title: "2. Предоплаченный товар, но не отраженный в приходе", value: 12500.0, comment: Optional("Студиопак-12.500 (влажные салфетки);"))),
         Tokens.BodyToken(source:"ИТОГ:\t645.184р 37к", symbol: .footer(title: "ИТОГ", value: Optional(645184.37))),
         Tokens.BodyToken(source:"Прочие расходы:\t\t15%\t16.5%", symbol: .header(title: "Прочие расходы", value: Optional(0.15), percentage: Optional(0.165))),
         Tokens.BodyToken(source:"1. Налоговые платежи \t26.964", symbol: .item(title: "1. Налоговые платежи", value: 26964.0, comment: nil)),
         Tokens.BodyToken(source:"2. Банковское обслуживание\t6.419", symbol: .item(title: "2. Банковское обслуживание", value: 6419.0, comment: nil)),
         Tokens.BodyToken(source:"3. Юридическое сопровождение\t40.000", symbol: .item(title: "3. Юридическое сопровождение", value: 40000.0, comment: nil)),
         Tokens.BodyToken(source:"4. Банковская комиссия 1.6% за эквайринг\t26.581", symbol: .item(title: "4. Банковская комиссия 1.6% за эквайринг", value: 26581.0, comment: nil)),
         Tokens.BodyToken(source:"6. Обслуживание кассовой программы Айко\t16.336", symbol: .item(title: "6. Обслуживание кассовой программы Айко", value: 16336.0, comment: nil)),
         Tokens.BodyToken(source:"8. Обслуживание мобильного приложения\t9.200", symbol: .item(title: "8. Обслуживание мобильного приложения", value: 9200.0, comment: nil)),
         Tokens.BodyToken(source:"9. Реклама и IT поддержка\t65.000", symbol: .item(title: "9. Реклама и IT поддержка", value: 65000.0, comment: nil)),
         Tokens.BodyToken(source:"12. Интернет\t9.000", symbol: .item(title: "12. Интернет", value: 9000.0, comment: nil)),
         Tokens.BodyToken(source:"16. Текущие мелкие расходы \t1.600", symbol: .item(title: "16. Текущие мелкие расходы", value: 1600.0, comment: nil)),
         Tokens.BodyToken(source:"20. Чистка вентиляции\t26.250", symbol: .item(title: "20. Чистка вентиляции", value: 26250.0, comment: nil)),
         Tokens.BodyToken(source:"21. Обслуживание банкетов\t15.250", symbol: .item(title: "21. Обслуживание банкетов", value: 15250.0, comment: nil)),
         Tokens.BodyToken(source:"22. Хэдхантер (подбор пероснала)\t9.720", symbol: .item(title: "22. Хэдхантер (подбор пероснала)", value: 9720.0, comment: nil)),
         Tokens.BodyToken(source:"23. Аудит кантора (Бухуслуги)\t60.000", symbol: .item(title: "23. Аудит кантора (Бухуслуги)", value: 60000.0, comment: nil)),
         Tokens.BodyToken(source:"24. Стол Тенгиз\t17.905", symbol: .item(title: "24. Стол Тенгиз", value: 17905.0, comment: nil)),
         Tokens.BodyToken(source:"25. Стол Игорь\t47.090", symbol: .item(title: "25. Стол Игорь", value: 47090.0, comment: nil)),
         Tokens.BodyToken(source:"26. Стол Андрей\t9.550", symbol: .item(title: "26. Стол Андрей", value: 9550.0, comment: nil)),
         Tokens.BodyToken(source:"27. Сервис Гуру (система аттестации, за 1 год)\t12.655", symbol: .item(title: "27. Сервис Гуру (система аттестации, за 1 год)", value: 12655.0, comment: nil)),
         Tokens.BodyToken(source:"ИТОГ:\t402.520", symbol: .footer(title: "ИТОГ", value: Optional(402520.0))),
         Tokens.BodyToken(source:"Расходы на доставку:", symbol: .header(title: "Расходы на доставку", value: nil, percentage: nil)),
         Tokens.BodyToken(source:"2. Агрегаторы\t18.132", symbol: .item(title: "2. Агрегаторы", value: 18132.0, comment: nil)),
         Tokens.BodyToken(source:"ИТОГ:\t18.132", symbol: .footer(title: "ИТОГ", value: Optional(18132.0))),
        ]
    }
    
    static var bodyTokens202010: [Tokens.BodyToken] {
        [Tokens.BodyToken(source:"Основные расходы:\t\t20%", symbol: .header(title: "Основные расходы", value: Optional(0.2), percentage: nil)),
         Tokens.BodyToken(source:"1. Аренда торгового помещения\t 200.000 (за август) +400.000 (за сентябрь)", symbol: .item(title: "1. Аренда торгового помещения", value: 600000.0, comment: Optional("200.000 (за август) +400.000 (за сентябрь)"))),
         Tokens.BodyToken(source:"5. Аренда головного офиса\t11.500", symbol: .item(title: "5. Аренда головного офиса", value: 11500.0, comment: nil)),
         Tokens.BodyToken(source:"6. Аренда головного склада\t7.000", symbol: .item(title: "6. Аренда головного склада", value: 7000.0, comment: nil)),
         Tokens.BodyToken(source:"ИТОГ:\t618.500", symbol: .footer(title: "ИТОГ", value: Optional(618500.0))),
         Tokens.BodyToken(source:"Зарплата:\t\t20%", symbol: .header(title: "Зарплата", value: Optional(0.2), percentage: nil)),
         Tokens.BodyToken(source:"1. ФОТ\t 1.147.085( за вторую часть сентября и первую  часть октября)", symbol: .item(title: "1. ФОТ", value: 1147085.0, comment: Optional("( за вторую часть сентября и первую  часть октября)"))),
         Tokens.BodyToken(source:"2. ФОТ Бренд, логистика, бухгалтерия\t99.000", symbol: .item(title: "2. ФОТ Бренд, логистика, бухгалтерия", value: 99000.0, comment: nil)),
         Tokens.BodyToken(source:"ИТОГ:\t1.246.085", symbol: .footer(title: "ИТОГ", value: Optional(1246085.0))),
         Tokens.BodyToken(source:"Фактический приход товара и оплата товара:\t\t25%", symbol: .header(title: "Фактический приход товара и оплата товара", value: Optional(0.25), percentage: nil)),
         Tokens.BodyToken(source:"1. Приход товара по накладным\t 907.841р; (оплаты фактические: 529.875р 50к -переводы; 98.340р 24к-корпоративная карта; 0-наличные из кассы; Итого 628.215р 74к)", symbol: .item(title: "1. Приход товара по накладным", value: 628215.74, comment: Optional("907.841р; (оплаты фактические: 529.875р 50к -переводы; 98.340р 24к-корпоративная карта; 0-наличные из кассы; Итого 628.215р 74к)"))),
         Tokens.BodyToken(source:"ИТОГ:\t628.215р 74к", symbol: .footer(title: "ИТОГ", value: Optional(628215.74))),
         Tokens.BodyToken(source:"Прочие расходы:\t\t15%", symbol: .header(title: "Прочие расходы", value: Optional(0.15), percentage: nil)),
         Tokens.BodyToken(source:"1. Налоговые платежи \t35.311", symbol: .item(title: "1. Налоговые платежи", value: 35311.0, comment: nil)),
         Tokens.BodyToken(source:"2. Банковское обслуживание\t6.279", symbol: .item(title: "2. Банковское обслуживание", value: 6279.0, comment: nil)),
         Tokens.BodyToken(source:"3. Юридическое сопровождение\t40.000", symbol: .item(title: "3. Юридическое сопровождение", value: 40000.0, comment: nil)),
         Tokens.BodyToken(source:"4. Банковская комиссия 1.6% за эквайринг\t31.587", symbol: .item(title: "4. Банковская комиссия 1.6% за эквайринг", value: 31587.0, comment: nil)),
         Tokens.BodyToken(source:"6. Обслуживание кассовой программы Айко\t8.435", symbol: .item(title: "6. Обслуживание кассовой программы Айко", value: 8435.0, comment: nil)),
         Tokens.BodyToken(source:"8. Обслуживание мобильного приложения\t9.200", symbol: .item(title: "8. Обслуживание мобильного приложения", value: 9200.0, comment: nil)),
         Tokens.BodyToken(source:"9. Реклама и IT поддержка\t85.000", symbol: .item(title: "9. Реклама и IT поддержка", value: 85000.0, comment: nil)),
         Tokens.BodyToken(source:"14. Вышивка логотипа на одежде\t2.836", symbol: .item(title: "14. Вышивка логотипа на одежде", value: 2836.0, comment: nil)),
         Tokens.BodyToken(source:"15. Аренда зарядных устройств и раций\t10.000", symbol: .item(title: "15. Аренда зарядных устройств и раций", value: 10000.0, comment: nil)),
         Tokens.BodyToken(source:"16. Текущие мелкие расходы \t5.460", symbol: .item(title: "16. Текущие мелкие расходы", value: 5460.0, comment: nil)),
         Tokens.BodyToken(source:"18. Аренда оборудования д/питьевой воды\t5.130", symbol: .item(title: "18. Аренда оборудования д/питьевой воды", value: 5130.0, comment: nil)),
         Tokens.BodyToken(source:"19. Ремонт оборудования\t6.610", symbol: .item(title: "19. Ремонт оборудования", value: 6610.0, comment: nil)),
         Tokens.BodyToken(source:"20. Чистка вентиляции\t35.000", symbol: .item(title: "20. Чистка вентиляции", value: 35000.0, comment: nil)),
         Tokens.BodyToken(source:"21. Обслуживание банкетов\t5.625", symbol: .item(title: "21. Обслуживание банкетов", value: 5625.0, comment: nil)),
         Tokens.BodyToken(source:"22. Хэдхантер (подбор пероснала)\t4.227", symbol: .item(title: "22. Хэдхантер (подбор пероснала)", value: 4227.0, comment: nil)),
         Tokens.BodyToken(source:"23. Аудит кантора (Бухуслуги)\t60.000", symbol: .item(title: "23. Аудит кантора (Бухуслуги)", value: 60000.0, comment: nil)),
         Tokens.BodyToken(source:"ИТОГ:\t350.700", symbol: .footer(title: "ИТОГ", value: Optional(350700.0))),
         Tokens.BodyToken(source:"Расходы на доставку:", symbol: .header(title: "Расходы на доставку", value: nil, percentage: nil)),
         Tokens.BodyToken(source:"2. Агрегаторы\t21.541", symbol: .item(title: "2. Агрегаторы", value: 21541.0, comment: nil)),
         Tokens.BodyToken(source:"ИТОГ:\t21.541", symbol: .footer(title: "ИТОГ", value: Optional(21541.0))),
        ]
    }
    
    static var bodyTokens202011: [Tokens.BodyToken] {
        [Tokens.BodyToken(source:"Основные расходы:\t\t20%", symbol: .header(title: "Основные расходы", value: Optional(0.2), percentage: nil)),
         Tokens.BodyToken(source:"1. Аренда торгового помещения\t 500.000 (за октябрь)", symbol: .item(title: "1. Аренда торгового помещения", value: 500000.0, comment: Optional("(за октябрь)"))),
         Tokens.BodyToken(source:"5. Аренда головного офиса\t11.500", symbol: .item(title: "5. Аренда головного офиса", value: 11500.0, comment: nil)),
         Tokens.BodyToken(source:"6. Аренда головного склада\t7.000", symbol: .item(title: "6. Аренда головного склада", value: 7000.0, comment: nil)),
         Tokens.BodyToken(source:"ИТОГ:\t518.500", symbol: .footer(title: "ИТОГ", value: Optional(518500.0))),
         Tokens.BodyToken(source:"Зарплата:\t\t20%", symbol: .header(title: "Зарплата", value: Optional(0.2), percentage: nil)),
         Tokens.BodyToken(source:"1. ФОТ\t 564.678( за вторую часть октября)", symbol: .item(title: "1. ФОТ", value: 564678.0, comment: Optional("( за вторую часть октября)"))),
         Tokens.BodyToken(source:"2. ФОТ Бренд, логистика, бухгалтерия\t99.000", symbol: .item(title: "2. ФОТ Бренд, логистика, бухгалтерия", value: 99000.0, comment: nil)),
         Tokens.BodyToken(source:"ИТОГ:\t663.678", symbol: .footer(title: "ИТОГ", value: Optional(663678.0))),
         Tokens.BodyToken(source:"Фактический приход товара и оплата товара:\t\t25%", symbol: .header(title: "Фактический приход товара и оплата товара", value: Optional(0.25), percentage: nil)),
         Tokens.BodyToken(source:"1. Приход товара по накладным\t 739.457; (оплаты фактические: 357.254р 17к -переводы; 80.220р 30к-корпоративная карта; 0-наличные из кассы; Итого 437.474р 47к)", symbol: .item(title: "1. Приход товара по накладным", value: 437474.47, comment: Optional("739.457; (оплаты фактические: 357.254р 17к -переводы; 80.220р 30к-корпоративная карта; 0-наличные из кассы; Итого 437.474р 47к)"))),
         Tokens.BodyToken(source:"ИТОГ:\t437.474р 47к", symbol: .footer(title: "ИТОГ", value: Optional(437474.47))),
         Tokens.BodyToken(source:"Прочие расходы:\t\t15%", symbol: .header(title: "Прочие расходы", value: Optional(0.15), percentage: nil)),
         Tokens.BodyToken(source:"1. Налоговые платежи \t31.949р 38к", symbol: .item(title: "1. Налоговые платежи", value: 31949.38, comment: nil)),
         Tokens.BodyToken(source:"2. Банковское обслуживание\t5.863р 74к", symbol: .item(title: "2. Банковское обслуживание", value: 5863.74, comment: nil)),
         Tokens.BodyToken(source:"3. Юридическое сопровождение\t40.000", symbol: .item(title: "3. Юридическое сопровождение", value: 40000.0, comment: nil)),
         Tokens.BodyToken(source:"4. Банковская комиссия 1.6% за эквайринг\t22.653", symbol: .item(title: "4. Банковская комиссия 1.6% за эквайринг", value: 22653.0, comment: nil)),
         Tokens.BodyToken(source:"6. Обслуживание кассовой программы Айко\t12.000", symbol: .item(title: "6. Обслуживание кассовой программы Айко", value: 12000.0, comment: nil)),
         Tokens.BodyToken(source:"8. Обслуживание мобильного приложения\t9.200", symbol: .item(title: "8. Обслуживание мобильного приложения", value: 9200.0, comment: nil)),
         Tokens.BodyToken(source:"9. Реклама и IT поддержка\t90.000", symbol: .item(title: "9. Реклама и IT поддержка", value: 90000.0, comment: nil)),
         Tokens.BodyToken(source:"12. Интернет\t4.500", symbol: .item(title: "12. Интернет", value: 4500.0, comment: nil)),
         Tokens.BodyToken(source:"14. Поверка весов\t3.400", symbol: .item(title: "14. Поверка весов", value: 3400.0, comment: nil)),
         Tokens.BodyToken(source:"15. Аренда зарядных устройств и раций\t5.000", symbol: .item(title: "15. Аренда зарядных устройств и раций", value: 5000.0, comment: nil)),
         Tokens.BodyToken(source:"16. Текущие мелкие расходы \t6.690", symbol: .item(title: "16. Текущие мелкие расходы", value: 6690.0, comment: nil)),
         Tokens.BodyToken(source:"18. Аренда оборудования д/питьевой воды\t5.130", symbol: .item(title: "18. Аренда оборудования д/питьевой воды", value: 5130.0, comment: nil)),
         Tokens.BodyToken(source:"20. Чистка вентиляции\t35.000", symbol: .item(title: "20. Чистка вентиляции", value: 35000.0, comment: nil)),
         Tokens.BodyToken(source:"22. Хэдхантер (подбор пероснала)\t9.720", symbol: .item(title: "22. Хэдхантер (подбор пероснала)", value: 9720.0, comment: nil)),
         Tokens.BodyToken(source:"23. Аудит кантора (Бухуслуги)\t60.000", symbol: .item(title: "23. Аудит кантора (Бухуслуги)", value: 60000.0, comment: nil)),
         Tokens.BodyToken(source:"24. Яндекс карты\t51.975", symbol: .item(title: "24. Яндекс карты", value: 51975.0, comment: nil)),
         Tokens.BodyToken(source:"ИТОГ:\t393.081р 12к", symbol: .footer(title: "ИТОГ", value: Optional(393081.12))),
         Tokens.BodyToken(source:"Расходы на доставку:", symbol: .header(title: "Расходы на доставку", value: nil, percentage: nil)),
         Tokens.BodyToken(source:"2. Агрегаторы\t17.839", symbol: .item(title: "2. Агрегаторы", value: 17839.0, comment: nil)),
         Tokens.BodyToken(source:"ИТОГ:\t17.839", symbol: .footer(title: "ИТОГ", value: Optional(17839.0))),
        ]
    }

}

public extension Token where Symbol == BodySymbol {
    static var allBodyTokens: [[Token<BodySymbol>]] {
        [bodyTokens202006,
         bodyTokens202007,
         bodyTokens202008,
         bodyTokens202009,
         bodyTokens202010,
         bodyTokens202011]//.flatMap { $0 }
    }

    static var allSignificantBodyTokens: [[Token<BodySymbol>]] {
        allBodyTokens
            .map {
                $0.filter {
                    switch $0.symbol {
                        case let .item(_, number, _): return number != 0
                        case .header(_, _, _), .footer(_, _): return true
                        default: return false
                    }
                }
            }
    }

#warning("row split and subtraction: -10.000 за перерасход питание персонала в июле")
    // swiftlint:disable file_length
    // swiftlint:disable line_length
    static var bodyTokens202006: [Token<BodySymbol>] {
        [Token<BodySymbol>(source: "Основные расходы:\t\t25%", symbol: .header(title: "Основные расходы", value: Optional(0.25), percentage: nil)),
         Token<BodySymbol>(source: "5. Аренда головного офиса\t11.500", symbol: .item(title: "5. Аренда головного офиса", value: 11500.0, comment: nil)),
         Token<BodySymbol>(source: "ИТОГ:\t11.500", symbol: .footer(title: "ИТОГ", value: Optional(11500.0))),
         Token<BodySymbol>(source: "Зарплата:\t\t22%", symbol: .header(title: "Зарплата", value: Optional(0.22), percentage: nil)),
         Token<BodySymbol>(source: "1. ФОТ\t19.721 ( за вторую часть июня мы выдаем с 10 по 15 июля, а первая часть июля с 25 по 30 июля)", symbol: .item(title: "1. ФОТ", value: 19721.0, comment: Optional("( за вторую часть июня мы выдаем с 10 по 15 июля, а первая часть июля с 25 по 30 июля)"))),
         Token<BodySymbol>(source: "ИТОГ:\t19.721", symbol: .footer(title: "ИТОГ", value: Optional(19721.0))),
         Token<BodySymbol>(source: "Фактический приход товара и оплата товара:\t\t25%", symbol: .header(title: "Фактический приход товара и оплата товара", value: Optional(0.25), percentage: nil)),
         Token<BodySymbol>(source: "1. Приход товара по накладным\t451.198р 41к (из них у нас оплачено фактический 21.346р 15к)", symbol: .item(title: "1. Приход товара по накладным", value: 21346.15, comment: Optional("451.198р 41к (из них у нас оплачено фактический 21.346р 15к)"))),
         Token<BodySymbol>(source: "2. Предоплаченный товар, но не отраженный в приходе\t15.800", symbol: .item(title: "2. Предоплаченный товар, но не отраженный в приходе", value: 15800.0, comment: nil)),
         Token<BodySymbol>(source: "ИТОГ:\t37.146р 15к", symbol: .footer(title: "ИТОГ", value: Optional(37146.15))),
         Token<BodySymbol>(source: "Прочие расходы:\t\t8%", symbol: .header(title: "Прочие расходы", value: Optional(0.08), percentage: nil)),
         Token<BodySymbol>(source: "2. Банковское обслуживание\t4.544", symbol: .item(title: "2. Банковское обслуживание", value: 4544.0, comment: nil)),
         Token<BodySymbol>(source: "4. Банковская комиссия 1.6% за эквайринг\t2.120", symbol: .item(title: "4. Банковская комиссия 1.6% за эквайринг", value: 2120.0, comment: nil)),
         Token<BodySymbol>(source: "9. Реклама и IT поддержка\t16.300", symbol: .item(title: "9. Реклама и IT поддержка", value: 16300.0, comment: nil)),
         Token<BodySymbol>(source: "16. Текущие мелкие расходы \t1.200", symbol: .item(title: "16. Текущие мелкие расходы", value: 1200.0, comment: nil)),
         Token<BodySymbol>(source: "ИТОГ:\t24.164", symbol: .footer(title: "ИТОГ", value: Optional(24164.0))),
         Token<BodySymbol>(source: "Расходы на доставку:", symbol: .header(title: "Расходы на доставку", value: nil, percentage: nil)),
         Token<BodySymbol>(source: "ИТОГ:", symbol: .footer(title: "ИТОГ", value: nil)),
        ]
    }

    static var bodyTokens202007: [Token<BodySymbol>] {
        [Token<BodySymbol>(source: "Основные расходы:\t\t25%", symbol: .header(title: "Основные расходы", value: Optional(0.25), percentage: nil)),
         Token<BodySymbol>(source: "1. Аренда торгового помещения\t46.667 (за июнь)", symbol: .item(title: "1. Аренда торгового помещения", value: 46667.0, comment: Optional("(за июнь)"))),
         Token<BodySymbol>(source: "5. Аренда головного офиса\t11.500", symbol: .item(title: "5. Аренда головного офиса", value: 11500.0, comment: nil)),
         Token<BodySymbol>(source: "6. Аренда головного склада\t7.000", symbol: .item(title: "6. Аренда головного склада", value: 7000.0, comment: nil)),
         Token<BodySymbol>(source: "ИТОГ:\t65.167", symbol: .footer(title: "ИТОГ", value: Optional(65167.0))),
         Token<BodySymbol>(source: "Зарплата:\t\t22%", symbol: .header(title: "Зарплата", value: Optional(0.22), percentage: nil)),
         Token<BodySymbol>(source: "1. ФОТ\t 704.848 ( за вторую часть июня мы выдаем с 10 по 15 июля, а первая часть июля с 25 по 30 июля)", symbol: .item(title: "1. ФОТ", value: 704848.0, comment: Optional("( за вторую часть июня мы выдаем с 10 по 15 июля, а первая часть июля с 25 по 30 июля)"))),
         Token<BodySymbol>(source: "2. ФОТ Бренд, логистика, бухгалтерия\t99.000", symbol: .item(title: "2. ФОТ Бренд, логистика, бухгалтерия", value: 99000.0, comment: nil)),
         Token<BodySymbol>(source: "ИТОГ:\t803.848", symbol: .footer(title: "ИТОГ", value: Optional(803848.0))),
         Token<BodySymbol>(source: "Фактический приход товара и оплата товара:\t\t25%", symbol: .header(title: "Фактический приход товара и оплата товара", value: Optional(0.25), percentage: nil)),
         Token<BodySymbol>(source: "1. Приход товара по накладным\t922.936р 37к (оплаты фактические: 313.570р 26к-переводы; 87.091р 20к-корпоративная карта; 97.712-наличные из кассы; Итого 498.373р 46к)", symbol: .item(title: "1. Приход товара по накладным", value: 498373.46, comment: Optional("922.936р 37к (оплаты фактические: 313.570р 26к-переводы; 87.091р 20к-корпоративная карта; 97.712-наличные из кассы; Итого 498.373р 46к)"))),
         Token<BodySymbol>(source: "2. Предоплаченный товар, но не отраженный в приходе\tБейсболки персонал-18.000; Подушки в зал-22.400; Итого 40.400", symbol: .item(title: "2. Предоплаченный товар, но не отраженный в приходе", value: 40400.0, comment: Optional("Бейсболки персонал-18.000; Подушки в зал-22.400; Итого 40.400"))),
         Token<BodySymbol>(source: "ИТОГ:\t538.773р 46к", symbol: .footer(title: "ИТОГ", value: Optional(538773.46))),
         Token<BodySymbol>(source: "Прочие расходы:\t\t8%", symbol: .header(title: "Прочие расходы", value: Optional(0.08), percentage: nil)),
         Token<BodySymbol>(source: "1. Налоговые платежи \t13.318р 93к", symbol: .item(title: "1. Налоговые платежи", value: 13318.93, comment: nil)),
         Token<BodySymbol>(source: "2. Банковское обслуживание\t5.778", symbol: .item(title: "2. Банковское обслуживание", value: 5778.0, comment: nil)),
         Token<BodySymbol>(source: "3. Юридическое сопровождение\t20.000", symbol: .item(title: "3. Юридическое сопровождение", value: 20000.0, comment: nil)),
         Token<BodySymbol>(source: "4. Банковская комиссия 1.6% за эквайринг\t12.785", symbol: .item(title: "4. Банковская комиссия 1.6% за эквайринг", value: 12785.0, comment: nil)),
         Token<BodySymbol>(source: "6. Обслуживание кассовой программы\t21.806р 20к", symbol: .item(title: "6. Обслуживание кассовой программы", value: 21806.2, comment: nil)),
         Token<BodySymbol>(source: "9. Реклама и IT поддержка\t104.000", symbol: .item(title: "9. Реклама и IT поддержка", value: 104000.0, comment: nil)),
         Token<BodySymbol>(source: "14. Контур (эл.отчетность)\t3.000", symbol: .item(title: "14. Контур (эл.отчетность)", value: 3000.0, comment: nil)),
         Token<BodySymbol>(source: "16. Текущие мелкие расходы \t2.910", symbol: .item(title: "16. Текущие мелкие расходы", value: 2910.0, comment: nil)),
         Token<BodySymbol>(source: "18. Регистрация Кассового аппарата (запасной)\t2.000", symbol: .item(title: "18. Регистрация Кассового аппарата (запасной)", value: 2000.0, comment: nil)),
         Token<BodySymbol>(source: "22. Хэдхантер (подбор пероснала)\t3.240", symbol: .item(title: "22. Хэдхантер (подбор пероснала)", value: 3240.0, comment: nil)),
         Token<BodySymbol>(source: "23. Аудит кантора (Бухуслуги)\t60.000", symbol: .item(title: "23. Аудит кантора (Бухуслуги)", value: 60000.0, comment: nil)),
         Token<BodySymbol>(source: "24. Столы Тенгиза\t6.100", symbol: .item(title: "24. Столы Тенгиза", value: 6100.0, comment: nil)),
         Token<BodySymbol>(source: "25. Стол Игорь\t5.470", symbol: .item(title: "25. Стол Игорь", value: 5470.0, comment: nil)),
         Token<BodySymbol>(source: "26. Вино отправляли в подарок\t1.900", symbol: .item(title: "26. Вино отправляли в подарок", value: 1900.0, comment: nil)),
         Token<BodySymbol>(source: "ИТОГ:\t262.308", symbol: .footer(title: "ИТОГ", value: Optional(262308.0))),
         Token<BodySymbol>(source: "Расходы на доставку:", symbol: .header(title: "Расходы на доставку", value: nil, percentage: nil)),
         Token<BodySymbol>(source: "2. Агрегаторы\t6.981", symbol: .item(title: "2. Агрегаторы", value: 6981.0, comment: nil)),
         Token<BodySymbol>(source: "ИТОГ:\t6.981", symbol: .footer(title: "ИТОГ", value: Optional(6981.0))),
        ]
    }

    static var bodyTokens202008: [Token<BodySymbol>] {
        [Token<BodySymbol>(source: "Основные расходы:\t\t20%\t12.56%", symbol: .header(title: "Основные расходы", value: Optional(0.2), percentage: Optional(0.12560000000000002))),
         Token<BodySymbol>(source: "1. Аренда торгового помещения\t 200.000 (за июль)", symbol: .item(title: "1. Аренда торгового помещения", value: 200000.0, comment: Optional("(за июль)"))),
         Token<BodySymbol>(source: "5. Аренда головного офиса\t11.500", symbol: .item(title: "5. Аренда головного офиса", value: 11500.0, comment: nil)),
         Token<BodySymbol>(source: "6. Аренда головного склада\t7.000", symbol: .item(title: "6. Аренда головного склада", value: 7000.0, comment: nil)),
         Token<BodySymbol>(source: "ИТОГ:\t218.500", symbol: .footer(title: "ИТОГ", value: Optional(218500.0))),
         Token<BodySymbol>(source: "Зарплата:\t\t20%\t57.13%", symbol: .header(title: "Зарплата", value: Optional(0.2), percentage: Optional(0.5713))),
         Token<BodySymbol>(source: "1. ФОТ\t 894.510( за вторую часть июля и первая часть августа)", symbol: .item(title: "1. ФОТ", value: 894510.0, comment: Optional("( за вторую часть июля и первая часть августа)"))),
         Token<BodySymbol>(source: "2. ФОТ Бренд, логистика, бухгалтерия\t99.000", symbol: .item(title: "2. ФОТ Бренд, логистика, бухгалтерия", value: 99000.0, comment: nil)),
         Token<BodySymbol>(source: "-10.000 за перерасход питание персонала в июле", symbol: .item(title: "Correction", value: -10000.0, comment: Optional("-10.000 за перерасход питание персонала в июле"))),
         Token<BodySymbol>(source: "ИТОГ:\t983.510", symbol: .footer(title: "ИТОГ", value: Optional(983510.0))),
         Token<BodySymbol>(source: "Фактический приход товара и оплата товара:\t\t25%", symbol: .header(title: "Фактический приход товара и оплата товара", value: Optional(0.25), percentage: nil)),
         Token<BodySymbol>(source: "1. Приход товара по накладным\t 753.950р 74к(оплаты фактические: 444.719р 16к -переводы; 75.255р 20к-корпоративная карта; 1.545-наличные из кассы; Итого 521.519р 36к)", symbol: .item(title: "1. Приход товара по накладным", value: 521519.36, comment: Optional("753.950р 74к(оплаты фактические: 444.719р 16к -переводы; 75.255р 20к-корпоративная карта; 1.545-наличные из кассы; Итого 521.519р 36к)"))),
         Token<BodySymbol>(source: "2. Предоплаченный товар, но не отраженный в приходе\t КНК Групп-17.300 (плейсметы;ИП Максимов-6.300 (шоколад фирм.,);Итого 23.600", symbol: .item(title: "2. Предоплаченный товар, но не отраженный в приходе", value: 23600.0, comment: Optional("КНК Групп-17.300 (плейсметы;ИП Максимов-6.300 (шоколад фирм.,);Итого 23.600"))),
         Token<BodySymbol>(source: "ИТОГ:\t545.119р 36к", symbol: .footer(title: "ИТОГ", value: Optional(545119.36))),
         Token<BodySymbol>(source: "Прочие расходы:\t\t15%", symbol: .header(title: "Прочие расходы", value: Optional(0.15), percentage: nil)),
         Token<BodySymbol>(source: "1. Налоговые платежи \t20.614", symbol: .item(title: "1. Налоговые платежи", value: 20614.0, comment: nil)),
         Token<BodySymbol>(source: "2. Банковское обслуживание\t7.234", symbol: .item(title: "2. Банковское обслуживание", value: 7234.0, comment: nil)),
         Token<BodySymbol>(source: "3. Юридическое сопровождение\t40.000", symbol: .item(title: "3. Юридическое сопровождение", value: 40000.0, comment: nil)),
         Token<BodySymbol>(source: "4. Банковская комиссия 1.6% за эквайринг\t19.769", symbol: .item(title: "4. Банковская комиссия 1.6% за эквайринг", value: 19769.0, comment: nil)),
         Token<BodySymbol>(source: "6. Обслуживание кассовой программы\t14.866", symbol: .item(title: "6. Обслуживание кассовой программы", value: 14866.0, comment: nil)),
         Token<BodySymbol>(source: "9. Реклама и IT поддержка\t53.500", symbol: .item(title: "9. Реклама и IT поддержка", value: 53500.0, comment: nil)),
         Token<BodySymbol>(source: "12. Интернет\t7.701+4.500", symbol: .item(title: "12. Интернет", value: 12201.0, comment: Optional("7.701+4.500"))),
         Token<BodySymbol>(source: "14. РПК Ника (крепления д/телевизоров и монтаж)\t30.000", symbol: .item(title: "14. РПК Ника (крепления д/телевизоров и монтаж)", value: 30000.0, comment: nil)),
         Token<BodySymbol>(source: "15. Аренда зарядных устройств и раций\t5.000", symbol: .item(title: "15. Аренда зарядных устройств и раций", value: 5000.0, comment: nil)),
         Token<BodySymbol>(source: "16. Текущие мелкие расходы \t2.250", symbol: .item(title: "16. Текущие мелкие расходы", value: 2250.0, comment: nil)),
         Token<BodySymbol>(source: "18. Аренда оборудования д/питьевой воды\t5.130", symbol: .item(title: "18. Аренда оборудования д/питьевой воды", value: 5130.0, comment: nil)),
         Token<BodySymbol>(source: "23. Аудит кантора (Бухуслуги)\t60.000", symbol: .item(title: "23. Аудит кантора (Бухуслуги)", value: 60000.0, comment: nil)),
         Token<BodySymbol>(source: "24. Стол Тенгиз\t10.552", symbol: .item(title: "24. Стол Тенгиз", value: 10552.0, comment: nil)),
         Token<BodySymbol>(source: "25. Стол Игорь\t45.440", symbol: .item(title: "25. Стол Игорь", value: 45440.0, comment: nil)),
         Token<BodySymbol>(source: "ИТОГ:\t326.556", symbol: .footer(title: "ИТОГ", value: Optional(326556.0))),
         Token<BodySymbol>(source: "Расходы на доставку:", symbol: .header(title: "Расходы на доставку", value: nil, percentage: nil)),
         Token<BodySymbol>(source: "2. Агрегаторы\t20.586", symbol: .item(title: "2. Агрегаторы", value: 20586.0, comment: nil)),
         Token<BodySymbol>(source: "ИТОГ:\t20.586", symbol: .footer(title: "ИТОГ", value: Optional(20586.0))),
        ]
    }

    static var bodyTokens202009: [Token<BodySymbol>] {
        [Token<BodySymbol>(source: "Основные расходы:\t\t20%\t8.95%", symbol: .header(title: "Основные расходы", value: Optional(0.2), percentage: Optional(0.0895))),
         Token<BodySymbol>(source: "1. Аренда торгового помещения\t 200.000 (за август)", symbol: .item(title: "1. Аренда торгового помещения", value: 200000.0, comment: Optional("(за август)"))),
         Token<BodySymbol>(source: "5. Аренда головного офиса\t11.500", symbol: .item(title: "5. Аренда головного офиса", value: 11500.0, comment: nil)),
         Token<BodySymbol>(source: "6. Аренда головного склада\t7.000", symbol: .item(title: "6. Аренда головного склада", value: 7000.0, comment: nil)),
         Token<BodySymbol>(source: "ИТОГ:\t218.500", symbol: .footer(title: "ИТОГ", value: Optional(218500.0))),
         Token<BodySymbol>(source: "Зарплата:\t\t20%\t43.4%", symbol: .header(title: "Зарплата", value: Optional(0.2), percentage: Optional(0.434))),
         Token<BodySymbol>(source: "1. ФОТ\t 960.056( за вторую часть августа и первую  часть сентября)", symbol: .item(title: "1. ФОТ", value: 960056.0, comment: Optional("( за вторую часть августа и первую  часть сентября)"))),
         Token<BodySymbol>(source: "2. ФОТ Бренд, логистика, бухгалтерия\t99.000", symbol: .item(title: "2. ФОТ Бренд, логистика, бухгалтерия", value: 99000.0, comment: nil)),
         Token<BodySymbol>(source: "ИТОГ:\t1.059.056", symbol: .footer(title: "ИТОГ", value: Optional(1059056.0))),
         Token<BodySymbol>(source: "Фактический приход товара и оплата товара:\t946.056р\t25%", symbol: .header(title: "Фактический приход товара и оплата товара", value: Optional(0.25), percentage: nil)),
         Token<BodySymbol>(source: "1. Приход товара по накладным\t 946.056 (оплаты фактические: 475.228р 52к -переводы; 157.455р 85к-корпоративная карта; 0-наличные из кассы; Итого 632.684р 37к)", symbol: .item(title: "1. Приход товара по накладным", value: 632684.37, comment: Optional("946.056 (оплаты фактические: 475.228р 52к -переводы; 157.455р 85к-корпоративная карта; 0-наличные из кассы; Итого 632.684р 37к)"))),
         Token<BodySymbol>(source: "2. Предоплаченный товар, но не отраженный в приходе\tСтудиопак-12.500 (влажные салфетки);", symbol: .item(title: "2. Предоплаченный товар, но не отраженный в приходе", value: 12500.0, comment: Optional("Студиопак-12.500 (влажные салфетки);"))),
         Token<BodySymbol>(source: "ИТОГ:\t645.184р 37к", symbol: .footer(title: "ИТОГ", value: Optional(645184.37))),
         Token<BodySymbol>(source: "Прочие расходы:\t\t15%\t16.5%", symbol: .header(title: "Прочие расходы", value: Optional(0.15), percentage: Optional(0.165))),
         Token<BodySymbol>(source: "1. Налоговые платежи \t26.964", symbol: .item(title: "1. Налоговые платежи", value: 26964.0, comment: nil)),
         Token<BodySymbol>(source: "2. Банковское обслуживание\t6.419", symbol: .item(title: "2. Банковское обслуживание", value: 6419.0, comment: nil)),
         Token<BodySymbol>(source: "3. Юридическое сопровождение\t40.000", symbol: .item(title: "3. Юридическое сопровождение", value: 40000.0, comment: nil)),
         Token<BodySymbol>(source: "4. Банковская комиссия 1.6% за эквайринг\t26.581", symbol: .item(title: "4. Банковская комиссия 1.6% за эквайринг", value: 26581.0, comment: nil)),
         Token<BodySymbol>(source: "6. Обслуживание кассовой программы Айко\t16.336", symbol: .item(title: "6. Обслуживание кассовой программы Айко", value: 16336.0, comment: nil)),
         Token<BodySymbol>(source: "8. Обслуживание мобильного приложения\t9.200", symbol: .item(title: "8. Обслуживание мобильного приложения", value: 9200.0, comment: nil)),
         Token<BodySymbol>(source: "9. Реклама и IT поддержка\t65.000", symbol: .item(title: "9. Реклама и IT поддержка", value: 65000.0, comment: nil)),
         Token<BodySymbol>(source: "12. Интернет\t9.000", symbol: .item(title: "12. Интернет", value: 9000.0, comment: nil)),
         Token<BodySymbol>(source: "16. Текущие мелкие расходы \t1.600", symbol: .item(title: "16. Текущие мелкие расходы", value: 1600.0, comment: nil)),
         Token<BodySymbol>(source: "20. Чистка вентиляции\t26.250", symbol: .item(title: "20. Чистка вентиляции", value: 26250.0, comment: nil)),
         Token<BodySymbol>(source: "21. Обслуживание банкетов\t15.250", symbol: .item(title: "21. Обслуживание банкетов", value: 15250.0, comment: nil)),
         Token<BodySymbol>(source: "22. Хэдхантер (подбор пероснала)\t9.720", symbol: .item(title: "22. Хэдхантер (подбор пероснала)", value: 9720.0, comment: nil)),
         Token<BodySymbol>(source: "23. Аудит кантора (Бухуслуги)\t60.000", symbol: .item(title: "23. Аудит кантора (Бухуслуги)", value: 60000.0, comment: nil)),
         Token<BodySymbol>(source: "24. Стол Тенгиз\t17.905", symbol: .item(title: "24. Стол Тенгиз", value: 17905.0, comment: nil)),
         Token<BodySymbol>(source: "25. Стол Игорь\t47.090", symbol: .item(title: "25. Стол Игорь", value: 47090.0, comment: nil)),
         Token<BodySymbol>(source: "26. Стол Андрей\t9.550", symbol: .item(title: "26. Стол Андрей", value: 9550.0, comment: nil)),
         Token<BodySymbol>(source: "27. Сервис Гуру (система аттестации, за 1 год)\t12.655", symbol: .item(title: "27. Сервис Гуру (система аттестации, за 1 год)", value: 12655.0, comment: nil)),
         Token<BodySymbol>(source: "ИТОГ:\t402.520", symbol: .footer(title: "ИТОГ", value: Optional(402520.0))),
         Token<BodySymbol>(source: "Расходы на доставку:", symbol: .header(title: "Расходы на доставку", value: nil, percentage: nil)),
         Token<BodySymbol>(source: "2. Агрегаторы\t18.132", symbol: .item(title: "2. Агрегаторы", value: 18132.0, comment: nil)),
         Token<BodySymbol>(source: "ИТОГ:\t18.132", symbol: .footer(title: "ИТОГ", value: Optional(18132.0))),
        ]
    }

    static var bodyTokens202010: [Token<BodySymbol>] {
        [Token<BodySymbol>(source: "Основные расходы:\t\t20%", symbol: .header(title: "Основные расходы", value: Optional(0.2), percentage: nil)),
         Token<BodySymbol>(source: "1. Аренда торгового помещения\t 200.000 (за август) +400.000 (за сентябрь)", symbol: .item(title: "1. Аренда торгового помещения", value: 600000.0, comment: Optional("200.000 (за август) +400.000 (за сентябрь)"))),
         Token<BodySymbol>(source: "5. Аренда головного офиса\t11.500", symbol: .item(title: "5. Аренда головного офиса", value: 11500.0, comment: nil)),
         Token<BodySymbol>(source: "6. Аренда головного склада\t7.000", symbol: .item(title: "6. Аренда головного склада", value: 7000.0, comment: nil)),
         Token<BodySymbol>(source: "ИТОГ:\t618.500", symbol: .footer(title: "ИТОГ", value: Optional(618500.0))),
         Token<BodySymbol>(source: "Зарплата:\t\t20%", symbol: .header(title: "Зарплата", value: Optional(0.2), percentage: nil)),
         Token<BodySymbol>(source: "1. ФОТ\t 1.147.085( за вторую часть сентября и первую  часть октября)", symbol: .item(title: "1. ФОТ", value: 1147085.0, comment: Optional("( за вторую часть сентября и первую  часть октября)"))),
         Token<BodySymbol>(source: "2. ФОТ Бренд, логистика, бухгалтерия\t99.000", symbol: .item(title: "2. ФОТ Бренд, логистика, бухгалтерия", value: 99000.0, comment: nil)),
         Token<BodySymbol>(source: "ИТОГ:\t1.246.085", symbol: .footer(title: "ИТОГ", value: Optional(1246085.0))),
         Token<BodySymbol>(source: "Фактический приход товара и оплата товара:\t\t25%", symbol: .header(title: "Фактический приход товара и оплата товара", value: Optional(0.25), percentage: nil)),
         Token<BodySymbol>(source: "1. Приход товара по накладным\t 907.841р; (оплаты фактические: 529.875р 50к -переводы; 98.340р 24к-корпоративная карта; 0-наличные из кассы; Итого 628.215р 74к)", symbol: .item(title: "1. Приход товара по накладным", value: 628215.74, comment: Optional("907.841р; (оплаты фактические: 529.875р 50к -переводы; 98.340р 24к-корпоративная карта; 0-наличные из кассы; Итого 628.215р 74к)"))),
         Token<BodySymbol>(source: "ИТОГ:\t628.215р 74к", symbol: .footer(title: "ИТОГ", value: Optional(628215.74))),
         Token<BodySymbol>(source: "Прочие расходы:\t\t15%", symbol: .header(title: "Прочие расходы", value: Optional(0.15), percentage: nil)),
         Token<BodySymbol>(source: "1. Налоговые платежи \t35.311", symbol: .item(title: "1. Налоговые платежи", value: 35311.0, comment: nil)),
         Token<BodySymbol>(source: "2. Банковское обслуживание\t6.279", symbol: .item(title: "2. Банковское обслуживание", value: 6279.0, comment: nil)),
         Token<BodySymbol>(source: "3. Юридическое сопровождение\t40.000", symbol: .item(title: "3. Юридическое сопровождение", value: 40000.0, comment: nil)),
         Token<BodySymbol>(source: "4. Банковская комиссия 1.6% за эквайринг\t31.587", symbol: .item(title: "4. Банковская комиссия 1.6% за эквайринг", value: 31587.0, comment: nil)),
         Token<BodySymbol>(source: "6. Обслуживание кассовой программы Айко\t8.435", symbol: .item(title: "6. Обслуживание кассовой программы Айко", value: 8435.0, comment: nil)),
         Token<BodySymbol>(source: "8. Обслуживание мобильного приложения\t9.200", symbol: .item(title: "8. Обслуживание мобильного приложения", value: 9200.0, comment: nil)),
         Token<BodySymbol>(source: "9. Реклама и IT поддержка\t85.000", symbol: .item(title: "9. Реклама и IT поддержка", value: 85000.0, comment: nil)),
         Token<BodySymbol>(source: "14. Вышивка логотипа на одежде\t2.836", symbol: .item(title: "14. Вышивка логотипа на одежде", value: 2836.0, comment: nil)),
         Token<BodySymbol>(source: "15. Аренда зарядных устройств и раций\t10.000", symbol: .item(title: "15. Аренда зарядных устройств и раций", value: 10000.0, comment: nil)),
         Token<BodySymbol>(source: "16. Текущие мелкие расходы \t5.460", symbol: .item(title: "16. Текущие мелкие расходы", value: 5460.0, comment: nil)),
         Token<BodySymbol>(source: "18. Аренда оборудования д/питьевой воды\t5.130", symbol: .item(title: "18. Аренда оборудования д/питьевой воды", value: 5130.0, comment: nil)),
         Token<BodySymbol>(source: "19. Ремонт оборудования\t6.610", symbol: .item(title: "19. Ремонт оборудования", value: 6610.0, comment: nil)),
         Token<BodySymbol>(source: "20. Чистка вентиляции\t35.000", symbol: .item(title: "20. Чистка вентиляции", value: 35000.0, comment: nil)),
         Token<BodySymbol>(source: "21. Обслуживание банкетов\t5.625", symbol: .item(title: "21. Обслуживание банкетов", value: 5625.0, comment: nil)),
         Token<BodySymbol>(source: "22. Хэдхантер (подбор пероснала)\t4.227", symbol: .item(title: "22. Хэдхантер (подбор пероснала)", value: 4227.0, comment: nil)),
         Token<BodySymbol>(source: "23. Аудит кантора (Бухуслуги)\t60.000", symbol: .item(title: "23. Аудит кантора (Бухуслуги)", value: 60000.0, comment: nil)),
         Token<BodySymbol>(source: "ИТОГ:\t350.700", symbol: .footer(title: "ИТОГ", value: Optional(350700.0))),
         Token<BodySymbol>(source: "Расходы на доставку:", symbol: .header(title: "Расходы на доставку", value: nil, percentage: nil)),
         Token<BodySymbol>(source: "2. Агрегаторы\t21.541", symbol: .item(title: "2. Агрегаторы", value: 21541.0, comment: nil)),
         Token<BodySymbol>(source: "ИТОГ:\t21.541", symbol: .footer(title: "ИТОГ", value: Optional(21541.0))),
        ]
    }

    static var bodyTokens202011: [Token<BodySymbol>] {
        [Token<BodySymbol>(source: "Основные расходы:\t\t20%", symbol: .header(title: "Основные расходы", value: Optional(0.2), percentage: nil)),
         Token<BodySymbol>(source: "1. Аренда торгового помещения\t 500.000 (за октябрь)", symbol: .item(title: "1. Аренда торгового помещения", value: 500000.0, comment: Optional("(за октябрь)"))),
         Token<BodySymbol>(source: "5. Аренда головного офиса\t11.500", symbol: .item(title: "5. Аренда головного офиса", value: 11500.0, comment: nil)),
         Token<BodySymbol>(source: "6. Аренда головного склада\t7.000", symbol: .item(title: "6. Аренда головного склада", value: 7000.0, comment: nil)),
         Token<BodySymbol>(source: "ИТОГ:\t518.500", symbol: .footer(title: "ИТОГ", value: Optional(518500.0))),
         Token<BodySymbol>(source: "Зарплата:\t\t20%", symbol: .header(title: "Зарплата", value: Optional(0.2), percentage: nil)),
         Token<BodySymbol>(source: "1. ФОТ\t 564.678( за вторую часть октября)", symbol: .item(title: "1. ФОТ", value: 564678.0, comment: Optional("( за вторую часть октября)"))),
         Token<BodySymbol>(source: "2. ФОТ Бренд, логистика, бухгалтерия\t99.000", symbol: .item(title: "2. ФОТ Бренд, логистика, бухгалтерия", value: 99000.0, comment: nil)),
         Token<BodySymbol>(source: "ИТОГ:\t663.678", symbol: .footer(title: "ИТОГ", value: Optional(663678.0))),
         Token<BodySymbol>(source: "Фактический приход товара и оплата товара:\t\t25%", symbol: .header(title: "Фактический приход товара и оплата товара", value: Optional(0.25), percentage: nil)),
         Token<BodySymbol>(source: "1. Приход товара по накладным\t 739.457; (оплаты фактические: 357.254р 17к -переводы; 80.220р 30к-корпоративная карта; 0-наличные из кассы; Итого 437.474р 47к)", symbol: .item(title: "1. Приход товара по накладным", value: 437474.47, comment: Optional("739.457; (оплаты фактические: 357.254р 17к -переводы; 80.220р 30к-корпоративная карта; 0-наличные из кассы; Итого 437.474р 47к)"))),
         Token<BodySymbol>(source: "ИТОГ:\t437.474р 47к", symbol: .footer(title: "ИТОГ", value: Optional(437474.47))),
         Token<BodySymbol>(source: "Прочие расходы:\t\t15%", symbol: .header(title: "Прочие расходы", value: Optional(0.15), percentage: nil)),
         Token<BodySymbol>(source: "1. Налоговые платежи \t31.949р 38к", symbol: .item(title: "1. Налоговые платежи", value: 31949.38, comment: nil)),
         Token<BodySymbol>(source: "2. Банковское обслуживание\t5.863р 74к", symbol: .item(title: "2. Банковское обслуживание", value: 5863.74, comment: nil)),
         Token<BodySymbol>(source: "3. Юридическое сопровождение\t40.000", symbol: .item(title: "3. Юридическое сопровождение", value: 40000.0, comment: nil)),
         Token<BodySymbol>(source: "4. Банковская комиссия 1.6% за эквайринг\t22.653", symbol: .item(title: "4. Банковская комиссия 1.6% за эквайринг", value: 22653.0, comment: nil)),
         Token<BodySymbol>(source: "6. Обслуживание кассовой программы Айко\t12.000", symbol: .item(title: "6. Обслуживание кассовой программы Айко", value: 12000.0, comment: nil)),
         Token<BodySymbol>(source: "8. Обслуживание мобильного приложения\t9.200", symbol: .item(title: "8. Обслуживание мобильного приложения", value: 9200.0, comment: nil)),
         Token<BodySymbol>(source: "9. Реклама и IT поддержка\t90.000", symbol: .item(title: "9. Реклама и IT поддержка", value: 90000.0, comment: nil)),
         Token<BodySymbol>(source: "12. Интернет\t4.500", symbol: .item(title: "12. Интернет", value: 4500.0, comment: nil)),
         Token<BodySymbol>(source: "14. Поверка весов\t3.400", symbol: .item(title: "14. Поверка весов", value: 3400.0, comment: nil)),
         Token<BodySymbol>(source: "15. Аренда зарядных устройств и раций\t5.000", symbol: .item(title: "15. Аренда зарядных устройств и раций", value: 5000.0, comment: nil)),
         Token<BodySymbol>(source: "16. Текущие мелкие расходы \t6.690", symbol: .item(title: "16. Текущие мелкие расходы", value: 6690.0, comment: nil)),
         Token<BodySymbol>(source: "18. Аренда оборудования д/питьевой воды\t5.130", symbol: .item(title: "18. Аренда оборудования д/питьевой воды", value: 5130.0, comment: nil)),
         Token<BodySymbol>(source: "20. Чистка вентиляции\t35.000", symbol: .item(title: "20. Чистка вентиляции", value: 35000.0, comment: nil)),
         Token<BodySymbol>(source: "22. Хэдхантер (подбор пероснала)\t9.720", symbol: .item(title: "22. Хэдхантер (подбор пероснала)", value: 9720.0, comment: nil)),
         Token<BodySymbol>(source: "23. Аудит кантора (Бухуслуги)\t60.000", symbol: .item(title: "23. Аудит кантора (Бухуслуги)", value: 60000.0, comment: nil)),
         Token<BodySymbol>(source: "24. Яндекс карты\t51.975", symbol: .item(title: "24. Яндекс карты", value: 51975.0, comment: nil)),
         Token<BodySymbol>(source: "ИТОГ:\t393.081р 12к", symbol: .footer(title: "ИТОГ", value: Optional(393081.12))),
         Token<BodySymbol>(source: "Расходы на доставку:", symbol: .header(title: "Расходы на доставку", value: nil, percentage: nil)),
         Token<BodySymbol>(source: "2. Агрегаторы\t17.839", symbol: .item(title: "2. Агрегаторы", value: 17839.0, comment: nil)),
         Token<BodySymbol>(source: "ИТОГ:\t17.839", symbol: .footer(title: "ИТОГ", value: Optional(17839.0))),
        ]
    }

}
