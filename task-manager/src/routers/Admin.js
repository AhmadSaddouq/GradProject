const express = require('express')
const Admin = require('../models/Admin')
const AdminAuth= require('../middleware/AdminAuth')
const multer = require('multer')
const sharp = require('sharp')

const router = new express.Router()


const upload = multer({
    limits: {
        fileSize: 1000000
    },
})
router.post('/Admin/log',  async (req, res)=>{
try{
  const Admin1 = await Admin.findUser1(req.body.name,req.body.password)
  
   const token = await Admin1.generateAuthToken()

   res.send({Admin1,token})
   
}
 catch(e){
    console.log(e)
res.status(400).send()
}
})





router.post('/Admin/logout', AdminAuth, async (req, res) => {
   try {
       req.Admin.tokens = req.Admin.tokens.filter((token) => {
           return token.token !== req.token
       })
       await req.Admin.save()

       res.send()
   } catch (e) {
       res.status(500).send()
   }
})



   
   

   router.get('/Admin/me', AdminAuth , async (req, res) => {
      res.send(req.Admin)
  })







//-------------------

router.post('/Admin',  async (req,res)=>{
    try{
        const Admin1 = new Admin (req.body)

          
    await Admin1.save();

   const token = await Admin1.generateAuthToken()


    res.status(201).send({Admin1,token})

 


 
    } catch(e){
    res.status(400).send(e)
    }
    
    })



module.exports = router