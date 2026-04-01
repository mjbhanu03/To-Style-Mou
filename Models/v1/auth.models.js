const md5 = require("md5")
const  conn = require("../../Config/db")
const common = require("../../Utils/common")
const {sendResponse} = require("../../Utils/middleware")

// Sign up
const signup = async (req, res) =>{
  const username=req.body.username
  const email=req.body.email
  const phone=req.body.phone
  const password=md5(req.body.password)

  
  try {
  const [user] = await conn.query('select * from tbl_user where email=? or username=? or phone=?', [email, username, phone])
  
        if(user.length > 0) {
        
        if(username === user[0].username){
          return sendResponse(req, res, 422, 0, 'Username is already existed', {})
        }else if(email === user[0].email){ 
          return sendResponse(req, res, 422, 0, 'Email is already existed', {})
        }else if(phone === user[0].phone){
          return sendResponse(req, res, 422, 0, 'Phone is already existed', {})
        }
  
      }else{
                await conn.query("Insert into tbl_user (username, email, phone, password) values (?,?,?,?)", [username, email, phone, password])
                    
                return sendResponse(req, res, 200, 4, 'Profile setup pending', {})

      }

} catch (error) {
  console.log(error)
  return sendResponse(req, res, 500, 0, "Internal server error", {})
}
}

// Set Profile
const setProfile = async (req, res)=>{
try {
    const fullname = req.body.fullName
    const dob = req.body.dob
    const device_token = req.body.device_token
    const device_type = req.body.device_type
    const device_name = req.body.device_name
    const device_model = req.body.device_model
    const os_version = req.body.os_version
    const uuid = req.body.uuid
    const ip = req.body.ip

    const user_id = req.body.user_id

    console.log(user_id, fullname, dob)
    const [query] = await conn.query('update tbl_user set full_name=?, dob=?, steps=2 where user_id=?', [fullname, dob, user_id])

    console.log(query)
    if(query.affectedRows > 0){

      const token = await generateToken(user_id, device_token,device_type,device_name,device_model,os_version,uuid,ip)

      const user = common.getUser(user_id)
      return sendResponse(req, res, 200, 1, 'Sign Up, Successfully!', {user:user, token:token})
    } 
      else{
        return sendResponse(req, res, 200, 3, 'User not found', {})
      }
  
} catch (error) {
      console.log(error)
      return sendResponse(req, res, 404, 0, error, {})
}
}

// Generate Token
const generateToken = async(user_id, device_token, device_type, device_name, device_model, os_version, uuid, ip) =>{
          const user = await common.getUser(user_id)
          const token = await common.jwt_sign({
          'user_id':user_id,
          'username': user.username,
          'phone': user.phone,
          'email': user.email
        })

        await conn.query('insert into tbl_user_device (user_id, device_token, device_type, device_name, device_model, os_version, uuid, ip, token) values (?, ?, ?, ?, ?, ?, ?, ?, ?)', [user_id, device_token, device_type, device_name, device_model, os_version, uuid, ip, token])
        
        return token
}

// Sign In
const signin = async (req, res)=>{
  try {
    
    const username = req.body.username
    const password = md5(req.body.password)
    const device_token = req.body.device_token
   const device_type = req.body.device_type
   const device_name = req.body.device_name
   const device_model = req.body.device_model
   const os_version = req.body.os_version
   const uuid = req.body.uuid
   const ip = req.body.ip

      // console.log(username, password)
            const [[result]] = await conn.query('select * from tbl_user where username=? and is_active!=2', [username, password])
              
            
// Set response as per is_active
// is_active 0 should be allow to signin again and its status change to 1 again   
              console.log(result.is_active)
              if(result){
            if(result.is_active === 0){
              console.log('Yes, i am updated')
              await conn.query('update tbl_user set is_active=1 where user_id=?', result.user_id)
            }
            if(result.password !== password){
              sendResponse(req, res, 200, 1, 'Invalid Password!', {data: result})
            }
            if(result.steps === 1){
              sendResponse(req, res, 200, 4, 'Please, Set up your profile.', {data: result})
            }

          const token = await generateToken(result.user_id, device_token,device_type,device_name,device_model,os_version,uuid,ip)
              sendResponse(req, res, 200, 1, 'Log In, Successfully!', {data: result, token:token})
            }
              
else{
  return sendResponse(req, res, 200, 3, "Invalid Username!", {})
}
  
  } catch (error) {
    console.log(error)
              return sendResponse(req, res, 500, 0, 'Internal Server Error', error)
  
}
}

// Forgot Password
const forgotPassword =async (req, res)=>{
  try {
    const field = req.body.field

    const user = common.getUser(field)

    if(!user) return sendResponse(req, res, 200, 3, "User not found", {})
    else{
  console.log(user.phone)
      await otp(req, res, user.phone)

    }
  } catch (error) {
    console.log(error)
    return sendResponse(req, res, 500, 0, "Internal server error", {})
  }
}

// OTP
const otp = async (req, res, field=null) =>{
  try {
    if(req.body && req.body.field){
      field = req.body.field
    }
    const currentTime = new Date()
    const user = await common.getUser(field)
    console.log(user)

    if(!user){
      return sendResponse(req, res, 200, 0, "User not found", {})  
    }
    const value = Math.floor(1000 + Math.random() * 9000);

    const [rows] = await conn.query("select * from tbl_otp where user_id=?", [user.user_id])

    const checkOTP = rows[0]

    if(checkOTP){
      const timeDifference = (currentTime - new Date(checkOTP.updated_at)) / 1000; 
    if(timeDifference > 30){

      const [query] = await conn.query("update tbl_otp set value=? where user_id=?", [value, user.user_id])
      
      if(query.affectedRows > 0){
          return sendResponse(req, res, 200, 1, 'OTP, Resend Successfully', {})     
      }else{
        return sendResponse(req, res, 200, 0, 'User not found!', {})      
      }
    }else{
        return sendResponse(req, res, 200, 0, 'Please, hold for 30 seconds to regenerate OTP!', {})      
    }
  }else{
    console.log(user.user_id)
    const [query] = await conn.query("Insert into tbl_otp (user_id, value, phone) values (?, ?, ?)", [user.user_id, value, user.phone])
    console.log(query)
          if(query.affectedRows > 0){

              return sendResponse(req, res, 200, 1, 'OTP, Sent Successfully', {})      

      }else{
        return sendResponse(req, res, 200, 0, 'User, not found!', {})      
      }
  }

} catch (error) {
  if(error){
    console.log(error)
              return sendResponse(req, res, 500, 0, 'Internal Server Error', error)
  }
  }
}

// Validate OTP
const validateOtp = async (req, res)=>{
try {
    const otp = req.body.value
    const field = req.body.field

    const [query] = await conn.query('select * from tbl_otp where phone=?', [field])

      if(query[0]){

        if(query[0].value!==otp){
          return sendResponse(req, res, 200, 0, 'Invalid OTP', {})
        }

        console.log(query[0])
        const updatedAt = new Date(query[0].updated_at);
        const now = new Date();

        const diffMs = now - updatedAt; 
        const diffMinutes = diffMs / (1000 * 60);
        if (diffMinutes <= 10) {

              await conn.query('delete from tbl_otp where value=? and (phone=? or email=?)',[otp, field, field])

          return sendResponse(req, res, 200, 1, 'OTP Validate, Successfully!', {})
        } 
        else {
          return sendResponse(req, res, 200, 0, 'OTP is Expired.', {})
}
      } else {
        return sendResponse(req, res, 404, 0, 'OTP Not Found', {})
      }

    } catch (error) {
  return sendResponse(req, res, 404, '0', error, {})
}
}

// Update password
const updatePassword = async (req, res)=>{
   try {
   const password = md5(req.body.password)
   const user_id = req.body.user_id

    const query = await conn.query('update tbl_user set password=? where user_id=?', [password, user_id])
    if(query[0].affectedRows > 0){
    return sendResponse(req, res, 200, 1, 'Password changed successfully', {})
  }else{
      return sendResponse(req, res, 200, 3, 'User not found', {})
    }

   }catch(error){
    console.log(error)
    return sendResponse(req, res, 500, 0, error, {})
   }
}

// Logut
const logout = async (req, res)=>{
  const token = req.headers['token']
try {
  
        const query = await conn.query('update tbl_user_device set is_active=0 where token=?', [token])
      if(query[0].affectedRows > 0){
             return sendResponse(req, res, 200, 1, 'Logged out', {})
            }else{
        return sendResponse(req, res, 200, 0, 'User not found', {})
      }
      
    } catch (error) {
      console.log(error)
      return sendResponse(req, res, 500, 0, "Internal Server Error", error)
} 
}

module.exports = {signup, setProfile, generateToken, signin, forgotPassword, otp, validateOtp, updatePassword, logout}