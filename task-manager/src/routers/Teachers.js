const express = require('express')
const auth1 = require('../middleware/auth1')
const { sendWelcomeEmail} = require('../emails/accounts')
const { deleteModel } = require('mongoose')
const Teacher = require('../models/teacher')
const User = require('../models/user')
const Task = require('../models/task')



const router = new express.Router()

// router.post('/users/log',  async (req, res)=>{
// try{
//   const user = await User.findUser(req.body.name,req.body.password)
  
//    const token = await user.generateAuthToken()

//    res.send({user,token})
   
// }
//  catch(e){
//     console.log(e)
// res.status(400).send()
// }
// })



// router.post('/users/pinF',async (req,res)=>{
//     try {
//         const user = await User.findOne({email:req.body.email})
//         const Isuser = await User.CheckValidate(user._id,req.body.Pin)

//         if(Isuser==false){
//             var tries = user.Tries;
//             tries--
//             console.log(tries)
//             user.Tries = tries
//             await user.save()
//             if(tries== 0){
//                 user.Tries = 4
//                 await user.save()
                
//              res.status(405).send()   
//             }
                
//            res.status(404).send()
//         }
//         else{

    
//             user.Tries = 4
//             user.tokens = []
//             await user.save()
//             const token = await user.generateAuthToken()

            
//         res.status(201).send({token})
    
//     }
//     } catch(e){
//         console.log("asd")
//         console.log(e)
    
//         res.status(400).send()
    
//     } 
//       })

// router.post('/users/pin',auth,async (req,res)=>{
// try {

//     const user = await User.CheckValidate(req.user._id,req.body.Pin)
//     if(user==false){
//         var tries = req.user.Tries;
//         tries--
//         req.user.Tries = tries
//         await req.user.save()
//         if(tries== 0){
//             const deleteFromData = await User.DeleteFrom(req.user)
//         }
            
//        res.status(404).send()
//     }
//     else{

//         req.user.Tries = 4
//         await req.user.save()
        
//     res.status(201).send({user})

// }
// } catch(e){
//     console.log(e)

//     res.status(400).send()

// } 
//   })

// router.post('/users/logout', auth, async (req, res) => {
//    try {
//        req.user.tokens = req.user.tokens.filter((token) => {
//            return token.token !== req.token
//        })
//        await req.user.save()

//        res.send()
//    } catch (e) {
//        res.status(500).send()
//    }
// })

// router.post('/users/Welcome',  auth, async (req, res)=>{
//     try{
//       const user1 = await User.findById({ id: req.user._id, name:req.user.name})
          
//       console.log(user1)
//        res.status(201).send({user1})
    
//     }
//      catch(e){
//         console.log(e)
//     res.status(400).send()
//     }
//     })

   
   

//    router.get('/users/me', auth , async (req, res) => {
//       res.send(req.user)
//   })
//--------------

// router.get('/users', async (req, res) => {
//    try {
//        const users = await User.find({})
//        res.send(users)
//    } catch (e) {
//        res.status(500).send()
//    }
// })
   
      // router.delete('/users/:id',async(req,res)=>{
      //    try{
      //    const user =  await User.findByIdAndDelete(req.params.id)
      //    if(!user){
      //       return res.status(404).send()
      //    }
      //    res.send(user)
      //    }catch(e){
      //            res.status(500).send()
      //    }
      // })

      //update
      // router.patch('/users/:id',async (req,res)=>{
      //    const updates = Object.keys(req.body)
      //    const allowedUpdates = ['name', 'email', 'password', 'ConfPass','Phone', 'Gender','birthday']
      //    const isValidOperation = updates.every((update) => allowedUpdates.includes(update))
     
      //    if (!isValidOperation) {
      //        return res.status(400).send({ error: 'Invalid updates!' })
      //    }
      //    try {
      //       const user = await User.findById(req.params.id)
      //       updates.forEach((update)=> user[update] = req.body[update])
      //       await user.save()
      //        if(!user){
      //           return res.status(404).send()
      //        }
      //        res.send(user)     
      //       }catch(e){
      //            res.status(400).send(e)
      //    }
   
      // })

//       router.patch('/users/me', auth, async (req, res) => {
//          const updates = Object.keys(req.body)
//          const allowedUpdates = ['name', 'email', 'password', 'ConfPass','Phone','Gender','Tries']
//          const isValidOperation = updates.every((update) => allowedUpdates.includes(update))
     
//          if (!isValidOperation) {
//              return res.status(400).send({ error: 'Invalid updates!' })
//          }
     
//          try {
//              updates.forEach((update) => req.user[update] = req.body[update])
//              await req.user.save()
//              res.send(req.user)
//          } catch (e) {
//              res.status(400).send(e)
//          }
//      })

//      router.delete('/users/me', auth, async (req, res) => {
//       try {
          
//           await req.user.remove()
//           res.send(req.user)

//       } catch (e) {
//           res.status(500).send()
//       }
//   })



//-------------------
router.post('/teachers',  async (req,res)=>{
    try{
         const teacher = new Teacher(req.body)
       
          if (req.body.password!=req.body.ConfPass) {
              
              throw new Error('Invalid Password"')
          }

teacher.Pin = Math.floor(1000 + Math.random() * 9000)
teacher.Tries = 4;


    await teacher.save();
    // sendWelcomeEmail(teacher.email, teacher.name,teacher.Pin)
   const token = await teacher.generateAuthToken1()
        
    res.status(201).send({teacher,token})


 


 
    } catch(e){
    res.status(400).send(e)
    }
    
    })
    
router.post('/teachers/log',  async (req, res)=>{
    try{
      const teacher = await Teacher.findUser1(req.body.name,req.body.password)
      
       const token = await teacher.generateAuthToken1()
    
       res.send({teacher,token})
       
    }
     catch(e){
        console.log(e)
    res.status(400).send()
    }
    })
//----------------
router.delete('/tasks/me1', auth1, async (req, res) => {
    try {

        await req.teacher.remove()
        const user = await User.updateMany(
            {
                owner1 : req.teacher._id
            },
            {
                $set : {
                    "owner1" : ""
                }
            },
            {upsert: true},
            (err, doc)=>{
                if(err) console.log(err);
                console.log(doc)
             }

            )
        const task = await Task.updateMany(
            {
                name : user.name
            },
            {
            $set:{
                "instrument" : ""
            }, 
         

                    },
                    {upsert: 
                        true},
                    (err, doc)=>{
                        if(err) console.log(err);
                        console.log(doc)
                     }
 )

        
                  
        await user.save()
        await task.save()
        res.send(req.teacher)
                       


    } catch (e) {
        res.status(500).send()
    }
})
  
//    router.post('/tasks', (req, res)=>{
//       const task = new Task1(req.body) 
   
//       task.save().then(()=>{
//       res.send(task)
//       console.log(res.task)
//       }).catch((e)=>{
//        res.status(400).send(e)
//       })
//    })
   
// router.patch('/users/forget',async (req, res) => {
//     try{
//  var email1 = req.body.email
//   var user = await User.findOne({email:email1})
//   if(!user){
//       res.status(404).send()
//   } else{
//   user.Pin = Math.floor(1000 + Math.random() * 9000)

// await user.save()

//   sendWelcomeEmail(user.email, user.name,user.Pin)
//     res.status(201).send({user})
// }
// }catch(e){
//     res.status(400).send(e)
// }
// })
// router.patch('/users/reset',auth, async (req, res) => {
//     const updates = Object.keys(req.body)
//     const allowedUpdates = ['password']
//     const isValidOperation = updates.every((update) => allowedUpdates.includes(update))

 

//     try {
//         updates.forEach((update) => req.user[update] = req.body[update])
//         await req.user.save()
//         res.send(req.user)
//     } catch (e) {
//         res.status(400).send(e)
//     }

   
//    })
module.exports = router