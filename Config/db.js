const mysql = require('mysql2/promise')
const env = require('dotenv')
env.config()
const pool = mysql.createPool({
localhost: process.env.DB_HOST,
user: process.env.DB_USER,
password:process.env.DB_PASSWORD,
database: process.env.DB_DATABASE
})

module.exports=pool