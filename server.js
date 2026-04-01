const express = require('express')
const env = require('dotenv')
const auth = require('./Routes/v1/auth.routes')
const post = require('./Routes/v1/post.routes')
const  conn  = require('./Config/db')
env.config()
const app = express()
app.use(express.json())

app.use('/auth/v1', auth)
app.use('/posts/v1', post)

try {
  app.listen(process.env.PORT)
  console.log("Server is running on port: ", process.env.PORT)
  // console.log(process.env.PORT)
} catch (error) {
  console.log("Server Error: ", error)
}