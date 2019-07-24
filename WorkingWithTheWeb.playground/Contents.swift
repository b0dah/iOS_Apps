import Cocoa

let url = URL(string: "https://www.apple.com")!
//let nasaUrl = URL(string: "https://api.nasa.gov/planetary/apod?")

print(url.host)

let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    if let data = data {
        let stringData = String(data: data, encoding: .utf8)
        print(stringData)
    }
}

task.resume()
