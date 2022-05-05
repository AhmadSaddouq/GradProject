const express = require('express')
const Instruments = require('../models/ShoppingInstruments')
const multer = require('multer')
const sharp = require('sharp')

const router = new express.Router()


const upload = multer({
    limits: {
        fileSize: 1000000
    },
})

router.post('/Instruments', upload.single('upload'), async (req, res) => {

    const courses = new Instruments (req.body)

    const buffer = await sharp(req.file.buffer).resize({ width: 250, height: 250 }).png().toBuffer()
    courses.avatar = buffer
    await courses.save();
    res.status(201).send(courses)
}, (error, req, res, next) => {
    res.status(400).send({ error: error.message })
})


router.post('/Instruments/getName', async (req, res) => {
 const Course = await Instruments.find();
const count = Course.length
var array= [];
var i;
for(i=0;i<count;i++){
array[i]=Course[i].name
}
var arr1=array.toString()
var q1 = arr1.split(',')
 res.send(q1.toString())


}, (error, req, res, next) => {
    res.status(400).send({ error: error.message })
})
router.post('/Instruments/count', async (req, res) => {
    const Course = await Instruments.find();
   const count = Course.length
      
    res.send(count.toString())
   
   
   }, (error, req, res, next) => {
       res.status(400).send({ error: error.message })
   })

   router.post('/Instruments/Des', async (req, res) => {
    const Course = await Instruments.find();
   const count = Course.length
   var array= [];
   var i;
   for(i=0;i<count;i++){
   array[i]=Course[i].Description
   }
   var arr1=array.toString()
   var q1 = arr1.split(',')
    res.send(q1.toString())
   
   
   }, (error, req, res, next) => {
       res.status(400).send({ error: error.message })
   })

   router.post('/Instruments/price', async (req, res) => {
    const Course = await Instruments.find();
   const count = Course.length
   var array= [];
   var i;
   for(i=0;i<count;i++){
   array[i]=Course[i].Price
   }
   var arr1=array.toString()
   var q1 = arr1.split(',')
   res.send(q1.toString())
   
   
   }, (error, req, res, next) => {
       res.status(400).send({ error: error.message })
   })

router.post('/Instruments/getImage', async (req, res) => {
    const Course = await Instruments.find();
   const count = Course.length
   var array1=[];
   var i;
   for(i=0;i<count;i++){
   array1[i]=Course[i].avatar.toString("base64")
   }
   var arr=array1.toString()
    var q= arr.split(',')
    res.send(q.toString())

   
   }, (error, req, res, next) => {
       res.status(400).send({ error: error.message })
   })

   router.post('/Instruments/getQuantity', async (req, res) => {
    const Course = await Instruments.find();
   const count = Course.length
   var array1=[];
   var i;
   for(i=0;i<count;i++){
   array1[i]=Course[i].Quantity
   }
   var arr=array1.toString()
    var q= arr.split(',')
    res.send(q.toString())

   
   }, (error, req, res, next) => {
       res.status(400).send({ error: error.message })
   })
 


module.exports = router