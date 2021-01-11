//
//  ContentView.swift
//  SwiftUIDeviceTraitStatus
//
//  Created by okudera on 2021/01/11.
//

import SwiftUI

struct ContentView: View {

    @Environment(\.horizontalSizeClass) var hSizeClass
    @Environment(\.verticalSizeClass) var vSizeClass
    
    var body: some View {
        VStack {
            let deviceTraitStatus = DeviceTraitStatus(hSizeClass: self.hSizeClass, vSizeClass: self.vSizeClass)
            switch deviceTraitStatus {
            case .wRhR, .wChR:
                self.buttonsOnPortrait
            case .wRhC, .wChC:
                self.buttonsOnLandscape
            }

            Spacer()

            Image("enel")
                .resizable()
                .frame(minWidth: 200, minHeight: 200)
                .aspectRatio(contentMode: .fit)

            Spacer()

            self.roundedButton(title: "ぼとむぼたん", backgroundColor: .orange) {
                print("ぼとむぼたんタップ！")
            }
            .padding([.top], 0)
            .padding([.leading, .bottom, .trailing], 32.0)
        }
    }
}

private extension ContentView {

    var button1: some View {
        self.roundedButton(title: "ぼたん1", backgroundColor: .red) {
            print("ぼたん1タップ！")
        }
    }

    var button2: some View {
        self.roundedButton(title: "ぼたん2", backgroundColor: .yellow) {
            print("ぼたん2タップ！")
        }
    }

    var button3: some View {
        self.roundedButton(title: "ぼたん3", backgroundColor: .blue) {
            print("ぼたん3タップ！")
        }
    }

    /// iPhoneの縦表示またはiPadの場合のボタン3つのレイアウト
    ///
    /// - Note: iPadの場合は、縦横ともに画面に収まるのでレイアウト変えない。
    var buttonsOnPortrait: some View {
        VStack(alignment: .center, spacing: 16.0, content: {
            self.button1
            self.button2
            self.button3
        })
        .padding([.top], 16.0)
        .padding([.leading, .trailing], 32.0)
    }

    /// iPhoneの横表示の場合のボタン3つのレイアウト
    var buttonsOnLandscape: some View {
        VStack {
            HStack {
                self.button1
                Spacer()
                self.button2

            }
            .padding([.leading, .trailing], 32.0)
            .padding([.bottom], 4.0)

            self.button3
        }
        .padding([.top], 16.0)
    }

    /// 角丸のボタン
    func roundedButton(title: String, textColor: Color = .white, backgroundColor: Color,  action: @escaping() -> Void) -> some View {
        Button(action: {
            action()
        }, label: {
            Text(title)
                .frame(maxWidth: 440.0, minHeight: 44.0)
                .font(Font.subheadline.weight(.bold))
                .foregroundColor(textColor)
                .background(backgroundColor)
                .cornerRadius(8.0)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
