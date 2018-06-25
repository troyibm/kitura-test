import Kitura

// Create a new router
let router = Router()

router.all("/", middleware: StaticFileServer(path: "./"))

// Handle HTTP GET requests to /
router.get("/") { request, response, next in
    do {
        try response.send(fileName: "demo.html")
    } catch let error {
        print(error.localizedDescription)
    }
    next()
}

// Add an HTTP server and connect it to the router
Kitura.addHTTPServer(onPort: 8080, with: router)

// Start the Kitura runloop (this call never returns)
Kitura.run()

