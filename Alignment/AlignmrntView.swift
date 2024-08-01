//
//  AlignmrntView.swift
//  TechnicalUI
//
//  Created by 유영웅 on 8/1/24.
//

import SwiftUI

struct AlignmrntView: View {
    var body: some View {
        return ZStack{
            Rectangle()
                .frame(width: 2)
            VStack{
                Group{
                    RoundedRectangle(cornerRadius: 20)
                        .alignmentGuide(HorizontalAlignment.center) { d in d[HorizontalAlignment.center] + 20
                            //센터 중간에서 왼쪽으로 + 20
                        }
                        .alignmentGuide(HorizontalAlignment.center){ d in
                            let explicit = d[explicit: HorizontalAlignment.center] ?? 0
                            print("explicit - \(explicit)")
                            return explicit
                        }
                    RoundedRectangle(cornerRadius: 20)
                        .alignmentGuide(HorizontalAlignment.center){ d in
                            let explicit = d[explicit: HorizontalAlignment.center] ?? 0
                            print("explicit - \(explicit)")
                            return explicit
                        }
                    RoundedRectangle(cornerRadius: 20)
                    RoundedRectangle(cornerRadius: 20)
                    RoundedRectangle(cornerRadius: 20)
                        .alignmentGuide(HorizontalAlignment.center, computeValue: { dimension in
                            20  //센터를 기준으로 잡고 왼쪽으로 - 20
                        })
                        .alignmentGuide(HorizontalAlignment.center){ d in
                            let explicit = d[explicit: HorizontalAlignment.center] ?? 0
                            print("explicit - \(explicit)")
                            return explicit
                        }
                }
                .frame(width: 100,height: 50)
                
            }
        }
    }
}

#Preview {
    AlignmrntView()
}
