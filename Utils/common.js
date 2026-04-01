const conn = require('../Config/db')
const jwt = require('jsonwebtoken');

const common = {
  getUser:async (field)=>{
    const [[user]] = await conn.query('select * from tbl_user where email=? or phone=? or user_id=? or username=? and is_active=1', [field, field, field, field])
    return user
  },

  fetchCategories:async () =>{
  let categoryListingQuery = `select * from tbl_category where is_active=1`
  const [categoryListing] = await conn.query(categoryListingQuery)
  return categoryListing
  },

  getPost:async (id) =>{
  let categoryListingQuery = `select * from tbl_post where is_active=1 and post_id=?`
  const [categoryListing] = await conn.query(categoryListingQuery, [id])
  return categoryListing
  },
  
  jwt_sign:(data, expiresIn='365days') => {
    
    const token = jwt.sign(data, process.env.JWT_WEB_TOKEN, {expiresIn});

    return token
  },
}

module.exports = common