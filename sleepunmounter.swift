import Swift
import NotificationCenter

class SleepUnmounter {
    var path: String
    init(path: String) {
        self.path = path
        NSWorkspace.shared.notificationCenter.addObserver(self,
                                               selector: #selector(self.unmountDisk(notification:)),
                                               name: Notification.Name("NSWorkspaceWillSleepNotification"),
                                               object: nil)
    }

    deinit {
        NSWorkspace.shared.notificationCenter.removeObserver(self)
    }

    @objc func unmountDisk(notification: Notification) {
        if(0 > unmount(self.path, MNT_FORCE)) {
            perror("unmount")
        }
    }

    func run() {
        RunLoop.main.run()
    }
}

if CommandLine.arguments.count != 2 {
    print("Usage: ", CommandLine.arguments[0], " <path>")
} else {
    let path = CommandLine.arguments[1]
    SleepUnmounter(path: path).run()
}
