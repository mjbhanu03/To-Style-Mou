const md5 = require("md5")
const  conn = require("../../Config/db")
const common = require("../../Utils/common")
const {sendResponse} = require("../../Utils/middleware")
const { report, post } = require("../../Routes/v1/post.routes")

// Fetch Posts
const fetchPosts = async (req, res) =>{
try {
  const {post_type, posts_of='New', category='Food', page, limit} = req.query
  const user_id = req.loginUser.user_id
  console.log(user_id)
  let conditions = []
  const trendingPostsQuery = 
  `
SELECT 
  tbl_post.post_id,
  tbl_post.post_type,
  tbl_user.username, 
  tbl_user.profile_url, 

  JSON_ARRAYAGG(
    JSON_OBJECT(
      'media_type', tbl_post_media.media_type,
      'media_url', tbl_post_media.media_url
    )
  ) AS posts,

  IFNULL(AVG(tbl_rating.rating), 0) AS avg_rating,
  IFNULL(COUNT(tbl_rating.rating), 0) AS rating_count,

  tbl_category.category_name,
  tbl_post.post_type

FROM tbl_post 

LEFT JOIN tbl_user 
  ON tbl_user.user_id = tbl_post.user_id 

LEFT JOIN tbl_post_media 
  ON tbl_post.post_id = tbl_post_media.post_id

LEFT JOIN tbl_rating 
  ON tbl_rating.image_id = tbl_post.post_id

LEFT JOIN tbl_category
  ON tbl_category.category_id=tbl_post.category_id

GROUP BY tbl_post.post_id

ORDER BY (avg_rating * rating_count) DESC

  `

  let query = 
  `
SELECT 
  tbl_post.post_id,
  tbl_user.username, 
  tbl_user.profile_url, 

  JSON_ARRAYAGG(
    JSON_OBJECT(
      'media_type', tbl_post_media.media_type,
      'media_url', tbl_post_media.media_url
    )
  ) AS posts,

  IFNULL(AVG(tbl_rating.rating), 0) AS avg_rating,
  IFNULL(COUNT(tbl_rating.rating), 0) AS rating_count,

  tbl_category.category_name,
  tbl_post.post_type

FROM tbl_post 

LEFT JOIN tbl_user 
  ON tbl_user.user_id = tbl_post.user_id 

LEFT JOIN tbl_post_media 
  ON tbl_post.post_id = tbl_post_media.post_id

LEFT JOIN tbl_rating 
  ON tbl_rating.image_id = tbl_post.post_id

LEFT JOIN tbl_category
  ON tbl_category.category_id=tbl_post.category_id
  `
// This is for Category Data 
let categoryQuery = query
if(category){
  categoryQuery += ` Where tbl_category.category_name='${category}' and tbl_post.is_active=1`
  console.log(categoryQuery)
}
// This is for Category Data


  if(posts_of==="Following"){
  query += 
  `JOIN tbl_follow on tbl_follow.logged_user_id=${user_id} and tbl_follow.following_user_id=tbl_post.user_id`
} 
if(post_type){
  query += ' where '

  if(post_type){
    conditions.push(` tbl_post.post_type='${post_type}' `)
  } 
// if(post_type==="ToStyleCompare"){
//   query += 
//   ` tbl_post.post_type='compare' `
// }else if(post_type==="ToStyleMe"){
//   query += 
//   ` tbl_post.post_type='me' `
// }else if(post_type==="ToStyleVideo"){
//   query += 
//   ` tbl_post.post_type='video' `
// }
} 
// console.log(conditions)
if(conditions.length>0){
  let conditionsQuery = conditions.join(' AND ')
  query+= conditionsQuery
  query += ' and tbl_post.is_active=1'
} else{
  query += ' tbl_post.is_active=1'
}
query += ' Group By tbl_post.post_id'
if(posts_of==="New"){
  query += 
  ` ORDER BY tbl_post.created_at `
} 

  // console.log(query)

  // Trending Posts
  const [trendingPosts] = await conn.query(trendingPostsQuery)

  // Normal Posts
  const [posts] = await conn.query(query)

  // Category Listing
  const categoryListing = await common.fetchCategories()

  // Category Posts
  let [categoryData] = await conn.query(categoryQuery)

  if(!categoryData[0].post_id) categoryData={}
  // console.log(categoryData[0].post_id)
  return sendResponse(req, res, 200, 1, "Posts found!", {trendingPosts: trendingPosts, posts: posts, category: categoryListing, categoryPosts: categoryData })

} catch (error) {
  console.log(error)
  return sendResponse(req, res, 500, 0, "Internal server error", {})
}
}

// Fetch Categories
const fetchCategories = async (req, res)=>{
  try {
    const category = await common.fetchCategories()

    if(category){
      return sendResponse(req, res, 200, 1, "Categories Found", category)
    }else{
      return sendResponse(req, res, 200, 3, "No Categories Found", {})
    }
  } catch (error) {
    return sendResponse(req, res, 500, 0, "Internal Server Error", {})
  }
}

// fetchCategoriesPosts
const fetchCategoriesPosts = async (req, res)=>{
  try {
    if(!req.body.category_id) return sendResponse(req, res, 400, 0, "Please, enter valid post", {})
    
    let query = 
    `SELECT 
  tbl_post.post_id,
  tbl_user.username, 
  tbl_user.profile_url, 

  JSON_ARRAYAGG(
    JSON_OBJECT(
      'media_type', tbl_post_media.media_type,
      'media_url', tbl_post_media.media_url
    )
  ) AS posts,

  IFNULL(AVG(tbl_rating.rating), 0) AS avg_rating,
  IFNULL(COUNT(tbl_rating.rating), 0) AS rating_count,

  tbl_category.category_name,
  tbl_post.post_type

FROM tbl_post 

LEFT JOIN tbl_user 
  ON tbl_user.user_id = tbl_post.user_id 

LEFT JOIN tbl_post_media 
  ON tbl_post.post_id = tbl_post_media.post_id

LEFT JOIN tbl_rating 
  ON tbl_rating.image_id = tbl_post.post_id

JOIN tbl_category
  ON tbl_category.category_id=tbl_post.category_id 
  
  WHERE tbl_category.is_active=1 and tbl_post.is_active=1 and tbl_post.category_id=${req.body.category_id}`

  
  const [posts] = await conn.query(query)
  console.log(posts)

    if(posts[0].post_id){
      return sendResponse(req, res, 200, 1, "Posts found", posts)
    }else{
      return sendResponse(req, res, 200, 3, "Posts not found", {})
    }
  } catch (error) {
    console.log(error)
    return sendResponse(req, res, 500, 0, "Internal Server Error", {})
  }
}

// Fetch single post
const fetchSinglePost = async (req, res)=>{
  try {
    if(!req.body.post_id) return sendResponse(req, res, 400, 0, "Please, enter valid post", {})

    let query = 
    `
SELECT
  p.post_id, p.description, p.post_type, p.expire_time,
  u.username, u.profile_url,
  
  -- 🔥 MEDIA WITH PROPER RANK #1,#2,#3
  (SELECT JSON_ARRAYAGG(
    JSON_OBJECT(
      'data_id', ranked.data_id,
      'media_type', ranked.media_type,
      'media_url', ranked.media_url,
      'rank', ranked.ranking,
      'total_votes', ranked.total_votes
    )
  ) FROM (
    SELECT 
      pm.data_id, pm.media_type, pm.media_url,
      COUNT(r.rank_id) AS total_votes,
      ROW_NUMBER() OVER (ORDER BY COUNT(r.rank_id) DESC) AS ranking
    FROM tbl_post_media pm 
    LEFT JOIN tbl_ranking r ON r.post_media_id = pm.data_id
    WHERE pm.post_id = p.post_id
    GROUP BY pm.data_id, pm.media_type, pm.media_url
  ) ranked
  ) AS post_media,

  (SELECT AVG(rating) FROM tbl_rating WHERE tbl_rating.image_id = p.post_id) AS avg_rating

FROM tbl_post p
JOIN tbl_user u ON u.user_id = p.user_id
WHERE p.is_active = 1 AND p.post_id = ?
    `;
const [posts] = await conn.query(query, [req.body.post_id])
    return sendResponse(req, res, 200, 1, "Posts found", posts)

  } catch (error) {
    console.log(error)
    return sendResponse(req, res, 500, 0, "Internal Server Error", {})
  }
}

// Add Ranking
const addRanking = async (req, res)=>{
try {
  const user_id = req.loginUser.user_id
  const media = req.body.media
  // console.log(media)
  if(!media) return sendResponse(req, res, 400, 0, "Please, give proper ranking", {})

  // fetch post id
  const [[post_id]] = await conn.query('select post_id from tbl_post_media where tbl_post_media.data_id=?', media[0].post_media_id)
  
  // fetch ids of that posts
  const [ids] = await conn.query(`select distinct post_id from tbl_post_media where data_id in (?)`, [media.map(m => m.post_media_id)])

  if(ids.length===0) return sendResponse(req, res, 200, 0, "Please, give ranking to proper media.")
    
  if (ids.length > 1) return sendResponse(req, res, 400, 0, "Media belong to different posts", {});
 
  const [[post]] = await conn.query('select *, (select json_arrayagg(json_object("media_id", tbl_post_media.data_id)) from tbl_post_media where tbl_post_media.post_id=tbl_post.post_id) media from tbl_post where tbl_post.post_id=?', post_id.post_id)
  
  if(!post) return sendResponse(req, res, "Post not found",)

  // Expiry check
  if (post.expire_time < new Date()) {
      return sendResponse(req, res, 400, 0, "Ranking expired for this post", {})
  }

  // all post got ranking
  if(post.media.length !== media.length) return sendResponse(req, res, 200, 0, "Please, give ranking to all Photos.")

  // Check is rating already had given before
  const [is_ranked] = await conn.query(`select * from tbl_ranking where user_id=? and post_media_id in (?)`, [user_id, post.media.map(m => m.media_id)])
  if(is_ranked.length > 0) {
    media.map(m => conn.query('update tbl_ranking set `rank`=? where user_id= ? and post_media_id= ?', [m.ranking, user_id, m.post_media_id]))
    return sendResponse(req, res, 200, 1, "Ranking updated successfully", {})
  }else{
    media.map(m => conn.query('Insert into tbl_ranking (user_id, post_media_id, `rank`) values (?, ?, ?)', [user_id, m.post_media_id, m.ranking]))
    return sendResponse(req, res, 200, 1, "Ranking addedd successfully", {})
  }

} catch (error) {
  console.log(error)
  return sendResponse(req, res, 500, 0, "Internal server error", error)
}
} 

// Add Rating
const addRating = async (req, res)=>{
  try {
    const user_id = req.loginUser.user_id
    const {post_id, rating} = req.body

    // Check is rating already had given before
    const [is_rated] = await conn.query("select * from tbl_rating where user_id=? and image_id=?", [user_id, post_id])

    if(is_rated.length > 0) {
      const [updated] = await conn.query('update tbl_rating set rating=? where user_id=? and image_id=?', [rating, user_id, post_id])

      if(updated.affectedRows > 0){
        return sendResponse(req, res, 200, 1, "Rating updated successfully", {})
      } else{
        return sendResponse(req, res, 200, 0, "Rating update failed", {})
      }
    }else{
      const [inserted] = await conn.query('INSERT INTO tbl_rating (user_id, image_id, rating) values (?, ?, ?)', [user_id, post_id, rating])
      if(inserted.affectedRows > 0){
        return sendResponse(req, res, 200, 1, "Rating added successfully", {})
      } else{
        return sendResponse(req, res, 200, 0, "Rating add failed", {})
      }
    }
    console.log(is_rated)

  } catch (error) {
    console.log(error)
    return sendResponse(req, res, 500, 0, "Internal server error", error)
  }
}

// Add Comment
const addComent = async (req, res)=>{
  try {
    const user_id = req.loginUser.user_id
    const {post_id, comment} = req.body
    const [inserted] = await conn.query('INSERT INTO tbl_comment (user_id, post_id, comment_text) values (?, ?, ?)', [user_id, post_id, comment])
    if(inserted.affectedRows > 0){
      return sendResponse(req, res, 200, 1, "Comment added successfully", {})
    }
  } catch (error) {
    console.log(error)
    return sendResponse(req, res, 500, 0, "Internal server error", error)
  }
}

// Save Post
const savePost = async (req, res)=>{
  try {
    const user_id = req.loginUser.user_id
    const {post_id} = req.body 

            const [post] = await common.getPost(post_id)

        if (!post) {
            return sendResponse(req, res, 200, 3, "Post not found", {})
        }

    // Check if already saved
    const [is_saved] = await conn.query('select * from tbl_save where user_id=? and post_id=?', [user_id, post_id])
    if(is_saved.length > 0) {
      conn.query('delete from tbl_save where user_id=? and post_id=?', [user_id, post_id])
      return sendResponse(req, res, 200, 1, "Post unsaved successfully", {})
    }else{
      const [saved] = await conn.query('insert into tbl_save (user_id, post_id) values (?, ?)', [user_id, post_id])
      return sendResponse(req, res, 200, 1, "Post saved successfully", {})
    }
  } catch (error) {
    console.log(error)
    return sendResponse(req, res, 500, 0, "Internal server error", error)
  }
}

// Report Post
const reportPost = async (req, res)=>{
  try {
    const user_id = req.loginUser.user_id
    const {post_id, reason} = req.body

    const [post] = await common.getPost(post_id)
    if(!post) return sendResponse(req, res, 200, 3, "Post not found", {})
    
    const [is_reported] = await conn.query('select * from tbl_user_report where user_id=? and post_id=?', [user_id, post_id])
    if(is_reported.length > 0){
      await conn.query('update tbl_user_report set report_text=? where user_id=? and post_id=?', [reason, user_id, post_id])
    } else{
    const [inserted] = await conn.query('INSERT INTO tbl_user_report (user_id, post_id, report_text) values (?, ?, ?)', [user_id, post_id, reason])
    if(inserted.affectedRows > 0){
      return sendResponse(req, res, 200, 1, "Post reported successfully", {})
    }
  }
  } catch (error) {
    console.log(error)
    return sendResponse(req, res, 500, 0, "Internal server error", error)
  }
}

// Create Post
const createPost = async (req, res)=>{
  try {
    const user_id = req.loginUser.user_id
    const {description, post_type, category_id, expire_time, media, visibility} = req.body

    if(post_type === "compare" && !expire_time){
      return sendResponse(req, res, 400, 0, "Please, provide expire time for compare post", {})
    }

    console.log(description, post_type, category_id, expire_time, media, visibility)
    const query = post_type === "compare" ? 'INSERT INTO tbl_post (user_id, description, post_type, category_id, expire_time, visibility) values (?, ?, ?, ?, ?, ?)' : 'INSERT INTO tbl_post (user_id, description, post_type, category_id, visibility) values (?, ?, ?, ?, ?)'

    const queryParams = post_type === "compare" ? [user_id, description, post_type, category_id, expire_time, visibility] : [user_id, description, post_type, category_id, visibility]

    const [inserted] = await conn.query(query, queryParams)

    if(inserted.affectedRows > 0){
      const post_id = inserted.insertId

    media.map(m => {
      if(!m.media_url || !m.media_type){
        return sendResponse(req, res, 400, 0, "Please, provide valid media data", {})
      }else{
        conn.query('INSERT INTO tbl_post_media (post_id, media_url, media_type) values (?, ?, ?)', [post_id, m.media_url, m.media_type])
      }
    })

    return sendResponse(req, res, 200, 1, "Post created successfully", {post_id: post_id})
  } else{
    return sendResponse(req, res, 200, 0, "Post creation failed", {})
  }
  } catch (error) {
    console.log(error)
    return sendResponse(req, res, 500, 0, "Internal server error", error)
  }
}

// Delete Post
const deletePost = async (req, res)=>{
  try {
    const user_id = req.loginUser.user_id
    const {post_id} = req.body 
    const [post] = await common.getPost(post_id)
    if(!post) return sendResponse(req, res, 200, 3, "Post not found", {})
    
    if(post.user_id !== user_id) return sendResponse(req, res, 403, 0, "You are not authorized to delete this post", {})
    
    const [deleted] = await conn.query('update tbl_post set is_active=0 where post_id=?', [post_id])
    if(deleted.affectedRows > 0){
      return sendResponse(req, res, 200, 1, "Post deleted successfully", {})
    } else{
      return sendResponse(req, res, 200, 0, "Post deletion failed", {})
    }
}
  catch (error) { 
    console.log(error)
    return sendResponse(req, res, 500, 0, "Internal server error", error)
  } 
}

module.exports = {fetchPosts, fetchCategories, fetchCategoriesPosts, fetchSinglePost, addRanking, addRating, addComent, savePost, reportPost, createPost, deletePost}
