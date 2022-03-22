//
//  IndexView.swift
//  UpTodo
//
//  Created by Parinthon Puksuriwong on 21/3/2565 BE.
//

import SwiftUI


struct IndexView: View {
    @Environment(\.managedObjectContext) var moc

    //:fetch task that still not pass duedate and sort by duedate
    @FetchRequest(sortDescriptors: [SortDescriptor(\.duedate)],
                  predicate: NSPredicate(format: "duedate >= %@",Calendar.current.startOfDay(for: Date()) as CVarArg)
    ) var tasks: FetchedResults<Task>

    @FetchRequest(sortDescriptors: [SortDescriptor(\.priority, order: .reverse),SortDescriptor(\.duedate)],
                  predicate: NSPredicate(format: "duedate >= %@",Calendar.current.startOfDay(for: Date()) as CVarArg)
    ) var tasksByPriority: FetchedResults<Task>


    @State private var showingPopover = false
    @State private var sortByPriority = false

    var body: some View {
        ZStack {
            Color("BgColor")
                .ignoresSafeArea()
            GeometryReader{ geometry in
                VStack{
                    HStack{
                        Image(systemName: "line.3.horizontal.decrease")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding()
                            .onTapGesture{
                                sortByPriority.toggle()
                                print(sortByPriority)
                            }
                        Spacer()
                        Text("Index")
                            .font(.title2)
                            .foregroundColor(.white)

                        Spacer()
                        Image(systemName: "plus")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding()
                            .onTapGesture {
                                showingPopover = true
                            }
                            .popover(isPresented: $showingPopover) {
                                AddTaskView()
                            }

                    }//: HStack

                    sortByPriority ? Text("Sort by Priority")
                        .foregroundColor(.white)
                        .font(.title2)
                    : Text("Sort by Due Date")
                        .foregroundColor(.white)
                        .font(.title2)
                    List{
                        if !sortByPriority { ForEach(headers, id: \.self) { header in
                            Section(header: Text(header, style: .date)) {

                                ForEach(groupedByDate[header]!){ task in
                                    HStack{
                                        VStack(alignment: .leading){
                                            Text(task.taskTitle ?? "Unknown Title")
                                                .font(.headline)

                                            HStack{
                                                if (Calendar.current.isDateInToday(task.duedate!)){
                                                    Text("Today at \(task.duedate ?? Date(), style: .time)")
                                                        .foregroundColor(.secondary)
                                                }else if (Calendar.current.isDateInTomorrow(task.duedate!)){
                                                    Text("Tomorrow at \(task.duedate ?? Date(), style: .time)")
                                                        .foregroundColor(.secondary)
                                                }
                                                else{
                                                    Text("\(task.duedate ?? Date(), style: .date) at \(task.duedate ?? Date(), style: .time)")
                                                        .foregroundColor(.secondary)
                                                }
                                            }//:HStack
                                        }
                                    }//:HStack
                                }
                                .onDelete(perform: deleteTask)
                            }
                        }
                        } else{
                            ForEach(headersPrio, id: \.self) { header in
                                Section(header: Text(header, style: .date)) {

                                    ForEach(groupedByDatePrio[header]!){ task in
                                        HStack{
                                            VStack(alignment: .leading){
                                                Text(task.taskTitle ?? "Unknown Title")
                                                    .font(.headline)

                                                HStack{
                                                    if (Calendar.current.isDateInToday(task.duedate!)){
                                                        Text("Today at \(task.duedate ?? Date(), style: .time)")
                                                            .foregroundColor(.secondary)
                                                    }else if (Calendar.current.isDateInTomorrow(task.duedate!)){
                                                        Text("Tomorrow at \(task.duedate ?? Date(), style: .time)")
                                                            .foregroundColor(.secondary)
                                                    }
                                                    else{
                                                        Text("\(task.duedate ?? Date(), style: .date) at \(task.duedate ?? Date(), style: .time)")
                                                            .foregroundColor(.secondary)
                                                    }
                                                }//:HStack
                                            }
                                        }//:HStack
                                    }
                                    .onDelete(perform: deleteTask)
                                }
                            }
                        }
                    }//: List
                }//: VStack
            }//: GeometryReader
        }//: ZStack
    }

    init(){
        UITableView.appearance().backgroundColor = UIColor.clear

    }
    

    func deleteTask(at offsets: IndexSet){
        for offset in offsets{
            let task = tasks[offset]
            moc.delete(task)
        }
        //        try? moc.save()
    }

    //: function to find the start of day
    func startOfDay(date: Date)-> Date { Calendar.current.startOfDay(for: date) }

    //: group task by using date
    //: can't use Date because it also contains time
    var groupedByDate: [Date: [Task]] {
        Dictionary(grouping: tasks, by: {startOfDay(date: $0.duedate!)})
    }

    var groupedByDatePrio: [Date: [Task]] {
        Dictionary(grouping: tasksByPriority, by: {startOfDay(date: $0.duedate!)})
    }

    //: generate header by start of day
    var headers: [Date] {
        groupedByDate.map({ $0.key }).sorted()
    }

    var headersPrio: [Date] {
        groupedByDatePrio.map({ $0.key }).sorted()
    }


}

extension Date {
    var day: Int { Calendar.current.dateComponents([.day], from: self).day ?? 0 }
}

struct IndexView_Previews: PreviewProvider {
    static var previews: some View {
        IndexView()
    }
}
