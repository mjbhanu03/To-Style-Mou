const express = require("express");
const router = express.Router();
const { signup, setProfile, signin, forgotPassword, validateOtp, updatePassword, logout } = require("../../Models/v1/auth.models");
const { checkApiKey, validateJoi, checkToken } = require("../../Utils/middleware");
const joi = require("joi");

// Sign up
router.post(
  "/signup",
  checkApiKey,
  validateJoi(
    joi.object({
      email: joi.string().email().required(),
      password: joi.string().required(),
      username: joi.string().required(),
      phone: joi.string().required(),
    }),
  ),
  signup,
);

// Set Profile
router.post(
  "/setProfile",
  checkApiKey,
  validateJoi(
    joi.object({
      fullName: joi.string().required(),
      dob: joi.date().required(),
      user_id: joi.number().required(),
      device_token: joi.string().required(),
      device_type: joi.string().required(),
      device_name: joi.string().required(),
      device_model: joi.string().required(),
      os_version: joi.string().required(),
      uuid: joi.string().required(),
      ip: joi.string().required(),
    }),
  ),
  setProfile,
);

// Sign In
router.post("/signin", validateJoi(
  joi.object({
    username: joi.string().required(),
    password: joi.string().required(),
    device_token: joi.string().required(),
    device_type: joi.string().required(),
    device_name: joi.string().required(),
    device_model: joi.string().required(),
    os_version: joi.string().required(),
    uuid: joi.string().required(),
    ip: joi.string().required()
  })
), checkApiKey, signin);

// Forgot Password
router.post("/forgotPassword", validateJoi(
  joi.object({
    field: joi.string().required()
  })
), forgotPassword)

// Validate OTP
router.post("/validateOtp", validateJoi(
  joi.object({
    field: joi.string().required(),
    value: joi.number().required()
  })
), validateOtp)

// Update Password
router.post("/updatePassword", checkApiKey, validateJoi(
joi.object({
  password: joi.string().required(),
  user_id: joi.number().required()
})
), updatePassword);

router.post("/logout", checkApiKey, checkToken, logout);

module.exports = router;
