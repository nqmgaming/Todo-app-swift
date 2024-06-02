//
//  AddView.swift
//  TodoList
//
//  Created by Nguyen Quang Minh on 2/6/24.
//

import SwiftUI

struct AddView: View {

    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textField: String = ""

    @State var alertTitle: String = ""
    @State var showAlert: Bool = false

    var body: some View {
        ScrollView{
            VStack {
                TextField("Type something here....", text: $textField)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
                Button(action: saveButtonPress, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }.padding(14)
        }.navigationTitle("Add an item 📝")
            .alert(isPresented: $showAlert, content: {
                getAlertTitle()
            })
    }

    func saveButtonPress(){
        if validate() {
            listViewModel.addItem(title: textField)
            presentationMode.wrappedValue.dismiss()
        }else{

        }

    }

    func validate() -> Bool {
        if textField.count < 3 {
            alertTitle = "Title must be at least 3 characters long"
            showAlert.toggle()
            return false
        }
        // if everything is fine
        return true
    }

    func getAlertTitle() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView{
        AddView()
    }.environmentObject(ListViewModel())
}
