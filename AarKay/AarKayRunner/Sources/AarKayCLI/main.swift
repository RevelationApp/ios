import Foundation
import AarKay

let url = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)

let options = AarKayOptions(
    force: CommandLine.arguments.contains("--force"),
    verbose: CommandLine.arguments.contains("--verbose")
)
AarKay(url: url, options: options).bootstrap()