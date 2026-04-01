const express = require("express");
const router = express.Router();
const { checkApiKey, checkToken, validateJoi } = require("../../Utils/middleware");
const joi = require("joi");
const { fetchPosts, fetchCategories, fetchCategoriesPosts, fetchSinglePost, addRanking, addRating, addComent, savePost, reportPost, createPost, deletePost } = require("../../Models/v1/post.models");

// Fetch Posts with filter and category
router.get('/fetchPosts', checkApiKey, checkToken, fetchPosts)

// Fetch All Categories
router.get('/fetchCategories', checkApiKey, checkToken, fetchCategories)

// Fetch Specific Posts of Categories
router.post('/fetchCategoriesPosts', checkApiKey, checkToken, validateJoi(
  joi.object({
    category_id: joi.number().required()
  })
), fetchCategoriesPosts)

// Fetch Single Post
router.post('/fetchSinglePost', checkApiKey, checkToken, validateJoi(
  joi.object({
    post_id: joi.number().required()
  })
), fetchSinglePost)

// Add Ranking 
router.post('/addRanking', checkApiKey, checkToken, validateJoi(
  joi.object({
    media: joi.array().required()
  })
), addRanking)

// Add Rating
router.post('/addRating', checkApiKey, checkToken, validateJoi(
  joi.object({
    post_id: joi.number().required(),
    rating: joi.number().required().min(1).max(5)
  })
), addRating)

// Add Comment
router.post('/addComment', checkApiKey, checkToken, validateJoi(
  joi.object({
    post_id: joi.number().required(),
    comment: joi.string().required(),
  })), addComent)

// Save Post
router.post('/savePost', checkApiKey, checkToken, validateJoi(
  joi.object({
    post_id: joi.number().required(),
  })
), savePost)

// Report Post
router.post('/reportPost', checkApiKey, checkToken, validateJoi(
  joi.object({
    post_id: joi.number().required(),
    reason: joi.string().required(),
  })), reportPost)



// Create Post
router.post('/createPost', checkApiKey, checkToken, validateJoi(
  joi.object({
    description: joi.string().required(),
    post_type: joi.string().required(),
    category_id: joi.number().required(),
    expire_time: joi.date().optional(),
    visibility: joi.string().required(),
    media: joi.array().items(
      joi.object({
        media_type: joi.string().required(),
        media_url: joi.string().required()
      })
    ).required()
  })
), createPost)

// Delete Post
router.post('/deletePost', checkApiKey, checkToken, validateJoi(
  joi.object({
    post_id: joi.number().required()
  })
), deletePost)


module.exports = router