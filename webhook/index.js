// A simple Express-based HTTP server that can be used
// as a webhook endpoint.

// Require express and body-parser
const express = require("express")
const bodyParser = require("body-parser")

// Initialize express and define a port
const app = express()
const PORT = process.env.PORT || 8080

// Tell express to use body-parser's JSON parsing
app.use(bodyParser.text({type: '*/*'}))

// Basically accept GET requests to any path, logging
// what the path was.
app.get('/*', (req, res) => {
  console.log('☞', req.path)
  res.send('Hey, this is a webhook - send a POST!')
})

// Also accept POST requests to any path, and log out
// what the path was, and also the JSON body if any.
app.post('/*', (req, res) => {
  console.log('☞', req.path)
  console.log('☞', req.body)
  res.status(200).end()
})

// Start express on the defined port
app.listen(PORT, () => console.log(`🚀 Server running on port ${PORT}`))
