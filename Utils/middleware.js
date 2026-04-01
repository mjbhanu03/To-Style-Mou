const env = require('dotenv')
const jwt = require('jsonwebtoken')
const conn = require('../Config/db')

env.config()


  // To Send Response
  const sendResponse = (req, res, statuscode, responsecode, message, responsedata)=>{
    let data = {code: responsecode, message: message, data: responsedata}
    res.status(statuscode)
    res.send(data)
  }

  // Check Api Key
  const checkApiKey = (req, res, next)=>{
try {
      if(req.headers['api-key']===process.env.API_KEY){
        next()
      }
} catch (error) {
  console.log(error)
  return sendResponse(req, res, 401, -1, 'API KEY Error', error)

}
  }
 
  // Validate Joi
  const validateJoi = (schema) => {
  return (req, res, next) => {
 
    if(!req.body) {
      return sendResponse(req, res, 422, '2', 'Body Missing', {})
    }
    const { error } = schema.validate(req.body, {
      abortEarly: false
    });
    if (error) {
 
      const errors = {};
 
      error.details.forEach(err => {
        errors[err.path[0]] = err.message.replace(/"/g, '');
      });
 
      return sendResponse(req, res, 422, '2',  errors,{});
    }
 
    next();
  };
}


const checkToken = async function (req, res, next) {
    try {
        req.loginUser = false;
        const token = req.headers['token'];
        if (!token) {
            return res.status(401).json({ message: "Token missing" });
        }

        const decoded = jwt.verify(token, process.env.JWT_WEB_TOKEN);
        const [device] = await conn.query(`SELECT user_id FROM tbl_user_device WHERE token = ? AND is_active = 1`, [token]);
        if (device.length === 0) {
            // return res.status(401).json({ message: "Invalid or logged out token" });
            return sendResponse(req, res, 401, -1, "Invalid or logged out token", {});
        }
          req.loginUser = decoded;
          next();
    
    }
    catch (error) {
      console.log(error)
        sendResponse(req, res, 401, -1, "Invalid or logged out token", {});
    }
};


module.exports = {sendResponse, validateJoi, checkApiKey, checkToken}
  