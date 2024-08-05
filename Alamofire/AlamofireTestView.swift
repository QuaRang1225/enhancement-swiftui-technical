//
//  AlamofireTestView.swift
//  TechnicalUI
//
//  Created by 유영웅 on 8/5/24.
//

import SwiftUI
import Alamofire

struct AlamofireTestView: View {
    var body: some View {
        Button {
            let a = AF.request("http://poke-dex-env.eba-gq6ggz7x.ap-northeast-2.elasticbeanstalk.com/pokemon/30",method: .head)
                .responseString{ value in
                    print(value.result)
                }
        } label: {
            Text("요청")
        }

    }
}

#Preview {
    AlamofireTestView()
}
