const express = require('express')
const TTask = require('../models/Ttask')
const auth1 = require('../middleware/auth1')
const Teacher = require('../models/teacher')
const Task = require('../models/task')
const { count } = require('../models/task')
const User = require('../models/user')
// const { translateAliases } = require('../models/teacher')
const router = new express.Router()


router.post('/taskss', auth1, async (req, res) => {
    const task = new TTask({
        ...req.body,
        owner: req.teacher._id,
        NName: req.teacher.name
        

    })

    try {
        task.Education = "Hey, Tell us About Your Qualifications."
        task.About = "Hi, Tell Us About You :)"
        task.instrument = "Violin"
        await task.save()
        res.status(201).send(task)
    } catch (e) {

        res.status(400).send(e)
    }
})

router.get('/Ttasks',auth1, async (req, res) => {
    try {
        await req.teacher.populate('taskss')
        res.send(req.teacher.Ttasks)
    } catch (e) {
        res.status(500).send()
    }
})
router.get('/Ttasks/Ed',auth1, async (req, res) => {
    try {
        const user1 = await TTask.findOne({ owner: req.teacher.id})
         

          res.status(201).send(user1.Education)

        
    } catch (e) {
        res.status(500).send()
    }
})

router.get('/Ttasks/ABOU',auth1, async (req, res) => {
    try {
        const user1 = await TTask.findOne({ owner: req.teacher.id})
         

          res.status(201).send(user1.About)

        
    } catch (e) {
        res.status(500).send()
    }
})

router.get('/Ttasks/name',auth1, async (req, res) => {
    try {
        const teacher = await TTask.findOne({ owner: req.teacher.id})
         

          res.status(201).send(req.teacher.name)

        
    } catch (e) {
        res.status(500).send()
    }
})

router.get('/Ttasks/email',auth1, async (req, res) => {
    try {
        const teacher = await TTask.findOne({ owner: req.teacher.id})
         
          res.status(201).send(req.teacher.email)
        
    } catch (e) {
        res.status(500).send()
    }
})

router.get('/Ttasks/short',auth1, async (req, res) => {
    try {
        const teacher = await TTask.findOne({ owner: req.teacher.id})
        var email= req.teacher.name
        var e = email.toUpperCase().split('')
          res.status(201).send(e[0]+e[1])
          
        
    } catch (e) {
        res.status(500).send()
    }
})

router.get('/Ttasks/STATUSTT',auth1, async (req, res) => {
    try {
        var Temp = [];
        const teacher = await TTask.findOne({owner: req.teacher.id})
        var Students3 = teacher.STUSTATUS
        
           
        res.status(201).send(Students3.toString())

           
          
        
    } catch (e) {
        res.status(500).send()
    }
})

router.post('/Ttasks/CANCEL',auth1, async (req, res) => {
    try {
        const count = await TTask.findOne({owner:req.teacher.id})
         var ccc = count.Students.length
        const teacher = await TTask.findOne({ owner: req.teacher.id})
        const user = await User.findOne({ owner1: req.teacher.id})
          
        const Dateee= await Task.findOne({Name:req.body.Name})
        const dat = Dateee.Date
        const Timee = Dateee.Time
        for(var i = 0;i<ccc;i++){
            if(teacher.Students[i]==Dateee.Name){
        const cancelt = await TTask.findOneAndUpdate({Students:teacher.Students[i]
        
        },
        {
            $pull:{
             Students : req.body.Name,
             TimeS :  req.body.Time,
             DateS: req.body.Date
            },
            $push:{
                CanceledS : req.body.Name
            },
        })
    }
    break
    
    }
    
   
         Dateee.Date = "";
         Dateee.Time = "";
         Dateee.instrument = "";
         user.owner1 = "";
         Dateee.owner2="";
         await user.save()
      await Dateee.save()
     await teacher.save()
      await cancelt.save()
      res.status(200).send(teacher)
          
        
    } catch (e) {
        res.status(500).send()
    }
})


router.post('/Ttasks/BookSuccess',auth1, async (req, res) => {
    try {

      const teacher = await TTask.findOneAndUpdate(
        {
            owner: req.teacher.id

     
 },
 {
     $pull: {
    Students : req.body.Students,
    TimeS : req.body.TimeS,
    DateS : req.body.DateS
    
     },
     
 
 
 } 
     )
     const teacher1 = await Task.findOneAndUpdate(
        {
            Time: req.body.Time,
            Date : req.body.Date

     
 },
 {
     $pull: {
    Time : req.body.Time,
    Date : req.body.Date,
    
     },
     
 
 
 } 
     )
     await teacher1.save()
     await teacher.save()
     res.status(200).send(teacher)
          
        
    } catch (e) {
        res.status(500).send()
    }
})

router.get('/Ttasks/ListN',auth1, async (req, res) => {
    try {
        const teacher = await TTask.findOne({ owner: req.teacher.id})
        var Students1 = teacher.Students
        
    res.status(201).send(Students1.toString())
    
          
        
    } catch (e) {
        res.status(500).send()
    }
})
router.get('/Ttasks/ListD',auth1, async (req, res) => {
    try {
        const teacher = await TTask.findOne({ owner: req.teacher.id})
 
        var Students3 = teacher.DateS

    res.status(201).send(Students3.toString())
    
          
        
    } catch (e) {
        res.status(500).send()
    }
})
router.get('/Ttasks/ListS',auth1, async (req, res) => {
    try {
        const teacher = await TTask.findOne({ owner: req.teacher.id})
        var Students2 = teacher.TimeS

    res.status(201).send(Students2.toString())
    
          
        
    } catch (e) {
        res.status(500).send()
    }
})

router.get('/Ttasks/count', async (req, res) => {
    try {
        const teacher = await Teacher.count()
                        
           res.send(teacher.toString())
        res.status(201)
        
    } catch (e) {
        res.status(500).send()
    }
})
router.get('/Ttasks/count1', async (req, res) => {
    try {
        const teacher = await Teacher.findOne({name : "ABOTALAL1"})
                        
        //    res.send(teacher.toString())
        res.status(201).send(teacher)
        
    } catch (e) {
        res.status(500).send()
    }
})

router.get('/Ttasks/TeachersList', async (req, res) => {
    try {
        var Temp = [];
        const teacher = await Teacher.find()
        const teacher1 = await Teacher.count()
        for(var i =0;i<teacher1;i++){
                Temp[i]=teacher[i].name


        }
           


        res.status(200).send(Temp.toString())

           
        
        
    } catch (e) {
        res.status(500).send()
    }
})

router.get('/Ttasks/CCS',auth1, async (req, res) => {
    try {
        const teacher1 = await TTask.findOne({owner: req.teacher.id})
        var test = teacher1.CanceledS
        var countt = test.length
if(countt==1){
        var Temp = [];
      
    
         
        for(var i =0;i<countt;i++){
                Temp[i]=test[i]


        }
    


        res.status(200).send(Temp.toString())
    }
    else if(countt>1){
        var Temp = [];
      
      
        // var split1 = test.split(",")
        //  var count1 = split1.length
         
        for(var i =0;i<countt;i++){
                Temp[i]=test[i]


        }
    }
    res.status(200).send(Temp.toString())

           
}
        
     catch (e) {
        res.status(500).send()
    }
})
router.get('/Ttasks/ALL',auth1, async (req, res) => {
    try {
        const teacher = await TTask.findOne({ owner: req.teacher.id})


    res.status(200).send(teacher)
    
          
        
    } catch (e) {
        res.status(500).send()
    }
})

router.get('/Ttasks/COUNTS',auth1, async (req, res) => {
    try {
        const teacher = await TTask.findOne({ owner: req.teacher.id})
       const Count = teacher.Students.length
       
    res.status(200).send(Count.toString())
    
          
        
    } catch (e) {
        res.status(500).send()
    }
})

router.get('/Ttasks/COUNTSC',auth1, async (req, res) => {
    try {
        const teacher = await TTask.findOne({ owner: req.teacher.id})
       const Count = teacher.CanceledS.length
       
    res.status(200).send(Count.toString())
    
          
        
    } catch (e) {
        res.status(500).send()
    }
})


router.get('/Ttasks/INST', async (req, res) => {
    try {
  
        var Temp = [];
        const teacher = await TTask.find()
        const teacher1 = await TTask.count()
        for(var i =0;i<teacher1;i++){
               
            Temp[i]=teacher[i].instrument


        }
           


        res.status(200).send(Temp.toString())

           
        
        
    } catch (e) {
        res.status(500).send()
    }
})

router.patch('/Ttasks/me', auth1, async (req, res) => {
    
    const updates = Object.keys(req.body)
    const allowedUpdates = ['name','About','Education']
    const isValidOperation = updates.every((update) => allowedUpdates.includes(update))

        
    try {
       

        const task = await TTask.findOne({ owner: req.teacher._id})
      
        const Task1 = await Teacher.findIfD(req.body.name)
        if(Task1==false){
            throw new Error()
           
          }

        updates.forEach((update) => req.teacher[update] = req.body[update],
        
        )
        updates.forEach((update) => task[update] = req.body[update],
        
        )
        await task.save()

        await req.teacher.save()
        res.send(task)
        
    } catch (e) {
        res.status(400).send(e)
    }
})



// router.get('/tasks/:id',auth, async (req, res) => {
//     const _id = req.params.id

//     try {
//         const task = await Task.findOne({ _id, owner: req.user._id })

//         if (!task) {
//             return res.status(404).send()
//         }

//         res.send(task)
//     } catch (e) {
//         res.status(500).send()
//     }
// })

// router.patch('/tasks/:id', auth, async (req, res) => {
//     const updates = Object.keys(req.body)
//     const allowedUpdates = ['description', 'completed']
//     const isValidOperation = updates.every((update) => allowedUpdates.includes(update))

//     if (!isValidOperation) {
//         return res.status(400).send({ error: 'Invalid updates!' })
//     }

//     try {
//         const task = await Task.findOne({ _id: req.params.id, owner: req.user._id})

//         if (!task) {
//             return res.status(404).send()
//         }

//         updates.forEach((update) => task[update] = req.body[update])
//         await task.save()
//         res.send(task)
//     } catch (e) {
//         res.status(400).send(e)
//     }
// })

// router.delete('/tasks/:id', auth, async (req, res) => {
//     try {
//         const task = await Task.findOneAndDelete({ _id: req.params.id, owner: req.user._id })

//         if (!task) {
//             res.status(404).send()
//         }

//         res.send(task)
//     } catch (e) {
//         res.status(500).send()
//     }
// })

router.get('/Ttasks/short',auth1, async (req, res) => {
    try {
        const teacher = await TTask.findOne({ owner: req.teacher.id})
        var email= req.teacher.name
        var e = email.toUpperCase().split('')
          res.status(201).send(e[0]+e[1])
          
        
    } catch (e) {
        res.status(500).send()
    }
})



router.post('/Ttasks/COMPS',auth1, async (req, res) => {
    try {
        const count = await TTask.findOne({owner:req.teacher.id})
         var ccc = count.Students.length
        const teacher = await TTask.findOne({ owner: req.teacher.id})
        const user = await User.findOne({ owner1: req.teacher.id})
          
        const Dateee= await Task.findOne({Name:req.body.Name})
      
        for(var i = 0;i<ccc;i++){
            if(teacher.Students[i]==Dateee.Name){
        const cancelt = await TTask.findOneAndUpdate({Students:teacher.Students[i]
        
        },
        {
            $pull:{
             Students : req.body.Name,
             TimeS :  req.body.Time,
             DateS: req.body.Date
            },
            $push:{
                CompS : req.body.Name
            },
        })
    }
    break
    
    }
    
   
         Dateee.Date = "";
         Dateee.Time = "";
         Dateee.instrument = "";
         user.owner1 = "";
         Dateee.owner2="";
         await user.save()
      await Dateee.save()
     await teacher.save()
      await cancelt.save()
      res.status(200).send(cancelt)
          
        
    } catch (e) {
        res.status(500).send()
    }
})
router.get('/Ttasks/CCSS',auth1, async (req, res) => {
    try {
        const teacher1 = await TTask.findOne({owner: req.teacher.id})
        var test = teacher1.CompS
        var countt = test.length
if(countt==1){
        var Temp = [];
      
    
         
        for(var i =0;i<countt;i++){
                Temp[i]=test[i]


        }
    


        res.status(200).send(Temp.toString())
    }
    else if(countt>1){
        var Temp = [];

         
        for(var i =0;i<countt;i++){
                Temp[i]=test[i]


        }
    }
    res.status(200).send(Temp.toString())

           
}
        
     catch (e) {
        res.status(500).send()
    }
})

router.get('/Ttasks/COUNTSCC',auth1, async (req, res) => {
    try {
        const teacher = await TTask.findOne({ owner: req.teacher.id})
       const Count = teacher.CompS.length
       
    res.status(200).send(Count.toString())
    
          
        
    } catch (e) {
        res.status(500).send()
    }
})

module.exports = router