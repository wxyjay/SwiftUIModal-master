//
//  ContentView.swift
//  SwiftUIModal

import SwiftUI

@available(iOS 14.0, *)
struct ContentView: View {
    
    @EnvironmentObject var modalManager: ModalManager
  @State private var isShow: Bool = false
    var body: some View {
        return ZStack {
            ForEach($modalManager.modals) { modal in
                ModalView(currentModal: modal).environmentObject(self.modalManager)
            }

          VStack {
            HStack{
              Spacer()
              Button("System Sheet") {
                self.isShow.toggle()
              }
              .padding(50)
            }
            Spacer()
          }
        }
        .onAppear(perform: {self.modalManager.fetchContent()})
        .ignoresSafeArea()
        .sheet(isPresented: $isShow) {
          VStack{
            Text("System Sheet")
          }
        }
    }
}
