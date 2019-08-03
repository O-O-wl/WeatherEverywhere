//
//  WeatherModel.swift
//  WeatherEverywhere
//
//  Created by 이동영 on 02/08/2019.
//  Copyright © 2019 부엉이. All rights reserved.
//

import UIKit

 /// - Todo: 삭제
class WeatherModel: NSObject, Modelable {

    var currentTime: Date = Date()
    var location: String = "서울특별시"
    var temperature: Int = 0
    var weatherImage: UIImage? = UIImage(named: "rain.jpg")

}

//
//
//struct 날씨세부사항 {
//
//    var 현재날씨: 날씨?
//
//    var 최고기온: Temperature?
//    var 최저기온: Temperature?
//
//    var 시간별날씨 = [날씨]()
//    var 일자별날씨 = [날씨]()
//
//    var 설명: String?
//
//    var 일출: Time?
//    var 일몰: Time?
//
//    var 비올확률: Persentage
//    var 습도: Persentage
//
//    var 바람: Wind
//    var 체감온도: Temperature
//
//    var 강수량: Int    //  cm
//    var 기압: Atmosphere     //  hpa
//
//}
//
//

