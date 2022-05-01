const express = require('express')
const Task = require('../models/task')

const auth = require('../middleware/auth')
const auth1 = require('../middleware/auth1')

const User = require('../models/user')
const Teacher = require('../models/teacher')
const TTask = require('../models/Ttask')
const { translateAliases } = require('../models/task')



const router = new express.Router()

router.post('/tasks', auth, async (req, res) => {

    const task = new Task({
        ...req.body,
        owner: req.user._id,
        Name : req.user.name
    })

    try {

        task.Education = "Hey, Tell us About Your Qualifications."
        task.About = "Hi, Tell Us About You :)"
        await task.save()
        res.status(201).send(task)
    } catch (e) {
        res.status(400).send(e)
    }
})

router.get('/tasks',auth, async (req, res) => {
    try {

        await req.user.populate('tasks')

        res.send(req.user.tasks)
    } catch (e) {
        res.status(500).send()
    }
})
router.get('/tasks/Ed',auth, async (req, res) => {
    try {
        const user1 = await Task.findOne({ owner: req.user.id})
         

          res.status(201).send(user1.Education)

        
    } catch (e) {
        res.status(500).send()
    }
})

router.get('/tasks/ABOU',auth, async (req, res) => {
    try {
        const user1 = await Task.findOne({ owner: req.user.id})
         

          res.status(201).send(user1.About)

        
    } catch (e) {
        res.status(500).send()
    }
})

router.get('/tasks/SD',auth, async (req, res) => {
    try {
        const user1 = await Task.findOne({ owner: req.user.id})
         

          res.status(200).send(user1.Date)

        
    } catch (e) {
        res.status(500).send()
    }
})
router.get('/tasks/ST',auth, async (req, res) => {
    try {
        const user1 = await Task.findOne({ owner: req.user.id})
          
          res.status(200).send(user1.Time)

        
    } catch (e) {
        res.status(500).send()
    }
})
router.get('/tasks/STN',auth, async (req, res) => {
    try {
        const user1 = await Task.findOne({ owner: req.user.id})
    await user1.populate('owner2')
res.status(200).send(user1.owner2.name)
        
    } catch (e) {
        res.status(500).send()
    }
})



// router.get('/tasks/count',auth, async (req, res) => {
//     try {
//         const user1 = await TTask.findOne({ NName: req.body.name})

         

//           res.status(201).send(user1.toString())

        
//     } catch (e) {
//         res.status(500).send()
//     }
// })

router.post('/tasks/test',auth,async (req, res) => {


        
    try {

        // const task = await Task.findOne({ owner: req.user._id})
                     

        //        const teacher = await TTask.findOne({NName:req.body.name,instrument: req.body.instrument})
        //            const teacher1 = await Teacher.findOne({name:req.body.name})
        //            if(!teacher1){

        //            }
        //            task.instrument = teacher.instrument
        //            task.TeacherName = teacher1
       
        
    } catch (e) {
        res.status(400).send(e)
    }
})
//----------
router.patch('/tasks/TheTeacher',auth,async (req, res) => {
    const updates = Object.keys(req.body)
    const allowedUpdates = ['instrument','Time']
    const isValidOperation = updates.every((update) => allowedUpdates.includes(update))
    
        
    try {
        const IFHasTeacher = await Task.findOne({Name : req.user.name})
        if(!IFHasTeacher.Time==""){
            if(!IFHasTeacher.Date==""){
            return res.status(400).send("NO");
                   
        }
        return res.status(400).send("NO");
        
        }
        const COUNT = await TTask.findOne({NName: req.body.name})
       
        if(COUNT.Students.length>9){
 
            return res.status(400).send("Max");

        }
       
      if(COUNT.Students.length>0){
        for(var i =0 ; i<COUNT.Students.length;i++){
            if(COUNT.Students[i]==req.user.name){
                console.log("ThisStudentIsAlreadySigned")
               return res.status(400).send("AlreadySigned");

            }
        }
    }
    if(COUNT.DateS.length>0){
        if(COUNT.TimeS.length>0){
        if(COUNT.NName == req.body.name && COUNT.instrument == req.body.instrument){
            for(var i = 0 ;i<COUNT.DateS.length;i++){
             if(COUNT.DateS[i]== req.body.Date){
                 for(var j= 0; j<COUNT.TimeS.length;j++){
                  if(COUNT.TimeS[j] == req.body.Time){
                    return res.status(400).send("BookedDate");

                    }
                  else{
                      continue
                  }    
                 }
             }
            
            }
        }

    }
}


        const task = await Task.findOne({ owner: req.user._id})
               const teacher = await TTask.findOneAndUpdate(
                   {
                       NName:req.body.name,
                       instrument : req.body.instrument

                
            },
            {
                $push: {
               Students : req.user.name,
               TimeS : req.body.Time,
               DateS : req.body.Date,
               
                },
                
            
            
            } 
                )
              
                   

                     

           
        
                   const teacher1 = await Teacher.findOne({name:req.body.name})
                   const user1 = await User.findOne({name:req.user.name})
                   if(!teacher){
                       throw new Error()
                   }
                   task.instrument = teacher.instrument
                   task.Time = req.body.Time
                   task.Date = req.body.Date
                   user1.owner1 = teacher1.id
                   task.owner2= teacher1.id

                   console.log(user1.owner1)




       
        updates.forEach((update) => task[update] = req.body[update],
        
        
        )
            
        task.Status = "Upcoming"
        
        await task.save()
        await teacher.save()
        await user1.save()


        await req.user.save()
        res.send(teacher.Students)
        
    } catch (e) {
        res.status(400).send(e)
    }
})
//------

router.get('/tasks/name',auth, async (req, res) => {
    try {
        const user = await User.findOne({ _id: req.user.id})
         

          res.status(201).send(req.user.name)

        
    } catch (e) {
        res.status(500).send()
    }
})




router.get('/tasks/email',auth, async (req, res) => {
    try {
        const user = await User.findOne({ _id: req.user.id})
         
          res.status(201).send(req.user.email)
        
    } catch (e) {
        res.status(500).send()
    }
})

router.get('/tasks/Time',auth, async (req, res) => {
    try {
        const user = await Task.findOne({ owner: req.user.id})
         
          res.status(201).send(user.Time)
        
    } catch (e) {
        res.status(500).send()
    }
})
router.get('/tasks/Ins',auth, async (req, res) => {
    try {
        const user = await Task.findOne({ owner: req.user.id})
         
          res.status(201).send(user.instrument)
        
    } catch (e) {
        res.status(500).send()
    }
})

router.get('/tasks/TS',auth, async (req, res) => {
    try {
  
        const task = await User.findOne({name:req.user.name})

        await task.populate('owner1')
            
        console.log(task.owner1)
          res.status(201).send(task.owner1.name)
        
    } catch (e) {
        res.status(500).send()
    }
})

router.post('/tasks/SaveRating',auth, async (req, res) => {
    try {
        const userTask = await User.findOne({name:req.body.Name})
        const StudentsTeacher = await Task.findOne({Name:req.body.Name})
        if(StudentsTeacher.owner2==""||StudentsTeacher.owner2==null){
            res.status(400).send("YouCant")
        }
        await StudentsTeacher.populate('owner2')
        const StudentsTeacher1 = await Teacher.findOne({name:req.body.name})

        if(StudentsTeacher.owner2._id.toString()!=StudentsTeacher1._id.toString()){
            res.status(400).send("YouCant")
        }
        else{
        const Taskk = await Task.findOne({owner:userTask._id})
             await userTask.populate('owner1')


        Taskk.rating = req.body.rating

        const FindTheStudent = await TTask.findOne({NName:userTask.owner1.name})
        const count = FindTheStudent.Students.length
        const count1 = FindTheStudent.ratingAvg.length
        var Temp;
        var i;

        for(i=0;i<count;i++){
            if(FindTheStudent.Students[i]==req.body.Name){
                Temp=i;
                break;
            }
          
        }
        if(Temp==-1){
            FindTheStudent.ratings.splice(FindTheStudent.Students.length-1, 0, Taskk.rating);
            FindTheStudent.ratingAvg.splice(FindTheStudent.Students.length-1, 0, Taskk.rating);
  
            
               
    }
    else if(Temp>=0){
        
         
          FindTheStudent.ratings.splice(Temp,1,Taskk.rating)
          FindTheStudent.ratingAvg.splice(Temp, 1, Taskk.rating);
                   
            await Taskk.save()
            await FindTheStudent.save()
          res.status(200).send(FindTheStudent.NName)
    }
}
        
    } catch (e) {
        res.status(500).send()
    }
})


router.get('/tasks/short',auth, async (req, res) => {
    try {
        const user = await User.findOne({ _id: req.user.id})
        var email= req.user.name
        var e = email.toUpperCase().split('')
          res.status(201).send(e[0]+e[1])
          
        
    } catch (e) {
        res.status(500).send()
    }
})
router.patch('/tasks/me', auth, async (req, res) => {
    
    const updates = Object.keys(req.body)
    const allowedUpdates = ['name','About','Education']
    const isValidOperation = updates.every((update) => allowedUpdates.includes(update))
    
        
    try {
        const Task1 = await User.findIfD(req.body.name)

        const task = await Task.findOne({ owner: req.user._id})
        if(Task1==false){
            throw new Error()
           
          }
        updates.forEach((update) => req.user[update] = req.body[update],
        
        )
        updates.forEach((update) => task[update] = req.body[update],
        
        )
        await task.save()

        await req.user.save()
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

module.exports = router