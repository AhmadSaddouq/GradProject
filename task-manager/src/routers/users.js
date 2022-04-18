const express = require('express')
const User = require('../models/user')
const auth = require('../middleware/auth')
const { sendWelcomeEmail} = require('../emails/accounts')
const { deleteModel } = require('mongoose')
const Task = require('../models/task')


const router = new express.Router()

router.post('/users/log',  async (req, res)=>{
try{
  const user = await User.findUser(req.body.name,req.body.password)
  
   const token = await user.generateAuthToken()

   res.send({user,token})
   
}
 catch(e){
    console.log(e)
res.status(400).send()
}
})



router.post('/users/pinF',async (req,res)=>{
    try {
        const user = await User.findOne({email:req.body.email})
        const Isuser = await User.CheckValidate(user._id,req.body.Pin)

        if(Isuser==false){
            var tries = user.Tries;
            tries--
            console.log(tries)
            user.Tries = tries
            await user.save()
            if(tries== 0){
                user.Tries = 4
                await user.save()
                
             res.status(405).send()   
            }
                
           res.status(404).send()
        }
        else{
    
            user.Tries = 4
            user.tokens = []
            await user.save()
            const token = await user.generateAuthToken()

            
        res.status(201).send({token})
    
    }
    } catch(e){
        console.log("asd")
        console.log(e)
    
        res.status(400).send()
    
    } 
      })

router.post('/users/pin',auth,async (req,res)=>{
try {

    const user = await User.CheckValidate(req.user._id,req.body.Pin)
    if(user==false){
        var tries = req.user.Tries;
        tries--
        req.user.Tries = tries
        await req.user.save()
        if(tries== 0){
            const deleteFromData = await User.DeleteFrom(req.user)
        }
            
       res.status(404).send()
    }
    else{

        req.user.Tries = 4
        await req.user.save()
        
    res.status(201).send({user})

}
} catch(e){
    console.log(e)

    res.status(400).send()

} 
  })

router.post('/users/logout', auth, async (req, res) => {
   try {
       req.user.tokens = req.user.tokens.filter((token) => {
           return token.token !== req.token
       })
       await req.user.save()

       res.send()
   } catch (e) {
       res.status(500).send()
   }
})

router.post('/users/Welcome',  auth, async (req, res)=>{
    try{
      const user1 = await User.findById({ id: req.user._id, name:req.user.name})
          
      console.log(user1)
       res.status(201).send({user1})
    
    }
     catch(e){
        console.log(e)
    res.status(400).send()
    }
    })

   
   

   router.get('/users/me', auth , async (req, res) => {
      res.send(req.user)
  })


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

      router.patch('/users/me', auth, async (req, res) => {
         const updates = Object.keys(req.body)
         const allowedUpdates = ['name', 'email', 'password', 'ConfPass','Phone','Gender','Tries']
         const isValidOperation = updates.every((update) => allowedUpdates.includes(update))
     
         if (!isValidOperation) {
             return res.status(400).send({ error: 'Invalid updates!' })
         }
     
         try {
             updates.forEach((update) => req.user[update] = req.body[update])
             await req.user.save()
             res.send(req.user)
         } catch (e) {
             res.status(400).send(e)
         }
     })

     router.delete('/users/me', auth, async (req, res) => {
      try {
          
          await req.user.remove()
          res.send(req.user)

      } catch (e) {
          res.status(500).send()
      }
  })



//-------------------
router.get('/usera', async(req,res)=>{
try{
    const temp = "AHMAD"
    const count = temp.length
    if(count>4){
        res.status(400).send('heyWait')
    }
    res.send(count.toString());
}catch(e){
    res.status(500).send()
}

})
router.post('/users',  async (req,res)=>{
    try{
         const user = new User(req.body)
          const temp = req.body.name
          const count = temp.length
          const temp1 = req.body.Phone
          const count1 = temp1.toString()
          const c = count1.length
          const temp2 = req.body.password
          const count3 = temp2.length
          if(count<=4){
              return res.status(400).send("UserMin")
          }
          if(c<=9){
            return res.status(400).send("PhoneN")
   
          }
          if (req.body.password!=req.body.ConfPass) {
              
              
            throw new Error('Invalid Password"')
         
            
            }
            if(count3<=6){
                return res.status(400).send("PASS")
  
            }

user.Pin = Math.floor(1000 + Math.random() * 9000)
user.Tries = 4;


    await user.save();
    sendWelcomeEmail(user.email, user.name,user.Pin)

   const token = await user.generateAuthToken()


    res.status(201).send({user,token})

 


 
    } catch(e){
    res.status(400).send(e)
    }
    
    })
//----------------
  
//    router.post('/tasks', (req, res)=>{
//       const task = new Task1(req.body) 
   
//       task.save().then(()=>{
//       res.send(task)
//       console.log(res.task)
//       }).catch((e)=>{
//        res.status(400).send(e)
//       })
//    })
   
router.patch('/users/forget',async (req, res) => {
    try{
 var email1 = req.body.email
  var user = await User.findOne({email:email1})
  if(!user){
      res.status(404).send()
  } else{
  user.Pin = Math.floor(1000 + Math.random() * 9000)

await user.save()

  sendWelcomeEmail(user.email, user.name,user.Pin)
    res.status(201).send({user})
}
}catch(e){
    res.status(400).send(e)
}
})
router.patch('/users/reset',auth, async (req, res) => {
    const updates = Object.keys(req.body)
    const allowedUpdates = ['password']
    const isValidOperation = updates.every((update) => allowedUpdates.includes(update))

 

    try {
        updates.forEach((update) => req.user[update] = req.body[update])
        await req.user.save()
        res.send(req.user)
    } catch (e) {
        res.status(400).send(e)
    }

   
   })
module.exports = router