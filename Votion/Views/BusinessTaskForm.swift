////
////  PersonalTaskForm.swift
////  Votion
////
////  Created by Sam Dillard on 7/5/23.
////
//
import SwiftUI

struct BusinessTaskForm: View {

    @State private var isDatePickerShown: Bool = false
    @State private var selectedDateString: String = ""
    
    @State private var input = TaskInput(
        taskName: "",
        startDate: Date(),
        description: ""
    )
    
    @AppStorage("notiontoken") var notiontoken: String?
    @AppStorage("databaseid") var databaseID: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Spacer()
                VStack {
                    Image(systemName: "laptopcomputer.and.iphone")
                        .padding(.bottom, 10)
                    Text("Create Business Task")
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.bottom, 100)
                .font(.largeTitle)
                Spacer()
            }
            Text("Task name")
                .font(.headline)
            TextField("Enter task name", text: $input.taskName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text("Start date")
                .font(.headline)
            TextField("Select start date", text: $selectedDateString, onEditingChanged: { isEditing in
                if isEditing {
                    isDatePickerShown = true
                }
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .onTapGesture {
                isDatePickerShown = true
            }
            .padding(.bottom, 8)
            Text("Description")
                .font(.headline)
            TextEditor(text: $input.description)
                .frame(height: 80)
                .border(Color.gray, width: 1)
            HStack {
                Spacer()
                SubmitButton(action: {
                    guard let key = notiontoken,
                          let dbID = databaseID else {
                        return
                    }
                    createPageInNotion(databaseID: dbID, apiKey: key, data: input)
                })
                Spacer()
            }
        }
        .foregroundColor(.black)
        .padding()
        .overlay(
            Group {
                if isDatePickerShown {
                    Color.black.opacity(0.3)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            isDatePickerShown = false
                        }
                    
                    VStack {
                        Spacer()
                        
                        DatePicker("", selection: Binding(
                            get: {
                                return input.startDate
                            },
                            set: { date in
                                input.startDate = date
                                let formatter = DateFormatter()
                                formatter.dateStyle = .medium
                                selectedDateString = formatter.string(from: date)
                                
                            }
                        ), displayedComponents: .date)
                        .datePickerStyle(WheelDatePickerStyle())
                        .labelsHidden()
                        .background(Color.white)
                        .cornerRadius(8)
                        .padding()
                    }
                }
            }
        )
    }
}

struct BusinessTaskForm_Previews: PreviewProvider {
    static var previews: some View {
        BusinessTaskForm()
    }
}

