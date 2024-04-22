//Marim Abbas
//CSCI 3210
//Project 2
//Dr Dong
// 17 April 2024

//let immutable used to declare constants 
//self-instence of class
//var- for mutable variables
//?-optional variable

import Foundation
// foundation is kind of similar to c++ libraries 

//define student class to store student information
class Student {
  var id:String
 var cla: Int
  var quiz: Int
  var exam: Int
  var ola: Int
  var finalExam: Int
  var total: Int
  private var totalPoints: Int
  private var letterGrade: String
  
//initalizes student Object with scores to calcualte total points and letter grade
  init(id:String, cla: Int, ola: Int, quiz: Int, exam: Int, finalExam: Int)
  {
    self.id=id
    self.cla=cla
    self.ola=ola
    self.quiz=quiz
    self.exam=exam
    self.finalExam=finalExam
    self.totalPoints=cla + ola + quiz + exam + finalExam
    self.total=totalPoints
    self.letterGrade=""
    self.letterGrade=calculateLetterGrade()
    
  }

  //functions to obtain cla, ola, quiz, exam, and final exam
  func getCla()->Int 
  {
    return cla
  }

  func getOla()->Int
  {
    return ola
  }

  func getQuiz()->Int
  {
    return quiz
  }

  func getExam()->Int
  {
    return exam
  }

  func getFinalExam()->Int
  {
    return finalExam
  }

  func printStudentInfo() 
  {
    print("\(id)\t\(cla)\t\(ola)\t\(quiz)\t\(exam)\t\(finalExam)\t\(letterGrade)")
  }

  //function that determines letter grade
private func calculateLetterGrade()->String
  {
    let total=Double(totalPoints)
    switch total
    {
      case ..<60:
      return "F"

      case 60..<63:
      return "D-"

      case 63..<67:
      return "D"

      case 67..<70:
      return "D+"

      case 70..<73:
      return "C-"

      case 73..<77:
      return "C"

      case 77..<80:
      return "C+"

      case 80..<83:
      return "B-"

      case 83..<87:
      return "B"

      case 87..<90:
      return "B+"

      case 90...:
      return "A"

      default:
      return "Not valid"
    }
    
    
  }
  
  
}

//Define Roster class to store student objects
class Roster 
{
  //dictionary to store student id
  private var students:[String: Student]=[:] 

  //function that adds new student to roster
  func addStudent(id: String, cla: Int, ola: Int, quiz: Int, exam: Int, finalExam: Int)
  {
    let newStudent=Student(id: id, cla: cla, ola: ola, quiz: quiz, exam: exam, finalExam: finalExam)
    
    students[id]=newStudent
  }

  //retrieve student by ID
  func getStudentID(id: String)->Student?
  {
    let trimmedID=id.trimmingCharacters(in: .whitespacesAndNewlines)
    return students[trimmedID]
  }

  //prints all the students out onto the roster
  func printAllStudents()
  {
    print("C#\t\tCLA\tOLA\tQuiz\tExam\tFinalExam\tLetterGrade")
    //for loop in swift
    for (_, student) in students
    {
      student.printStudentInfo()
    }
    
  }

  //function that calcualtes averages
  func calculateAverages()->(cla:Double, ola: Double, quiz: Double, exam: Double, finalExam: Double)
  {
    var claTotal=0.0
    var olaTotal=0.0
    var quizTotal=0.0
    var examTotal=0.0
    var finalExamTotal=0.0

    for(_,student) in students
    {
      claTotal+=Double(student.cla)
      olaTotal+=Double(student.ola)
      quizTotal+=Double(student.quiz)
      examTotal+=Double(student.exam)
      finalExamTotal+=Double(student.finalExam)
    }

    let count=Double(students.count)
    let claAvg=claTotal/count
    let olaAvg=olaTotal/count
    let quizAvg=quizTotal/count
    let examAvg=examTotal/count
    let finalExamAvg=finalExamTotal/count

    return(claAvg, olaAvg, quizAvg, examAvg, finalExamAvg)
    
  }

  //prints out averages
  func printAverages()
  {
    let averages=calculateAverages()
    print("\nAverage\t\(String(format: "%.2f", averages.cla))\t\(String(format: "%.2f", averages.ola))\t\(String(format: "%.2f", averages.quiz))\t\(String(format: "%.2f", averages.exam))\t\(String(format: "%.2f", averages.finalExam))")
  }

  //function that prints out highest scores
  func printHighestScores()
  {
    var maxCla=0
    var maxOla=0
    var maxQuiz=0
    var maxExam=0
    var maxFinalExam=0

    for(_, student) in students
    {
      maxCla=max(maxCla, student.cla)
      maxOla=max(maxOla,student.ola)
      maxQuiz=max(maxQuiz,student.quiz)
      maxExam=max(maxExam, student.exam)
      maxFinalExam=max(maxFinalExam, student.finalExam)        
    }

    print ("\nHighest\t\(maxCla)\t\(maxOla)\t\(maxQuiz)\t\(maxExam)\t\(maxFinalExam)")
    
  }
  
}

//the main function to bring it all together
func main()
{
  let roster=Roster()

  //read student records from the file
  let fileURL="scores.dat"
  
//do while loop to read through the file
  do {
    let data=try String(contentsOfFile: fileURL)
    let lines=data.components(separatedBy:.newlines)
    for line in lines
    {
      let components=line.components(separatedBy:.whitespaces).filter{!$0.isEmpty}
    
      if components.count==6
      {
        let id=components[0]
        let cla=Int(components[1]) ?? 0
        let ola=Int(components[2]) ?? 0
        let quiz=Int(components[3]) ?? 0
        let exam=Int(components[4]) ?? 0
        let finalExam=Int(components[5]) ?? 0
        roster.addStudent(id: id, cla: cla, ola: ola, quiz: quiz, exam: exam, finalExam: finalExam)
      }
      }
  } catch {
  print("Error reading file:", error.localizedDescription)
  return
}

  print("Enter C# to query: ")
  let query1=readLine() ?? ""
  if let student1=roster.getStudentID(id: query1.trimmingCharacters(in:.whitespacesAndNewlines))
  {
    print("Query result:")
    student1.printStudentInfo()
  }
  else
  {
    print("Student not found\n")
  }
  print("\nEnter another C# to query:")
  let query2=readLine() ?? ""
  if let student2=roster.getStudentID(id: query2.trimmingCharacters(in:.whitespacesAndNewlines))
  {
    print("Query result")
    student2.printStudentInfo()
  }
  else
  {
    print("Student not found\n")
  }

  //print all of the students information
  roster.printAllStudents()
  roster.printAverages()
  roster.printHighestScores()
  
} 

//calling main function 
main()

