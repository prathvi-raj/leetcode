import Foundation

class Helper {
     static func shellOptinal(launchPath path: String, arguments args: [String]) -> String? {
        var output: String? = nil
         let task = Process()
         task.launchPath = path
         task.arguments = args

         let pipe = Pipe()
         task.standardOutput = pipe
         task.standardError = pipe
         task.launch()

         let data = pipe.fileHandleForReading.readDataToEndOfFile()
         output = String(data: data, encoding: .utf8)
         task.waitUntilExit()

        return(output)
    }
}

for i in 1...10000 {
   let output = Helper.shellOptinal(launchPath: "/bin/ls", arguments: ["."])
   print("\(i). output")
   print(output ?? "")
}
