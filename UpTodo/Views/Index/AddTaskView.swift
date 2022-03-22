//
//  AddTaskView.swift
//  UpTodo
//
//  Created by Parinthon Puksuriwong on 21/3/2565 BE.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss

    @State private var title = ""
    @State private var description = ""
    @State private var date = Date()
    @State private var selectedCategory = "Work"
    @State private var selectedPriority = 0

    var categories = ["Work", "University", "Home", "Grocery", "Sport", "Social", "Movie", "Music", "Health",]

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var priority = ["Low", "Medium", "High"]

    init(){
        UITextView.appearance().backgroundColor = .clear
    }
    var body: some View {
        ZStack{
            Color("SecondaryColor")
                .ignoresSafeArea()

            ScrollView{
                VStack(alignment: .leading){

                    //MARK: Task Title
                    Text("Add Task")
                        .font(.title2)
                        .foregroundColor(.white)

                    TextField("", text: $title)
                        .foregroundColor(.white)
                        .font(Font.system(size: 18))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 5).stroke(.white))

                        .foregroundColor(.white)
                        .placeholder(when: title.isEmpty) {
                            Text("Enter your task here.").foregroundColor(.gray)
                        }
                        .padding(.bottom)

                    //MARK: Task Description
                    Text("Description")

                        .foregroundColor(.white)

                    TextEditor(text: $description)
                        .foregroundColor(.white)
                        .font(Font.system(size: 18))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 5).stroke(.white))

                        .foregroundColor(.white)
                        .placeholder(when: description.isEmpty) {
                            Text("Enter your Description here.").foregroundColor(.gray)
                            Spacer()
                        }

                    //MARK: Task DueDate
                    DatePicker("Due Date", selection: $date)
                        .colorScheme(.dark)
                        .padding(.vertical)

                    //MARK: Task Category
                    HStack{
                        Text("Task Category")
                            .foregroundColor(.white)
                        Spacer()
                        Picker("Select the Category", selection: $selectedCategory) {
                            ForEach(categories, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.menu)
                        Spacer()
                    }

                    //MARK: Task Priority
                    HStack{
                        Text("Piority")
                            .foregroundColor(.white)
                        Spacer()
                        Picker("Select the Priority", selection: $selectedPriority) {
                            ForEach(0...2, id: \.self) {
                                Text(priority[$0])
                            }
                        }
                        .pickerStyle(.menu)
                        Spacer()
                    }

                    //MARK: Save
                        Button("SAVE"){
                            let newTask = Task(context: moc)
                            newTask.id = UUID()
                            newTask.taskTitle = title
                            newTask.taskDescription = description
                            newTask.duedate = date
                            newTask.category = selectedCategory
                            newTask.priority = Int16(selectedPriority)

                            try? moc.save()
                            dismiss()
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))

                }//: VStack
                .padding()
            }
        }//: ZStack
    }

}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

            ZStack(alignment: alignment) {
                VStack{
                    placeholder().opacity(shouldShow ? 1 : 0)
                        .padding()

                }
                self
            }
        }
}

