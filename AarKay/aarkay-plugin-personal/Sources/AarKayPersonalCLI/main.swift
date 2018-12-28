import Foundation
import AarKay

let options = AarKayOptions(force: true, verbose: true)

var url = URL(fileURLWithPath: #file)
    .deletingLastPathComponent()
    .deletingLastPathComponent()
    .deletingLastPathComponent()

AarKay(url: url, options: options).bootstrap()

url = URL(fileURLWithPath: #file)
    .deletingLastPathComponent()
    .deletingLastPathComponent()
    .deletingLastPathComponent()
    .deletingLastPathComponent()
    .deletingLastPathComponent()

AarKay(url: url, options: options).bootstrap()
